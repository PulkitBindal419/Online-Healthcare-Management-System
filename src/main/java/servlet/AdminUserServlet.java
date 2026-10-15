package com.healthcare.servlet;

import com.healthcare.model.User;
import com.healthcare.service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/users")
public class AdminUserServlet extends HttpServlet {

    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        List<User> users = userService.getAllUsers();

        request.setAttribute("users", users);

        request.getRequestDispatcher("/admin/users.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("add".equals(action)) {

            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String role = request.getParameter("role");

            User user = new User(
                    0,
                    name,
                    email,
                    password,
                    role
            );

            userService.addUser(user);

        } else if ("delete".equals(action)) {

            int id = Integer.parseInt(request.getParameter("id"));

            userService.deleteUser(id);
        }

        response.sendRedirect(request.getContextPath() + "/admin/users");
    }
}