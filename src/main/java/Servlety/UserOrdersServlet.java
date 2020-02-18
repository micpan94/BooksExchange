package Servlety;

import Encje.Client;
import Encje.ClientDao;
import Encje.Order;
import Encje.OrderDAO;

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

@WebServlet(urlPatterns = "/orders")
public class UserOrdersServlet extends HttpServlet {
    @Inject
    ClientDao clientDao;
    @Inject
    OrderDAO orderDAO;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Client client = (Client) session.getAttribute("client");

        if (client != null) {
            Collection<Order> allOrdersByClientID = orderDAO.getAllOrdersByClientID(client.getId());
            req.setAttribute("ClientOrders",allOrdersByClientID);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("userOrders.jsp");
            requestDispatcher.forward(req,resp);
        }else {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("index.jsp");
            requestDispatcher.forward(req, resp);
        }
    }
}
