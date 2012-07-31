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


    private static final String DB_CREATE = "create database if not exists hr_info;";
    private static final String DB_DROP = "drop database hr_info;";
    private static final String USER_DROP = "drop user '"+ConnectionPool.getInstance().dbUser+"'@'localhost';";
    private static final String USER_CREATE = "create user '"+ConnectionPool.getInstance().dbUser+"'@'localhost' identified by '"+ConnectionPool.getInstance().dbPassword+"';";
    private static final String USER_GRANT = "GRANT ALL ON hr_info.* to '"+ConnectionPool.getInstance().dbUser+"'@'localhost' identified by '"+ConnectionPool.getInstance().dbPassword+"';";
    private static final String CREATE_EMPLOYEE_TABLE = "CREATE TABLE Employee (EMP_ID int NOT NULL,Salary int NOT NULL, PRIMARY KEY (EMP_ID));";

    public static void createOrSetupDB(){
        Connection myConnection = ConnectionPool.getInstance().getRootConnection();
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
    public static void dropUser(){
        Connection myConnection = ConnectionPool.getInstance().getRootConnection();
        try{
            final PreparedStatement preparedStatement = myConnection.prepareStatement(USER_DROP);
            final int executed = preparedStatement.executeUpdate();
            System.out.println("DB Created:"+executed);
        }catch(SQLException sql){
            sql.printStackTrace();
        }finally{
            ConnectionPool.getInstance().returnRootConnection(myConnection);
        }
    }
    public static void createUser(){
        Connection myConnection = ConnectionPool.getInstance().getRootConnection();
        try{
            PreparedStatement preparedStatement = myConnection.prepareStatement(USER_CREATE);
            int executed = preparedStatement.executeUpdate();
            System.out.println("User Created:"+executed);
            preparedStatement = myConnection.prepareStatement(USER_GRANT);
            executed = preparedStatement.executeUpdate();
            System.out.println("User Granted:"+executed);
        }catch(SQLException sql){
            sql.printStackTrace();
        }finally{
            ConnectionPool.getInstance().returnRootConnection(myConnection);
        }
    }
    

    public static void createOrSetupTables(){
        Connection myConnection = ConnectionPool.getInstance().getConnection();
        try{
            final PreparedStatement preparedStatement = myConnection.prepareStatement(CREATE_EMPLOYEE_TABLE);
            final int executed = preparedStatement.executeUpdate();
            System.out.println("Table Created:"+executed);
        }catch(SQLException sql){
            sql.printStackTrace();
        }finally{
            ConnectionPool.getInstance().returnConnection(myConnection);
        }
    }

    public static void dropHRInfoDB(){
        Connection myConnection = ConnectionPool.getInstance().getRootConnection();
        try{
            final PreparedStatement preparedStatement = myConnection.prepareStatement(DB_DROP);
            final int executed = preparedStatement.executeUpdate();
            System.out.println("DB Dropped:"+executed);
        }catch(SQLException sql){
            sql.printStackTrace();
        }finally{
            ConnectionPool.getInstance().returnRootConnection(myConnection);
        }
    }

    public static void main(String[] args) {
        DBSetup.dropHRInfoDB();
        DBSetup.dropUser();
        DBSetup.createOrSetupDB();
        DBSetup.createUser();
        DBSetup.createOrSetupTables();
    }
}

