package com.rms.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.rms.dao.StudentDAO;
import com.rms.model.Student;

@WebServlet("/EditStudentServlet")
public class EditStudentServlet extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int rollNo =
            Integer.parseInt(
            request.getParameter("rollno"));

        StudentDAO dao =
            new StudentDAO();

        Student s =
            dao.getStudentByRollNo(rollNo);

        request.setAttribute("student", s);

        request.getRequestDispatcher(
            "updateStudent.jsp")
            .forward(request, response);
    }
}