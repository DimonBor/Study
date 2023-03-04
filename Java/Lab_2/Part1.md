# Перша частина

### 1. Створити клас з полями.
``` java
public class NewClass {
    private byte b = 42;
    private char c = 'a';
    private short s = 1024;
    private int i = 50000;
    private float f = 5.67f;
    private double d = .1234;

    public getResult() {
        return (f * b) + (i / c) - (d * s);
    }
}
```

До якого типу даних належить результат?

**double**

<br>

****

### 2. Перетворення типів:
Перетворити типи змінних в int, float, double.\
Приклад: 
``` java 
int c = (int) (0.5 + b); 
```
Результат вивести на екран і пояснити.


``` java
...
    public getResult() {
        return (int) ((f * b) + (i / c) - (d * s)); // Приведення в int
    }
...
```
``` java
...
    public getResult() {
        return (float) ((f * b) + (i / c) - (d * s)); // Приведення в float
    }
...
```
``` java
...
    public getResult() {
        return (double) ((f * b) + (i / c) - (d * s)); // Приведення в double
    }
...
```

В даних трьох прикладах використовується стандартний механізм приведення типів данних в Java.

<br>

****

### 3. Примінити префіксну та постфіксну форми інкременту/декременту, вивести значення змінних до і після операції. Визначити результат застосування інкременту/декременту для різних типів даних.
Обчислити значення, які отримають змінні після виконання коду:
``` java 
int a, b = 5, c = 7, d = 9;
a = b ++ + c ++ + ++ d;
```

Код, що було використано:
``` java
public class Test{

     public static void main(String []args){
        int a, b = 5, c = 7, d = 9;
        a = b ++ + c ++ + ++ d;
        System.out.println(
            "a = " + a + "\n" +
            "b = " + b + "\n" +
            "c = " + c + "\n" +
            "d = " + d + "\n"
        );
     }
}
```
<br>

Результат:
```
a = 22
b = 6
c = 8
d = 10
```

<br>

****

### 4. Перевірте випадки отримання результату - позитивна і негативна нескінченності (positive/negative infinity)

Код для перевірки:
``` java
public class Test{

     public static void main(String []args){
        System.out.println(
            1f / 0f + "\n" +  	
            -1d / 0d 
        );
     }
}
```

Результат:
```
Infinity
-Infinity
```

<br>

****

### 5. Отримати значення NaN (значення «не число», Not-a-Number). Значення NaN можна отримати в результаті наступних дій:
``` Java
0.0 / 0.0 			// поділ нуль на нуль
(1.0 / 0.0) * 0.0 		// множення нескінченності на нуль
```

Код для перевірки:
``` java
public class Test{

     public static void main(String []args){
        System.out.println(
            (0.0 / 0.0) + "\n" +
            (1.0 / 0.0) * 0.0
        );
     }
}
```

Результат:
```
NaN
NaN
```

<br>

****

### 6. Математичні функції і константи. Отримати значення довжини сторони трикутника (гіпотенузи) з використанням теореми Піфагора, знаючи довжини катетів і використовуючи методи класу Math.

Код для обчислення гіпотенузи:
``` java
import java.lang.Math;

public class Test{

    public static void main(String []args){
        /* Катети A та B */
        int a = 2, b = 3;
        /* Обчислення кореню з суми квадратів */
        System.out.println(Math.sqrt(Math.pow(a, 2) + Math.pow(b, 2)));
    }
}
```

Результат:
``` 
3.605551275463989
```
