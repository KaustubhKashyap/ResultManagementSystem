package com.rms.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.rms.dao.StudentDAO;
import com.rms.model.Student;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {

protected void doPost(
        HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException, IOException {

    HttpSession session =
            request.getSession(false);

    Student student =
            (Student) session.getAttribute("student");

    int rollNo =
            student.getRollNo();

    String newPassword =
            request.getParameter("newPassword");

    StudentDAO dao =
            new StudentDAO();

    boolean status =
            dao.changePassword(
                    rollNo,
                    newPassword);

    if(status) {

        response.getWriter().println(
                "Password Changed Successfully");

    } else {

        response.getWriter().println(
                "Password Change Failed");
    }
}

}
