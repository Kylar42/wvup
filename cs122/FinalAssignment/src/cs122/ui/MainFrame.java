package cs122.ui;

import cs122.model.Employee;
import cs122.model.EmployeeDataImpl;
import cs122.model.Manager;

import javax.swing.*;
import javax.swing.event.MenuEvent;
import javax.swing.event.MenuListener;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

/**
 * @Author Tom Byrne, tom.byrne@apple.com
 * (C) 2011 Apple, Inc
 * "I code not to solve a problem,
 * but because there is code within me, crying to get out."
 */
public class MainFrame extends JFrame {
    //Going to put this here, although I would *normally* create a more consistent data handling model.
    //Since I'm doing the UI for fun and not for marks, I'm going to cut some
    EmployeeDataImpl _mainDataList = new EmployeeDataImpl();


    public MainFrame() throws HeadlessException {
        super("Assignment 3");
        _mainDataList.addEmployee(new Employee(212, "Tom", 91000));
        _mainDataList.addEmployee(new Manager(9182, "Landon", 100000, 21000));
        _mainDataList.addEmployee(new Employee(4165, "Phil", 27555));
        _mainDataList.addEmployee(new Employee(911, "Ed", 38911));
        _mainDataList.addEmployee(new Employee(5, "Jake", 21000));
        setupOnlyCallFromCtor();
    }

    /**
     * Call from constructor to create this 'Assignment Frame'
     */
    private final void setupOnlyCallFromCtor(){
        setUpMenu(); 
        
        JSplitPane splitPane = new JSplitPane(JSplitPane.VERTICAL_SPLIT);
        //Top will be two panels: A menu panel on the left, and on the right an 'output' panel.
        //Bottom will be a custom JTable.
        /**
         * *****************************************************
         * * ********************  *************************** *
         * * *                  *  *                         * *
         * * * Menu Panel       *  * Output Panel            * *
         * * *                  *  *                         * *
         * * *                  *  *                         * *
         * * *                  *  *                         * *
         * * *                  *  *                         * *
         * * *                  *  *                         * *
         * * ********************  *************************** *
         * *********************JSPLITPANE**********************
         * *****************************************************
         * * JTable With Scrollable Employee List             **
         * *****************************************************
         * * Emp #* Emp Name  * Salary  * Employee Type * ab/bl*
         * *      *           *         *               *      *
         * *      *           *         *               *      *
         * *      *           *         *               *      *
         * *      *           *         *               *      *
         * *      *           *         *               *      *
         * *****************************************************
         * 
         *
         */
        
        EmployeeListTableModel model = new EmployeeListTableModel(_mainDataList);
        JTable table = new JTable(model);
        table.setDefaultRenderer(Object.class, new EmployeeDataTableCellRenderer());
        table.setShowGrid(true);
        JScrollPane scrollPane = new JScrollPane(table);
        splitPane.add(scrollPane, JSplitPane.BOTTOM);
        splitPane.setDividerLocation(0.5d);
        
        this.getContentPane().add(splitPane, BorderLayout.CENTER);
        
        JPanel menuPanel = new EmployeeMenuPanel();
        JPanel inset = new JPanel(new BorderLayout());
        JTextPane outputPane = new JTextPane();//going to use a textPane so that we can use HTML.
        JScrollPane outputPaneScroller = new JScrollPane(outputPane);
        outputPaneScroller.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);

        inset.add(menuPanel, BorderLayout.WEST);
        inset.add(outputPaneScroller, BorderLayout.CENTER);//making the outputpane the 'center' so it will take up extra space :)
        splitPane.add(inset, JSplitPane.TOP);


        //OK let's get the screen we're on and make sure it's big enough, and calculate the center of it.
        final Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
        final int width = Math.min(screenSize.width, 1024);
        final int height = Math.min(screenSize.height, 768);
        
        setSize(new Dimension(width, height));//let's pick a standard size 1024x768 or smaller if the screen can't handle it..


        //Find where we should locate the frame.
        final int startXLocation = (screenSize.width-width)/2;
        final int startYLocation = (screenSize.height-height)/2;

        setLocation(startXLocation, startYLocation);

        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        this.setVisible(true);
    }

    /**
     * Set up the JMenu for the frame. Right now it will only contain a 'Quit' and 'About'
     */
    private final void setUpMenu(){


        JMenuBar mainMenuBar = new JMenuBar();
        final JMenu quitMenuItem = new JMenu("Quit");
        quitMenuItem.addMenuListener(new MenuListener() {
            public void menuSelected(MenuEvent e) {
                System.exit(0);

            }
            public void menuDeselected(MenuEvent e) {}
            public void menuCanceled(MenuEvent e) {}
        });
       
        quitMenuItem.setPopupMenuVisible(false);
        final JMenu aboutMenuItem = new JMenu("About");
       
        aboutMenuItem.addMenuListener(new MenuListener() {
            public void menuSelected(MenuEvent e) {
                JOptionPane.showMessageDialog(MainFrame.this, "Assignment 3 With Swing UI. Author: T.Byrne", "About", JOptionPane.INFORMATION_MESSAGE);
                aboutMenuItem.setSelected(false);//otherwise it will still be selected after the dialog box.
            }
            public void menuDeselected(MenuEvent e) {}

            public void menuCanceled(MenuEvent e) {}
        });
        aboutMenuItem.setPopupMenuVisible(false);
        mainMenuBar.add(quitMenuItem);
        mainMenuBar.add(aboutMenuItem);
        this.setJMenuBar(mainMenuBar);
    }
    private void menuChosen(final String s){

    }

    private class EmployeeMenuPanel extends JPanel{
        EmployeeMenuPanel(){
            this.setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));
            this.add(new JLabel("1. Enter an Employee"));
            this.add(new JLabel("2. Enter a Manager"));
            this.add(new JLabel("3. Print All The Employees"));
            this.add(new JLabel("4. Print All The Managers"));
            this.add(new JLabel("5. Print Everyone"));
            this.add(new JLabel("6. Search For A Manager (By Employee ID)"));
            this.add(new JLabel("7. Search For An Employee (By Employee ID)"));
            this.add(new JLabel("8. Search for anyone (By Employee ID)"));
            final JTextField tf = new JTextField();
            this.add(tf);
            this.add(Box.createHorizontalGlue());
            
            tf.addActionListener(new ActionListener() {         
                public void actionPerformed(ActionEvent e) {
                    MainFrame.this.menuChosen(tf.getText());
                }
            });
        }
    }
}
