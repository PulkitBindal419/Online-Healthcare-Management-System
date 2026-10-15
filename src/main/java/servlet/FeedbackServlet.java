package com.healthcare.servlet;

import com.healthcare.model.Feedback;
import com.healthcare.service.FeedbackService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/doctor/feedback")
public class FeedbackServlet extends HttpServlet {

    private final FeedbackService feedbackService =
            new FeedbackService();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        // Temporary doctor ID for testing
        int doctorId = 1;

        List<Feedback> feedbackList =
                feedbackService.getFeedbackByDoctor(doctorId);

        request.setAttribute("feedbackList", feedbackList);

        request.getRequestDispatcher(
                "/doctor/feedback.jsp"
        ).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("delete".equals(action)) {

            int id = Integer.parseInt(
                    request.getParameter("id"));

            feedbackService.deleteFeedback(id);
        }

        response.sendRedirect(
                request.getContextPath()
                        + "/doctor/feedback"
        );
    }
}