package cs122.model;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
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
    private long                    _totalSalary                    = 0L;


    public EmployeeDataList(){

    }

    public void addEmployee(Employee employeeToAdd){
        _employeeList.add(employeeToAdd);
        _employeeMap.put(employeeToAdd.getNumber(), employeeToAdd);
        _totalSalary += employeeToAdd.getSalary();
    }

    public List<Employee> getEmployeeList(){
        return Collections.unmodifiableList(_employeeList);//return wrapped list so they can't modify it.
    }

    public boolean employeeNumberExists(int employeeNumber){
        return _employeeMap.containsKey(employeeNumber);
    }
    
    public int getEmployeeCount(){
        return _employeeList.size();
    } 
    public Employee getEmployeeAtIndex(final int index){
        return _employeeList.get(index);
    }

    /**
     * Get employee by number.
     * @param employeeNumber
     * @return Appropriate employee, null if not found.
     */
    public Employee getEmployee(int employeeNumber){
        return _employeeMap.get(employeeNumber);
    }

    public long getTotalSalary(){
        return _totalSalary;
    }

    public double getAvgSalary(){
        //tempting to cache this whenever calculated...
        //but for now I'll just calc on the fly.
        return _totalSalary / (_employeeList.size()+1);
    }



}
