public class Utils {
    public static String getTheBestSubject(Student[] students) {
        float maxAverage = 0;
        String bestSubject = "";

        for (String subjectName : Subject.getNameSubjects()) {
            float sum = 0;
            int count = 0;

            for (Student student : students) {
                Subject[] subjects = student.getSubjects();

                for (Subject subject : subjects) {
                    if (subject.getNameSubject().equals(subjectName)) {
                        sum += subject.getMark();
                        count++;
                    }
                }
            }

            float average = sum / count;
            if (average > maxAverage) {
                maxAverage = average;
                bestSubject = subjectName;
            }
        }

        return bestSubject;
    }

    public static Student getTheBestStudent(Student[] students) {
        float maxAverage = 0;
        Student bestStudent = null;

        for (Student student : students) {
            float sum = 0;
            int count = 0;

            Subject[] subjects = student.getSubjects();

            for (Subject subject : subjects) {
                sum += subject.getMark();
                count++;
            }

            float average = sum / count;
            if (average > maxAverage) {
                maxAverage = average;
                bestStudent = student;
            }
        }

        return bestStudent;
    }
}
