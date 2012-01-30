import java.io.BufferedReader;
import java.io.IOException;
import java.util.Set;

/**
 * User: Tom Byrne(tom.byrne@apple.com)
 * Copyright (C) 2011 Apple Inc.
 * "I code not because I have a problem to solve, but because there is
 * code within me, crying to get out."
 */
public class EmployeeDataStdinReader {

    private final BufferedReader standardInReader = new BufferedReader(new java.io.InputStreamReader(System.in));

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

    public int promptForEmployeeNumber(final String employeeName, final Set<Integer> currentEmployeeList) throws IOException {
        //generic error
        String genericError = "Please enter a unique employee number between 1-" + Employee.EMPLOYEE_NUMBER_MAXIMUM + " inclusive.";
        int input = 0;

        //loop until we get input
        while (input <= 0 || currentEmployeeList.contains(input)) {//Can't be 0, can't already exist.
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
                } else if (currentEmployeeList.contains(input)) {
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

    public String promptForEmployeeName(final int employeeOrdinal) throws IOException {
        //generic error string
        String genericError = "The Employee name must be less than 40 characters.";

        String input = null;
        //loop until we get valid input.
        while (null == input || 0 >= input.length() || 40 < input.length()) {
            System.out.print("Please enter the name of employee " + employeeOrdinal + ":");
            input = standardInReader.readLine();
            //check input.
            if (null == input || 0 == input.length()) {
                //Ugh, how did this happen?
                System.out.println("You entered a name that was too short. " + genericError);
            } else if (input.length() > 40) {
                System.out.println("You entered a name that was too long. " + genericError);
            }
        }

        return input;
    }

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


    public void closeStreams(){
        if(null != standardInReader){
            try {
                standardInReader.close();
            } catch (IOException ignore) {
                //ignored by design -tbyrne 011712
            }
        }
    }
}