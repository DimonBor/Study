import java.util.Random;

public class Main {
    public static void main(String[] args) {

        Server mainServer = new Server(20, 7);

        Random random = new Random();

        while (mainServer.getCurrentCountVehicle() < mainServer.getLimitVehicle()) {
            int randomNumber = random.nextInt(7); // Генеруємо випадкове число від 0 до 6

            switch (randomNumber) {
                case 0 -> mainServer.addTransport(0, new Car("NewCar", 1500, 60));
                case 1 -> mainServer.addTransport(1, new Bicycle("NewBicycle", 30, 45));
                case 2 -> mainServer.addTransport(2, new RollerSkates("NewRollerSkates", 20, 10));
                case 3 -> mainServer.addTransport(3, new Jumpers("NewJumpers", 30, 10));
                case 4 -> mainServer.addTransport(4, new Bus("NewJumpers", 30, 10, 20));
                case 5 -> mainServer.addTransport(5, new TractorWheeled("NewWheeledTractor", 1500, 10));
                case 6 -> mainServer.addTransport(6, new TractorCrawler("NewCrawlerTractor", 2500, 10));
            }
        }

        System.out.println();
        System.out.println("Загальна кількість автомобілів: " + mainServer.getCountVehicles(0));
        System.out.println("Загальна кількість велосипедів: " + mainServer.getCountVehicles(1));
        System.out.println("Загальна кількість роликових ковзанів: " + mainServer.getCountVehicles(2));
        System.out.println("Загальна кількість джамперів: " + mainServer.getCountVehicles(3));
        System.out.println("Загальна кількість автобусів: " + mainServer.getCountVehicles(4));
        System.out.println("Загальна кількість колісних тракторів: " + mainServer.getCountVehicles(5));
        System.out.println("Загальна кількість гусеничних тракторів: " + mainServer.getCountVehicles(6));

    }
}
