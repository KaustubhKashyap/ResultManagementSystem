package com.rms.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.rms.dao.SubjectDAO;
import com.rms.model.Subject;

@WebServlet("/ViewSubjectsServlet")
public class ViewSubjectsServlet extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        SubjectDAO dao =
            new SubjectDAO();

        List<Subject> list =
            dao.getAllSubjects();

        request.setAttribute(
            "subjectList",
            list);

        request.getRequestDispatcher(
            "viewSubjects.jsp")
            .forward(request, response);
    }
}