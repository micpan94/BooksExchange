package Servlety;

import Encje.Book;
import Encje.BookDao;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/test")
public class test extends HttpServlet {
    @Inject
    BookDao bookDao;


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Book book = new Book("Teraz albo nigdy","Szymon Hołowania","Znak","2019",25,"biznes");
        Book book1 = new Book("Ojciec Chrzestny","Mario Puzo","Albatros","2019",23,"Kryminał");
        bookDao.save(book);
        bookDao.save(book1);
    }
}
