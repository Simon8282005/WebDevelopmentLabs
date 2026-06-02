/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;

import com.dao.CarDAO;
import com.model.Car;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;
import java.util.ArrayList;

/**
 *
 * @author user
 */
@WebServlet("/")
public class CarServlet extends HttpServlet {

    private CarDAO carDAO;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/insert":
                    insertCar(request, response);
                    break;
                case "/delete":
                    deleteCar(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/update":
                    updateCar(request, response);
                    break;
                default:
                    listCar(request, response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void listCar(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        ArrayList<Car> carList = carDAO.findAllCar();
        request.setAttribute("carList", carList);
        
        RequestDispatcher rd = request.getRequestDispatcher("CarList.jsp");
        rd.forward(request, response);
    }
    
    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        RequestDispatcher rd = request.getRequestDispatcher("CarForm.jsp");
        rd.forward(request, response);
    }
    
    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        Car existingCar= carDAO.findCar(id);
        
        RequestDispatcher rd = request.getRequestDispatcher("CarForm.jsp");
        request.setAttribute("car", existingCar);
        rd.forward(request, response);
    }
    
    private void insertCar(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        int cyclinder = Integer.parseInt(request.getParameter("cyclinder"));
        double price = Double.parseDouble(request.getParameter("price"));
        
        carDAO.insertNewCar(brand, model, cyclinder, price);
        response.sendRedirect("list");
    }
    
    private void updateCar(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id").trim());
        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        int cyclinder = Integer.parseInt(request.getParameter("cyclinder").trim());
        double price = Double.parseDouble(request.getParameter("price").trim());
        
        System.out.println("Id: " + id);
        System.out.println("brand: " + brand);
        System.out.println("model: " + model);
        System.out.println("cyclinder: " + cyclinder);
        System.out.println("price: " + price);
        
        carDAO.updateCar(id, brand, model, cyclinder, price);
        response.sendRedirect("list");
    }
    
    private void deleteCar(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        carDAO.deleteCar(id);
        response.sendRedirect("list");
    } 
    
    public void init() {
        carDAO = new CarDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
