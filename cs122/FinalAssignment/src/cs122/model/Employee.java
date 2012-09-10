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
    private String employeeFirstName;
    private String employeeLastName;
    private int employeeSalary;

    public Employee(){
        employeeFirstName = null;
        employeeLastName = null;
        employeeNumber = -1;
        employeeSalary = -1;
    }
    
    public Employee(final int empNumber, final String firstname, final String lastname, final int empSalary) {

        //Check all values, even though they should be correct already.
        if (0 > empNumber || EMPLOYEE_NUMBER_MAXIMUM < empNumber) {
            throw new IllegalArgumentException("Employee Number must be unique and between 0 and 99999999 inclusive.");
        }
        employeeNumber = empNumber;

        if (null == firstname || firstname.length() > 50) {
            throw new IllegalArgumentException("Employee First Name must be 40 characters or less.");
        }
        employeeFirstName = firstname;

        if (null == lastname || lastname.length() > 50) {
            throw new IllegalArgumentException("Employee First Name must be 40 characters or less.");
        }
        employeeLastName = lastname;

        if (0 > empSalary || EMPLOYEE_NUMBER_MAXIMUM < empSalary) {
            throw new IllegalArgumentException("Employee Salary must be between 0 and 1000000, inclusive.");
        }
        employeeSalary = empSalary;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("[Employee - ID:").append(employeeNumber).append(" - Name: ").append(employeeFirstName).append(" ").append(employeeLastName).append(" - Salary:").append(employeeSalary)
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

    public String getFirstName() {
        return employeeFirstName;
    }
    public void setFirstName(String name){
        employeeFirstName = name;
    }
    public String getLastName(){
        return employeeLastName;
    }
    public void setLastName(String lastName){
        employeeLastName = lastName;
    }

    public String getName(){
        return getFirstName()+" "+getLastName();
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
        if (!employeeLastName.equals(employee.employeeLastName)) {
            return false;
        }
        if (!employeeFirstName.equals(employee.employeeFirstName)) {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        int result = employeeNumber;
        result = 31 * result + employeeLastName.hashCode();
        result = 31 * result + employeeFirstName.hashCode();
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
