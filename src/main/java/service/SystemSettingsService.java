package com.healthcare.service;

import com.healthcare.dao.SystemSettingsDAO;

public class SystemSettingsService {

    private final SystemSettingsDAO systemSettingsDAO;

    public SystemSettingsService() {
        systemSettingsDAO = new SystemSettingsDAO();
    }

    public boolean saveSettings(String hospitalName, String appointmentStatus, String systemEmail) {
        return systemSettingsDAO.saveSettings(
                hospitalName,
                appointmentStatus,
                systemEmail
        );
    }
}