package com.healthcare.servlet;

import com.healthcare.model.Appointment;
import com.healthcare.service.AppointmentService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/appointments")
public class AdminAppointmentServlet extends HttpServlet {

    private final AppointmentService appointmentService =
            new AppointmentService();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        List<Appointment> appointments =
                appointmentService.getAllAppointments();

        request.setAttribute("appointments", appointments);

        request.getRequestDispatcher("/admin/appointments.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("updateStatus".equals(action)) {

            int id = Integer.parseInt(request.getParameter("id"));
            String status = request.getParameter("status");

            appointmentService.updateStatus(id, status);

        } else if ("delete".equals(action)) {

            int id = Integer.parseInt(request.getParameter("id"));

            appointmentService.deleteAppointment(id);
        }

        response.sendRedirect(
                request.getContextPath() + "/admin/appointments"
        );
    }
}