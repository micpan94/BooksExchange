package Servlety;

import Encje.Book;
import Encje.BookDao;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/book")
public class SingleBookViewServlet extends HttpServlet {

    @Inject
    private BookDao bookDao;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer bookId = Integer.parseInt(req.getParameter("bookId"));
        Book selectedBook = bookDao.findById(bookId);
        req.setAttribute("book", selectedBook);
        req.getRequestDispatcher("singleBookView.jsp").forward(req,resp);
    }
}
