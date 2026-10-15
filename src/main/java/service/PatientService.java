package com.healthcare.service;

import com.healthcare.dao.PatientDAO;

public class PatientService {

    private final PatientDAO patientDAO;

    public PatientService() {
        patientDAO = new PatientDAO();
    }

    public int getPatientIdByUserId(int userId) {
        return patientDAO.getPatientIdByUserId(userId);
    }
}