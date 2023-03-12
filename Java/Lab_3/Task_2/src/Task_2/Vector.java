package Task_2;

import java.util.Arrays;

/**
 * Реалізація класу вектор
 */
public class Vector {
    private int[] elements;

    /**
     * Пустий конструктор
     */
    public Vector() {
        elements = new int[0];
    }

    /**
     * Конструктор, в якому можна задати початковий розмір масиву
     * @param new_size новий розмір масиву
     */
    public Vector(int new_size) {
        elements = new int[new_size];
    }

    /**
     * Зміна розміру вектору
     * @param new_size новий розмір масиву
     */
    public void setDimension(int new_size) {
        elements = Arrays.copyOf(elements, new_size);
    }

    /**
     *Повернення елементу за індексом
     * @param index індекс елементу, який хочемо повернути
     * @return значення елементу
     */
    public int getElem(int index) {
        return elements[index];
    }

    /**
     *Зміна елементу за індексомґ
     * @param index індекс елементу, який хочемо змінити
     * @param value нове значення
     */
    public void setElem(int index, int value) {
        elements[index] = value;
    }

    /**
     * Додати елемент в кінець вектору
     * @param value значення до додання
     */
    public void append(int value) {
        elements = Arrays.copyOf(elements, elements.length + 1);
        elements[elements.length-1] = value;
    }

    /**
     * Додавання векторів поелементно
     * @param vector вектор який будемо додавати
     * @return новоутворений вектор
     */
    public Vector add(Vector vector) {
        Vector result = new Vector();
        result.setDimension(elements.length);
        for (int i = 0; i < elements.length; i++) {
            result.setElem(i, getElem(i) + vector.getElem(i));
        }
        return result;
    }

    /**
     * Множення векторів поелементно
     * @param vector вектор який будемо множити
     * @return новоутворений вектор
     */
    public Vector multiply(Vector vector) {
        Vector result = new Vector();
        result.setDimension(elements.length);
        for (int i = 0; i < elements.length; i++) {
            result.setElem(i, getElem(i) * vector.getElem(i));
        }
        return result;
    }

    /**
     * Ділення векторів поелементно
     * @param vector вектор який будемо ділити
     * @return новоутворений вектор
     */
    public Vector divide(Vector vector) {
        Vector result = new Vector();
        result.setDimension(elements.length);
        for (int i = 0; i < elements.length; i++) {
            result.setElem(i, getElem(i) / vector.getElem(i));
        }
        return result;
    }

    /**
     * Віднімання векторів поелементно
     * @param vector вектор який будемо віднімати
     * @return новоутворений вектор
     */
    public Vector deduct(Vector vector) {
        Vector result = new Vector();
        result.setDimension(elements.length);
        for (int i = 0; i < elements.length; i++) {
            result.setElem(i, getElem(i) - vector.getElem(i));
        }
        return result;
    }

    /**
     * Виведення вмісту вектору в консоль у форматі [1, 2, 3, ..., n]
     */
    public void print() {
        System.out.print("[");
        for (int i = 0; i < elements.length; i++) {
            System.out.print(getElem(i));
            if (i < elements.length - 1) {
                System.out.print(",");
            }
        }
        System.out.print("]");
    }
}

