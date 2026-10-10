package com.rms.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rms.dao.StudentDAO;
import com.rms.model.Student;

@WebServlet("/AddStudentServlet")
public class AddStudentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

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
        
        String password =
        		request.getParameter("password");
        
        s.setPassword(password);

        StudentDAO dao = new StudentDAO();

        if(dao.addStudent(s)) {

            response.sendRedirect(
                    "studentSuccess.jsp");

        } else {

            response.getWriter().println(
                    "Student Insert Failed");
        }
    }
}