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

@WebServlet(urlPatterns = "/adversment")
public class SingleAdvServlet extends HttpServlet {
    @Inject
    private AdvertisementDAO advertisementDAO;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        if (id == null) {
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        } else if (advertisementDAO.isValidID(Integer.parseInt(id))) {
            Advertisement advertisement = advertisementDAO.findById(Integer.parseInt(id));
            req.setAttribute("ADV", advertisement);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("singleAdvView.jsp");
            requestDispatcher.forward(req, resp);
        } else {
            resp.getWriter().println("ups! coś poszło nie tak");
        }

    }
}
