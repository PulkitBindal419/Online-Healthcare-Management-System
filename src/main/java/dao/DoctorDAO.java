package com.healthcare.dao;

import com.healthcare.model.Doctor;
import com.healthcare.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DoctorDAO {

    public List<Doctor> getAllDoctors() {

        List<Doctor> doctors = new ArrayList<>();

        String sql = "SELECT * FROM doctors";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {

                Doctor doctor = new Doctor(
                        resultSet.getInt("id"),
                        resultSet.getInt("user_id"),
                        resultSet.getString("specialization"),
                        resultSet.getString("qualification"),
                        resultSet.getString("phone"),
                        resultSet.getString("availability")
                );

                doctors.add(doctor);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return doctors;
    }
}