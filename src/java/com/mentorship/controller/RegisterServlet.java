package com.mentorship.controller;

import com.mentorship.dao.UserDAO;
import com.mentorship.model.User;
import java.io.IOException;
import java.util.regex.Pattern;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form parameters
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String role = request.getParameter("role");

        // Server-side validation
        StringBuilder errors = new StringBuilder();

        // Required fields
        if (fullName == null || fullName.trim().isEmpty()) {
            errors.append("Full name is required. ");
        }
        if (email == null || email.trim().isEmpty()) {
            errors.append("Email is required. ");
        }
        if (password == null || password.trim().isEmpty()) {
            errors.append("Password is required. ");
        }
        if (role == null || role.trim().isEmpty()) {
            errors.append("Role is required. ");
        }

        // Email format validation
        String emailRegex = "^[A-Za-z0-9+_.-]+@(.+)$";
        if (email != null && !Pattern.matches(emailRegex, email)) {
            errors.append("Invalid email format. ");
        }

        // Password length validation
        if (password != null && password.length() < 8) {
            errors.append("Password must be at least 8 characters. ");
        }

        // Password confirmation
        if (password != null && !password.equals(confirmPassword)) {
            errors.append("Passwords do not match. ");
        }

        // Check if email already exists
        if (userDAO.emailExists(email)) {
            errors.append("Email already registered. ");
        }

        // If validation errors exist
        if (errors.length() > 0) {
            request.setAttribute("error", errors.toString());
            request.getRequestDispatcher("auth/register.jsp").forward(request, response);
            return;
        }

        // Create user object
        User user = new User();
        user.setFullName(fullName);
        user.setEmail(email);
        user.setPhone(phone);
        user.setPasswordHash(password); // In production, hash the password
        user.setRole(role);
        user.setStatus("active");

        // Register user
        boolean registered = userDAO.registerUser(user);

        if (registered) {
            response.sendRedirect("auth/login.jsp?registered=success");
        } else {
            request.setAttribute("error", "Registration failed. Please try again.");
            request.getRequestDispatcher("auth/register.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("auth/register.jsp");
    }
}
