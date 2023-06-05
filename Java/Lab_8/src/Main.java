import java.util.Scanner;
import java.util.StringTokenizer;

public class Main {
    public static void main(String[] args) {

        String selected = "";
        String inputLine = "На височині гір зеленіють смереки а в долинах розташовані мальовничі струмочки які змивають скали і утворюють водоспади а все це оточено безкраєм небом і пронизано свіжим повітрям що сповнене ароматами лісу та квітів.";

        StringTokenizer tokenizer1 = new StringTokenizer(inputLine, " ");

        while (tokenizer1.hasMoreTokens()) {
            String word = tokenizer1.nextToken();
            if (word.length() == 3) {
                selected += word += '\n';
            }
        }

        System.out.println(selected);

        News[] news = {
                new News("News 1"),
                new News("News 2"),
                new News("News 3")
        };

        String[] path = {"view/1", "edit/1", "view/1"};

        ControllerNews controller = new ControllerNews(news);

        for (String p : path) {
            StringTokenizer tokenizer2 = new StringTokenizer(p, "/");
            String method = tokenizer2.nextToken();
            int id = Integer.parseInt(tokenizer2.nextToken());

            if (method.equals("view")) {
                controller.view(id);
            } else if (method.equals("edit")) {
                System.out.print("Enter new title for news: ");
                Scanner readTitle = new Scanner(System.in);
                String newTitle = readTitle.nextLine();
                controller.edit(id, newTitle);
            } else {
                System.out.println("Invalid method.");
            }
        }
    }
}
