package com.healthcare.servlet;

import com.healthcare.model.Appointment;
import com.healthcare.model.Doctor;
import com.healthcare.model.User;
import com.healthcare.service.AppointmentService;
import com.healthcare.service.DoctorService;
import com.healthcare.service.PatientService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/patient/book-appointment")
public class PatientAppointmentServlet extends HttpServlet {

    private final AppointmentService appointmentService =
            new AppointmentService();

    private final PatientService patientService =
            new PatientService();

    private final DoctorService doctorService =
            new DoctorService();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        List<Doctor> doctors = doctorService.getAllDoctors();

        request.setAttribute("doctors", doctors);

        request.getRequestDispatcher(
                "/patient/book-appointment.jsp"
        ).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(
                    request.getContextPath() + "/login.jsp"
            );
            return;
        }

        User user = (User) session.getAttribute("user");

        int patientId =
                patientService.getPatientIdByUserId(user.getId());

        if (patientId == -1) {
            response.sendRedirect(
                    request.getContextPath()
                            + "/patient/book-appointment"
                            + "?error=Patient+profile+not+found"
            );
            return;
        }

        int doctorId = Integer.parseInt(
                request.getParameter("doctorId")
        );

        String date =
                request.getParameter("appointmentDate");

        String time =
                request.getParameter("appointmentTime");

        String reason =
                request.getParameter("reason");

        Appointment appointment = new Appointment(
                0,
                patientId,
                doctorId,
                date,
                time,
                reason,
                "PENDING"
        );

        boolean success =
                appointmentService.bookAppointment(appointment);

        if (success) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/patient/book-appointment"
                            + "?success=Appointment+booked+successfully"
            );

        } else {

            response.sendRedirect(
                    request.getContextPath()
                            + "/patient/book-appointment"
                            + "?error=Unable+to+book+appointment"
            );
        }
    }
}