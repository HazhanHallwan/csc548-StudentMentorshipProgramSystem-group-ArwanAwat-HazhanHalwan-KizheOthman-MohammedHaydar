package com.mentorship.controller;

import com.mentorship.dao.MentorDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/MentorDeleteServlet")
public class MentorDeleteServlet extends HttpServlet {
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
        boolean deleted = mentorDAO.deleteMentor(mentorId);

        if (deleted) {
            response.sendRedirect("MentorListServlet?success=deleted");
        } else {
            response.sendRedirect("MentorListServlet?error=deletefailed");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
