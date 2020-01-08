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
import java.util.Collections;
import java.util.Enumeration;
import java.util.List;
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

        if (req.getSession().getAttribute("user") != null) {
            Advertisement advertisement = new Advertisement();
            HttpSession session = req.getSession();
            Client client = (Client) session.getAttribute("client");
            Integer userID = client.getId();
//            sciezka do zapisu pliku
            String uploadPath = "C:\\Users\\PanczoPC\\IdeaProjects\\inzynierka\\src\\main\\webapp\\adversmentJSP\\img";
            String uploadPath2 = "C:\\Users\\PanczoPC\\IdeaProjects\\inzynierka\\target\\inzynierka-1.0-SNAPSHOT\\adversmentJSP\\img";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();


            try {
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
                advertisement.setLocation(client.getLocation());
                advertisement.setImg(uploadPath);
                advertisementDAO.save(advertisement);
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("index.jsp");
                session.setAttribute("advID", advertisement.getId());
                requestDispatcher.forward(req, resp);
                for (Part part : req.getParts()) {
                    part.write(uploadPath + File.separator + advertisement.getId() + ".jpg");
                    part.write(uploadPath2 + File.separator + advertisement.getId() + ".jpg");
                }

            } catch (Exception e) {
                resp.getWriter().print(e.getMessage());
            }
        } else {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("index.jsp");
            requestDispatcher.forward(req, resp);

        }


    }
}