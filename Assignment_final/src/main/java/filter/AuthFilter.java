package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;

@WebFilter(filterName = "AuthFilter", urlPatterns = { "/login", "/logout","/cart","/DetailsServlet","/sanpham" })
public class AuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Khởi tạo
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        // Kiểm tra xem người dùng đã đăng nhập chưa
        if (user == null && !req.getRequestURI().endsWith("/login")) {
            resp.sendRedirect("login"); // Chuyển hướng đến trang đăng nhập nếu chưa đăng nhập và không phải là trang login
            return;
        }

        // Tiếp tục xử lý yêu cầu nếu người dùng đã đăng nhập hoặc đang ở trang login
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Hủy bỏ
    }
}
