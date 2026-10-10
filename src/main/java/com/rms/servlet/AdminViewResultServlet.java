package com.rms.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.rms.dao.ResultDAO;
import com.rms.model.Result;

@WebServlet("/AdminViewResultServlet")
public class AdminViewResultServlet extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String rollNoParam = request.getParameter("rollno");

        if (rollNoParam == null || rollNoParam.trim().isEmpty()) {
            response.sendRedirect("adminViewResult.jsp");
            return;
        }

        int rollNo = Integer.parseInt(rollNoParam);

        ResultDAO dao = new ResultDAO();

        List<Result> list = dao.getResult(rollNo);

        request.setAttribute("resultList", list);
        request.setAttribute("fromAdmin", true);

        request.getRequestDispatcher("result.jsp")
               .forward(request, response);
    }
}