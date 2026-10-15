package com.healthcare.dao;

import com.healthcare.model.MedicalRecord;
import com.healthcare.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MedicalRecordDAO {

    public boolean addRecord(MedicalRecord record) {

        String sql = "INSERT INTO medical_records " +
                "(patient_id, doctor_id, diagnosis, prescription, notes, record_date) " +
                "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, record.getPatientId());
            statement.setInt(2, record.getDoctorId());
            statement.setString(3, record.getDiagnosis());
            statement.setString(4, record.getPrescription());
            statement.setString(5, record.getNotes());
            statement.setString(6, record.getRecordDate());

            return statement.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public List<MedicalRecord> getRecordsByPatient(int patientId) {

        List<MedicalRecord> records = new ArrayList<>();

        String sql = "SELECT * FROM medical_records WHERE patient_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, patientId);

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {

                MedicalRecord record = new MedicalRecord(
                        resultSet.getInt("id"),
                        resultSet.getInt("patient_id"),
                        resultSet.getInt("doctor_id"),
                        resultSet.getString("diagnosis"),
                        resultSet.getString("prescription"),
                        resultSet.getString("notes"),
                        resultSet.getString("record_date")
                );

                records.add(record);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return records;
    }
}