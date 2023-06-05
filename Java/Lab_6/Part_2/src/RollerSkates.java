public class RollerSkates extends Machine {
    public RollerSkates(String name, double weight, double maxSpeed) {
        super(name, weight, maxSpeed);
    }
    @Override
    public void move(int id) {
        System.out.println("Джампер №" + id + " почав рух.");
    }
}