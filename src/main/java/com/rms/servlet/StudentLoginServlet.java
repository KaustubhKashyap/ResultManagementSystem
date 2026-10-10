package com.rms.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rms.dao.StudentDAO;
import com.rms.model.Student;

@WebServlet("/StudentLoginServlet")
public class StudentLoginServlet extends HttpServlet {

private static final long serialVersionUID = 1L;

protected void doPost(
        HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException, IOException {

    int rollNo =
        Integer.parseInt(
        request.getParameter("rollno"));

    String password =
        request.getParameter("password");

    StudentDAO dao =
        new StudentDAO();

    Student student =
        dao.validateStudent(
        rollNo,
        password);

    if(student != null) {

        HttpSession session =
            request.getSession();

        session.setAttribute(
            "student",
            student);

        response.sendRedirect(
            "studentDashboard.jsp");

    } else {

        response.getWriter().println(
            "Invalid Roll Number or Password");

    }
}

}
