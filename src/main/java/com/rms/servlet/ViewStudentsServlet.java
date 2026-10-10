package com.rms.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.rms.dao.StudentDAO;
import com.rms.model.Student;

@WebServlet("/ViewStudentsServlet")
public class ViewStudentsServlet extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        StudentDAO dao = new StudentDAO();

        List<Student> students =
                dao.getAllStudents();

        request.setAttribute(
                "studentList",
                students);

        request.getRequestDispatcher(
                "viewStudents.jsp")
                .forward(request, response);
    }
}