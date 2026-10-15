package com.healthcare.servlet;

import com.healthcare.model.DoctorSchedule;
import com.healthcare.service.DoctorScheduleService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/doctor/schedule")
public class DoctorScheduleServlet extends HttpServlet {

    private final DoctorScheduleService scheduleService =
            new DoctorScheduleService();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        // Temporary doctor ID for testing
        int doctorId = 1;

        List<DoctorSchedule> schedules =
                scheduleService.getSchedulesByDoctor(doctorId);

        request.setAttribute("schedules", schedules);

        request.getRequestDispatcher(
                "/doctor/schedule.jsp"
        ).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        // Delete schedule
        if ("delete".equals(action)) {

            int id = Integer.parseInt(
                    request.getParameter("id"));

            scheduleService.deleteSchedule(id);

        } else {

            // Add schedule
            int doctorId = 1;

            String dayOfWeek =
                    request.getParameter("dayOfWeek");

            String startTime =
                    request.getParameter("startTime");

            String endTime =
                    request.getParameter("endTime");

            DoctorSchedule schedule =
                    new DoctorSchedule(
                            0,
                            doctorId,
                            dayOfWeek,
                            startTime,
                            endTime,
                            "AVAILABLE"
                    );

            scheduleService.addSchedule(schedule);
        }

        response.sendRedirect(
                request.getContextPath()
                        + "/doctor/schedule"
        );
    }
}