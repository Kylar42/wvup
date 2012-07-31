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
    public Manager(int empNumber, String firstName, String lastName, int empSalary){
        super(empNumber,empSalary);
    }
    public Manager(int empNumber, String firstName, String lastName, int empSalary, int bonus) {
        this(empNumber, firstName, lastName, empSalary);
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

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("[Manager: Employee - ID:").append(getEmployeeNumber()).append(" - Salary:").append(getSalary())
                .append(" - Bonus:").append(getBonus()).append("]");

        return sb.toString();

    }
    
}
