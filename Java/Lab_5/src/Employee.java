public class Employee {
    private int id;
    private static int nextId = 1;
    private String name;
    private String surname;
    private double salary;
    private Manager manager;

    public Employee(String name, String surname, double salary, Manager manager) {
        this.id = nextId;
        nextId++;
        this.name = name;
        this.surname = surname;
        this.salary = salary;
        this.manager = manager;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public Manager getManager() {
        return manager;
    }

    public void setManager(Manager manager) {
        this.manager = manager;
    }

    public void raiseSalary(double percent) {
        double raiseAmount = salary * percent / 100;
        salary += raiseAmount;
    }

    public String getManagerName() {
        return  manager == null ? "No manager" : (manager.getName() + " " + manager.getSurname());
    }

    public Employee getTopManager() {
        return (getManager() == null) ? this : getTopManager();
    }

    @Override
    public String toString() {
        return "Employee{" +
                "\n\tid=" + id +
                ",\n\tparrent=" + (manager != null ? String.valueOf(manager.getId()) : null) +
                ",\n\tname='" + name + '\'' +
                ",\n\tsurname='" + surname + '\'' +
                ",\n\tsalary=" + salary +
                "\n}";
    }
}


