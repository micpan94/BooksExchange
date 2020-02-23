package Servlety;

import Encje.*;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/home")
public class HomeServlet extends HttpServlet {
    @Inject
    private BookDao bookDao;

    @Inject
    private ClientDao clientDao;
    @Inject
    private ShopppingCardDAO shopppingCardDAO;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Book book = new Book("Teraz albo nigdy", "Szymon Hołownia", "Znak", "2019", 25, "biznes");
        Book book1 = new Book("Ojciec Chrzestny", "Mario Puzo", "Albatros", "2019", 23, "kryminał");
        bookDao.save(book);
        bookDao.save(book1);
//        ShoppingCard shoppingCard = new ShoppingCard();
//        shopppingCardDAO.save(shoppingCard);

//        Client client = new Client("admin","123","dzony@wp.pl","516800255","Katowice","Michał","Panko",shoppingCard,null,null);
//        clientDao.save(client);

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("index.jsp");
        requestDispatcher.forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
