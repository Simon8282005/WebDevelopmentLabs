/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package SourcePackages;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get username and password
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        // Check the username and password
        if(username.equals("Ahmad") && password.equals("4567")) {
            // If correct
            request.setAttribute("accountType", "Premium Student");
            request.setAttribute("email", "ahmad@siswa.edu.my");
            
            // Request forward to AccountServlet
            RequestDispatcher rd = request.getRequestDispatcher("AccountServlet");
            rd.forward(request, response);
        } else if (username.equals("Ding") && password.equals("123")) {
            // If another correct
            request.setAttribute("accountType", "Standard Student");
            request.setAttribute("email", "12345678@gmail.com");
            
            RequestDispatcher rd = request.getRequestDispatcher("AccountServlet");
            rd.forward(request, response);
        } else {
            // If fail
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<h3 style='color:red'>Login Failed ! Invalid credentials. </h3>");
            out.println("<a href='index.html'>Try Again</a>");
        }
    }
}
