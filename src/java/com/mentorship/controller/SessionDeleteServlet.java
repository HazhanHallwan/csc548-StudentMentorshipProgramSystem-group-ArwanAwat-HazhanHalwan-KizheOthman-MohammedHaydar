package com.mentorship.controller;

import com.mentorship.dao.SessionDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/SessionDeleteServlet")
public class SessionDeleteServlet extends HttpServlet {
    private SessionDAO sessionDAO = new SessionDAO();

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
            response.sendRedirect("SessionListServlet");
            return;
        }

        int sessionId = Integer.parseInt(idStr);
        boolean deleted = sessionDAO.deleteSession(sessionId);

        if (deleted) {
            response.sendRedirect("SessionListServlet?success=deleted");
        } else {
            response.sendRedirect("SessionListServlet?error=deletefailed");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
