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


    public Employee readEmployee() throws IOException{
        String name = promptForEmployeeName();
        int age = promptForEmployeeAge();
        int service = promptForEmployeeYearsOfService();
        Employee toReturn = new Employee(age, service);
        toReturn.setName(name);
        return toReturn;

    }

    public String promptForEmployeeName() throws IOException {
        //generic error string
        String genericError = "The Employee name must be less than 40 characters.";

        String input = null;
        //loop until we get valid input.
        while (null == input || 0 >= input.length() || 40 < input.length()) {
            System.out.print("Please enter the name of employee:");
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

    public int promptForContinue() throws IOException {
        //Generic error string
        int input = -1;

        //loop until we get valid input.
        while (input != 0 && input != 1) {
            try {
                System.out.print("Would you like to enter an employee? (1 for yes, 0 for no):");
                String s = standardInReader.readLine();
                input = Integer.parseInt(s);

                //this is ugly to duplicate the code, but it'll make a nicer error message.
                if (input != 0 && input != 1){
                    System.out.println("Please enter either 0 or 1.");
                }
            } catch (NumberFormatException e) {
                //was going to put in 'must be a number' or the like, but if they enter a number
                //that's too long, ie: 999999999999999999999 - it'll trip this too,
                //so I'm choosing to make the error a bit different than the example.
                System.out.println("You entered an invalid or non-numeric value. ");
            }


        }

        return input;
    }


    public int promptForEmployeeAge() throws IOException {
        //Generic error string
        String genericError = "Please enter a positive number from 16-99.";
        int input = 0;

        //loop until we get valid input.
        while (input <= 15 || input > 99) {
            try {
                System.out.print("Please enter the employee's age:");
                String s = standardInReader.readLine();
                input = Integer.parseInt(s);

                //this is ugly to duplicate the code, but it'll make a nicer error message.
                if (input <= 16) {
                    System.out.println("You entered a value that was less than 16. " + genericError);
                } else if (input > 99) {
                    System.out.println("You entered a value that was higher than " + 99 + ". " + genericError);
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

    public int promptForEmployeeYearsOfService() throws IOException {
         //Generic error string
         String genericError = "Please enter a positive number from 1-50.";
         int input = 0;

         //loop until we get valid input.
         while (input <= 0 || input > 50) {
             try {
                 System.out.print("Please enter the employee's years of service:");
                 String s = standardInReader.readLine();
                 input = Integer.parseInt(s);

                 //this is ugly to duplicate the code, but it'll make a nicer error message.
                 if (input <= 0) {
                     System.out.println("You entered a value that was less than 1. " + genericError);
                 } else if (input > 50) {
                     System.out.println("You entered a value that was higher than " + 50 + ". " + genericError);
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
