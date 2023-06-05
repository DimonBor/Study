public class Jumpers extends Machine {
    public Jumpers(String name, double weight, double maxSpeed) {
        super(name, weight, maxSpeed);
    }
    @Override
    public void move(int id) {
        System.out.println("Джампер №" + id + " почав рух.");
    }
}
