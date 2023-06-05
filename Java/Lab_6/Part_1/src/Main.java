import java.util.Random;

public class Main {
    public static void main(String[] args) {

        Server mainServer = new Server(10, 4);

        Random random = new Random();

        while (mainServer.getCurrentCountVehicle() < mainServer.getLimitVehicle()) {
            int randomNumber = random.nextInt(4); // Генеруємо випадкове число від 0 до 3

            switch (randomNumber) {
                case 0 -> mainServer.addTransport(0, new Car());
                case 1 -> mainServer.addTransport(1, new Bicycle());
                case 2 -> mainServer.addTransport(2, new RollerSkates());
                case 3 -> mainServer.addTransport(3, new Jumpers());
            }
        }

        System.out.println();
        System.out.println("Загальна кількість автомобілів: " + mainServer.getCountVehicles(0));
        System.out.println("Загальна кількість велосипедів: " + mainServer.getCountVehicles(1));
        System.out.println("Загальна кількість роликових ковзанів: " + mainServer.getCountVehicles(2));
        System.out.println("Загальна кількість джамперів: " + mainServer.getCountVehicles(3));
    }
}
