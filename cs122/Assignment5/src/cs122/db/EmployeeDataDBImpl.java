package cs122.db;

import cs122.model.Employee;
import cs122.model.EmployeeDataList;
import cs122.model.Manager;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * User: Tom Byrne(tom.byrne@apple.com)
 * Copyright (C) 2011 Apple Inc.
 * "I code not because I have a problem to solve, but because there is
 * code within me, crying to get out."
 */
public class EmployeeDataDBImpl implements EmployeeDataList {

    private static final String INSERT_SQL = "insert into Employee (EMP_ID, Salary) values (?, ?);";
    private static final String SELECT_BY_EMPLOYEE_NUMBER_SQL = "select EMP_ID, Salary from Employee where EMP_ID=?";

    public List<Employee> getAllEmployeesWithName(String name, boolean isfirstName) {

        throw new NotImplementedException();
    }

    public List<Employee> getHighestSalariedEmployees() {
        throw new NotImplementedException();
    }

    public List<Employee> getLowestSalariedEmployees() {
        throw new NotImplementedException();
    }

    public BigDecimal getAverageSalary() {
        throw new NotImplementedException();

    }

    public boolean addEmployee(Employee employeeToAdd) {
        final Connection connection = ConnectionPool.getInstance().getConnection();
        int rowsInserted = 0;
        try {
            PreparedStatement statement = connection.prepareStatement(INSERT_SQL);
            statement.setInt(1, employeeToAdd.getEmployeeNumber());
            statement.setInt(2, employeeToAdd.getSalary());
            rowsInserted = statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            ConnectionPool.getInstance().returnConnection(connection);
        }
        return (1 == rowsInserted);
    }

    public List<Employee> getCompleteEmployeeList(boolean ordered) {
        throw new NotImplementedException();

    }

    public List<Manager> getManagerList() {
        throw new NotImplementedException();

    }

    public List<Employee> getEmployeeList() {
        throw new NotImplementedException();

    }

    public boolean employeeNumberExists(int employeeNumber) {
        final Employee employee = getEmployee(employeeNumber);
        if (null != employee) {
            return true;
        }
        return false;
    }

    public boolean employeeNumberExists(int employeeNumber, boolean isManager) {
        final Employee employee = getEmployee(employeeNumber);
        if (null == employee) {
            return false;
        }
        return !(isManager ^ (employee instanceof Manager));


    }

    public int getEmployeeCount() {
        throw new NotImplementedException();

    }

    public Employee getEmployee(int employeeNumber) {
        final Connection connection = ConnectionPool.getInstance().getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement(SELECT_BY_EMPLOYEE_NUMBER_SQL);
            statement.setInt(1, employeeNumber);
            final ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                final int empNum = resultSet.getInt(1);
                final int salary = resultSet.getInt(2);
                Employee e = new Employee(empNum, salary);
                return e;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            ConnectionPool.getInstance().returnConnection(connection);
        }
        return null;
    }

    public static void main(String[] args) {
        //test our DB Backed Employee List.
        DBSetup.dropHRInfoDB();
        DBSetup.dropUser();
        DBSetup.createOrSetupDB();
        DBSetup.createUser();
        DBSetup.createOrSetupTables();
        final EmployeeDataDBImpl employeeDataDB = new EmployeeDataDBImpl();
        employeeDataDB.addEmployee(new Employee(44, 1000));
        employeeDataDB.addEmployee(new Employee(88, 191919));
        final Employee employee = employeeDataDB.getEmployee(44);
        System.out.println(employee);


    }
}
