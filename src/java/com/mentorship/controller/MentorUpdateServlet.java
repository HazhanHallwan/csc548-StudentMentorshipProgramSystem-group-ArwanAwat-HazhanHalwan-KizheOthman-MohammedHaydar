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

@WebServlet("/MentorUpdateServlet")
public class MentorUpdateServlet extends HttpServlet {
    private MentorDAO mentorDAO = new MentorDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("auth/login.jsp");
            return;
        }

        int mentorId = Integer.parseInt(request.getParameter("mentorId"));
        int userId = Integer.parseInt(request.getParameter("userId"));
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String department = request.getParameter("department");
        String positionTitle = request.getParameter("positionTitle");
        String expertiseAreas = request.getParameter("expertiseAreas");
        int yearsExperience = Integer.parseInt(request.getParameter("yearsExperience"));
        int maxMentees = Integer.parseInt(request.getParameter("maxMentees"));
        String bio = request.getParameter("bio");

        Mentor mentor = new Mentor();
        mentor.setMentorId(mentorId);
        mentor.setUserId(userId);
        mentor.setFullName(fullName);
        mentor.setEmail(email);
        mentor.setPhone(phone);
        mentor.setDepartment(department);
        mentor.setPositionTitle(positionTitle);
        mentor.setExpertiseAreas(expertiseAreas);
        mentor.setYearsExperience(yearsExperience);
        mentor.setMaxMentees(maxMentees);
        mentor.setBio(bio);

        boolean updated = mentorDAO.updateMentor(mentor);

        if (updated) {
            response.sendRedirect("MentorDetailsServlet?id=" + mentorId + "&success=updated");
        } else {
            request.setAttribute("error", "Failed to update mentor");
            request.setAttribute("mentor", mentor);
            request.getRequestDispatcher("mentors/edit.jsp").forward(request, response);
        }
    }
}
