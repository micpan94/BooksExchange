package Servlety;

import Encje.Advertisement;
import Encje.AdvertisementDAO;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/json")
public class TestJsonServlet extends HttpServlet {
    @Inject
    private ObjectMapper objectMapper;
    @Inject
    private ObjectWriter objectWriter;

    @Inject
    private AdvertisementDAO advertisementDAO;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String json1 = req.getParameter("json1");

        resp.setHeader("Access-Control-Allow-Origin","*");




        Integer number = Integer.parseInt(json1);


        Advertisement advertisement = advertisementDAO.getAdvertisement(number);

        String jsonObject = objectWriter.writeValueAsString(advertisement);

        resp.getWriter().print(jsonObject);
    }
}
