package cs122.model;

import java.util.List;

/**
 * User: Tom Byrne(tom.byrne@apple.com)
 * Copyright (C) 2011 Apple Inc.
 * "I code not because I have a problem to solve, but because there is
 * code within me, crying to get out."
 */
public interface EmployeeDataList {

    void addEmployee(Employee employeeToAdd);

    List<Employee> getCompleteEmployeeList();

    List<Manager> getManagerList();

    List<Employee> getEmployeeList();

    boolean employeeNumberExists(int employeeNumber);

    boolean employeeNumberExists(int employeeNumber, boolean isManager);

    int getEmployeeCount();

    Employee getEmployee(int employeeNumber);
}
