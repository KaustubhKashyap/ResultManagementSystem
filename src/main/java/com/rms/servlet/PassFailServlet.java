package com.rms.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.rms.dao.ResultDAO;
import com.rms.model.Result;

@WebServlet("/PassFailServlet")
public class PassFailServlet extends HttpServlet {

protected void doGet(
        HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException, IOException {

    ResultDAO dao =
        new ResultDAO();

    List<Result> list =
        dao.getAllResults();

    request.setAttribute(
        "resultList", list);

    request.getRequestDispatcher(
        "passFailReport.jsp")
        .forward(request, response);
}


}
