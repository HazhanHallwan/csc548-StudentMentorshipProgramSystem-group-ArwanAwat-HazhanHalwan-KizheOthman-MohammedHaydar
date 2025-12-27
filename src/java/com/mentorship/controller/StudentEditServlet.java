package com.mentorship.controller;

import com.mentorship.dao.StudentDAO;
import com.mentorship.model.Student;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/StudentEditServlet")
public class StudentEditServlet extends HttpServlet {
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

        // Get student ID
        String idStr = request.getParameter("id");
        if (idStr == null) {
            response.sendRedirect("StudentListServlet");
            return;
        }

        int studentId = Integer.parseInt(idStr);
        Student student = studentDAO.getStudentById(studentId);

        if (student != null) {
            request.setAttribute("student", student);
            request.getRequestDispatcher("students/edit.jsp").forward(request, response);
        } else {
            response.sendRedirect("StudentListServlet?error=notfound");
        }
    }
}
