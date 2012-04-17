package cs122.db;

import cs122.model.Employee;
import cs122.model.EmployeeDataList;
import cs122.model.Manager;

import java.util.List;

/**
 * User: Tom Byrne(tom.byrne@apple.com)
 * Copyright (C) 2011 Apple Inc.
 * "I code not because I have a problem to solve, but because there is
 * code within me, crying to get out."
 */
public class EmployeeDataDBImpl implements EmployeeDataList {

    public void addEmployee(Employee employeeToAdd) {

    }

    public List<Employee> getCompleteEmployeeList() {
        return null;
    }

    public List<Manager> getManagerList() {
        return null;
    }

    public List<Employee> getEmployeeList() {
        return null;
    }

    public boolean employeeNumberExists(int employeeNumber) {
        return false;
    }

    public boolean employeeNumberExists(int employeeNumber, boolean isManager) {
        return false;
    }

    public int getEmployeeCount() {
        return 0;
    }

    public Employee getEmployee(int employeeNumber) {
        return null;
    }
}
