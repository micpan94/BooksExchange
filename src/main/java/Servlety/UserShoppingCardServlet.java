package Servlety;

import Encje.*;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Collection;
import java.util.List;

@WebServlet(urlPatterns = "/shoppingCard")
public class UserShoppingCardServlet extends HttpServlet {

    @Inject
    ShopppingCardDAO shopppingCardDAO;


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Client client = (Client) session.getAttribute("client");
        try {
            if (client != null) {
                Collection<ShoppingCard> all = shopppingCardDAO.findAll();
                for (ShoppingCard element : all) {
                    if (element.getClient().getId() == client.getId()) {
                        List<Book> books = element.getBooks();
                        req.setAttribute("booksFromCard",books);
                    }
                }
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("userShoppingCard.jsp");
                requestDispatcher.forward(req, resp);
            }

        } catch (Exception e) {
            resp.getWriter().print("złapałem exepszjona : " + e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
