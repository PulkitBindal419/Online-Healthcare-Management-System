package com.healthcare.model;

public class MedicalRecord {

    private int id;
    private int patientId;
    private int doctorId;
    private String diagnosis;
    private String prescription;
    private String notes;
    private String recordDate;

    public MedicalRecord() {
    }

    public MedicalRecord(int id, int patientId, int doctorId,
                         String diagnosis, String prescription,
                         String notes, String recordDate) {
        this.id = id;
        this.patientId = patientId;
        this.doctorId = doctorId;
        this.diagnosis = diagnosis;
        this.prescription = prescription;
        this.notes = notes;
        this.recordDate = recordDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPatientId() {
        return patientId;
    }

    public void setPatientId(int patientId) {
        this.patientId = patientId;
    }

    public int getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
    }

    public String getDiagnosis() {
        return diagnosis;
    }

    public void setDiagnosis(String diagnosis) {
        this.diagnosis = diagnosis;
    }

    public String getPrescription() {
        return prescription;
    }

    public void setPrescription(String prescription) {
        this.prescription = prescription;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public String getRecordDate() {
        return recordDate;
    }

    public void setRecordDate(String recordDate) {
        this.recordDate = recordDate;
    }
}