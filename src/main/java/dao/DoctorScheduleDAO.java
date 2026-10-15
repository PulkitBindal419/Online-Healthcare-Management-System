package com.healthcare.dao;

import com.healthcare.model.DoctorSchedule;
import com.healthcare.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DoctorScheduleDAO {

    // Add a new schedule
    public boolean addSchedule(DoctorSchedule schedule) {

        String sql = "INSERT INTO doctor_schedules " +
                "(doctor_id, day_of_week, start_time, end_time, status) " +
                "VALUES (?, ?, ?, ?, ?)";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection connection = DBConnection.getConnection();
                 PreparedStatement statement =
                         connection.prepareStatement(sql)) {

                statement.setInt(1, schedule.getDoctorId());
                statement.setString(2, schedule.getDayOfWeek());
                statement.setString(3, schedule.getStartTime());
                statement.setString(4, schedule.getEndTime());
                statement.setString(5, schedule.getStatus());

                return statement.executeUpdate() > 0;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // Get all schedules for a doctor
    public List<DoctorSchedule> getSchedulesByDoctor(int doctorId) {

        List<DoctorSchedule> schedules = new ArrayList<>();

        String sql = "SELECT * FROM doctor_schedules " +
                "WHERE doctor_id = ? ORDER BY id";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection connection = DBConnection.getConnection();
                 PreparedStatement statement =
                         connection.prepareStatement(sql)) {

                statement.setInt(1, doctorId);

                try (ResultSet resultSet = statement.executeQuery()) {

                    while (resultSet.next()) {

                        DoctorSchedule schedule =
                                new DoctorSchedule(
                                        resultSet.getInt("id"),
                                        resultSet.getInt("doctor_id"),
                                        resultSet.getString("day_of_week"),
                                        resultSet.getString("start_time"),
                                        resultSet.getString("end_time"),
                                        resultSet.getString("status")
                                );

                        schedules.add(schedule);
                    }
                }

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return schedules;
    }


    // Delete a schedule
    public boolean deleteSchedule(int id) {

        String sql = "DELETE FROM doctor_schedules WHERE id = ?";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection connection = DBConnection.getConnection();
                 PreparedStatement statement =
                         connection.prepareStatement(sql)) {

                statement.setInt(1, id);

                return statement.executeUpdate() > 0;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}