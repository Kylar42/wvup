import java.util.Comparator;

/**
 * User: Tom Byrne(tom.byrne@apple.com)
 * Copyright (C) 2011 Apple Inc.
 * "I code not because I have a problem to solve, but because there is
 * code within me, crying to get out."
 */
public class Employee {

    public final static int EMPLOYEE_NUMBER_MAXIMUM = 99999999;
    public final static int EMPLOYEE_SALARY_MAXIMUM = 1000000;

    //Data members
    final int    employeeNumber;
    final String employeeName;
    final int    employeeSalary;
    final int    ordinal;

    public Employee(final int number, final String name, final int salary, int ordinal){

        //Check all values, even though they should be correct already.
        if(0 > number || EMPLOYEE_NUMBER_MAXIMUM < number){
            throw new IllegalArgumentException("Employee Number must be unique and between 0 and 99999999 inclusive.");
        }
        employeeNumber = number;

        if(null == name || name.length() > 40){
            throw new IllegalArgumentException("Employee Name must be 40 characters or less.");
        }

        employeeName = name;
        if(0 > salary || EMPLOYEE_NUMBER_MAXIMUM < salary){
            throw new IllegalArgumentException("Employee Salary must be between 0 and 1000000, inclusive.");
        }
        employeeSalary = salary;

        this.ordinal = ordinal;
    }


    public int getSalary(){
        return employeeSalary;
    }

    public int getNumber(){
        return employeeNumber;
    }

    public String getName(){
        return employeeName;
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


    public static final class EmployeeNumberComparator implements Comparator<Employee> {
        public int compare(Employee o1, Employee o2) {
            return o1.employeeNumber-o2.employeeNumber;
        }

    }

    public static final class EmployeeOrdinalComparator implements Comparator<Employee> {
        public int compare(Employee o1, Employee o2) {
            return o1.ordinal-o2.ordinal;
        }

    }
}
