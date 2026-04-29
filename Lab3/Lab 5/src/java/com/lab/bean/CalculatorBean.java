package com.lab.bean;

/**
 *
 * @author Simon
 */
public class CalculatorBean {
    private double num1;
    private double num2;
    
    public CalculatorBean() {
        
    }

    public double getNum1() {
        return num1;
    }

    public void setNum1(double number1) {
        this.num1 = number1;
    }

    public double getNum2() {
        return num2;
    }

    public void setNum2(double number2) {
        this.num2 = number2;
    }
    
    public double getSum() {
        return num1 + num2;
    }
    
}
