package com.rms.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.rms.dao.SubjectDAO;
import com.rms.model.Subject;

@WebServlet("/AddSubjectServlet")
public class AddSubjectServlet extends HttpServlet {

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        Subject s = new Subject();

        s.setSubjectId(
            Integer.parseInt(
            request.getParameter("subjectId")));

        s.setSubjectName(
            request.getParameter("subjectName"));

        SubjectDAO dao =
            new SubjectDAO();

        boolean status =
            dao.addSubject(s);

        if(status) {

        	response.sendRedirect(
        			"ViewSubjectsServlet");

        } else {

            response.getWriter().println(
                "<h2>Error Adding Subject</h2>");
        }
    }
}