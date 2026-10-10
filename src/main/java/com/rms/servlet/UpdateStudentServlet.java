package com.rms.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.rms.dao.StudentDAO;
import com.rms.model.Student;

@WebServlet("/UpdateStudentServlet")
public class UpdateStudentServlet extends HttpServlet {

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        Student s = new Student();

        s.setRollNo(
            Integer.parseInt(
            request.getParameter("rollno")));

        s.setName(
            request.getParameter("name"));

        s.setStudentClass(
            request.getParameter("studentClass"));

        s.setEmail(
            request.getParameter("email"));

        StudentDAO dao =
            new StudentDAO();

        dao.updateStudent(s);

        response.sendRedirect(
            "ViewStudentsServlet");
    }
}