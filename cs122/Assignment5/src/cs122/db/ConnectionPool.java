package cs122.db;

import com.sun.org.apache.bcel.internal.generic.INSTANCEOF;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.concurrent.ConcurrentLinkedQueue;

/**
 * User: Tom Byrne(tom.byrne@apple.com)
 * Copyright (C) 2011 Apple Inc.
 * "I code not because I have a problem to solve, but because there is
 * code within me, crying to get out."
 */

public class ConnectionPool {
    final String dbRootUrl = "jdbc:mysql://localhost/";
    final String dbRootUser = "root";
    final String dbRootPassword = "";//yes, yes, it's in plain text.



    final String dbUrl = "jdbc:mysql://localhost/hr_info";
    final String dbClass = "com.mysql.jdbc.Driver";
    final String dbUser = "cs122";
    final String dbPassword = "cs122";

    private static final ConnectionPool INSTANCE = new ConnectionPool();

    private final ConcurrentLinkedQueue<Connection> ROOT_CONNECTIONS = new ConcurrentLinkedQueue<Connection>() ;
    private final ConcurrentLinkedQueue<Connection> NORMAL_CONNECTIONS = new ConcurrentLinkedQueue<Connection>() ;

    public static ConnectionPool getInstance(){ return INSTANCE; }

    /** I am going to make this just create a new one for now. */
    public synchronized Connection getConnection(){
        if(null == NORMAL_CONNECTIONS.peek()){
            return INSTANCE.newDefaultConnection();
        }else{
            return NORMAL_CONNECTIONS.poll();
        }

    }
    
    private Connection newDefaultConnection(){
        try {
            Class.forName(dbClass);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            return DriverManager.getConnection(dbUrl, dbUser, dbPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private Connection newRootConnection(){
        try {
            Class.forName(dbClass);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            return DriverManager.getConnection(dbRootUrl,dbRootUser, dbRootPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Connection getRootConnection(){
        if(null == ROOT_CONNECTIONS.peek()){
            return newRootConnection();
        }else{
            return ROOT_CONNECTIONS.poll();
        }

    }
    
    public synchronized void returnConnection(Connection c){
        NORMAL_CONNECTIONS.add(c);
    }
    public synchronized void returnRootConnection(Connection c){
        ROOT_CONNECTIONS.add(c);
    }

}
