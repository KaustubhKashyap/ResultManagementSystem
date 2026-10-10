package com.rms.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.rms.dao.SubjectDAO;
import com.rms.model.Subject;

@WebServlet("/EditSubjectServlet")
public class EditSubjectServlet extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int subjectId =
            Integer.parseInt(
            request.getParameter("subjectId"));

        SubjectDAO dao =
            new SubjectDAO();

        Subject s =
            dao.getSubjectById(subjectId);

        request.setAttribute(
            "subject", s);

        request.getRequestDispatcher(
            "updateSubject.jsp")
            .forward(request, response);
    }
}