package com.healthcare.dao;

import com.healthcare.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class SystemSettingsDAO {

    public boolean saveSettings(String hospitalName,
                                String appointmentStatus,
                                String systemEmail) {

        String sql = "INSERT INTO system_settings (setting_name, setting_value) " +
                "VALUES (?, ?) " +
                "ON DUPLICATE KEY UPDATE setting_value = VALUES(setting_value)";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            // Hospital Name
            statement.setString(1, "hospital_name");
            statement.setString(2, hospitalName);
            statement.executeUpdate();

            // Appointment Status
            statement.setString(1, "appointment_status");
            statement.setString(2, appointmentStatus);
            statement.executeUpdate();

            // System Email
            statement.setString(1, "system_email");
            statement.setString(2, systemEmail);
            statement.executeUpdate();

            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}