package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CategoryDao;
import dao.ProductDao;
import dao.UserDao;
import dto.CartDto;
import model.Category;
import model.Product;
import model.User;

@WebServlet(name = "HomeSevlet", urlPatterns = {"/index", "/login", "/logout", "/register", "/detail"})
public class HomeSevlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    ProductDao productDao = new ProductDao();
    CategoryDao categoryDao = new CategoryDao();
    UserDao userDao = new UserDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        CartDto cart = (CartDto) session.getAttribute("cart");
        if (cart == null) {
            session.setAttribute("cart", new CartDto());
        }

        List<Category> listCategory = categoryDao.findAll();
        req.setAttribute("listCategory", listCategory);

        String url = req.getServletPath();
        if (url.equals("/index")) {
            doGetIndex(req, resp);
        } else if (url.equals("/login")) {
            doGetLogin(req, resp);
        } else if (url.equals("/logout")) {
            doGetLogout(req, resp);
        } else if (url.equals("/register")) {
            doGetRegister(req, resp);
        } 
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getServletPath();
        if (url.equals("/login")) {
            doPostLogin(req, resp);
            return;
        }
        if(url.contains("register")) {
        	doPostRegister(req, resp);
        	return;
        }
    }

    protected void doGetIndex(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> listProduct = productDao.findAll();
        req.setAttribute("listProduct", listProduct);
        req.getRequestDispatcher("views/index.jsp").forward(req, resp);
    }

    protected void doGetLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("views/login.jsp").forward(req, resp);
    }

    protected void doGetRegister(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("views/sign-up.jsp").forward(req, resp);
    }

    protected void doGetLogout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.removeAttribute("user");
        session.removeAttribute("cart");
        resp.sendRedirect("index");
    }

    protected void doPostLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        User user = userDao.checkLogin(username, password);
        if (user == null) {
            req.setAttribute("err	orMessage", "Login failed!");
            req.getRequestDispatcher("views/login.jsp").forward(req, resp);
        } else {
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            resp.sendRedirect("index");
        }
    }

    protected void doPostRegister(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String fullname = req.getParameter("fullname");
        String email = req.getParameter("email");

        // Kiểm tra dữ liệu đầu vào
        if (username == null || password == null || fullname == null || email == null ||
                username.isEmpty() || password.isEmpty() || fullname.isEmpty() || email.isEmpty()) {
            req.setAttribute("errorMessage", "Please fill out all the fields.");
            req.getRequestDispatcher("views/sign-up.jsp").forward(req, resp);
            return;
        }

        // Kiểm tra xem người dùng đã tồn tại hay chưa
        if (userDao.checkUserExist(username)) {
            req.setAttribute("errorMessage", "Username already exists!");
            req.getRequestDispatcher("views/sign-up.jsp").forward(req, resp);
            return;
        }

        // Tạo một đối tượng User mới và thêm vào cơ sở dữ liệu
        User newUser = new User();
        newUser.setUsername(username);
        newUser.setPassword(password);
        newUser.setEmail(email);
        newUser.setFullname(fullname); // Đã sửa thành setFullname()
        
        // Kiểm tra xem thêm người dùng mới có thành công không
        if (userDao.insert(newUser)) {
            // Nếu thêm thành công, chuyển hướng đến trang đăng nhập hoặc trang chính
			req.getRequestDispatcher("/views/login.jsp").forward(req, resp); // Điều hướng đến trang đăng nhập sau khi đăng ký thành công
        } else {
            // Nếu không thành công, hiển thị thông báo lỗi
            req.setAttribute("errorMessage", "Registration failed. Please try again later.");
            req.getRequestDispatcher("views/sign-up.jsp").forward(req, resp);
        }
    }


}
