package Servlety;

import Encje.*;


import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/order")
public class OrdersServlet extends HttpServlet {
    @Inject
    private ClientDao clientDao;
    @Inject
    private ShopppingCardDAO shopppingCardDAO;
    @Inject
    private OrderDAO orderDAO;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("OrderForm.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        Orders order = new Orders();
        order.setClient((Client) req.getSession().getAttribute("client"));
        String city = req.getParameter("city");
        String street = req.getParameter("street");
        String code = req.getParameter("postCode");
        order.setAddress("Miasto : " + city + " Ulica : " + street);
        order.setPostCode(code);
        order.setTotalPrice(shopppingCardDAO.getTotalPriceByClientId(((Client) req.getSession().getAttribute("client")).getId()));
        orderDAO.save(order);
        //czyszczenie koszyka po doknaniu zamowienia
        ShoppingCard card = shopppingCardDAO.getClientCard((Client) req.getSession().getAttribute("client"));
        List<Book> newList = new ArrayList<>();
        card.setBooks(newList);
        shopppingCardDAO.upgrade(card);


        req.getRequestDispatcher("/home").forward(req,resp);
    }
}
