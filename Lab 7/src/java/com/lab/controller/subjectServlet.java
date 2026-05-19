package com.lab.controller;

import com.lab.dao.subjectDAO;
import jakarta.servlet.ServletConfig;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author user
 */

public class subjectServlet extends HttpServlet {
    
    private subjectDAO subDAO;
    private HttpSession session;

    @Override
    public void init(ServletConfig config) throws ServletException {
        subDAO = new subjectDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        session = request.getSession(false);
        String action = request.getParameter("action");
        
        String matricNo = (String) session.getAttribute("matricNo");
        String subjectName = (String) request.getParameter("subjectName");
        String subjectCode = (String) request.getParameter("subjectCode");
        
        switch(action) {
            case "registerSubject":
                subDAO.insertSubject(matricNo, subjectName, subjectCode);
                response.sendRedirect("subject/viewSubject.jsp");
                break;
            case "updateSubject":
                subDAO.updateSubject(subjectName, subjectCode);
                response.sendRedirect("subject/viewSubject.jsp");
                break;
            case "viewSubject":
                response.sendRedirect("/subject/viewSubject.jsp");
                break;
        }
        
        
        
       
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
