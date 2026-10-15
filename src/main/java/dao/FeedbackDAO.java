package com.healthcare.dao;

import com.healthcare.model.Feedback;
import com.healthcare.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FeedbackDAO {

    public List<Feedback> getFeedbackByDoctor(int doctorId) {

        List<Feedback> feedbackList = new ArrayList<>();

        String sql = "SELECT * FROM feedback " +
                "WHERE doctor_id = ? ORDER BY id DESC";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection connection = DBConnection.getConnection();
                 PreparedStatement statement =
                         connection.prepareStatement(sql)) {

                statement.setInt(1, doctorId);

                try (ResultSet resultSet = statement.executeQuery()) {

                    while (resultSet.next()) {

                        Feedback feedback = new Feedback(
                                resultSet.getInt("id"),
                                resultSet.getInt("patient_id"),
                                resultSet.getInt("doctor_id"),
                                resultSet.getInt("rating"),
                                resultSet.getString("comments")
                        );

                        feedbackList.add(feedback);
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return feedbackList;
    }

    public boolean deleteFeedback(int id) {

        String sql = "DELETE FROM feedback WHERE id = ?";

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