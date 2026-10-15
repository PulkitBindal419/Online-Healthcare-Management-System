package com.healthcare.dao;

import com.healthcare.model.User;
import com.healthcare.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    // ================= LOGIN =================

    public User login(String email, String password) {

        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection connection = DBConnection.getConnection();
                 PreparedStatement statement = connection.prepareStatement(sql)) {

                statement.setString(1, email);
                statement.setString(2, password);

                ResultSet resultSet = statement.executeQuery();

                if (resultSet.next()) {

                    return new User(
                            resultSet.getInt("id"),
                            resultSet.getString("name"),
                            resultSet.getString("email"),
                            resultSet.getString("password"),
                            resultSet.getString("role")
                    );
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }


    // ================= GET ALL USERS =================

    public List<User> getAllUsers() {

        List<User> users = new ArrayList<>();

        String sql = "SELECT * FROM users ORDER BY id";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection connection = DBConnection.getConnection();
                 PreparedStatement statement = connection.prepareStatement(sql);
                 ResultSet resultSet = statement.executeQuery()) {

                while (resultSet.next()) {

                    User user = new User(
                            resultSet.getInt("id"),
                            resultSet.getString("name"),
                            resultSet.getString("email"),
                            resultSet.getString("password"),
                            resultSet.getString("role")
                    );

                    users.add(user);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return users;
    }


    // ================= ADD USER =================

    public boolean addUser(User user) {

        String sql = "INSERT INTO users (name, email, password, role) VALUES (?, ?, ?, ?)";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection connection = DBConnection.getConnection();
                 PreparedStatement statement = connection.prepareStatement(sql)) {

                statement.setString(1, user.getName());
                statement.setString(2, user.getEmail());
                statement.setString(3, user.getPassword());
                statement.setString(4, user.getRole());

                return statement.executeUpdate() > 0;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // ================= DELETE USER =================

    public boolean deleteUser(int id) {

        String sql = "DELETE FROM users WHERE id = ?";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection connection = DBConnection.getConnection();
                 PreparedStatement statement = connection.prepareStatement(sql)) {

                statement.setInt(1, id);

                return statement.executeUpdate() > 0;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}