package controller;

import java.io.IOException;
import javax.persistence.EntityManager;
import utils.JpaUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;

@WebServlet(name = "DetailsServlet", urlPatterns = {"/DetailsServlet"})
public class DetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    public DetailsServlet() {
        super();
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sp = req.getParameter("vid");
        ProductDao dao = new ProductDao();
        req.setAttribute("product", dao.findByMaSP(sp));
        req.getRequestDispatcher("/views/detail.jsp").forward(req, resp);
        
        
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/index.jsp").forward(req, resp);
    }
}
