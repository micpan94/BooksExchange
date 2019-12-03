package Servlety;

import Encje.Advertisement;
import Encje.AdvertisementDAO;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collection;

@WebServlet(urlPatterns = "/adv")
public class AdvServlet extends HttpServlet {

    @Inject
    private AdvertisementDAO advertisementDAO;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Collection<Advertisement> advertisementCollection = advertisementDAO.findAll();
        Integer numberOfAdvs = advertisementCollection.size();

        req.setAttribute("advList",advertisementCollection);
        req.setAttribute("numberOfAdvs",numberOfAdvs);

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("adversmentJSP/viewAdv.jsp");
        requestDispatcher.forward(req, resp);


    }
}
