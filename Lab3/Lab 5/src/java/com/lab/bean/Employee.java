package com.lab.bean;

/**
 *
 * @author Simon
 */
public class Employee {
    private String empID;
    private String name;
    private String department;
    private double basicSalary;
    
    public Employee(String id, String name, String department, double basicSalary) {
        this.empID = id;
        this.name = name;
        this.department = department;
        this.basicSalary = basicSalary;
    }

    public String getEmpID() {
        return empID;
    }

    public void setEmpID(String empID) {
        this.empID = empID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public double getBasicSalary() {
        return basicSalary;
    }

    public void setBasicSalary(double basicSalary) {
        this.basicSalary = basicSalary;
    }
    
    
}
