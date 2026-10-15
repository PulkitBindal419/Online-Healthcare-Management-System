package com.healthcare.service;

import com.healthcare.dao.MedicalRecordDAO;
import com.healthcare.model.MedicalRecord;

import java.util.List;

public class MedicalRecordService {

    private final MedicalRecordDAO medicalRecordDAO;

    public MedicalRecordService() {
        medicalRecordDAO = new MedicalRecordDAO();
    }

    public boolean addRecord(MedicalRecord record) {
        return medicalRecordDAO.addRecord(record);
    }

    public List<MedicalRecord> getRecordsByPatient(int patientId) {
        return medicalRecordDAO.getRecordsByPatient(patientId);
    }
}