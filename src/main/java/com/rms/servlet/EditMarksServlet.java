package com.rms.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.rms.dao.MarksDAO;
import com.rms.model.Marks;

@WebServlet("/EditMarksServlet")
public class EditMarksServlet extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int rollNo =
            Integer.parseInt(
                request.getParameter("rollno"));

        int subjectId =
            Integer.parseInt(
                request.getParameter("subjectId"));

        MarksDAO dao = new MarksDAO();

        Marks m =
            dao.getMarks(rollNo, subjectId);

        request.setAttribute(
            "marks", m);

        request.getRequestDispatcher(
            "updateMarks.jsp")
            .forward(request, response);
    }
}
