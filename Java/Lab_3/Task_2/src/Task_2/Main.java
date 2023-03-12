package Task_2;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner k = new Scanner(System.in);

        Vector firstVector = new Vector();
        Vector secondVector = new Vector();

        System.out.println("Enter sizes: ");
        int size_a = k.nextInt();
        int size_b = k.nextInt();

        System.out.println("Enter elements: ");
        for (int i = 0; i < size_a; i++) firstVector.append(k.nextInt());
        for (int i = 0; i < size_b; i++) secondVector.append(k.nextInt());

        Vector thirdVector = firstVector.add(secondVector);
        Vector fourthVector = secondVector.multiply(firstVector);

        firstVector.print();
        System.out.println();
        secondVector.print();
        System.out.println();
        thirdVector.print();
        System.out.println();
        fourthVector.print();

    }
}
