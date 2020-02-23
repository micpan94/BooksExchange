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
import javax.servlet.http.*;

import java.io.File;
import java.io.IOException;

import java.io.InputStream;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.Collection;
import java.util.Collections;
import java.util.Enumeration;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)
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

        // walidacja danych
        Boolean validate = true;
        req.setAttribute("errors", false);


        if (req.getSession().getAttribute("user") != null) {
            Advertisement advertisement = new Advertisement();
            HttpSession session = req.getSession();
            Client client = (Client) session.getAttribute("client");
            Integer userID = client.getId();
//            sciezka do zapisu pliku aby wyswietlaly sie zdjecia poprawnie musimy zapisywac w dwoch miejscach jednoczesnie , pamietamy o tym ze sciezba bedzie sie roznic w zalezosci od mazyny
            String uploadPath = "C:\\Users\\Panko\\Desktop\\changeBook\\src\\main\\webapp\\adversmentJSP\\img";
            String uploadPath2 = "C:\\Users\\Panko\\Desktop\\changeBook\\target\\inzynierka-1.0-SNAPSHOT\\adversmentJSP\\img";
//            C:\Users\Panko\Desktop\changeBook\target\inzynierka-1.0-SNAPSHOT\adversmentJSP\img
//            C:\Users\Panko\Desktop\changeBook\src\main\webapp\adversmentJSP\img
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();


            try {
                if (req.getParameter("state").contains("Nowa")) {
                    advertisement.setNew(true);
                } else {
                    advertisement.setNew(false);
                }
                String price = "0";
                price = req.getParameter("price");

                Pattern pattern = Pattern.compile("^[0-9]*$");
                Matcher matcher = pattern.matcher(price);
                if (matcher.find() && price.length() != 0) {
                    advertisement.setPrice(Integer.valueOf(req.getParameter("price")));
                } else {
                    req.setAttribute("errors", true);
                    req.setAttribute("price_error", true);
                    validate = false;
                }
                String title = req.getParameter("title");
                if (title.length() < 200 && title.length() > 0) {
                    advertisement.setTitle(req.getParameter("title"));
                } else {
                    req.setAttribute("errors", true);
                    req.setAttribute("title_error", true);
                    validate = false;
                }
                String description = req.getParameter("content");
                if (description.length() < 30) {
                    req.setAttribute("errors", true);
                    req.setAttribute("description_error", true);
                    validate = false;
                } else {
                    advertisement.setContent(description);
                }

                if (validate) {
                    advertisement.setType(req.getParameter("type"));
                    advertisement.setClient(clientDao.findById(userID));
                    advertisement.setData(LocalDateTime.now());
                    advertisement.setLocation(req.getParameter("location"));
                    advertisement.setImg(uploadPath);
                    advertisementDAO.save(advertisement);
                    RequestDispatcher requestDispatcher = req.getRequestDispatcher("adversmentJSP/addAdv.jsp");
                    session.setAttribute("advID", advertisement.getId());
                    Collection<Advertisement> allClientAdvByID = advertisementDAO.getAllClientAdvByID(client.getId());
                    session.setAttribute("list",allClientAdvByID);
                    for (Part part : req.getParts()) {
                        part.write(uploadPath + File.separator + advertisement.getId() + ".jpg");
                        part.write(uploadPath2 + File.separator + advertisement.getId() + ".jpg");
                    }
                    req.setAttribute("succes", true);
                    requestDispatcher.forward(req, resp);
                } else {
                    RequestDispatcher requestDispatcher = req.getRequestDispatcher("adversmentJSP/addAdv.jsp");
                    requestDispatcher.forward(req, resp);

                }


            } catch (Exception e) {
                resp.getWriter().print(e.getMessage());
    }
}


    }
}