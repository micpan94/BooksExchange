package Servlety;

import Encje.Advertisement;
import Encje.AdvertisementDAO;
import Encje.Client;
import Encje.ClientDao;

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

@WebServlet(urlPatterns = "/advlist")
public class UserAdversmentServlet extends HttpServlet {

    @Inject
    ClientDao clientDao;
    @Inject
    AdvertisementDAO advertisementDAO;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        Client client = (Client) session.getAttribute("client");

        if (client != null) {
            Collection<Advertisement> allClientAdvByID = advertisementDAO.getAllClientAdvByID(client.getId());
            req.setAttribute("ClientAdvList",allClientAdvByID);


            RequestDispatcher requestDispatcher = req.getRequestDispatcher("userAdversment.jsp");
            requestDispatcher.forward(req, resp);
        } else {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("index.jsp");
            requestDispatcher.forward(req, resp);
        }

    }
}
