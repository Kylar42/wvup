package cs122.db;

import cs122.model.Employee;
import cs122.model.EmployeeDataList;
import cs122.model.Manager;

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

    private static final String INSERT_SQL = "insert into Employee (EMP_ID, FirstName, LastName, Salary, isManager, bonus) values (?, ?, ?, ?, ?, ?);";
    private static final String SELECT_ALL_EMPLOYEES_SQL = "select EMP_ID, FirstName, LastName, Salary, isManager, bonus from Employee";
    private static final String SELECT_ALL_EMPLOYEES_SQL_ORDERED = "select EMP_ID, FirstName, LastName, Salary, isManager, bonus from Employee order by Salary";
    private static final String SELECT_EMPLOYEES_ONLY_SQL = "select EMP_ID, FirstName, LastName, Salary, isManager, bonus from Employee where isManager=false";
    private static final String SELECT_MANAGERS_ONLY_SQL = "select EMP_ID, FirstName, LastName, Salary, isManager, bonus from Employee where isManager=true";
    private static final String SELECT_BY_EMPLOYEE_NUMBER_SQL = "select EMP_ID, FirstName, LastName, Salary, isManager, bonus from Employee where EMP_ID=?";
    private static final String GET_EMPLOYEE_COUNT_SQL = "select count(*) from Employee";
    private static final String SELECT_BY_FIRST_NAME_SQL = "select EMP_ID, FirstName, LastName, Salary, isManager, bonus from Employee where FirstName=?";
    private static final String SELECT_BY_LAST_NAME_SQL = "select EMP_ID, FirstName, LastName, Salary, isManager, bonus from Employee where LastName=?";

    private static final String SELECT_HIGHEST_SALARY_SQL = "select EMP_ID, FirstName, LastName, Salary, isManager, bonus from Employee where (Salary+Bonus)=(select MAX(Salary+Bonus) from Employee)";
    private static final String SELECT_LOWEST_SALARY_SQL = "select EMP_ID, FirstName, LastName, Salary, isManager, bonus from Employee where (Salary+Bonus)=(select MIN(Salary+Bonus) from Employee)";
    private static final String SELECT_AVERAGE_SALARY = "select (SUM(Salary)/(select count(*) from Employee)) from Employee";

    public List<Employee> getAllEmployeesWithName(String name, boolean isfirstName) {
        final ArrayList<Employee> toReturn = new ArrayList<Employee>();
        final Connection connection = ConnectionPool.getInstance().getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement(isfirstName ? SELECT_BY_FIRST_NAME_SQL : SELECT_BY_LAST_NAME_SQL);
            statement.setString(1, name);
            final ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                final int empNum = resultSet.getInt(1);
                final String firstName = resultSet.getString(2);
                final String lastName = resultSet.getString(3);
                final int salary = resultSet.getInt(4);
                final boolean isManager = resultSet.getBoolean(5);
                final int bonus = resultSet.getInt(6);
                if (isManager) {
                    Manager m = new Manager(empNum, firstName, lastName, salary, bonus);
                    toReturn.add(m);
                } else {
                    Employee e = new Employee(empNum, firstName, lastName, salary);
                    toReturn.add(e);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            ConnectionPool.getInstance().returnConnection(connection);
        }
        return toReturn;
    }

    public List<Employee> getHighestSalariedEmployees() {
        final ArrayList<Employee> toReturn = new ArrayList<Employee>();
        final Connection connection = ConnectionPool.getInstance().getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement(SELECT_HIGHEST_SALARY_SQL);
            final ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                final int empNum = resultSet.getInt(1);
                final String firstName = resultSet.getString(2);
                final String lastName = resultSet.getString(3);
                final int salary = resultSet.getInt(4);
                final boolean isManager = resultSet.getBoolean(5);
                final int bonus = resultSet.getInt(6);
                if (isManager) {
                    Manager m = new Manager(empNum, firstName, lastName, salary, bonus);
                    toReturn.add(m);
                } else {
                    Employee e = new Employee(empNum, firstName, lastName, salary);
                    toReturn.add(e);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            ConnectionPool.getInstance().returnConnection(connection);
        }
        return toReturn;    }

    public List<Employee> getLowestSalariedEmployees() {
        final ArrayList<Employee> toReturn = new ArrayList<Employee>();
        final Connection connection = ConnectionPool.getInstance().getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement(SELECT_LOWEST_SALARY_SQL);
            final ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                final int empNum = resultSet.getInt(1);
                final String firstName = resultSet.getString(2);
                final String lastName = resultSet.getString(3);
                final int salary = resultSet.getInt(4);
                final boolean isManager = resultSet.getBoolean(5);
                final int bonus = resultSet.getInt(6);
                if (isManager) {
                    Manager m = new Manager(empNum, firstName, lastName, salary, bonus);
                    toReturn.add(m);
                } else {
                    Employee e = new Employee(empNum, firstName, lastName, salary);
                    toReturn.add(e);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            ConnectionPool.getInstance().returnConnection(connection);
        }
        return toReturn;    }

    public BigDecimal getAverageSalary() {
        final Connection connection = ConnectionPool.getInstance().getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement(SELECT_AVERAGE_SALARY);
            final ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                double d = resultSet.getDouble(1);
                return new BigDecimal(d);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            ConnectionPool.getInstance().returnConnection(connection);
        }
        return null;
    }

    public boolean addEmployee(Employee employeeToAdd) {
        final Connection connection = ConnectionPool.getInstance().getConnection();
        int rowsInserted = 0;
        try {
            PreparedStatement statement = connection.prepareStatement(INSERT_SQL);
            statement.setInt(1, employeeToAdd.getEmployeeNumber());
            statement.setString(2, employeeToAdd.getFirstName());
            statement.setString(3, employeeToAdd.getLastName());
            if (employeeToAdd instanceof Manager) {
                statement.setInt(4, employeeToAdd.getSalary()-((Manager) employeeToAdd).getBonus());
                statement.setBoolean(5, true);
                statement.setInt(6, ((Manager) employeeToAdd).getBonus());
            } else {
                statement.setInt(4, employeeToAdd.getSalary());
                statement.setBoolean(5, false);
                statement.setInt(6, 0);
            }

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
        final ArrayList<Employee> toReturn = new ArrayList<Employee>();
        final Connection connection = ConnectionPool.getInstance().getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement(ordered ? SELECT_ALL_EMPLOYEES_SQL_ORDERED : SELECT_ALL_EMPLOYEES_SQL);
            final ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                final int empNum = resultSet.getInt(1);
                final String firstName = resultSet.getString(2);
                final String lastName = resultSet.getString(3);
                final int salary = resultSet.getInt(4);
                final boolean isManager = resultSet.getBoolean(5);
                final int bonus = resultSet.getInt(6);
                if (isManager) {
                    Manager m = new Manager(empNum, firstName, lastName, salary, bonus);
                    toReturn.add(m);
                } else {
                    Employee e = new Employee(empNum, firstName, lastName, salary);
                    toReturn.add(e);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            ConnectionPool.getInstance().returnConnection(connection);
        }
        return toReturn;
    }

    public List<Manager> getManagerList() {
        final ArrayList<Manager> toReturn = new ArrayList<Manager>();
        final Connection connection = ConnectionPool.getInstance().getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement(SELECT_MANAGERS_ONLY_SQL);
            final ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                final int empNum = resultSet.getInt(1);
                final String firstName = resultSet.getString(2);
                final String lastName = resultSet.getString(3);
                final int salary = resultSet.getInt(4);
                final boolean isManager = resultSet.getBoolean(5);
                final int bonus = resultSet.getInt(6);
                if (isManager) {
                    Manager m = new Manager(empNum, firstName, lastName, salary, bonus);
                    toReturn.add(m);
                } else {
                    //error.
                    System.err.println("Was asked to retrieve a manager list, but somehow got an employee. ID:"+empNum);
                    //Let's keep looping.
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            ConnectionPool.getInstance().returnConnection(connection);
        }
        return toReturn;
    }

    public List<Employee> getEmployeeList() {
        final ArrayList<Employee> toReturn = new ArrayList<Employee>();
        final Connection connection = ConnectionPool.getInstance().getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement(SELECT_EMPLOYEES_ONLY_SQL);
            final ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                final int empNum = resultSet.getInt(1);
                final String firstName = resultSet.getString(2);
                final String lastName = resultSet.getString(3);
                final int salary = resultSet.getInt(4);
                final boolean isManager = resultSet.getBoolean(5);
                final int bonus = resultSet.getInt(6);
                if (isManager) {
                    Manager m = new Manager(empNum, firstName, lastName, salary, bonus);
                    toReturn.add(m);
                } else {
                    Employee e = new Employee(empNum, firstName, lastName, salary);
                    toReturn.add(e);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            ConnectionPool.getInstance().returnConnection(connection);
        }
        return toReturn;
    }

    public boolean employeeNumberExists(int employeeNumber) {
        final Employee employee = getEmployee(employeeNumber);
        if(null != employee){
            return true;
        }
        return false;
    }

    public boolean employeeNumberExists(int employeeNumber, boolean isManager) {
        final Employee employee = getEmployee(employeeNumber);
        if(null == employee){
            return false;
        }
        return !(isManager ^ (employee instanceof Manager));


    }

    public int getEmployeeCount() {
        int employeeCount = 0;
        final Connection connection = ConnectionPool.getInstance().getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement(GET_EMPLOYEE_COUNT_SQL);
            final ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                employeeCount = resultSet.getInt(1);//should only be one item returned.
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        } finally {
            ConnectionPool.getInstance().returnConnection(connection);
        }
        return employeeCount;
    }

    public Employee getEmployee(int employeeNumber) {
        final Connection connection = ConnectionPool.getInstance().getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement(SELECT_BY_EMPLOYEE_NUMBER_SQL);
            statement.setInt(1, employeeNumber);
            final ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                final int empNum = resultSet.getInt(1);
                final String firstName = resultSet.getString(2);
                final String lastName = resultSet.getString(3);
                final int salary = resultSet.getInt(4);
                final boolean isManager = resultSet.getBoolean(5);
                final int bonus = resultSet.getInt(6);
                if (isManager) {
                    Manager m = new Manager(empNum, firstName, lastName, salary, bonus);
                    return m;
                } else {
                    Employee e = new Employee(empNum, firstName, lastName, salary);
                    return e;
                }
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
        employeeDataDB.addEmployee(new Employee(123, "Tom", "Byrne", 182000));
        employeeDataDB.addEmployee(new Employee(127, "John", "Byrne", 1000));
        employeeDataDB.addEmployee(new Employee(1290, "Tom", "Cole", 1000));
        employeeDataDB.addEmployee(new Manager(4554, "Poor", "Guy", 500, 500));
        employeeDataDB.addEmployee(new Employee(1113, "Joss", "Whedon", 228000));
        employeeDataDB.addEmployee(new Manager(124, "Landon", "Cole", 212000, 16000));
        final List<Employee> completeEmployeeList = employeeDataDB.getCompleteEmployeeList(false);
        for (Employee e : completeEmployeeList) {
            System.out.println(e.toString());
        }
        final int employeeCount = employeeDataDB.getEmployeeCount();
        System.out.println("Employee Count:" + employeeCount);

        System.out.println("===================Managers");
        List<Manager> managerList = employeeDataDB.getManagerList();
        for (Manager e : managerList) {
            System.out.println(e.toString());
        }
        System.out.println("===================Employees");
        List<Employee> employeeList = employeeDataDB.getEmployeeList();
        for (Employee e : employeeList) {
            System.out.println(e.toString());
        }
        System.out.println("===================Find By ID");
        Employee tom = employeeDataDB.getEmployee(1290);
        System.out.println(tom.toString());

        System.out.println("===================Highest Salary");
        employeeList = employeeDataDB.getHighestSalariedEmployees();
        for (Employee e : employeeList) {
            System.out.println(e.toString());
        }
        System.out.println("===================Lowest Salary");
        employeeList = employeeDataDB.getLowestSalariedEmployees();
        for (Employee e : employeeList) {
            System.out.println(e.toString());
        }

        System.out.println("===================By First name Search = TOM");
        employeeList = employeeDataDB.getAllEmployeesWithName("Tom", true);
        for (Employee e : employeeList) {
            System.out.println(e.toString());
        }
        System.out.println("===================By Last name Search = Cole");
        employeeList = employeeDataDB.getAllEmployeesWithName("Cole", false);
        for (Employee e : employeeList) {
            System.out.println(e.toString());
        }
        System.out.println("===================Sorted By Salary");
        employeeList = employeeDataDB.getCompleteEmployeeList(true);
        for (Employee e : employeeList) {
            System.out.println(e.toString());
        }


    }
}
