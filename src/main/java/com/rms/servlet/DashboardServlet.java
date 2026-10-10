package com.rms.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.rms.dao.DashboardDAO;

@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        DashboardDAO dao =
            new DashboardDAO();

        request.setAttribute(
            "students",
            dao.getStudentCount());

        request.setAttribute(
            "subjects",
            dao.getSubjectCount());

        request.setAttribute(
            "marks",
            dao.getMarksCount());
        
        request.setAttribute(
        	    "topper",
        	    dao.getTopperName());
        
        request.setAttribute(
        	    "highestPercentage",
        	    dao.getHighestPercentage());

        request.getRequestDispatcher(
            "dashboard.jsp")
            .forward(request,response);
    }
}