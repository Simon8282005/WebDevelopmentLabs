package com.lab.controller;

import com.lab.bean.Employee;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author user
 */
public class PayrollServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<Employee> employeeList = new ArrayList<>();
        
        employeeList.add(new Employee("A101", "Simon", "Computer Science", 5000));
        employeeList.add(new Employee("A102", "Weiqi", "Cybersecurity", 7000));
        employeeList.add(new Employee("A103", "Jun Han", "Front End Designer", 6000));
        employeeList.add(new Employee("A104", "Syamil", "Database Developer", 2500));
        employeeList.add(new Employee("A105", "Arisya", "Back End developer", 8000));
        employeeList.add(new Employee("A106", "Kishor", "Full Stack Developer", 5000));
        
        request.setAttribute("employeelist", employeeList);
        
        RequestDispatcher rd = request.getRequestDispatcher("payroll_view.jsp");
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
