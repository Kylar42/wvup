package cs122.io;

import cs122.model.Employee;
import cs122.model.EmployeeMenuItem;

import java.text.NumberFormat;
import java.util.List;

/**
 * User: Tom Byrne(tom.byrne@apple.com)
 * Copyright (C) 2011 Apple Inc.
 * "I code not because I have a problem to solve, but because there is
 * code within me, crying to get out."
 */
public class EmployeeStdoutWriter {

    private final NumberFormat currencyInstance = NumberFormat.getCurrencyInstance();


    public EmployeeStdoutWriter() {

    }

    public void printEmployeeList(final List<? extends Employee> listToPrint, double avgSalaryAsDouble) {
        //Loop through the employees
        for (final Employee e : listToPrint) {
            printEmployee(e, avgSalaryAsDouble);
            System.out.println();//Spacing.
        }
    }

    public void printAverageSalary(double averageSalaryAsDouble){
        System.out.println("The average salary is:"+currencyInstance.format(averageSalaryAsDouble));
    }

    public void printEmployee(final Employee employeeToPrint, double avgSalaryAsDouble) {
        //Print out the 3 pieces of data
        System.out.println("Employee Name: " + employeeToPrint.getName());
        System.out.println("Employee Number: " + employeeToPrint.getEmployeeNumber());
        System.out.println(employeeToPrint.getName() + "'s salary: " + currencyInstance.format(employeeToPrint.getSalary()));

        //Let's look to see if it's average, or else above/below.
        if (Double.MIN_VALUE != avgSalaryAsDouble) {
            if (avgSalaryAsDouble == employeeToPrint.getSalary()) {
                System.out.println(employeeToPrint.getName() + "'s salary is exactly average.");
            } else {
                System.out.println(employeeToPrint.getName() + "'s salary is " + ((employeeToPrint.getSalary() < avgSalaryAsDouble) ? "below" : "above") + " average.");
            }
        }
        System.out.println("***************************************************");
    }

    public void printMenu() {
        System.out.println("***************************************************");
        System.out.println("What would you like to do?");
        for (EmployeeMenuItem mi : EmployeeMenuItem.values()) {
            System.out.println(mi.getMenuFormattedString());
        }
        System.out.println("***************************************************");
    }
}
