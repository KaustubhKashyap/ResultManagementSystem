package com.rms.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rms.dao.LoginDAO;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String username =
                request.getParameter("username");

        String password =
                request.getParameter("password");

        LoginDAO dao =
                new LoginDAO();

        if(dao.validate(username,password)) {

            HttpSession session =
                    request.getSession();

            session.setAttribute(
                    "admin",
                    username);

            response.sendRedirect("DashboardServlet");

        }
        else {

            response.sendRedirect(
                    "login.jsp");

        }
    }
}