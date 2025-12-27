package com.mentorship.controller;

import com.mentorship.dao.StudentDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/StudentDeleteServlet")
public class StudentDeleteServlet extends HttpServlet {
    private StudentDAO studentDAO = new StudentDAO();

  @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("userId") == null) {
        response.sendRedirect("auth/login.jsp");
        return;
    }

    // RBAC: Only admin can delete students
    String userRole = (String) session.getAttribute("userRole");
    if (!"admin".equals(userRole)) {
        response.sendRedirect("StudentListServlet?error=nopermission");
        return;
    }

    String idStr = request.getParameter("id");
    if (idStr == null) {
        response.sendRedirect("StudentListServlet");
        return;
    }

    int studentId = Integer.parseInt(idStr);
    boolean deleted = studentDAO.deleteStudent(studentId);

    if (deleted) {
        response.sendRedirect("StudentListServlet?success=deleted");
    } else {
        response.sendRedirect("StudentListServlet?error=deletefailed");
    }
}


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
