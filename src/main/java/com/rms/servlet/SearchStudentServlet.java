package com.rms.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.rms.dao.StudentDAO;
import com.rms.model.Student;

@WebServlet("/SearchStudentServlet")
public class SearchStudentServlet extends HttpServlet {

protected void doPost(
        HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException, IOException {

    int rollNo =
        Integer.parseInt(
            request.getParameter("rollno"));

    StudentDAO dao =
        new StudentDAO();

    Student student =
        dao.searchStudent(rollNo);

    request.setAttribute(
        "student",
        student);

    request.getRequestDispatcher(
        "studentSearchResult.jsp")
        .forward(request, response);
}


}
