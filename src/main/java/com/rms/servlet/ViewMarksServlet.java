package com.rms.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rms.dao.MarksDAO;
import com.rms.model.Marks;

@WebServlet("/ViewMarksServlet")
public class ViewMarksServlet extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        MarksDAO dao = new MarksDAO();

        List<Marks> list = dao.getAllMarks();

        request.setAttribute("marksList", list);

        request.getRequestDispatcher("viewMarks.jsp")
               .forward(request, response);
    }
}