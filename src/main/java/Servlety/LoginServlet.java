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
import java.util.Collection;

@WebServlet(urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    @Inject
    private ClientDao clientDao;


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("Login.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Collection<Client> users = clientDao.findAll();
        String login = req.getParameter("login");
        String password = req.getParameter("password");
        HttpSession session = req.getSession();
        req.setAttribute("errors", false);



        //VALIDACJA
        boolean isLoginInBase = false;
        boolean wrongPassword = false;
        boolean sukcess = false;
        int userId = 0;
        for (Client element : users) {
            if (element.getLogin().equals(login)) {
                isLoginInBase = true;
                if (element.getPassword().equals(password)) {
                    wrongPassword = false;
                    sukcess = true;
                    userId = element.getId();

                } else {
                    wrongPassword = true;
                }
            }
        }
        /// CD

        if (isLoginInBase && sukcess) {

            Client client = clientDao.findById(userId);
            session.setAttribute("name",client.getLogin());
            Integer clientID = userId;
            session.setAttribute("user",clientID);
            session.setAttribute("client",client);




            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/home");
            requestDispatcher.forward(req, resp);
        } else if (isLoginInBase && wrongPassword) {
            req.setAttribute("errors",true);
            req.setAttribute("wrong_password", true);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("Login.jsp");
            requestDispatcher.forward(req, resp);
        } else {
            req.setAttribute("errors",true);
            req.setAttribute("login_error", true);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("Login.jsp");
            requestDispatcher.forward(req, resp);
        }


    }


}
