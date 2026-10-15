package com.healthcare.service;

import com.healthcare.dao.DoctorScheduleDAO;
import com.healthcare.model.DoctorSchedule;

import java.util.List;

public class DoctorScheduleService {

    private final DoctorScheduleDAO doctorScheduleDAO;

    public DoctorScheduleService() {
        doctorScheduleDAO = new DoctorScheduleDAO();
    }

    public boolean addSchedule(DoctorSchedule schedule) {
        return doctorScheduleDAO.addSchedule(schedule);
    }

    public List<DoctorSchedule> getSchedulesByDoctor(int doctorId) {
        return doctorScheduleDAO.getSchedulesByDoctor(doctorId);
    }

    public boolean deleteSchedule(int id) {
        return doctorScheduleDAO.deleteSchedule(id);
    }
}