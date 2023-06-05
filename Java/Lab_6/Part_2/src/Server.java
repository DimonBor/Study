public class Server {

    private int[] countVehicles;
    private int commonCountVehicles;
    private int limitVehicle;
    private Machine[] vehicles;

    public Server (int limit, int typesCount) {
        this.limitVehicle = limit;
        this.countVehicles = new int[typesCount];
        this.vehicles = new Machine[limit];
    }

    public int getLimitVehicle () {
        return limitVehicle;
    }

    public int getCurrentCountVehicle () {
        return commonCountVehicles;
    }

    public int getCountVehicles (int numberVehicles) {
        return countVehicles[numberVehicles];
    }

    public void addTransport (int numberVehicles, Machine vehicle) {
        countVehicles[numberVehicles]++;
        vehicles[commonCountVehicles] = vehicle;
        vehicles[commonCountVehicles].move(countVehicles[numberVehicles]);
        commonCountVehicles++;
    }
}