package Servlety;

import Encje.Client;
import Encje.OrderDAO;
import Encje.Orders;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Set;

@WebServlet(urlPatterns = "/myorders")
public class ClientOrdersServlet extends HttpServlet {

    @Inject
    private OrderDAO orderDAO;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Client client = (Client) req.getSession().getAttribute("client");
        Set<Orders> allOrdersByClientID = orderDAO.getAllOrdersByClientID(client.getId());
        req.setAttribute("orders",allOrdersByClientID);
        req.getRequestDispatcher("userOrders.jsp").forward(req,resp);
    }
}
