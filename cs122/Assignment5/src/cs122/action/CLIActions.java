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
        ACTION_MAP.put(EmployeeMenuItem.SEARCH_ALL, new SearchForAnyAction());
        ACTION_MAP.put(EmployeeMenuItem.QUIT, new QuitAction());

    }



    public Action actionForMenuItem(EmployeeMenuItem menuItem) {
        return ACTION_MAP.get(menuItem);
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


    private class QuitAction implements Action {
        public void performAction() {
            System.exit(0);
        }
    }



    private class SearchForAnyAction implements Action {
        public void performAction() {
            try {
                final int employeeNum = _reader.promptForAnyEmployeeNumberForSearch(_list);
                Employee employee = _list.getEmployee(employeeNum);
                if (null != employee) {
                    _writer.printEmployee(employee, Double.MIN_VALUE);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
