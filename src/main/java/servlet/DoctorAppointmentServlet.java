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

@WebServlet("/doctor/appointments")
public class DoctorAppointmentServlet extends HttpServlet {

    private final AppointmentService appointmentService =
            new AppointmentService();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        List<Appointment> appointments =
                appointmentService.getAllAppointments();

        request.setAttribute("appointments", appointments);

        request.getRequestDispatcher(
                "/doctor/appointments.jsp"
        ).forward(request, response);
    }
}