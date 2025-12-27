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

@WebServlet("/MentorDetailsServlet")
public class MentorDetailsServlet extends HttpServlet {
    private MentorDAO mentorDAO = new MentorDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("auth/login.jsp");
            return;
        }

        String idStr = request.getParameter("id");
        if (idStr == null) {
            response.sendRedirect("MentorListServlet");
            return;
        }

        int mentorId = Integer.parseInt(idStr);
        Mentor mentor = mentorDAO.getMentorById(mentorId);

        if (mentor != null) {
            request.setAttribute("mentor", mentor);
            request.getRequestDispatcher("mentors/details.jsp").forward(request, response);
        } else {
            response.sendRedirect("MentorListServlet?error=notfound");
        }
    }
}
