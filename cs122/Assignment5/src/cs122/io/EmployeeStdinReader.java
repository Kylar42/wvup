package cs122.io;

import com.sun.javaws.exceptions.CouldNotLoadArgumentException;
import cs122.model.Employee;
import cs122.model.EmployeeDataList;
import cs122.model.EmployeeMenuItem;
import cs122.model.Manager;

import java.io.BufferedReader;
import java.io.IOException;

/**
 * User: Tom Byrne(tom.byrne@apple.com)
 * Copyright (C) 2011 Apple Inc.
 * "I code not because I have a problem to solve, but because there is
 * code within me, crying to get out."
 */
public class EmployeeStdinReader {

    private final BufferedReader standardInReader = new BufferedReader(new java.io.InputStreamReader(System.in));

    public EmployeeStdinReader(){
    }

    public void readAndAddEmployee(EmployeeDataList dataList) throws IOException{
         int number = promptForEmployeeNumber(dataList);
        int salary = promptForSalary();
        //TODO: Fix
        dataList.addEmployee(new Employee(number,salary));
    }
    
     public EmployeeMenuItem promptForMenuItem() throws IOException {
        EmployeeMenuItem mi = null;

        while(mi == null){
            String s = standardInReader.readLine();
            try{
                int choice = Integer.parseInt(s);
                mi = EmployeeMenuItem.fromInt(choice);
            }catch(NumberFormatException nfe){
                //could print something...
            }
        }
        return mi;
    }

    public int promptForSalary() throws IOException {

        //generic error
        String genericError = "Please enter a salary between 1-" + Employee.EMPLOYEE_SALARY_MAXIMUM + " inclusive.";
        int input = 0;

        //loop unti we get good input
        while (input <= 0 || input > Employee.EMPLOYEE_SALARY_MAXIMUM) {//Can't be 0, can't be bigger than the max.
            try {//easier for control flow to put this here.
                System.out.print("Please enter the salary for the employee:");
                //read from stdin
                String s = standardInReader.readLine();
                //try to parse an int.
                input = Integer.parseInt(s);

                if (input <= 0) {
                    System.out.println("You entered a value that was less than 1. " + genericError);
                } else if (input > Employee.EMPLOYEE_SALARY_MAXIMUM) {
                    System.out.println("You entered a value that was higher than " + Employee.EMPLOYEE_SALARY_MAXIMUM + ". " + genericError);
                }
            } catch (NumberFormatException e) {
                //was going to put in 'must be a number' or the like, but if they enter a number
                //that's too long, ie: 999999999999999999999 - it'll trip this too,
                //so I'm choosing to make the error a bit different than the example.
                System.out.println("You entered an invalid or non-numeric value. " + genericError);
            }


        }

        return input;
    }

    public int promptForEmployeeNumber( final EmployeeDataList currentEmployeeList) throws IOException {
        //generic error
        String genericError = "Please enter a unique employee number between 1-" + Employee.EMPLOYEE_NUMBER_MAXIMUM + " inclusive.";
        int input = 0;

        //loop until we get input
        while (input <= 0 || currentEmployeeList.employeeNumberExists(input)) {//Can't be 0, can't already exist.
            try {
                System.out.print("Please enter the employee number:");
                //read from stdin
                String s = standardInReader.readLine();
                //try to parse an int.
                input = Integer.parseInt(s);

                //this is ugly to duplicate the code, but it'll make a nicer error message.
                if (input <= 0) {
                    System.out.println("You entered a value that was less than 1. " + genericError);
                } else if (input > Employee.EMPLOYEE_NUMBER_MAXIMUM) {
                    System.out.println("You entered a value that was higher than " + Employee.EMPLOYEE_NUMBER_MAXIMUM + ". " + genericError);
                } else if (currentEmployeeList.employeeNumberExists(input)) {
                    System.out.println("You entered an employee number that already exists. " + genericError);
                }
            } catch (NumberFormatException e) {
                //was going to put in 'must be a number' or the like, but if they enter a number
                //that's too long, ie: 999999999999999999999 - it'll trip this too,
                //so I'm choosing to make the error a bit different than the example.
                System.out.println("You entered an invalid or non-numeric value. " + genericError);
            }


        }

        return input;
    }

    public int promptForAnyEmployeeNumberForSearch(final EmployeeDataList currentEmployeeList) throws IOException {
        String notFoundErrorString = "Employee %d was not found.";
        String genericError = "You entered a non-numeric value.";
        int input = -1;
        while (0 != input && !currentEmployeeList.employeeNumberExists(input)) {
            //prompt for Employee number
            System.out.print("Enter the search key by employee number (0 to quit):");
            //read from stdin
            String s = standardInReader.readLine();
            //try to parse an int.
            try {
                input = Integer.parseInt(s);

                if(0 != input && !currentEmployeeList.employeeNumberExists(input)){
                    System.out.println(String.format(notFoundErrorString, input));
                }

            } catch (NumberFormatException e) {
                System.out.println(genericError);
            }
        }

        return input;
    }


    public void closeStreams() {
        if (null != standardInReader) {
            try {
                standardInReader.close();
            } catch (IOException ignore) {
                //ignored by design -tbyrne 011712
            }
        }
    }
}
