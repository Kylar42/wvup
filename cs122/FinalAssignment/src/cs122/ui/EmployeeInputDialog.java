package cs122.ui;

import com.sun.deploy.panel.NumberDocument;
import cs122.model.Employee;

import javax.swing.*;
import javax.swing.text.AttributeSet;
import javax.swing.text.BadLocationException;
import javax.swing.text.PlainDocument;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

/**
 * User: Tom Byrne(tom.byrne@apple.com)
 * Copyright (C) 2011 Apple Inc.
 * "I code not because I have a problem to solve, but because there is
 * code within me, crying to get out."
 */
public class EmployeeInputDialog extends JDialog {
    private final static String[] employeeTypes = {"Employee", "Manager"};
    private final JComboBox typeCB = new JComboBox(employeeTypes);
    private final JTextField employeeNameTF = new JTextField(30);
    private final JTextField employeeNumberTF = new JTextField(new NumberDocument(), "", 30);
    private final JTextField employeeSalaryTF = new JTextField(new DoubleDocument(), "",30);
    private final JTextField managerBonusTF = new JTextField(new DoubleDocument(), "",30);
    private final JLabel     managerBonusLabel = new JLabel("Manager Bonus");

    private EmployeeInputDialog(Frame parent) {
        super(parent, "Create Employee", true);
        Box mainPanel = Box.createVerticalBox();

        typeCB.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {

                final String actionCommand = (String)typeCB.getSelectedItem();
                if(employeeTypes[0].equals(actionCommand)){
                    //employee was chosen.
                    managerBonusTF.setEnabled(false);
                    managerBonusLabel.setEnabled(false);

                }else{
                    //manager was chosen.
                    managerBonusTF.setEnabled(true);
                    managerBonusLabel.setEnabled(true);
                }
            }
        });
        
        //JComboBox first
        Box panel = Box.createHorizontalBox();
        panel.add(Box.createHorizontalGlue());
        panel.add(new JLabel("Employee Type"));
        panel.add(typeCB);
        mainPanel.add(panel);
        panel = Box.createHorizontalBox();
        panel.add(Box.createHorizontalGlue());
        panel.add(new JLabel("Employee Name"));
        panel.add(employeeNameTF);
        mainPanel.add(panel);
        panel = Box.createHorizontalBox();
        panel.add(Box.createHorizontalGlue());
        panel.add(new JLabel("Employee Number"));
        panel.add(employeeNumberTF);
        mainPanel.add(panel);
        panel = Box.createHorizontalBox();
        panel.add(Box.createHorizontalGlue());
        panel.add(new JLabel("Employee Salary"));
        panel.add(employeeSalaryTF);
        mainPanel.add(panel);
        panel = Box.createHorizontalBox();
        panel.add(Box.createHorizontalGlue());
        panel.add(managerBonusLabel);
        panel.add(managerBonusTF);
        mainPanel.add(panel);

        this.getContentPane().add(mainPanel);
        this.pack();
        this.setLocationByPlatform(true);
        typeCB.setSelectedIndex(0);
    }


    /**
     * Static method to create dialog and return.
     *
     * @param parent
     * @return
     */

    public static Employee showDialogAndGetEmployee(Frame parent) {
        return showDialogAndGetEmployee(parent, null, -1, -1);
    }
    
    public static Employee showDialogAndGetEmployee(Frame parent, String employeeName, double employeeSalary, int employeeNumber) {
        EmployeeInputDialog dialog = new EmployeeInputDialog(parent);

        dialog.setVisible(true);

        //each line will be a new panel: Glue, JLabel, JTextField
        
        return null;
    }

    /**
     * Inner class to only allow a double to be inserted into this document
     * This will be used for salary inputs.
     */
    private static class DoubleDocument extends PlainDocument {
        @Override
        public void insertString(int offs, String str, AttributeSet a) throws BadLocationException {
            if (isDouble(offs, str, super.getText(0, super.getLength()))) {
                super.insertString(offs, str, a);
            } else{
                Toolkit.getDefaultToolkit().beep();
            }
        }

        private boolean isDouble(int offset, String newString, String existing) {
            try {
                StringBuilder sb = new StringBuilder(existing);
                sb.insert(offset, newString);
                Double.parseDouble(sb.toString());
            } catch (NumberFormatException ignore) {
                return false;
            }
            return true;
        }
    }

    public static void main(String[] args) {
        JFrame f = new JFrame();
        f.setSize(new Dimension(200,200));
        f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        f.setVisible(true);
        final Employee employee = showDialogAndGetEmployee(f);
        
        System.out.println(employee);
    }
}
