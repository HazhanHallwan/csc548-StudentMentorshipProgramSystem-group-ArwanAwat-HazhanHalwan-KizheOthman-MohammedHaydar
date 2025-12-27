package com.mentorship.controller;

import com.mentorship.dao.MatchDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/MatchDeleteServlet")
public class MatchDeleteServlet extends HttpServlet {
    private MatchDAO matchDAO = new MatchDAO();

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
            response.sendRedirect("MatchListServlet");
            return;
        }

        int matchId = Integer.parseInt(idStr);
        boolean deleted = matchDAO.deleteMatch(matchId);

        if (deleted) {
            response.sendRedirect("MatchListServlet?success=deleted");
        } else {
            response.sendRedirect("MatchListServlet?error=deletefailed");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
