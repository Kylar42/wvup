package cs122.model;

/**
 * @Author Tom Byrne, tom.byrne@apple.com
 * (C) 2011 Apple, Inc
 * "I code not to solve a problem,
 * but because there is code within me, crying to get out."
 */
public class Manager extends Employee{
    
    private int bonus;
    
    public Manager(){
        super();
        bonus = -1;
    }
    public Manager(int empNumber, String name, int empSalary){
        super(empNumber, name, empSalary);
    }
    public Manager(int number, String name, int salary, int bonus) {
        this(number, name, salary);
        this.bonus = bonus;
    }
    
    public int getBonus(){
        return bonus;
    }
    
    public void setBonus(int bon){
        this.bonus = bon;
    }
    
    public int getSalary(){
        return super.getSalary() + bonus;
    }
    
}
