package com.healthcare.servlet;

import com.healthcare.service.AnalyticsService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/analytics")
public class AnalyticsServlet extends HttpServlet {

    private final AnalyticsService analyticsService =
            new AnalyticsService();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int totalUsers = analyticsService.getTotalUsers();
        int totalAppointments = analyticsService.getTotalAppointments();
        int totalMedicalRecords = analyticsService.getTotalMedicalRecords();
        int totalFeedback = analyticsService.getTotalFeedback();

        request.setAttribute("totalUsers", totalUsers);
        request.setAttribute("totalAppointments", totalAppointments);
        request.setAttribute("totalMedicalRecords", totalMedicalRecords);
        request.setAttribute("totalFeedback", totalFeedback);

        request.getRequestDispatcher("/admin/analytics.jsp")
                .forward(request, response);
    }
}