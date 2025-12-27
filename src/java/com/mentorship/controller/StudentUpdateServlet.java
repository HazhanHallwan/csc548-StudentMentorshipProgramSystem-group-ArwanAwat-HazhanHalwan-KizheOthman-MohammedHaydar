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

@WebServlet("/StudentUpdateServlet")
public class StudentUpdateServlet extends HttpServlet {
    private StudentDAO studentDAO = new StudentDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Check session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("auth/login.jsp");
            return;
        }

        // Get form parameters
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        int userId = Integer.parseInt(request.getParameter("userId"));
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String department = request.getParameter("department");
        int yearLevel = Integer.parseInt(request.getParameter("yearLevel"));
        String academicInterests = request.getParameter("academicInterests");
        String careerGoals = request.getParameter("careerGoals");

        // Create student object
        Student student = new Student();
        student.setStudentId(studentId);
        student.setUserId(userId);
        student.setFullName(fullName);
        student.setEmail(email);
        student.setPhone(phone);
        student.setDepartment(department);
        student.setYearLevel(yearLevel);
        student.setAcademicInterests(academicInterests);
        student.setCareerGoals(careerGoals);

        // Update in database
        boolean updated = studentDAO.updateStudent(student);

        if (updated) {
            response.sendRedirect("StudentDetailsServlet?id=" + studentId + "&success=updated");
        } else {
            request.setAttribute("error", "Failed to update student");
            request.setAttribute("student", student);
            request.getRequestDispatcher("students/edit.jsp").forward(request, response);
        }
    }
}
