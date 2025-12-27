package com.mentorship.controller;

import com.mentorship.dao.SessionDAO;
import com.mentorship.dao.MatchDAO;
import com.mentorship.model.MentorshipSession;
import com.mentorship.model.MentorshipMatch;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/SessionCreateServlet")
public class SessionCreateServlet extends HttpServlet {
    private SessionDAO sessionDAO = new SessionDAO();
    private MatchDAO matchDAO = new MatchDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("auth/login.jsp");
            return;
        }

        try {
            int matchId = Integer.parseInt(request.getParameter("matchId"));
            String sessionDate = request.getParameter("sessionDate");
            String sessionTime = request.getParameter("sessionTime");
            int duration = Integer.parseInt(request.getParameter("duration"));
            String topic = request.getParameter("topic");
            String locationType = request.getParameter("locationType");
            String locationDetails = request.getParameter("locationDetails");
            String notes = request.getParameter("notes");

            // Combine date and time
            String dateTimeStr = sessionDate + " " + sessionTime + ":00";
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Timestamp sessionDateTime = new Timestamp(sdf.parse(dateTimeStr).getTime());

            MentorshipSession mentorSession = new MentorshipSession();
            mentorSession.setMatchId(matchId);
            mentorSession.setSessionDate(sessionDateTime);
            mentorSession.setDurationMinutes(duration);
            mentorSession.setTopic(topic);
            mentorSession.setLocationType(locationType);
            mentorSession.setLocationDetails(locationDetails);
            mentorSession.setStatus("scheduled");
            mentorSession.setNotes(notes);

            boolean created = sessionDAO.createSession(mentorSession);

            if (created) {
                response.sendRedirect("SessionListServlet?success=created");
            } else {
                request.setAttribute("error", "Failed to create session");
                request.getRequestDispatcher("sessions/create.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
            request.getRequestDispatcher("sessions/create.jsp").forward(request, response);
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

        // Get active matches for dropdown
        List<MentorshipMatch> matches = matchDAO.getAllMatches();
        request.setAttribute("matches", matches);
        request.getRequestDispatcher("sessions/create.jsp").forward(request, response);
    }
}
