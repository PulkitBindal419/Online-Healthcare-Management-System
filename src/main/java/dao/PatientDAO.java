package com.healthcare.dao;

import com.healthcare.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PatientDAO {

    public int getPatientIdByUserId(int userId) {

        String sql = "SELECT id FROM patients WHERE user_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, userId);

            try (ResultSet resultSet = statement.executeQuery()) {

                if (resultSet.next()) {
                    return resultSet.getInt("id");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return -1;
    }
}