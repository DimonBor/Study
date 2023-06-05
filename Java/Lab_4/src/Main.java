public class Main {
    public static void main(String[] args) {
        // Створення масиву студентів
        Student[] students = new Student[5];

        // Ініціалізація студентів
        students[0] = new Student("Іван", "Петров", "Група1");
        students[1] = new Student("Олександр", "Сидоров", "Група1");
        students[2] = new Student("Марія", "Іванова", "Група2");
        students[3] = new Student("Ольга", "Коваль", "Група2");
        students[4] = new Student("Петро", "Семенов", "Група3");

        // Ініціалізація предметів для кожного студента
        for (Student student : students) {
            Subject[] subjects = new Subject[5];
            for (int i = 0; i < subjects.length; i++) {
                subjects[i] = new Subject();
            }
            student.setSubjects(subjects);
        }

        // Розрахунок середнього балу для кожного студента та виведення інформації
        for (Student student : students) {
            Subject[] subjects = student.getSubjects();
            float sum = 0;

            P.rintln("Студент: " + student.getName() + " " + student.getSurname());
            P.rintln("Група: " + student.getGroup());
            P.rintln("Оцінки:");

            for (Subject subject : subjects) {
                P.rintln(subject.getNameSubject() + ": " + subject.getMark());
                sum += subject.getMark();
            }

            float average = sum / subjects.length;
            P.rintln("Середній бал: " + average);

            if (average >= 4.0 && average < 5.0) {
                P.rintln("Студент отримує звичайну стипендію");
            } else if (average == 5.0) {
                P.rintln("Студент отримує підвищену стипендію");
            } else {
                P.rintln("Студент не отримує стипендію");
            }

            P.rintln("");
        }
    }

}