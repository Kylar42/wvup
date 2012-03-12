package cs122.model;

/**
 * User: Tom Byrne(tom.byrne@apple.com)
 * Copyright (C) 2011 Apple Inc.
 * "I code not because I have a problem to solve, but because there is
 * code within me, crying to get out."
 */
public enum EmployeeMenuItem {

    ENTER_EMPLOYEE(1, "Enter an Employee"),
    ENTER_MANAGER(2, "Enter a Manager"),
    PRINT_EMPLOYEES(3, "Print All Employees"),
    PRINT_MANAGERS(4, "Print All Managers"),
    PRINT_ALL(5, "Print Everyone"),
    SEARCH_FOR_MANAGER(6, "Search For Manager By Employee ID"),
    SEARCH_FOR_EMPLOYEE(7, "Search For Employee By Employee ID"),
    SEARCH_ALL(8, "Search For Anyone By Employee ID"),
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
