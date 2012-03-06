package cs122;

import cs122.io.EmployeeDataStdinReader;
import cs122.model.Employee;
import cs122.model.EmployeeDataList;
import cs122.ui.MainFrame;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.Collections;
import java.util.List;

/**
 * User: Tom Byrne(tom.byrne@apple.com)
 * Copyright (C) 2011 Apple Inc.
 * "I code not because I have a problem to solve, but because there is
 * code within me, crying to get out."
 */
public class EmployeeDataMain {
    //------------------------------------Member vars
    private final EmployeeDataList employeeDataList = new EmployeeDataList();
    private final EmployeeDataStdinReader employeeDataReader = new EmployeeDataStdinReader();
    private final NumberFormat currencyInstance = NumberFormat.getCurrencyInstance();

    private double avgSalaryAsDouble;
    //------------------------------------Static vars
    //since this is an assignment, I'm going to bound the upper limit to 100.
    private static final int MAX_NUMBER_OF_EMPLOYEES = 100;

    private EmployeeDataMain(boolean runUI) {
        if(runUI){
            runUI();
        }else{
            runCLI();
        }
        
    }

    private void runUI(){
        new MainFrame();//launch the UI, it takes care of itself.
    }

    /**
     * Deprecating the CLI version - it will work for the Assignment2 stuff, but not Assignment3.
     *
     */
    @Deprecated
    private void runCLI(){
        //Set up Buffered reader to read lines.
        //First, prompt for number of employees
        int numberOfEmployees = 0;

        try {
            numberOfEmployees = employeeDataReader.promptForNumberOfEmployees(MAX_NUMBER_OF_EMPLOYEES);
            System.out.println();//Spacing.

            long salaryTotal = 0;

            for (int i = 0; i < numberOfEmployees; i++) {

                //prompt for employee name
                String name = employeeDataReader.promptForEmployeeName(i + 1);//pass user-facing ordinal for prompt.
                int number = employeeDataReader.promptForEmployeeNumber(name, employeeDataList);
                int salary = employeeDataReader.promptForSalary(name);
                salaryTotal += salary;
                Employee e = new Employee(number, name, salary);
                employeeDataList.addEmployee(e);
                System.out.println();//Spacing.
            }

            //calculate average salary, use BigDecimal for precision in the calculation, even though we're going to cast it to a double later.
            BigDecimal totalSalary = new BigDecimal(salaryTotal);
            BigDecimal avgSalary = totalSalary.divide(new BigDecimal(numberOfEmployees), BigDecimal.ROUND_DOWN);
            avgSalaryAsDouble = avgSalary.doubleValue();//will use this for comparison in the loop later

            //format the currency output properly
            System.out.println();//Spacing.
            System.out.println("Average Salary is: " + currencyInstance.format(avgSalaryAsDouble));
            System.out.println();//Spacing.

            //employee DataList will have it in ordinal (input) order already.
            System.out.println("Before Sorting");
            System.out.println();//Spacing.

            List<Employee> list = employeeDataList.getEmployeeList();
            printEmployeeList(list);

            //sort into employee number order
            System.out.println();//Spacing.
            System.out.println("After Sorting");
            System.out.println();//Spacing.
            Collections.sort(list, new Employee.EmployeeNumberComparator());
            printEmployeeList(list);

            int employeeNumberToSearchFor = employeeDataReader.promptForEmployeeNumberForSearch(employeeDataList);


            while(0 != employeeNumberToSearchFor){
                //look for the employee #, then print out it's info.
                printEmployee(employeeDataList.getEmployee(employeeNumberToSearchFor));
                employeeNumberToSearchFor = employeeDataReader.promptForEmployeeNumberForSearch(employeeDataList);
            }



        } catch (IOException ioe) {
            //if stdin is broken, we probably want to exit the program.
            //let's dump a trace to stderr
            ioe.printStackTrace();

            //and exit.
            System.exit(-1);
        } finally {

            employeeDataReader.closeStreams();
        }
    }
    private void printEmployeeList(final List<Employee> listToPrint) {
        //Loop through the employees
        for (final Employee e : listToPrint) {

            printEmployee(e);
            System.out.println();//Spacing.
        }
    }

    private void printEmployee(final Employee employeeToPrint){
        //Print out the 3 pieces of data
            System.out.println("Employee Name: " + employeeToPrint.getName());
            System.out.println("Employee Number: " + employeeToPrint.getNumber());
            System.out.println(employeeToPrint.getName() + "'s salary: " + currencyInstance.format(employeeToPrint.getSalary()));

            //Let's look to see if it's average, or else above/below.
            if (avgSalaryAsDouble == employeeToPrint.getSalary()) {
                System.out.println(employeeToPrint.getName() + "'s salary is exactly average.");
            } else {
                System.out.println(employeeToPrint.getName() + "'s salary is " + ((employeeToPrint.getSalary() < avgSalaryAsDouble) ? "below" : "above") + " average.");
            }
        System.out.println("***************************************************");
    }

    public static void main(String[] args) {
        new EmployeeDataMain(true);
    }
}
