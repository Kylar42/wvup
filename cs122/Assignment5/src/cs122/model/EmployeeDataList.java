package cs122.model;

import java.math.BigDecimal;
import java.util.List;

/**
 * User: Tom Byrne(tom.byrne@apple.com)
 * Copyright (C) 2011 Apple Inc.
 * "I code not because I have a problem to solve, but because there is
 * code within me, crying to get out."
 */
public interface EmployeeDataList {

    boolean addEmployee(Employee employeeToAdd);

    List<Employee> getCompleteEmployeeList(boolean orderBySalary);

    List<Manager> getManagerList();

    List<Employee> getEmployeeList();

    List<Employee> getHighestSalariedEmployees();

    List<Employee> getLowestSalariedEmployees();

    List<Employee> getAllEmployeesWithName(String name, boolean firstName);

    BigDecimal getAverageSalary();

    boolean employeeNumberExists(int employeeNumber);

    boolean employeeNumberExists(int employeeNumber, boolean isManager);

    int getEmployeeCount();

    Employee getEmployee(int employeeNumber);
}
