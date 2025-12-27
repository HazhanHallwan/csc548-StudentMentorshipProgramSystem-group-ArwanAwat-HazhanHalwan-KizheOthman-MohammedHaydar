package com.mentorship.controller;

import com.mentorship.dao.MentorDAO;
import com.mentorship.model.Mentor;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/MentorCreateServlet")
public class MentorCreateServlet extends HttpServlet {
    private MentorDAO mentorDAO = new MentorDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("auth/login.jsp");
            return;
        }

        String mentorNumber = request.getParameter("mentorNumber");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String department = request.getParameter("department");
        String positionTitle = request.getParameter("positionTitle");
        String expertiseAreas = request.getParameter("expertiseAreas");
        String yearsExpStr = request.getParameter("yearsExperience");
        String maxMenteesStr = request.getParameter("maxMentees");
        String bio = request.getParameter("bio");

        if (mentorDAO.mentorNumberExists(mentorNumber)) {
            request.setAttribute("error", "Mentor number already exists");
            request.getRequestDispatcher("mentors/create.jsp").forward(request, response);
            return;
        }

        Mentor mentor = new Mentor();
        mentor.setMentorNumber(mentorNumber);
        mentor.setFullName(fullName);
        mentor.setEmail(email);
        mentor.setPhone(phone);
        mentor.setDepartment(department);
        mentor.setPositionTitle(positionTitle);
        mentor.setExpertiseAreas(expertiseAreas);
        mentor.setYearsExperience(Integer.parseInt(yearsExpStr));
        mentor.setMaxMentees(Integer.parseInt(maxMenteesStr));
        mentor.setBio(bio);

        boolean created = mentorDAO.createMentor(mentor);

        if (created) {
            response.sendRedirect("MentorListServlet?success=created");
        } else {
            request.setAttribute("error", "Failed to create mentor");
            request.getRequestDispatcher("mentors/create.jsp").forward(request, response);
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

        request.getRequestDispatcher("mentors/create.jsp").forward(request, response);
    }
}
