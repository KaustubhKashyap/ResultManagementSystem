package com.rms.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.rms.dao.ResultSummaryDAO;
import com.rms.model.ResultSummary;

@WebServlet("/ResultSummaryServlet")
public class ResultSummaryServlet extends HttpServlet {

protected void doGet(
        HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException, IOException {

    ResultSummaryDAO dao =
        new ResultSummaryDAO();

    ResultSummary summary =
        dao.getSummary();

    request.setAttribute(
        "summary",
        summary);

    request.getRequestDispatcher(
        "resultSummary.jsp")
        .forward(request, response);
}

}
