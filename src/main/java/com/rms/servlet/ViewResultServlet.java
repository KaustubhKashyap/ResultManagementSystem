package com.rms.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.rms.dao.ResultDAO;
import com.rms.model.Result;
import com.rms.model.Student;

@WebServlet("/ViewResultServlet")
public class ViewResultServlet extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        Student s =
                (Student)session.getAttribute("student");

        if(s == null) {
            response.sendRedirect("studentLogin.jsp");
            return;
        }

        int rollNo = s.getRollNo();

        ResultDAO dao =
                new ResultDAO();

        List<Result> list = dao.getResult(rollNo);

        request.setAttribute("resultList", list);
        request.setAttribute("fromStudent", true);

        request.getRequestDispatcher(
                "result.jsp")
                .forward(request, response);
    }
}