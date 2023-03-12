package Task_1;

public class Main {
    public static void main(String[] args) {
        Formula newFormula = new Formula();
        newFormula.set(14.26, -1.22, 0.035);
        newFormula.run();
        newFormula.print();
    }
}