package com.mentorship.controller;

import com.mentorship.dao.MatchDAO;
import com.mentorship.dao.StudentDAO;
import com.mentorship.dao.MentorDAO;
import com.mentorship.model.MentorshipMatch;
import com.mentorship.model.Student;
import com.mentorship.model.Mentor;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/MatchCreateServlet")
public class MatchCreateServlet extends HttpServlet {
    private MatchDAO matchDAO = new MatchDAO();
    private StudentDAO studentDAO = new StudentDAO();
    private MentorDAO mentorDAO = new MentorDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("auth/login.jsp");
            return;
        }

        int studentId = Integer.parseInt(request.getParameter("studentId"));
        int mentorId = Integer.parseInt(request.getParameter("mentorId"));
        String startDate = request.getParameter("startDate");
        String durationMonths = request.getParameter("durationMonths");
        String goals = request.getParameter("goals");

        MentorshipMatch match = new MentorshipMatch();
        match.setStudentId(studentId);
        match.setMentorId(mentorId);
        match.setMatchDate(Date.valueOf(startDate));
        match.setStartDate(Date.valueOf(startDate));
        
        // Calculate expected end date (add months to start date)
        Date expectedEnd = Date.valueOf(startDate);
        match.setExpectedEndDate(expectedEnd);
        
        match.setStatus("active");
        match.setGoals(goals);

        boolean created = matchDAO.createMatch(match);

        if (created) {
            response.sendRedirect("MatchListServlet?success=created");
        } else {
            request.setAttribute("error", "Failed to create match");
            request.getRequestDispatcher("matches/create.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("auth/login.jsp");
            return;
        }

        // Get students and available mentors for dropdowns
        List<Student> students = studentDAO.getAllStudents();
        List<Mentor> mentors = mentorDAO.getAvailableMentors();
        
        request.setAttribute("students", students);
        request.setAttribute("mentors", mentors);
        request.getRequestDispatcher("matches/create.jsp").forward(request, response);
    }
}
