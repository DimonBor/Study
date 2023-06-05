public class Manager extends Employee {
    private double bonus;

    public Manager(String name, String surname, double salary, Manager manager) {
        super(name, surname, salary, manager);
    }

    public double getBonus() {
        return bonus;
    }

    public void setBonus(double bonus) {
        this.bonus = bonus;
    }

    @Override
    public double getSalary() {
        return super.getSalary() + bonus;
    }

    @Override
    public String toString() {
        return "Manager{\n" +
                "\tid=" + getId() +
                ",\n\tparrent=" + (this.getManager() != null ? String.valueOf(this.getManager().getId()) : null) +
                ",\n\tname='" + getName() + '\'' +
                ",\n\tsurname='" + getSurname() + '\'' +
                ",\n\tsalary=" + getSalary() +
                ",\n\tbonus=" + bonus +
                "\n}";
    }
}
