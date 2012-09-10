package cs122.action;


import cs122.io.EmployeeStdinReader;
import cs122.io.EmployeeStdoutWriter;
import cs122.model.Employee;
import cs122.model.EmployeeDataList;
import cs122.model.EmployeeMenuItem;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * User: Tom Byrne(tom.byrne@apple.com)
 * Copyright (C) 2011 Apple Inc.
 * "I code not because I have a problem to solve, but because there is
 * code within me, crying to get out."
 */
public class CLIActions {

    /**
     * ENTER_EMPLOYEE(1, "Enter an Employee"),
     * ENTER_MANAGER(2, "Enter a Manager"),
     * PRINT_EMPLOYEES(3, "Print All Employees"),
     * PRINT_MANAGERS(4, "Print All Managers"),
     * PRINT_ALL(5, "Print Everyone"),
     * SEARCH_FOR_MANAGER(6, "Search For Manager By Employee ID"),
     * SEARCH_FOR_EMPLOYEE(7, "Search For Employee By Employee ID"),
     * SEARCH_ALL(8, "Search For Anyone By Employee ID");
     */

    private final Map<EmployeeMenuItem, Action> ACTION_MAP = new HashMap<EmployeeMenuItem, Action>();

    private EmployeeStdinReader _reader;
    private EmployeeDataList _list;
    private EmployeeStdoutWriter _writer;


    public CLIActions(EmployeeDataList list, EmployeeStdinReader reader, EmployeeStdoutWriter writer) {
        _list = list;
        _reader = reader;
        _writer = writer;

        ACTION_MAP.put(EmployeeMenuItem.ENTER_EMPLOYEE, new EnterEmployeeAction());
        ACTION_MAP.put(EmployeeMenuItem.PRINT_EMPLOYEES, new PrintEmployeeListAction());
        ACTION_MAP.put(EmployeeMenuItem.SEARCH_FOR_EMPLOYEE, new SearchForEmployeeAction());
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

    private class PrintEmployeesAction implements Action {
        public void performAction() {
            _writer.printEmployeeList(_list.getEmployeeList(), _list.getAvgSalary());
        }
    }

    private class PrintManagersAction implements Action {
        public void performAction() {
            _writer.printEmployeeList(_list.getManagerList(), _list.getAvgSalary());
        }
    }

    private class QuitAction implements Action {
        public void performAction() {
            System.exit(0);
        }
    }

    private class PrintAllEmployeesAction implements Action {
        public void performAction() {
            _writer.printEmployeeList(_list.getCompleteEmployeeList(), _list.getAvgSalary());
        }
    }

    private class SearchForEmployeeAction implements Action {
        public void performAction() {
            try {
                final int employeeNum = _reader.promptForEmployeeOrManagerNumberForSearch(_list, false);
                Employee employee = _list.getEmployee(employeeNum);
                if (null != employee) {
                    _writer.printEmployee(employee, _list.getAvgSalary());
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private class PrintEmployeeListAction implements Action {
        public void performAction() {
            _list.printHashMapContents();
        }
    }

    private class SearchForAnyAction implements Action {
        public void performAction() {
            try {
                final int employeeNum = _reader.promptForAnyEmployeeNumberForSearch(_list);
                Employee employee = _list.getEmployee(employeeNum);
                if (null != employee) {
                    _writer.printEmployee(employee, _list.getAvgSalary());
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
