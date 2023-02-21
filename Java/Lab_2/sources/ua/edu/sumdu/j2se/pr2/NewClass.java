package ua.edu.sumdu.j2se.pr2;

import java.util.Scanner; 

public class NewClass {

	public NewClass () {
		Scanner k = new Scanner(System.in);
        
        int number1;	
		float number2;
		double number3;
		char char1;	
		byte number4;	
		short number5;	
		String word;
		long number6;

		System.out.println ("Введіть довільне ціле число: "); // int 
		number1 = k.nextInt();	

        System.out.println ("Введіть довільне неціле число: "); // float 
		number2 = k.nextFloat();	

        System.out.println ("Ще одне: "); // double
		number3 = k.nextDouble();	

        System.out.println ("Введіть довільний символ: "); // char
		char1 = k.next().charAt(0);	
	
        System.out.println ("Введіть цифру від 1 до 9: "); // byte 
		number4 = k.nextByte();	
	
        System.out.println ("Введіть число від 1 до 999: "); // short
		number5 = k.nextShort();	
        k.nextLine();
        
        System.out.println ("Введіть довільне слово: "); // String 
		word = k.nextLine();	
	
        System.out.println ("І ще одне ціле число: "); // long
		number6 = k.nextLong();	

        System.out.println(
            "\nВи понавводили:\n" +
            "\t" + number1 + " \n" +
            "\t" + number2 + " \n" +
            "\t" + number3 + " \n" +
            "\t" + number4 + " \n" +
            "\t" + number5 + " \n" +
            "\t" + number6 + " \n" +
            "\t" + word + " \n" +
            "\t" + char1 + " \n"        
        );
	}

}
