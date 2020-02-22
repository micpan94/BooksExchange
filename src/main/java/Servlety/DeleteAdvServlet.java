package Servlety;

import Encje.Advertisement;
import Encje.AdvertisementDAO;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(urlPatterns = "/delete")
public class DeleteAdvServlet extends HttpServlet {
    @Inject
    private AdvertisementDAO advertisementDAO;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            String nr = req.getParameter("id");
            Integer number = Integer.valueOf(nr);
            Advertisement advertisement = advertisementDAO.findById(number);
            advertisementDAO.delete(advertisement);

        }catch (Exception e){
            req.getRequestDispatcher("/home").forward(req,resp);
        }


    }
}
