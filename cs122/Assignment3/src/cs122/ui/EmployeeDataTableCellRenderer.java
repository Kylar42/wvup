package cs122.ui;

import javax.swing.*;
import javax.swing.table.DefaultTableCellRenderer;
import java.awt.*;

/**
 * @Author Tom Byrne, tom.byrne@apple.com
 * (C) 2011 Apple, Inc
 * "I code not to solve a problem,
 * but because there is code within me, crying to get out."
 */
public class EmployeeDataTableCellRenderer extends DefaultTableCellRenderer {

    Color EVEN_ROW_BACKGROUND = new Color(255, 255, 200); //light yellow, shows off alternating rows.
    Color ODD_ROW_BACKGROUND = Color.WHITE;

    @Override
    public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus, int row, int column) {
        Component toReturn = null;

        setBackground(((0 == row % 2) ? EVEN_ROW_BACKGROUND : ODD_ROW_BACKGROUND));
        if (3 == column) {
            value = ((Boolean) value) ? "Manager" : "Employee";
        } else if (4 == column) {
            double dVal = (Double)value;
            if(dVal < 0){
                setBackground(Color.RED);
                value = "BELOW";
            }else if(dVal > 0){
                setBackground(Color.GREEN);
                value = "ABOVE";
            }else{
                setBackground(Color.WHITE);
                value = "AVERAGE";
            }
            
            
        }
        toReturn = super.getTableCellRendererComponent(table, value, isSelected, hasFocus, row, column);
        return toReturn;
    }
}
