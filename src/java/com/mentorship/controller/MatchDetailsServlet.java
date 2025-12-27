package com.mentorship.controller;

import com.mentorship.dao.MatchDAO;
import com.mentorship.model.MentorshipMatch;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/MatchDetailsServlet")
public class MatchDetailsServlet extends HttpServlet {
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
        MentorshipMatch match = matchDAO.getMatchById(matchId);
        int sessionCount = matchDAO.getSessionCountForMatch(matchId);

        if (match != null) {
            request.setAttribute("match", match);
            request.setAttribute("sessionCount", sessionCount);
            request.getRequestDispatcher("matches/details.jsp").forward(request, response);
        } else {
            response.sendRedirect("MatchListServlet?error=notfound");
        }
    }
}
