abstract class Tractor extends Machine {
    private final String type;

    public Tractor(String name, double weight, double maxSpeed, String type) {
        super(name, weight, maxSpeed);
        this.type = type;
    }

    public String getType() {
        return type;
    }
}

class TractorWheeled extends Tractor {
    public TractorWheeled(String name, double weight, double maxSpeed) {
        super(name, weight, maxSpeed, "Колісний");
    }

    public void move(int id) {
        System.out.println("Трактор №" + id + " на колесах працює на полі.");
    }
}

class TractorCrawler extends Tractor {
    public TractorCrawler(String name, double weight, double maxSpeed) {
        super(name, weight, maxSpeed, "Гусеничний");
    }

    public void move(int id) {
        System.out.println("Трактор № " + id + " на гусеницях працює на нерівному грунті.");
    }
}