package Servlety;


import Encje.*;
import org.hibernate.Session;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

@WebServlet(urlPatterns = "/deleteItem")
public class DeleteFromCardServlet extends HttpServlet {
    @Inject
    private ShopppingCardDAO shopppingCardDAO;
    @Inject
    private ClientDao client;
    @Inject
    private BookDao bookDao;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Book book = bookDao.findById(Integer.valueOf(req.getParameter("id")));
        Client client = (Client) req.getSession().getAttribute("client");
        Collection<ShoppingCard> all = shopppingCardDAO.findAll();
        ShoppingCard shoppingCard = new ShoppingCard();
        for (ShoppingCard element : all) {
            if (element.getClient().getId() == client.getId()) {
                shoppingCard = element;
            }
        }
        List<Book> result = new ArrayList<>();
        List<Book> books = shoppingCard.getBooks();
        for (Book element : books) {
            if (element.getId() != book.getId()) {
                result.add(element);
            }
        }

        shoppingCard.setBooks(result);
        int size = result.size();
        shopppingCardDAO.upgrade(shoppingCard);
        req.getRequestDispatcher("shoppingCard").forward(req, resp);
    }
}
