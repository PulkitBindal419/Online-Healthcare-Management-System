package com.healthcare.dao;

import com.healthcare.model.Appointment;
import com.healthcare.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AppointmentDAO {

    // Book a new appointment
    public boolean bookAppointment(Appointment appointment) {

        String sql = "INSERT INTO appointments " +
                "(patient_id, doctor_id, appointment_date, appointment_time, reason, status) " +
                "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, appointment.getPatientId());
            statement.setInt(2, appointment.getDoctorId());
            statement.setString(3, appointment.getAppointmentDate());
            statement.setString(4, appointment.getAppointmentTime());
            statement.setString(5, appointment.getReason());
            statement.setString(6, appointment.getStatus());

            return statement.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // Get all appointments
    public List<Appointment> getAllAppointments() {

        List<Appointment> appointments = new ArrayList<>();

        String sql =
                "SELECT a.*, u.name AS doctor_name, d.specialization " +
                        "FROM appointments a " +
                        "LEFT JOIN doctors d ON a.doctor_id = d.id " +
                        "LEFT JOIN users u ON d.user_id = u.id " +
                        "ORDER BY a.id";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {

                Appointment appointment = new Appointment(
                        resultSet.getInt("id"),
                        resultSet.getInt("patient_id"),
                        resultSet.getInt("doctor_id"),
                        resultSet.getString("appointment_date"),
                        resultSet.getString("appointment_time"),
                        resultSet.getString("reason"),
                        resultSet.getString("status"),
                        resultSet.getString("doctor_name"),
                        resultSet.getString("specialization")
                );

                appointments.add(appointment);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return appointments;
    }


    // Get appointments for a particular patient
    public List<Appointment> getAppointmentsByPatient(int patientId) {

        List<Appointment> appointments = new ArrayList<>();

        String sql =
                "SELECT a.*, u.name AS doctor_name, d.specialization " +
                        "FROM appointments a " +
                        "LEFT JOIN doctors d ON a.doctor_id = d.id " +
                        "LEFT JOIN users u ON d.user_id = u.id " +
                        "WHERE a.patient_id = ? " +
                        "ORDER BY a.appointment_date DESC";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, patientId);

            try (ResultSet resultSet = statement.executeQuery()) {

                while (resultSet.next()) {

                    Appointment appointment = new Appointment(
                            resultSet.getInt("id"),
                            resultSet.getInt("patient_id"),
                            resultSet.getInt("doctor_id"),
                            resultSet.getString("appointment_date"),
                            resultSet.getString("appointment_time"),
                            resultSet.getString("reason"),
                            resultSet.getString("status"),
                            resultSet.getString("doctor_name"),
                            resultSet.getString("specialization")
                    );

                    appointments.add(appointment);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return appointments;
    }


    // Update appointment status
    public boolean updateStatus(int id, String status) {

        String sql =
                "UPDATE appointments SET status = ? WHERE id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, status);
            statement.setInt(2, id);

            return statement.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // Delete appointment
    public boolean deleteAppointment(int id) {

        String sql =
                "DELETE FROM appointments WHERE id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, id);

            return statement.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}