public class Car extends Machine {
    public Car(String name, double weight, double maxSpeed) {
        super(name, weight, maxSpeed);
    }
    @Override
    public void move(int id) {
        System.out.println("Автомобіль №" + id + " виїхав.");
    }
}
