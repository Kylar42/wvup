import java.io.IOException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Random;

/**
 * User: Tom Byrne(tom.byrne@apple.com)
 * Copyright (C) 2011 Apple Inc.
 * "I code not because I have a problem to solve, but because there is
 * code within me, crying to get out."
 */
public class PS5Main {
    private final static Random RANDOM_GENERATOR = new SecureRandom();

    private PS5Main() {
        ArrayList<Double> doubleList = createDoubleArrayList();
        printArrayList(doubleList);
        System.out.println("Third element of the list is:" + doubleList.get(2));

        ArrayList<Employee> empList = promptForEmployeeList();


        printArrayList(empList);

    }

    private ArrayList<Employee> promptForEmployeeList() {
        ArrayList<Employee> employeeList = new ArrayList<Employee>();
        EmployeeDataStdinReader reader = new EmployeeDataStdinReader();
        try {

            int shouldContinue = reader.promptForContinue();
            while (0 != shouldContinue) {
                employeeList.add(reader.readEmployee());
                shouldContinue = reader.promptForContinue();
            }

        } catch (IOException ioe) {
            ioe.printStackTrace();
        } finally {
            reader.closeStreams();
        }
        return employeeList;
    }

    private ArrayList<Double> createDoubleArrayList() {
        ArrayList<Double> doubleArrayList = new ArrayList<Double>();
        for (int i = 0; i < 20; i++) {
            doubleArrayList.add(RANDOM_GENERATOR.nextDouble());
        }
        return doubleArrayList;

    }

    private void printArrayList(ArrayList aList) {
        //Print out contents of the array list:
        System.out.println("Contents of Array List:");
        for (Object o : aList) {
            System.out.println(o);
        }
    }


    public static void main(String[] args) {
        new PS5Main();
    }

}
