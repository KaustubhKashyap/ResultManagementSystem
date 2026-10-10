package com.rms.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.rms.dao.MarksDAO;
import com.rms.model.Marks;

@WebServlet("/EnterMarksServlet")
public class EnterMarksServlet extends HttpServlet {

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        Marks m = new Marks();

        m.setRollNo(
            Integer.parseInt(
            request.getParameter("rollno")));

        m.setSubjectId(
            Integer.parseInt(
            request.getParameter("subjectId")));

        m.setMarks(
            Integer.parseInt(
            request.getParameter("marks")));

        MarksDAO dao =
            new MarksDAO();

        boolean status =
            dao.addMarks(m);

        if(status) {

        	response.sendRedirect("DashboardServlet");

        } else {

        	response.getWriter().println(
        		    "<h2>Failed To Add Marks</h2>");
        }
    }
}