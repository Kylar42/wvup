package cs122;

import cs122.action.Action;
import cs122.action.CLIActions;
import cs122.db.EmployeeDataDBImpl;
import cs122.io.EmployeeStdinReader;
import cs122.io.EmployeeStdoutWriter;
import cs122.model.EmployeeDataList;
import cs122.model.EmployeeMenuItem;

import java.io.IOException;

/**
 * User: Tom Byrne(tom.byrne@apple.com)
 * Copyright (C) 2011 Apple Inc.
 * "I code not because I have a problem to solve, but because there is
 * code within me, crying to get out."
 */
public class EmployeeDataMain {
    //------------------------------------Member vars

    //------------------------------------Static vars
    //since this is an assignment, I'm going to bound the upper limit to 100.
    private static final int MAX_NUMBER_OF_EMPLOYEES = 100;

    private EmployeeDataMain(boolean runUI) {
       runCLI();
    }



    //main CLI Loop
    private void runCLI() {
        //EmployeeDataList dataList = new EmployeeDataImpl();
        EmployeeDataList dataList = new EmployeeDataDBImpl();
        EmployeeStdinReader reader = new EmployeeStdinReader();
        EmployeeStdoutWriter writer = new EmployeeStdoutWriter();
        CLIActions actionHandler = new CLIActions(dataList, reader, writer);

        EmployeeMenuItem lastItem = null;
        try {
            while (true) {
                writer.printMenu();
                try {
                    final EmployeeMenuItem employeeMenuItem = reader.promptForMenuItem();
                    final Action action = actionHandler.actionForMenuItem(employeeMenuItem);
                    action.performAction();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        } finally {
            reader.closeStreams();
        }

    }

    /**
     * Deprecating the CLI version - it will work for the Assignment2 stuff, but not Assignment3.
     */
    @Deprecated
    /*private void runCLI(){
        
        
        EmployeeStdoutWriter writer = new EmployeeStdoutWriter();
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
            EmployeeStdoutWriter.printEmployeeList(list, avgSalaryAsDouble);

            //sort into employee number order
            System.out.println();//Spacing.
            System.out.println("After Sorting");
            System.out.println();//Spacing.
            Collections.sort(list, new Employee.EmployeeNumberComparator());
            EmployeeStdoutWriter.printEmployeeList(list, avgSalaryAsDouble);

            int employeeNumberToSearchFor = employeeDataReader.promptForEmployeeNumberForSearch(employeeDataList);


            while(0 != employeeNumberToSearchFor){
                //look for the employee #, then print out it's info.
                EmployeeStdoutWriter.printEmployee(employeeDataList.getEmployee(employeeNumberToSearchFor), avgSalaryAsDouble);
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
    }*/


    public static void main(String[] args) {
        new EmployeeDataMain(false);
    }
}
