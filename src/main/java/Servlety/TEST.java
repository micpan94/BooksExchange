package Servlety;

import Encje.Advertisement;
import Encje.AdvertisementDAO;
import Encje.Client;
import Encje.ClientDao;
import org.hibernate.Session;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Collection;

@WebServlet(urlPatterns = "/TEST")
public class TEST extends HttpServlet {
    @Inject
    private ClientDao clientDao;
    @Inject
    AdvertisementDAO advertisementDAO;


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.getWriter().print("commitTEST");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        Advertisement advertisement = new Advertisement(LocalDateTime.now(), "xyz", "yhx", 120, true, "HORROR", clientDao.findById(2002));

        advertisementDAO.save(advertisement);
    }
}

