import java.text.SimpleDateFormat;

public class ControllerNews {
    private News[] arrayNews;

    public ControllerNews(News[] arrayNews) {
        this.arrayNews = arrayNews;
    }

    public void view(int id) {
        if (id >= 0 && id < arrayNews.length) {
            News news = arrayNews[id];
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy HH:mm:ss:SSS");

            System.out.println("Title: " + news.getNews());
            System.out.println("Creation Date: " + dateFormat.format(news.getDateCreation().getTime()));
            System.out.println("Change Date: " + dateFormat.format(news.getDateChange().getTime()));
        } else {
            System.out.println("Invalid news ID.");
        }
    }

    public void edit(int id, String title) {
        if (id >= 0 && id < arrayNews.length) {
            News news = arrayNews[id];
            news.changeNews(title);
        } else {
            System.out.println("Invalid news ID.");
        }
    }
}
