package baove;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({"/Bai1Servlet", "/Bai1Servlet/sum", "/Bai1Servlet/tru","/Bai1Servlet/nhan","/Bai1Servlet/chia"})
public class Bai1Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Bai1Servlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/bai1.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("sum")) {
            int a = Integer.parseInt(request.getParameter("a"));
            int b = Integer.parseInt(request.getParameter("b"));
            int sum = a + b;
            request.setAttribute("message", "Tổng của " + a + " và " + b + " là: " + sum);
        }
        if (uri.contains("tru")) {
            int a = Integer.parseInt(request.getParameter("a"));
            int b = Integer.parseInt(request.getParameter("b"));
            int tru = a - b;
            request.setAttribute("message", "Hiệu của " + a + " và " + b + " là: " + tru);
        }
        if (uri.contains("nhan")) {
            int a = Integer.parseInt(request.getParameter("a"));
            int b = Integer.parseInt(request.getParameter("b"));
            int nhan = a * b;
            request.setAttribute("message", "Tích của " + a + " và " + b + " là: " + nhan);
        }
        if (uri.contains("chia")) {
            int a = Integer.parseInt(request.getParameter("a"));
            int b = Integer.parseInt(request.getParameter("b"));
            if (b != 0) {
                int chia = a / b;
                request.setAttribute("message", "Thương của " + a + " và " + b + " là: " + chia);
            } else {
                request.setAttribute("message", "Không thể chia cho 0.");
            }
        }
        request.getRequestDispatcher("/views/bai1.jsp").forward(request, response);
    }
}
