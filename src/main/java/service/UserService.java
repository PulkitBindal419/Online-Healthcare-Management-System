package com.healthcare.service;

import com.healthcare.dao.UserDAO;
import com.healthcare.model.User;

import java.util.List;

public class UserService {

    private final UserDAO userDAO;

    public UserService() {
        userDAO = new UserDAO();
    }

    public User login(String email, String password) {
        return userDAO.login(email, password);
    }

    public List<User> getAllUsers() {
        return userDAO.getAllUsers();
    }

    public boolean addUser(User user) {
        return userDAO.addUser(user);
    }

    public boolean deleteUser(int id) {
        return userDAO.deleteUser(id);
    }
}