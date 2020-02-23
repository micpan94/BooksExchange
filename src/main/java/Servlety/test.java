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


        Book book = new Book("Teraz albo nigdy","Szymon Hołownia","Znak","2019",25,"biznes",null);
        Book book1 = new Book("Ojciec Chrzestny","Mario Puzo","Albatros","2019",23,"kryminał",null);
        Book book2 = new Book("Szczerze","Donald Tusk","Agora","2019-12-12",29,"biznes",null);
        Book book3 = new Book("Miecz Przeznaczenia Wiedzmin","Andrzej Sapkowski","SuperNowa","2010-11-10",89,"fantastyka",null);
        Book book4 = new Book("Wada","Robert Małecki","Czwarta Strona","2019-05-15",19,"kryminał",null);
        Book book5 = new Book("No One Is Too Small to Make a Difference","Greta Thunberg","Penguin Books Ltd","2019-05-30",19,"książki obcojęzyczne",null);
        Book book6 = new Book("I cóż że o Szwecji","Natalia Kołaczek","Wydawnictwo Poznańskie","2017-03-15",35,"literatura podróżnicza",null);
        Book book7 = new Book("Juliusz. Trzeci Testament Tom 1","Alice Alex,Dorison Xavier","Egmont Polska Sp.z o.o.","2019-12-04",135,"komiks",null);
        Book book8 = new Book("Stranger Things","Alice Alex,Dorison Xavier","Egmont Polska Sp.z o.o.","2019-12-04",135,"komiks",null);

        bookDao.save(book);
        bookDao.save(book1);
        bookDao.save(book2);
        bookDao.save(book3);
        bookDao.save(book4);
        bookDao.save(book5);
        bookDao.save(book6);
        bookDao.save(book7);
        bookDao.save(book8);
    }
}
