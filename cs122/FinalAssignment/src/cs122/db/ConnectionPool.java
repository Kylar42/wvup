package cs122.db;

import com.sun.org.apache.bcel.internal.generic.INSTANCEOF;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * User: Tom Byrne(tom.byrne@apple.com)
 * Copyright (C) 2011 Apple Inc.
 * "I code not because I have a problem to solve, but because there is
 * code within me, crying to get out."
 */

public class ConnectionPool {
    String dbRootUrl = "jdbc:mysql://localhost/";

    String dbUrl = "jdbc:mysql://localhost/HR_INFO";
    String dbClass = "com.mysql.jdbc.Driver";
    
    private static final ConnectionPool INSTANCE = new ConnectionPool();
    
    public static ConnectionPool getInstance(){ return INSTANCE; }

    /** I am going to make this just create a new one for now. */
    public synchronized Connection getConnection(){
        return INSTANCE.newDefaultConnection();
    }
    
    private Connection newDefaultConnection(){
        try {
            Class.forName(dbClass);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            return DriverManager.getConnection(dbUrl, "cs122", "cs122");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    Connection newRootConnection(){
        try {
            Class.forName(dbClass);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            return DriverManager.getConnection(dbRootUrl,"root", "");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    
    public synchronized void returnConnection(Connection c){
        //nothing right now.
    }
    public synchronized void returnRootConnection(Connection c){
        //nothing right now.
    }
}
