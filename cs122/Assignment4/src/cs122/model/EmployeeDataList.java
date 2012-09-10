package cs122.model;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * User: Tom Byrne(tom.byrne@apple.com)
 * Copyright (C) 2011 Apple Inc.
 * "I code not because I have a problem to solve, but because there is
 * code within me, crying to get out."
 */
public class EmployeeDataList {
    // I could keep two maps of employees and managers, but I'm going to be lazy and just filter.
    private Map<Integer, Employee>  _employeeMap                    = new LinkedHashMap<Integer, Employee>();
    private long                    _totalSalary                    = 0L;
    private List<ListListener>      _listeners                      = new ArrayList<ListListener>();


    public void printHashMapContents(){
        for(Integer empNum : _employeeMap.keySet()){
            System.out.println(String.format("Employee Number: %d", empNum));
            Employee currentEmployee = _employeeMap.get(empNum);
            System.out.println("Employee Name: "+currentEmployee.getName());
            System.out.println("Employee Salary: "+currentEmployee.getSalary());
        }
    }

    public void addEmployee(Employee employeeToAdd){
        _employeeMap.put(employeeToAdd.getEmployeeNumber(), employeeToAdd);
        _totalSalary += employeeToAdd.getSalary();
        fireListChanged(ListListener.Action.ADDED, employeeToAdd);
    }

    public List<Employee> getCompleteEmployeeList(){
        return new ArrayList<Employee>(_employeeMap.values());//return wrapped list so they can't modify it.
    }

    /**
     * get List of managers. I could save these, but I'm going to just filter.
     * @return
     */
    public List<Manager> getManagerList(){
        ArrayList<Manager> toReturn = new ArrayList<Manager>();
        for(Employee e : _employeeMap.values()){
            if(e instanceof Manager){
                toReturn.add((Manager)e);
            }
        }
        return toReturn;                
    }
    
    public List<Employee> getEmployeeList(){
        ArrayList<Employee> toReturn = new ArrayList<Employee>();
        for(Employee e : _employeeMap.values()){
            if(!(e instanceof Manager)){
                toReturn.add(e);
            }
        }
        return toReturn;
    }
    
    public boolean employeeNumberExists(int employeeNumber){
        return _employeeMap.containsKey(employeeNumber);
    }
    public boolean employeeNumberExists(int employeeNumber, boolean isManager){
        Employee e = _employeeMap.get(employeeNumber);

        if(null == e){
            return false;
        }

        //Here we're going to AND toReturn (it had to have been non-null to continue.
        // and we're anding it to the XOR of isManager and instanceof manager.
        //this will return false if both of these are the same
        //so we do an and and not the XOR.
        //And Landon - I'm being a bit overly clever here because it's
        //more efficient. Here's how I could have written it to make it more readable:
        /**
         * if(isManager){
         *   toReturn = (e instanceof Manager);
         * } else{
         *   toReturn = !(e instanceof Manager);
         * }
         *
         *
         */
        return !(isManager ^ (e instanceof Manager));

    }
    public int getEmployeeCount(){
        return _employeeMap.size();
    } 
    public Employee getEmployeeAtIndex(final int index){
        return _employeeMap.get(index);
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
        return _totalSalary / (_employeeMap.size()+1);
    }


    private void fireListChanged(ListListener.Action action, Employee employee){
        for(ListListener ll : _listeners){
            ll.listChanged(action, employee);
        }
    }


    public static void main(String[] args) {
        //test this
        EmployeeDataList list = new EmployeeDataList();
        list.addEmployee(new Manager(1, "", 10, 10));
        list.addEmployee(new Employee(2, "", 10));

        System.out.println(list.employeeNumberExists(1, true));
        System.out.println(list.employeeNumberExists(1, false));
        System.out.println(list.employeeNumberExists(2, true));
        System.out.println(list.employeeNumberExists(2, false));
    }
   

}
