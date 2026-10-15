package com.healthcare.servlet;

import com.healthcare.service.SystemSettingsService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/settings")
public class SystemSettingsServlet extends HttpServlet {

    private final SystemSettingsService systemSettingsService =
            new SystemSettingsService();

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String hospitalName = request.getParameter("hospitalName");
        String appointmentStatus = request.getParameter("appointmentStatus");
        String systemEmail = request.getParameter("systemEmail");

        boolean success = systemSettingsService.saveSettings(
                hospitalName,
                appointmentStatus,
                systemEmail
        );

        if (success) {
            response.sendRedirect(
                    request.getContextPath() +
                            "/admin/settings.jsp?success=Settings+saved+successfully"
            );
        } else {
            response.sendRedirect(
                    request.getContextPath() +
                            "/admin/settings.jsp?error=Unable+to+save+settings"
            );
        }
    }
}