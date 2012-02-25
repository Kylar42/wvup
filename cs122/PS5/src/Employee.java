/**
 * User: Tom Byrne(tom.byrne@apple.com)
 * Copyright (C) 2011 Apple Inc.
 * "I code not because I have a problem to solve, but because there is
 * code within me, crying to get out."
 */
public class Employee {
    private int age;
    private int yrsOfService;
    private String name;

    public Employee(){

    }
    public Employee(final int age, final int yrsOfService){
        this.age = age;
        this.yrsOfService = yrsOfService;
    }

    public int getAge(){
        return age;
    }

    public void setAge(final int age){
        this.age = age;
    }

    public int getYrsOfService(){
        return yrsOfService;
    }

    public void setYrsOfService(final int yrsOfService){
        this.yrsOfService = yrsOfService;
    }

    public String getName(){
        return name;
    }
    public void setName(final String name){
        this.name = name;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Employee:  [Name: ").append(this.name).append(" Age: ").append(age).append( " Years Of Service: ").append(yrsOfService).append(" ]");
        return sb.toString();
    }
}
