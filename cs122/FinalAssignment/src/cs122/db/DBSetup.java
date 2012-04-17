package cs122.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * User: Tom Byrne(tom.byrne@apple.com)
 * Copyright (C) 2011 Apple Inc.
 * "I code not because I have a problem to solve, but because there is
 * code within me, crying to get out."
 */
public class DBSetup {
    
    private static final DBSetup INSTANCE = new DBSetup();


    private static final String DB_CREATE = "create database if not exists hr_info";

    public static void createOrSetupDB(){
        Connection myConnection = ConnectionPool.getInstance().newRootConnection();
        try{
            final PreparedStatement preparedStatement = myConnection.prepareStatement(DB_CREATE);
            final int executed = preparedStatement.executeUpdate();
            System.out.println("Created:"+executed);
        }catch(SQLException sql){
            sql.printStackTrace();
        }finally{
            ConnectionPool.getInstance().returnRootConnection(myConnection);
        }
    }

    
    private static final String CREATE_EMPLOYEE_TABLE = "CREATE TABLE Employee\n" +
            "\t(\n" +
            "\t\tEMP_ID int NOT NULL,\n" +
            "\t\tFirstName varchar(50),\n" +
            "\t\tLastName varchar(50),\n" +
            "\t\tSalary int NOT NULL,\n" +
            "\t\tPRIMARY KEY (EMP_ID)\n" +
            "\t)\n" +
            "";

    public static void createOrSetupTables(){
        Connection myConnection = ConnectionPool.getInstance().getConnection();
        try{
            final PreparedStatement preparedStatement = myConnection.prepareStatement(CREATE_EMPLOYEE_TABLE);
            final int executed = preparedStatement.executeUpdate();
            System.out.println("Created:"+executed);
        }catch(SQLException sql){
            sql.printStackTrace();
        }finally{
            ConnectionPool.getInstance().returnConnection(myConnection);
        }
    }

    public static void main(String[] args) {
        DBSetup.createOrSetupDB();
        DBSetup.createOrSetupTables();
    }
}

