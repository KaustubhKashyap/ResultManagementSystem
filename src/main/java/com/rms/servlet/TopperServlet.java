package com.rms.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rms.dao.TopperDAO;
import com.rms.model.Topper;

@WebServlet("/TopperServlet")
public class TopperServlet extends HttpServlet {

protected void doGet(
        HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException, IOException {

    TopperDAO dao =
        new TopperDAO();

    List<Topper> list =
        dao.getTopperList();

    request.setAttribute(
        "topperList",
        list);

    request.getRequestDispatcher(
        "topper.jsp")
        .forward(request,response);
}


}
