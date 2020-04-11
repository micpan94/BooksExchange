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
import java.util.List;

@WebServlet(urlPatterns = "/adv")
public class AdvServlet extends HttpServlet {

    @Inject
    private AdvertisementDAO advertisementDAO;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html");
        req.setCharacterEncoding("UTF-8");
        Collection<Advertisement> advertisementCollection = advertisementDAO.findAll();
        Integer numberOfAdvs = advertisementCollection.size();

        if (req.getParameter("city") == null){
            req.setAttribute("advList",advertisementCollection);
            req.setAttribute("numberOfAdvs",numberOfAdvs);
        }
        else if (req.getParameter("city").contains("Katowice")){
            List<Advertisement> katowice = advertisementDAO.getAdvByCity("Katowice");
            req.setAttribute("advList",katowice);
        }
        else if (req.getParameter("city").contains("Dąbrowa Górnicza")){
            List<Advertisement> dąbrowa_górnicza = advertisementDAO.getAdvByCity("Dąbrowa Górnicza");
            req.setAttribute("advList",dąbrowa_górnicza);
        }



        RequestDispatcher requestDispatcher = req.getRequestDispatcher("adversmentJSP/viewAdv.jsp");
        requestDispatcher.forward(req, resp);


    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html");
        req.setCharacterEncoding("UTF-8");
        doGet(req,resp);
    }
}
