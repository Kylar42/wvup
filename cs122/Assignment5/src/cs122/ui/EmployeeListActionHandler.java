package cs122.ui;

import cs122.model.Employee;
import cs122.model.EmployeeDataList;
import cs122.model.EmployeeMenuItem;
import cs122.model.ListListener;

/**
 * User: Tom Byrne(tom.byrne@apple.com)
 * Copyright (C) 2011 Apple Inc.
 * "I code not because I have a problem to solve, but because there is
 * code within me, crying to get out."
 */
public class EmployeeListActionHandler implements ListListener{


    private final EmployeeDataList _canonicalList;

    public EmployeeListActionHandler(EmployeeDataList dataList){
        _canonicalList = dataList;
    }

    public void listChanged(Action type, Employee employeeChanged) {

    }

    public void menuItemChosen(EmployeeMenuItem item){

    }
}
