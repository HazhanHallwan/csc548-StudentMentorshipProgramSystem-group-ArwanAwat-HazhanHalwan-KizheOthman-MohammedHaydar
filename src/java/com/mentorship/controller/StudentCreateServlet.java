package com.mentorship.controller;

import com.mentorship.dao.StudentDAO;
import com.mentorship.model.Student;
import java.io.IOException;
import java.sql.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/StudentCreateServlet")
public class StudentCreateServlet extends HttpServlet {
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
        String studentNumber = request.getParameter("studentNumber");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String department = request.getParameter("department");
        String yearLevelStr = request.getParameter("yearLevel");
        String academicInterests = request.getParameter("academicInterests");
        String careerGoals = request.getParameter("careerGoals");
        String enrollmentDateStr = request.getParameter("enrollmentDate");

        // Validation
        if (studentNumber == null || fullName == null || email == null || department == null) {
            request.setAttribute("error", "All required fields must be filled");
            request.getRequestDispatcher("students/create.jsp").forward(request, response);
            return;
        }

        // Check if student number exists
        if (studentDAO.studentNumberExists(studentNumber)) {
            request.setAttribute("error", "Student number already exists");
            request.getRequestDispatcher("students/create.jsp").forward(request, response);
            return;
        }

        // Create student object
        Student student = new Student();
        student.setStudentNumber(studentNumber);
        student.setFullName(fullName);
        student.setEmail(email);
        student.setPhone(phone);
        student.setDepartment(department);
        student.setYearLevel(Integer.parseInt(yearLevelStr));
        student.setAcademicInterests(academicInterests);
        student.setCareerGoals(careerGoals);
        student.setEnrollmentDate(Date.valueOf(enrollmentDateStr));

        // Save to database
        boolean created = studentDAO.createStudent(student);

        if (created) {
            response.sendRedirect("StudentListServlet?success=created");
        } else {
            request.setAttribute("error", "Failed to create student");
            request.getRequestDispatcher("students/create.jsp").forward(request, response);
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

    // RBAC: Only admin can create students
    String userRole = (String) session.getAttribute("userRole");
    if (!"admin".equals(userRole)) {
        response.sendRedirect("StudentListServlet?error=nopermission");
        return;
    }

    request.getRequestDispatcher("students/create.jsp").forward(request, response);
}

}
