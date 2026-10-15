package com.healthcare.service;

import com.healthcare.dao.AppointmentDAO;
import com.healthcare.model.Appointment;

import java.util.List;

public class AppointmentService {

    private final AppointmentDAO appointmentDAO;

    public AppointmentService() {
        appointmentDAO = new AppointmentDAO();
    }

    public boolean bookAppointment(Appointment appointment) {
        return appointmentDAO.bookAppointment(appointment);
    }

    public List<Appointment> getAllAppointments() {
        return appointmentDAO.getAllAppointments();
    }

    public List<Appointment> getAppointmentsByPatient(int patientId) {
        return appointmentDAO.getAppointmentsByPatient(patientId);
    }

    public boolean updateStatus(int id, String status) {
        return appointmentDAO.updateStatus(id, status);
    }

    public boolean deleteAppointment(int id) {
        return appointmentDAO.deleteAppointment(id);
    }
}