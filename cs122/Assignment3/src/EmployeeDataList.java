import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * User: Tom Byrne(tom.byrne@apple.com)
 * Copyright (C) 2011 Apple Inc.
 * "I code not because I have a problem to solve, but because there is
 * code within me, crying to get out."
 */
public class EmployeeDataList {

    private List<Employee>          _employeeList                   = new ArrayList<Employee>();
    private Map<Integer, Employee>  _employeeMap                    = new HashMap<Integer, Employee>();

    public EmployeeDataList(){

    }

    public void addEmployee(Employee employeeToAdd){
        _employeeList.add(employeeToAdd);
        _employeeMap.put(employeeToAdd.getNumber(), employeeToAdd);
    }

    public List<Employee> getEmployeeList(){
        return _employeeList;
    }

    public boolean employeeNumberExists(int employeeNumber){
        return _employeeMap.containsKey(employeeNumber);
    }

    /**
     * Get employee by number.
     * @param employeeNumber
     * @return Appropriate employee, null if not found.
     */
    public Employee getEmployee(int employeeNumber){
        return _employeeMap.get(employeeNumber);
    }





}
