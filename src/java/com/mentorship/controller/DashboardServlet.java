package com.mentorship.controller;

import com.mentorship.dao.UserDAO;
import com.mentorship.dao.StudentDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();
    private StudentDAO studentDAO = new StudentDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Check session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("auth/login.jsp");
            return;
        }

        // Get KPIs from database
        int totalUsers = userDAO.getTotalUsersCount();
        int totalStudents = studentDAO.getTotalStudentsCount();

        // Get students by department for table/chart
        List<Object[]> studentsByDept = studentDAO.getStudentsByDepartment();

        // Set attributes
        request.setAttribute("totalUsers", totalUsers);
        request.setAttribute("totalStudents", totalStudents);
        request.setAttribute("studentsByDept", studentsByDept);

        // Forward to dashboard JSP
        request.getRequestDispatcher("dashboard/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
