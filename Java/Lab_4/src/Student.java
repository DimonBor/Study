import java.util.Random;

public class Student {
    private int id;
    private static int nextId = 1;
    private String name;
    private String surname;
    private String group;
    private Subject[] subjects;

    // Конструктор за замовчуванням
    public Student() {
        this.id = nextId++;
        this.name = "";
        this.surname = "";
        this.group = "";
        this.subjects = new Subject[5];
    }

    // Конструктор з параметрами
    public Student(String name, String surname, String group, Subject[] subjects) {
        this.id = nextId++;
        this.name = name;
        this.surname = surname;
        this.group = group;
        this.subjects = subjects;
    }

    public Student(String name, String surname, String group) {
        this.id = nextId++;
        this.name = name;
        this.surname = surname;
        this.group = group;
        this.subjects = new Subject[5];
    }

    // Гетери та сетери для всіх полів

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public static int getNextId() {
        return nextId;
    }

    public static void setNextId(int nextId) {
        Student.nextId = nextId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getGroup() {
        return group;
    }

    public void setGroup(String group) {
        this.group = group;
    }

    public Subject[] getSubjects() {
        return subjects;
    }

    public void setSubjects(Subject[] subjects) {
        this.subjects = subjects;
    }

}
