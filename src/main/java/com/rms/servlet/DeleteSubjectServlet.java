package com.rms.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.rms.dao.SubjectDAO;

@WebServlet("/DeleteSubjectServlet")
public class DeleteSubjectServlet extends HttpServlet {

protected void doGet(
        HttpServletRequest request,
        HttpServletResponse response)
        throws IOException {

    int subjectId =
        Integer.parseInt(
        request.getParameter("subjectId"));

    SubjectDAO dao =
        new SubjectDAO();

    dao.deleteSubject(subjectId);

    response.sendRedirect(
        "ViewSubjectsServlet");
}

}
