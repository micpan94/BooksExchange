package Servlety;

import Encje.Client;
import Encje.ClientDao;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(urlPatterns = "/updateProfile")
public class UpdateProfileServlet extends HttpServlet {
    @Inject
    private ClientDao clientDao;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html");
        req.setCharacterEncoding("UTF-8");

        Client client = (Client) session.getAttribute("client");
        if (client!= null){
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("updateProfile.jsp");
            requestDispatcher.forward(req,resp);
        }
        else {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("index.jsp");
            requestDispatcher.forward(req,resp);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html");
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        Client client = (Client) session.getAttribute("client");
        Boolean validate = true;
        req.setAttribute("errors", false);
        String login = req.getParameter("login");
        if (login.length() < 14) {
            client.setLogin(login);
        } else {
            req.setAttribute("errors", true);
            req.setAttribute("login_error", true);
            validate = false;
        }
        String password = req.getParameter("password");
        String passwordMd5 = clientDao.MD5(password);
        if (password != passwordMd5) {
           client.setPassword(passwordMd5);
        } else {
            req.setAttribute("errors", true);
            req.setAttribute("password_error", true);
            validate = false;
        }
        String telephone = req.getParameter("telephone");
        if (telephone.length() > 8 && telephone.length() < 11){
            client.setTelephoneNr(telephone);
        }else {
            req.setAttribute("errors",true);
            req.setAttribute("telephone_error",true);
            validate = false;
        }
        String firstName = req.getParameter("firstName");
        if (firstName.length() < 16 && firstName.length() > 2){
            client.setFirstName(firstName);
        }else {
            req.setAttribute("errors",true);
            req.setAttribute("firstName_error",true);
            validate = false;
        }
        String lastName = req.getParameter("lastName");
        if (lastName.length() < 24 && lastName.length() > 4){
            client.setLastName(lastName);
        }else {
            req.setAttribute("errors",true);
            req.setAttribute("lastName_error",true);
            validate = false;
        }

        String email = req.getParameter("email");
        Pattern pattern = Pattern.compile("(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])");
        Matcher matcher = pattern.matcher(email);
        if (matcher.find()) {
            client.setEmail(email);
        } else {
            req.setAttribute("errors", true);
            req.setAttribute("email_error", true);
            validate = false;
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("updateProfile.jsp");
            requestDispatcher.forward(req, resp);

        }
        String location = req.getParameter("location");
        client.setLocation(location);
        if (validate) {

            clientDao.upgrade(client);
            req.setAttribute("succes", true);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("profile.jsp");
            requestDispatcher.forward(req, resp);


        } else {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("updateProfile.jsp");
            requestDispatcher.forward(req, resp);
        }


    }
}
