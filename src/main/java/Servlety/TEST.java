package Servlety;
import Encje.AdvertisementDAO;
import Encje.ClientDao;

import org.apache.taglibs.standard.lang.jstl.Constants;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;



@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)
@WebServlet(urlPatterns = "/TEST")
public class TEST extends HttpServlet {
    @Inject
    private ClientDao clientDao;
    @Inject
    AdvertisementDAO advertisementDAO;






    private String getFileName(Part part){
        for (String content : part.getHeader("content-disposition").split(";")){
            if (content.trim().startsWith("filename"))
                return content.substring(content.indexOf("=") + 2,content.length()-1);
        }
        return "TEST";
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uploadPath = getServletContext().getRealPath("") + File.separator + "/adversmentImg";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();


            for (Part part : req.getParts()) {
           String fileName = getFileName(part);
            part.write(uploadPath + File.separator + "abc.jpg");
        }


    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("upload.jsp");
        requestDispatcher.forward(req,resp);
    }
}

