import java.util.Calendar;

public class News {
    private String title;
    private Calendar dateCreation;
    private Calendar dateChange;

    public News(String title) {
        this.title = title;
        this.dateCreation = Calendar.getInstance();
        this.dateChange = Calendar.getInstance();
    }

    public String getNews() {
        return title;
    }

    public Calendar getDateCreation() {
        return dateCreation;
    }

    public Calendar getDateChange() {
        return dateChange;
    }

    public void changeNews(String newTitle) {
        this.title = newTitle;
        this.dateChange = Calendar.getInstance();
    }
}
