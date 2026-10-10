package com.rms.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.rms.dao.StudentDAO;

@WebServlet("/DeleteStudentServlet")
public class DeleteStudentServlet extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        int rollNo =
            Integer.parseInt(
            request.getParameter("rollno"));

        StudentDAO dao =
            new StudentDAO();

        dao.deleteStudent(rollNo);

        response.sendRedirect(
            "ViewStudentsServlet");
    }
}