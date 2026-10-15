package com.healthcare.dao;

import com.healthcare.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AnalyticsDAO {

    public int getTotalUsers() {
        return getCount("SELECT COUNT(*) FROM users");
    }

    public int getTotalAppointments() {
        return getCount("SELECT COUNT(*) FROM appointments");
    }

    public int getTotalMedicalRecords() {
        return getCount("SELECT COUNT(*) FROM medical_records");
    }

    public int getTotalFeedback() {
        return getCount("SELECT COUNT(*) FROM feedback");
    }

    private int getCount(String sql) {

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            if (resultSet.next()) {
                return resultSet.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }
}