package com.healthcare.service;

import com.healthcare.dao.AnalyticsDAO;

public class AnalyticsService {

    private final AnalyticsDAO analyticsDAO;

    public AnalyticsService() {
        analyticsDAO = new AnalyticsDAO();
    }

    public int getTotalUsers() {
        return analyticsDAO.getTotalUsers();
    }

    public int getTotalAppointments() {
        return analyticsDAO.getTotalAppointments();
    }

    public int getTotalMedicalRecords() {
        return analyticsDAO.getTotalMedicalRecords();
    }

    public int getTotalFeedback() {
        return analyticsDAO.getTotalFeedback();
    }
}