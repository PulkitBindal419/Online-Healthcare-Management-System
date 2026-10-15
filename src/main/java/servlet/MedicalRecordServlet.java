package com.healthcare.servlet;

import com.healthcare.model.MedicalRecord;
import com.healthcare.service.MedicalRecordService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/medical-records")
public class MedicalRecordServlet extends HttpServlet {

    private final MedicalRecordService medicalRecordService =
            new MedicalRecordService();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String patientIdParameter =
                request.getParameter("patientId");

        if (patientIdParameter == null || patientIdParameter.isEmpty()) {
            response.sendRedirect(
                    request.getContextPath()
                            + "/doctor/medical-records.jsp"
            );
            return;
        }

        int patientId = Integer.parseInt(patientIdParameter);

        List<MedicalRecord> records =
                medicalRecordService.getRecordsByPatient(patientId);

        request.setAttribute("records", records);

        String source = request.getParameter("source");

        if ("doctor".equalsIgnoreCase(source)) {

            request.getRequestDispatcher(
                    "/doctor/medical-records.jsp"
            ).forward(request, response);

        } else {

            request.getRequestDispatcher(
                    "/patient/medical-history.jsp"
            ).forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int patientId = Integer.parseInt(
                request.getParameter("patientId"));

        int doctorId = Integer.parseInt(
                request.getParameter("doctorId"));

        String diagnosis =
                request.getParameter("diagnosis");

        String prescription =
                request.getParameter("prescription");

        String notes =
                request.getParameter("notes");

        String recordDate =
                request.getParameter("recordDate");

        MedicalRecord record = new MedicalRecord(
                0,
                patientId,
                doctorId,
                diagnosis,
                prescription,
                notes,
                recordDate
        );

        boolean success =
                medicalRecordService.addRecord(record);

        if (success) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/medical-records?patientId="
                            + patientId
                            + "&source=doctor"
            );

        } else {

            response.sendRedirect(
                    request.getContextPath()
                            + "/doctor/medical-records.jsp"
                            + "?error=Unable+to+add+record"
            );
        }
    }
}