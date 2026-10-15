package com.healthcare.servlet;

import com.healthcare.model.User;
import com.healthcare.service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private final UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = userService.login(email, password);

        if (user != null) {

            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            if ("ADMIN".equalsIgnoreCase(user.getRole())) {
                response.sendRedirect("admin/dashboard.jsp");

            } else if ("DOCTOR".equalsIgnoreCase(user.getRole())) {
                response.sendRedirect("doctor/dashboard.jsp");

            } else if ("PATIENT".equalsIgnoreCase(user.getRole())) {
                response.sendRedirect("patient/dashboard.jsp");

            } else {
                response.sendRedirect("login.jsp?error=Invalid+role");
            }

        } else {
            response.sendRedirect("login.jsp?error=Invalid+email+or+password");
        }
    }
}