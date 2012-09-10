package cs122;

import cs122.action.Action;
import cs122.action.CLIActions;
import cs122.io.EmployeeStdinReader;
import cs122.io.EmployeeStdoutWriter;
import cs122.model.EmployeeDataList;
import cs122.model.EmployeeMenuItem;

import java.io.IOException;

/**
 * User: Tom Byrne(tom.byrne@apple.com)
 * Copyright (C) 2011 Apple Inc.
 * "I code not because I have a problem to solve, but because there is
 * code within me, crying to get out."
 */
public class EmployeeDataMain {
    //------------------------------------Member vars

    //------------------------------------Static vars
    //since this is an assignment, I'm going to bound the upper limit to 100.
    private static final int MAX_NUMBER_OF_EMPLOYEES = 100;

    private EmployeeDataMain() {
        runCLI();
    }




    //main CLI Loop
    private void runCLI() {
        EmployeeDataList dataList = new EmployeeDataList();
        EmployeeStdinReader reader = new EmployeeStdinReader();
        EmployeeStdoutWriter writer = new EmployeeStdoutWriter();
        CLIActions actionHandler = new CLIActions(dataList, reader, writer);

        EmployeeMenuItem lastItem = null;
        try {
            while (true) {
                writer.printMenu();
                try {
                    final EmployeeMenuItem employeeMenuItem = reader.promptForMenuItem();
                    final Action action = actionHandler.actionForMenuItem(employeeMenuItem);
                    action.performAction();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        } finally {
            reader.closeStreams();
        }

    }



    public static void main(String[] args) {
        new EmployeeDataMain();
    }
}
