package com.healthcare.model;

public class Doctor {

    private int id;
    private int userId;
    private String specialization;
    private String qualification;
    private String phone;
    private String availability;

    public Doctor() {
    }

    public Doctor(int id, int userId, String specialization,
                  String qualification, String phone, String availability) {
        this.id = id;
        this.userId = userId;
        this.specialization = specialization;
        this.qualification = qualification;
        this.phone = phone;
        this.availability = availability;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getSpecialization() {
        return specialization;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAvailability() {
        return availability;
    }

    public void setAvailability(String availability) {
        this.availability = availability;
    }
}