public class Main {
    public static void main(String[] args) {

        Manager manager1 = new Manager("Петро", "Косаченко", 3000, null);
        Manager manager2 = new Manager("Олександр", "Петренко", 2200, manager1);
        Manager manager3 = new Manager("Євген", "Кошовий", 4000, null);
        Manager manager4 = new Manager("Святослав", "Журавленко", 3500, manager3);
        Manager manager5 = new Manager("Кирило", "Нечай", 3000, manager4);
        Manager manager6 = new Manager("Богдан", "Чорний", 2500, manager5);

        Employee employee1 = new Employee("Сергій", "Васюк", 2500, manager2);
        Employee employee2 = new Employee("Станіслав", "Линник", 2500, manager2);
        Employee employee3 = new Employee("Володимир", "Шевченко", 2500, manager1);
        Employee employee4 = new Employee("Віталій", "Козачук", 2500, manager6);

        System.out.println(manager1.toString());
        System.out.println(manager2.toString());
        System.out.println(manager3.toString());
        System.out.println(manager4.toString());
        System.out.println(manager5.toString());
        System.out.println(manager6.toString());
        System.out.println(employee1.toString());
        System.out.println(employee2.toString());
        System.out.println(employee3.toString());
        System.out.println(employee4.toString());

    }
}