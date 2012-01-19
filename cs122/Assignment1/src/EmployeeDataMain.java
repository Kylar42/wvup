import java.io.BufferedReader;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 * User: Tom Byrne(tom.byrne@apple.com)
 * Copyright (C) 2011 Apple Inc.
 * "I code not because I have a problem to solve, but because there is
 * code within me, crying to get out."
 */
public class EmployeeDataMain {
    //------------------------------------Member vars
    private final Map<Integer, Employee> employeeMap = new HashMap<Integer, Employee>();
    private final EmployeeDataStdinReader employeeDataReader = new EmployeeDataStdinReader();

    //------------------------------------Static vars
    //since this is an assignment, I'm going to bound the upper limit to 100.
    private static final int MAX_NUMBER_OF_EMPLOYEES = 100;

    private EmployeeDataMain() {

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
                int number = employeeDataReader.promptForEmployeeNumber(name, employeeMap.keySet());
                int salary = employeeDataReader.promptForSalary(name);
                salaryTotal += salary;
                Employee e = new Employee(number, name, salary);
                employeeMap.put(number, e);
                System.out.println();//Spacing.
            }

            //calculate average salary, use BigDecimal for precision in the calculation, even though we're going to cast it to a double later.
            BigDecimal totalSalary = new BigDecimal(salaryTotal);
            BigDecimal avgSalary = totalSalary.divide(new BigDecimal(numberOfEmployees));
            double avgSalaryAsDouble = avgSalary.doubleValue();//will use this for comparison in the loop later

            //format the currency output properly
            NumberFormat currencyInstance = NumberFormat.getCurrencyInstance();
            System.out.println();//Spacing.
            System.out.println("Average Salary is: " + currencyInstance.format(avgSalaryAsDouble));
            System.out.println();//Spacing.

            //Loop through the employees
            for (Employee e : employeeMap.values()) {
                //Print out the 3 pieces of data
                System.out.println("Employee Name: " + e.getName());
                System.out.println("Employee number: " + e.getNumber());
                System.out.println(e.getName() + "'s salary: " + currencyInstance.format(e.getSalary()));

                //Let's look to see if it's average, or else above/below.
                if (avgSalaryAsDouble == e.getSalary()) {
                    System.out.println(e.getName() + "'s salary is exactly average.");
                } else {
                    System.out.println(e.getName() + "'s salary is " + ((e.getSalary() < avgSalaryAsDouble) ? "below" : "above") + " average.");
                }

                System.out.println();//Spacing.
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


    public static void main(String[] args) {
        new EmployeeDataMain();
    }
}
