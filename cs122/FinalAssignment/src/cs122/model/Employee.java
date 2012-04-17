package cs122.model;

import java.util.Comparator;

/**
 * User: Tom Byrne(tom.byrne@apple.com)
 * Copyright (C) 2011 Apple Inc.
 * "I code not because I have a problem to solve, but because there is
 * code within me, crying to get out."
 */
public class Employee implements Comparable<Employee>{

    public final static int EMPLOYEE_NUMBER_MAXIMUM = 99999999;
    public final static int EMPLOYEE_SALARY_MAXIMUM = 1000000;

    //Data members
    private int employeeNumber;
    private String employeeName;
    private int employeeSalary;

    public Employee(){
        employeeName = null;
        employeeNumber = -1;
        employeeSalary = -1;
    }
    
    public Employee(final int empNumber, final String name, final int empSalary) {

        //Check all values, even though they should be correct already.
        if (0 > empNumber || EMPLOYEE_NUMBER_MAXIMUM < empNumber) {
            throw new IllegalArgumentException("Employee Number must be unique and between 0 and 99999999 inclusive.");
        }
        employeeNumber = empNumber;

        if (null == name || name.length() > 40) {
            throw new IllegalArgumentException("Employee Name must be 40 characters or less.");
        }

        employeeName = name;
        if (0 > empSalary || EMPLOYEE_NUMBER_MAXIMUM < empSalary) {
            throw new IllegalArgumentException("Employee Salary must be between 0 and 1000000, inclusive.");
        }
        employeeSalary = empSalary;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("[Employee - ID:").append(employeeNumber).append(" - Name: ").append(employeeName).append(" - Salary:").append(employeeSalary)
                .append("]");

        return sb.toString();

    }

    public int getSalary() {
        return employeeSalary;
    }

    public void setSalary(int sal) {
        employeeSalary = sal;
    }

    public int getEmployeeNumber() {
        return employeeNumber;
    }

    public void setEmployeeNumber(int empNum){
        employeeNumber = empNum;
    }

    public String getName() {
        return employeeName;
    }
    public void setName(String name){
        employeeName = name;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }

        Employee employee = (Employee) o;

        if (employeeNumber != employee.employeeNumber) {
            return false;
        }
        if (employeeSalary != employee.employeeSalary) {
            return false;
        }
        if (!employeeName.equals(employee.employeeName)) {
            return false;
        }

        return true;
    }

    @Override
    public int hashCode() {
        int result = employeeNumber;
        result = 31 * result + employeeName.hashCode();
        result = 31 * result + employeeSalary;
        return result;
    }


    //============================================================================Inner Class

    public int compareTo(Employee o) {
        return this.employeeNumber - o.employeeNumber;
    }


    public static final class EmployeeNumberComparator implements Comparator<Employee> {
        public int compare(Employee o1, Employee o2) {
            return o1.employeeNumber - o2.employeeNumber;
        }

    }
}
