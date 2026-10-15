package com.healthcare.service;

import com.healthcare.dao.DoctorDAO;
import com.healthcare.model.Doctor;

import java.util.List;

public class DoctorService {

    private final DoctorDAO doctorDAO;

    public DoctorService() {
        doctorDAO = new DoctorDAO();
    }

    public List<Doctor> getAllDoctors() {
        return doctorDAO.getAllDoctors();
    }
}