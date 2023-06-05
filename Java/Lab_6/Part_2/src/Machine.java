abstract class Machine implements Run {
    private final String name;
    private final double weight;
    private final double maxSpeed;


    public Machine(String name, double weight, double maxSpeed) {
        this.name = name;
        this.weight = weight;
        this.maxSpeed = maxSpeed;
    }

    public String getName() {
        return name;
    }

    public double getMaxSpeed() {
        return maxSpeed;
    }

    public double getWeight() {
        return weight;
    }

    public abstract void move(int id);
}