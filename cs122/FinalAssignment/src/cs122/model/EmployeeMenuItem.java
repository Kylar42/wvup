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
    SEARCH_ALL(3, "Search For Anyone By Employee ID"),
    SEARCH_BY_FIRST(4, "Search for an employee or manager by first name."),
    SEARCH_BY_LAST(5, "Search for an employee or manager by last name"),
    PRINT_ALL(6, "Print Everyone"),
    PRINT_BY_SALARY(7, "Print everyone by Sorted Salary (Highest To Lowest)"),
    PRINT_LOWEST_SALARY(8,"Display the employee(s) with the lowest salary."),
    PRINT_HIGHEST_SALARY(9, "Display the employee(s) with the highest salary."),
    PRINT_AVG_SALARY(10, "Print out the average salary of all employees."),
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
