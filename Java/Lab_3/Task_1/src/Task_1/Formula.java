package Task_1;

import java.lang.Math;

public class Formula {
    private double x, y, z, t;

    void set(double new_x, double new_y, double new_z) {
        this.x = new_x;
        this.y = new_y;
        this.z = new_z;
    }

    void run() {
        t = ((2*Math.cos(x-(Math.PI/6)))/(0.5+Math.pow(Math.sin(y), 2)))*(1+(Math.pow(z, 2)/(3-(Math.pow(z, 2))/5)));
    }

    void print() {
        System.out.println("t = " + t);
    }
}
