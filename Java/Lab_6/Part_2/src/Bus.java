public class Bus extends Machine {
    private final int passengers;

    public Bus(String name, double weight, double maxSpeed, int passengers) {
        super(name, weight, maxSpeed);
        this.passengers = passengers;
    }

    public int getPassengers() {
        return passengers;
    }

    @Override
    public void move(int id) {
        System.out.println("Автобус №" + id + " виїхав.");
    }
}