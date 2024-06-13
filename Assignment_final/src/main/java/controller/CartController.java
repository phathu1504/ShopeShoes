package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import dao.UserDao;

import dao.CategoryDao;
import dao.ProductDao;
import dto.CartDto;
import model.Category;
import model.User;
import service.CartService;

@WebServlet("/cart")
public class CartController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	CartService cartService = new CartService();
	ProductDao productDao = new ProductDao();
	CategoryDao categoryDao = new CategoryDao();
	UserDao userDao = new UserDao();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		List<Category> listCategory = categoryDao.findAll();
		req.setAttribute("listCategory", listCategory);
		
		HttpSession session = req.getSession();
		CartDto cart = (CartDto) session.getAttribute("cart");
		if (cart == null) {
			session.setAttribute("cart", new CartDto());
		}
		
		String action = req.getParameter("action");
		
		if (action.equals("view")) {
			// localhost:8080/asm-java4/cart?action=view
			doGetViewCart(req, resp);
		} else if (action.equals("add")) {
			// localhost:8080/asm-java4/cart?action=add&masp={masp}&soluong={soluong}
			String masp = req.getParameter("masp");
			int soluong = Integer.parseInt(req.getParameter("soluong"));
			doGetAddSP(req, resp, session, masp, soluong);
		} else if (action.equals("remove")) {
			// localhost:8080/asm-java4/cart?action=remove&masp={masp}
			String masp = req.getParameter("masp");
			doGetRemoveSP(req, resp, masp);
		} else if (action.equals("paying")) {
			// localhost:8080/asm-java4/cart?action=paying&phone={phone}&address={address}
			doGetPaying(req, resp, session);
		}
	}
	
	protected void doGetViewCart(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		req.getRequestDispatcher("views/cart.jsp").forward(req, resp);
	}
	
	protected void doGetAddSP(HttpServletRequest req, HttpServletResponse resp, HttpSession session, String masp, int soluong) 
			throws ServletException, IOException {
		CartDto cart = (CartDto) session.getAttribute("cart");
		boolean isUpdate = req.getParameter("isUpdate").equals("1");
		cartService.updateCart(cart, masp, soluong, isUpdate);
		ObjectMapper mapper = new ObjectMapper();
		String cartToJsonString = mapper.writeValueAsString(cart);
		resp.setContentType("application/json");
		PrintWriter out = resp.getWriter();
		out.print(cartToJsonString);
		out.flush();
	}

	protected void doGetRemoveSP(HttpServletRequest req, HttpServletResponse resp, String masp) 
			throws ServletException, IOException {
		req.getRequestDispatcher("views/cart.jsp").forward(req, resp);
	}
	
	protected void doGetPaying(HttpServletRequest req, HttpServletResponse resp, HttpSession session)
            throws ServletException, IOException {
    resp.setContentType("application/json");
    User currentUser = (User) session.getAttribute("user");
    CartDto cart = (CartDto) session.getAttribute("cart");
    if (currentUser != null && cart != null) {
        String phoneNumber = req.getParameter("phone");
        String address = req.getParameter("address");
        cart.setDienthoai(phoneNumber);
        cart.setDiachi(address);
        cart.setUserId(currentUser.getId());
        if (cartService.insertHoaDon(cart)) {
            session.setAttribute("cart", new CartDto());
            resp.setStatus(200); // 200: ma HTTP success
            // In ra thông báo thành công hoặc chuyển hướng đến trang thành công
            PrintWriter out = resp.getWriter();
            out.print("{\"message\": \"Payment successful\"}");
            out.flush();
        } else {
            resp.setStatus(400); // 400: bad request
            // In ra thông báo thất bại hoặc xử lý thêm tùy theo yêu cầu của bạn
            PrintWriter out = resp.getWriter();
            out.print("{\"message\": \"Payment failed\"}");
            out.flush();
        }
    } else {
        resp.setStatus(400); // 400: bad request
        // In ra thông báo hoặc xử lý thêm tùy theo yêu cầu của bạn
        PrintWriter out = resp.getWriter();
        out.print("{\"message\": \"User not logged in or Cart is empty\"}");
        out.flush();
    }
}

}