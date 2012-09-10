package cs122.ui;

import cs122.model.Employee;
import cs122.model.EmployeeDataImpl;
import cs122.model.Manager;

import javax.swing.table.AbstractTableModel;

/**
 * @Author Tom Byrne, tom.byrne@apple.com
 * (C) 2011 Apple, Inc
 * "I code not to solve a problem,
 * but because there is code within me, crying to get out."
 */
public class EmployeeListTableModel extends AbstractTableModel{
    
    final EmployeeDataImpl _dataStructure;
    final String[]          _columnNames = {"Employee Number", "Employee Name", "Employee Salary", "Employee Type", "Salary"};
    
    EmployeeListTableModel(EmployeeDataImpl list){
        _dataStructure = list;
    }
    
    public int getColumnCount() {
        return 5;//Employee #, Name, Salary, Type, Above/below avg.
    }

    public int getRowCount() {
        int rowCt = _dataStructure.getEmployeeCount();
        return rowCt;
    }

    public Object getValueAt(int rowIndex, int columnIndex) {
        final Employee currentEmployee = _dataStructure.getEmployeeAtIndex(rowIndex);
        if(null == currentEmployee){
            System.out.println("UNABLE TO RETRIEVE DATA FOR ["+rowIndex+":"+columnIndex+"]");
        }
        switch(columnIndex){
            case 0:
                return currentEmployee.getEmployeeNumber();
            case 1:
                return currentEmployee.getName();
            case 2:
                return currentEmployee.getSalary();
            case 3:
                return currentEmployee instanceof Manager;
            case 4:
                return currentEmployee.getSalary() - _dataStructure.getAverageSalary().doubleValue();
            //no default case.
        }
        
        return null;
    }

    @Override
    public String getColumnName(int column) {
        return _columnNames[column];
    }
}
