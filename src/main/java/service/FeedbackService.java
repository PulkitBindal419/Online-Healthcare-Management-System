package com.healthcare.service;

import com.healthcare.dao.FeedbackDAO;
import com.healthcare.model.Feedback;

import java.util.List;

public class FeedbackService {

    private final FeedbackDAO feedbackDAO;

    public FeedbackService() {
        feedbackDAO = new FeedbackDAO();
    }

    public List<Feedback> getFeedbackByDoctor(int doctorId) {
        return feedbackDAO.getFeedbackByDoctor(doctorId);
    }

    public boolean deleteFeedback(int id) {
        return feedbackDAO.deleteFeedback(id);
    }
}