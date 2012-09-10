package cs122.action;


import cs122.io.EmployeeStdinReader;
import cs122.io.EmployeeStdoutWriter;
import cs122.model.Employee;
import cs122.model.EmployeeDataImpl;
import cs122.model.EmployeeDataList;
import cs122.model.EmployeeMenuItem;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * User: Tom Byrne(tom.byrne@apple.com)
 * Copyright (C) 2011 Apple Inc.
 * "I code not because I have a problem to solve, but because there is
 * code within me, crying to get out."
 */
public class CLIActions {

    /**
     ENTER_EMPLOYEE(1, "Enter an Employee"),
     ENTER_MANAGER(2, "Enter a Manager"),
     SEARCH_ALL(3, "Search For Anyone By Employee ID"),
     SEARCH_BY_FIRST(4, "Search for an employee or manager by first name."),
     SEARCH_BY_LAST(5, "Search for an employee or manager by last name"),
     PRINT_ALL(6, "Print Everyone"),
     PRINT_BY_SALARY(7, "Print everyone by Sorted Salary (Highest To Lowest)"),
     PRINT_LOWEST_SALARY(8,"Display the employee(s) with the lowest salary."),
     PRINT_HIGHEST_SALARY(9, "Display the employee(s) with the highest salary."),
     PRINT_AVG_SALARY(10, "Print out the average salary of all employees."),
     QUIT(0, "Quit");     */

    private final Map<EmployeeMenuItem, Action> ACTION_MAP = new HashMap<EmployeeMenuItem, Action>();

    private EmployeeStdinReader _reader;
    private EmployeeDataList _list;
    private EmployeeStdoutWriter _writer;


    public CLIActions(EmployeeDataList list, EmployeeStdinReader reader, EmployeeStdoutWriter writer) {
        _list = list;
        _reader = reader;
        _writer = writer;

        ACTION_MAP.put(EmployeeMenuItem.ENTER_EMPLOYEE, new EnterEmployeeAction());
        ACTION_MAP.put(EmployeeMenuItem.ENTER_MANAGER, new EnterManagerAction());
        ACTION_MAP.put(EmployeeMenuItem.PRINT_ALL, new PrintAllEmployeesAction());
        ACTION_MAP.put(EmployeeMenuItem.SEARCH_BY_FIRST, new SearchByFirstNameAction());
        ACTION_MAP.put(EmployeeMenuItem.SEARCH_BY_LAST, new SearchByLastNameAction());
        ACTION_MAP.put(EmployeeMenuItem.PRINT_BY_SALARY, new PrintEmployeesBySalaryAction());
        ACTION_MAP.put(EmployeeMenuItem.PRINT_LOWEST_SALARY, new PrintEmployeesLowestSalaryAction());
        ACTION_MAP.put(EmployeeMenuItem.PRINT_HIGHEST_SALARY, new PrintEmployeesHighestSalaryAction());
        ACTION_MAP.put(EmployeeMenuItem.PRINT_AVG_SALARY, new PrintAverageSalaryAction());
        ACTION_MAP.put(EmployeeMenuItem.SEARCH_ALL, new SearchForAnyAction());
        ACTION_MAP.put(EmployeeMenuItem.QUIT, new QuitAction());

    }



    public Action actionForMenuItem(EmployeeMenuItem menuItem) {
        return ACTION_MAP.get(menuItem);
    }
    private class PrintAverageSalaryAction implements Action{
        public void performAction() {
            final BigDecimal averageSalary = _list.getAverageSalary();
            _writer.printAverageSalary(averageSalary.doubleValue());
        }
    }
    private class PrintEmployeesLowestSalaryAction implements Action{
        public void performAction() {
            final List<Employee> lowestSalariedEmployees = _list.getLowestSalariedEmployees();
            _writer.printEmployeeList(lowestSalariedEmployees, Double.MIN_VALUE);

        }
    }
    private class PrintEmployeesHighestSalaryAction implements Action{
        public void performAction() {
            final List<Employee> highestSalariedEmployees = _list.getHighestSalariedEmployees();
            _writer.printEmployeeList(highestSalariedEmployees, Double.MIN_VALUE);

        }
    }
    private class SearchByFirstNameAction implements Action{
        public void performAction(){
            try {
                final String name = _reader.promptForEmployeeNameToSearchFor(true);
                final List<Employee> allEmployeesWithName = _list.getAllEmployeesWithName(name, true);
                if(allEmployeesWithName.isEmpty()){
                    System.out.println("Employee Not Found.");
                }else{
                    _writer.printEmployeeList(allEmployeesWithName, Double.MIN_VALUE);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    private class SearchByLastNameAction implements Action{
        public void performAction(){
            try {
                final String name = _reader.promptForEmployeeNameToSearchFor(false);
                final List<Employee> allEmployeesWithName = _list.getAllEmployeesWithName(name, false);
                if(allEmployeesWithName.isEmpty()){
                    System.out.println("Employee Not Found.");
                }else{
                    _writer.printEmployeeList(allEmployeesWithName, Double.MIN_VALUE);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    private class PrintEmployeesBySalaryAction implements Action{
        public void performAction() {
            final List<Employee> completeEmployeeList = _list.getCompleteEmployeeList(true);
            _writer.printEmployeeList(completeEmployeeList, Double.MIN_VALUE);
        }
    }
    private class EnterEmployeeAction implements Action {
        public void performAction() {
            try {
                _reader.readAndAddEmployee(_list);
            } catch (IOException e) {
                //Should log or something, but just going to dump.
                e.printStackTrace();
            }
        }
    }

    private class EnterManagerAction implements Action {
        public void performAction() {
            try {
                _reader.readAndAddManager(_list);
            } catch (IOException e) {
                //Should log or something, but just going to dump.
                e.printStackTrace();
            }
        }
    }



    private class QuitAction implements Action {
        public void performAction() {
            System.exit(0);
        }
    }

    private class PrintAllEmployeesAction implements Action {
        public void performAction() {
            BigDecimal salary = _list.getAverageSalary();
            double toPass = (null == salary) ? Double.MIN_VALUE : salary.doubleValue();
            _writer.printEmployeeList(_list.getCompleteEmployeeList(false), toPass);
        }
    }



    private class SearchForAnyAction implements Action {
        public void performAction() {
            try {
                final int employeeNum = _reader.promptForAnyEmployeeNumberForSearch(_list);
                Employee employee = _list.getEmployee(employeeNum);
                if (null != employee) {
                    _writer.printEmployee(employee, _list.getAverageSalary().doubleValue());
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
