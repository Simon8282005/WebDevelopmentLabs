package com.lab.controller;

import com.lab.bean.StudentBean;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author user
 */
public class StudentListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List <StudentBean> studentList = new ArrayList<>();
        
        StudentBean s1 = new StudentBean();
        s1.setName("Syamil");
        s1.setMatricNo("S11111");
        
        StudentBean s2 = new StudentBean();
        s2.setName("Kishor");
        s2.setMatricNo("S22222");
        
        StudentBean s3 = new StudentBean();
        s3.setName("Arisya");
        s3.setMatricNo("S33333");
        
        studentList.add(s1);
        studentList.add(s2);
        studentList.add(s3);
        
        request.setAttribute("studentList", studentList);
        
        RequestDispatcher rd = request.getRequestDispatcher("displayList.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
