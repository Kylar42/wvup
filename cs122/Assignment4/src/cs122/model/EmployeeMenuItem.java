package cs122.model;

/**
 * User: Tom Byrne(tom.byrne@apple.com)
 * Copyright (C) 2011 Apple Inc.
 * "I code not because I have a problem to solve, but because there is
 * code within me, crying to get out."
 */
public enum EmployeeMenuItem {

    ENTER_EMPLOYEE(1, "Enter an Employee"),
    PRINT_EMPLOYEES(3, "Print All Employees"),
    SEARCH_FOR_EMPLOYEE(2, "Search For Employee By Employee ID"),
    QUIT(0, "Quit");
    
    
    final int       _menuChoice;
    final String    _displayString; 
    private EmployeeMenuItem(int menuChoice, String displayString){
        _menuChoice = menuChoice;
        _displayString = displayString;
        
    }        
    
    public String getMenuFormattedString(){
        StringBuilder sb = new StringBuilder();
        sb.append(_menuChoice).append(". ").append(_displayString);
        return sb.toString();
    }
    
    public static EmployeeMenuItem fromInt(int value){
        for(EmployeeMenuItem item : values()){
            if(item._menuChoice == value){
                return item;
            }
        }
        return null;//should be a canonical unknown value
    }
    
}
