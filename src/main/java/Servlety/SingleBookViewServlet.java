package Servlety;

import Encje.*;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/book")
public class SingleBookViewServlet extends HttpServlet {

    @Inject
    private BookDao bookDao;
    @Inject
    private ShopppingCardDAO shopppingCardDAO;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer bookId = Integer.parseInt(req.getParameter("bookId"));
        Book selectedBook = bookDao.findById(bookId);
        req.setAttribute("book", selectedBook);
        req.getRequestDispatcher("singleBookView.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        HttpSession session = req.getSession();
        Client client = (Client) session.getAttribute("client");

        Integer count = client.getOrders().size();
        ShoppingCard shoppingCard = shopppingCardDAO.findById(client.getShoppingCard().getId());

        List<Book> books = shoppingCard.getBooks();
        Integer bookID = Integer.parseInt(req.getParameter("bookId"));
        Book book = bookDao.findById(bookID);
        books.add(book);
        shoppingCard.setBooks(books);
        shopppingCardDAO.upgrade(shoppingCard);

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/home");
        requestDispatcher.forward(req,resp);
    }
}
