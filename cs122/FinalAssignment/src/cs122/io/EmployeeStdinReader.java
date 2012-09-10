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
        String firstname = promptForEmployeeName(false, true);
        String lastname = promptForEmployeeName(false, false);
        int number = promptForEmployeeNumber(firstname, dataList);
        int salary = promptForSalary(firstname);
        //TODO: Fix
        dataList.addEmployee(new Employee(number, firstname, lastname, salary));
    }
    
    public void readAndAddManager(EmployeeDataList dataList) throws IOException{
        String firstname = promptForEmployeeName(true, true);
        String lastname = promptForEmployeeName(true, false);
        int number = promptForEmployeeNumber(firstname, dataList);
        int salary = promptForSalary(firstname);
        int bonus = promptForBonus(firstname);
        //TODO: Fix
        dataList.addEmployee(new Manager(number, firstname, lastname, salary, bonus));
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

    public int promptForSalary(final String employeeName) throws IOException {

        //generic error
        String genericError = "Please enter a salary between 1-" + Employee.EMPLOYEE_SALARY_MAXIMUM + " inclusive.";
        int input = 0;

        //loop unti we get good input
        while (input <= 0 || input > Employee.EMPLOYEE_SALARY_MAXIMUM) {//Can't be 0, can't be bigger than the max.
            try {//easier for control flow to put this here.
                System.out.print("Please enter the salary for " + employeeName + ":");
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
    public int promptForBonus(final String employeeName) throws IOException {

        //generic error
        String genericError = "Please enter a Bonus between 1-" + Employee.EMPLOYEE_SALARY_MAXIMUM + " inclusive.";
        int input = 0;

        //loop unti we get good input
        while (input <= 0 || input > Employee.EMPLOYEE_SALARY_MAXIMUM) {//Can't be 0, can't be bigger than the max.
            try {//easier for control flow to put this here.
                System.out.print("Please enter the bonus for " + employeeName + ":");
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
    public int promptForEmployeeNumber(final String employeeName, final EmployeeDataList currentEmployeeList) throws IOException {
        //generic error
        String genericError = "Please enter a unique employee number between 1-" + Employee.EMPLOYEE_NUMBER_MAXIMUM + " inclusive.";
        int input = 0;

        //loop until we get input
        while (input <= 0 || currentEmployeeList.employeeNumberExists(input)) {//Can't be 0, can't already exist.
            try {
                System.out.print("Please enter the employee number for " + employeeName + ":");
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
    public int promptForEmployeeOrManagerNumberForSearch(final EmployeeDataList currentEmployeeList, boolean isManager) throws IOException {
        String notFoundErrorString = isManager ? "Manager %d was not found." : "Employee %d was not found.";
        String genericError = "You entered a non-numeric value.";
        int input = -1;
        while (0 != input && !currentEmployeeList.employeeNumberExists(input, isManager)) {
            //prompt for Employee number
            System.out.print("Enter the search key by employee number (0 to quit):");
            //read from stdin
            String s = standardInReader.readLine();
            //try to parse an int.
            try {
                input = Integer.parseInt(s);

                if(0 != input && !currentEmployeeList.employeeNumberExists(input, isManager)){
                    System.out.println(String.format(notFoundErrorString, input));
                }

            } catch (NumberFormatException e) {
                System.out.println(genericError);
            }
        }

        return input;
    }

    public String promptForEmployeeName(boolean isManager, boolean firstName) throws IOException {
        //generic error string
        String genericError = "The Employee's name must be less than 50 characters.";
        String info = String.format("Please enter the %s name of the %s:", (firstName?"First":"Last"), (isManager?"Manager":"Employee"));

        String input = null;
        //loop until we get valid input.
        while (null == input || 0 >= input.length() || 50 < input.length()) {
            System.out.print(info);
            input = standardInReader.readLine();
            //check input.
            if (null == input || 0 == input.length()) {
                //Ugh, how did this happen?
                System.out.println("You entered a name that was too short. " + genericError);
            } else if (input.length() > 50) {
                System.out.println("You entered a name that was too long. " + genericError);
            }
        }

        return input;
    }
    public String promptForEmployeeNameToSearchFor(boolean firstName) throws IOException {
        //generic error string
        String genericError = "The Employee's name must be less than 50 characters.";
        String info = String.format("Please enter the %s name of the Employee to search for:", (firstName?"First":"Last"));

        String input = null;
        //loop until we get valid input.
        while (null == input || 0 >= input.length() || 50 < input.length()) {
            System.out.print(info);
            input = standardInReader.readLine();
            //check input.
            if (null == input || 0 == input.length()) {
                //Ugh, how did this happen?
                System.out.println("You entered a name that was too short. " + genericError);
            } else if (input.length() > 50) {
                System.out.println("You entered a name that was too long. " + genericError);
            }
        }

        return input;
    }
    
    @Deprecated
    public int promptForNumberOfEmployees(final int maxNumberOfEmployees) throws IOException {
        //Generic error string
        String genericError = "Please enter a positive number from 1-" + maxNumberOfEmployees + ".";
        int input = 0;

        //loop until we get valid input.
        while (input <= 0 || input > maxNumberOfEmployees) {
            try {
                System.out.print("How many employees would you like to enter?:");
                String s = standardInReader.readLine();
                input = Integer.parseInt(s);

                //this is ugly to duplicate the code, but it'll make a nicer error message.
                if (input <= 0) {
                    System.out.println("You entered a value that was less than 1. " + genericError);
                } else if (input > maxNumberOfEmployees) {
                    System.out.println("You entered a value that was higher than " + maxNumberOfEmployees + ". " + genericError);
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
