package com.rms.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.rms.dao.SubjectDAO;
import com.rms.model.Subject;

@WebServlet("/UpdateSubjectServlet")
public class UpdateSubjectServlet extends HttpServlet {

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        Subject s =
            new Subject();

        s.setSubjectId(
            Integer.parseInt(
            request.getParameter("subjectId")));

        s.setSubjectName(
            request.getParameter("subjectName"));

        SubjectDAO dao =
            new SubjectDAO();

        dao.updateSubject(s);

        response.sendRedirect(
            "ViewSubjectsServlet");
    }
}