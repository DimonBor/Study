import java.util.Random;

public class Subject {
    private String nameSubject;
    private float mark;
    private boolean passed;

    // Масив назв предметів
    private static final String[] nameSubjects = {"Математика", "Фізика", "Хімія", "Історія", "Англійська"};

    // Конструктор з випадковими оцінками та перевіркою на здачу
    public Subject() {
        Random random = new Random();
        this.nameSubject = nameSubjects[random.nextInt(nameSubjects.length)];
        this.mark = 2 + random.nextFloat(5-2); // Оцінка від 2 до 5
        this.passed = mark > 2; // Перевірка на здачу
    }

    // Гетери та сетери для полів класу

    public String getNameSubject() { return nameSubject; }

    public static String[] getNameSubjects() { return nameSubjects; }

    public void setNameSubject(String nameSubject) {
        this.nameSubject = nameSubject;
    }

    public float getMark() {
        return mark;
    }

    public void setMark(float mark) {
        this.mark = mark;
    }

    public boolean isPassed() {
        return passed;
    }

    public void setPassed(boolean passed) {
        this.passed = passed;
    }

    // Метод для отримання випадкового предмету з масиву назв
    public static String getRandomSubject() {
        Random random = new Random();
        return nameSubjects[random.nextInt(nameSubjects.length)];
    }
}