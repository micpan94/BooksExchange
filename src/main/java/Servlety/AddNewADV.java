package Servlety;

import Encje.Advertisement;
import Encje.AdvertisementDAO;
import Encje.Client;
import Encje.ClientDao;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

import java.time.LocalDateTime;
import java.util.Collections;
import java.util.Enumeration;
import java.util.List;

@WebServlet(urlPatterns = "/add")

public class AddNewADV extends HttpServlet {
    @Inject
    private ClientDao clientDao;
    @Inject
    private AdvertisementDAO advertisementDAO;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("adversmentJSP/addAdv.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //uzyskujemy id klienta z atrybutu sesji nadanego przy logowaniu
        Object user = req.getAttribute("user");
        String userId = user.toString();
        int userID = Integer.parseInt(userId);


        //setup
        Advertisement advertisement = new Advertisement();
        if (req.getParameter("state").contains("Nowa")) {
            advertisement.setNew(true);
        } else {
            advertisement.setNew(false);
        }
        advertisement.setPrice(Integer.valueOf(req.getParameter("price")));
        advertisement.setTitle(req.getParameter("title"));
        advertisement.setContent(req.getParameter("content"));
        advertisement.setType(req.getParameter("type"));
        advertisement.setClient(clientDao.findById(userID));
        advertisement.setData(LocalDateTime.now());
        try {
            advertisementDAO.save(advertisement);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("adversmentJSP/viewAdv.jsp");
        } catch (Exception e) {
            resp.getWriter().print(e.getMessage());
        }


    }


}
