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

@WebServlet("/patient/appointments")
public class PatientAppointmentHistoryServlet extends HttpServlet {

    private final AppointmentService appointmentService =
            new AppointmentService();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        // Temporary patient ID for testing
        int patientId = 1;

        List<Appointment> appointments =
                appointmentService.getAppointmentsByPatient(patientId);

        request.setAttribute("appointments", appointments);

        request.getRequestDispatcher(
                "/patient/appointment-history.jsp"
        ).forward(request, response);
    }
}