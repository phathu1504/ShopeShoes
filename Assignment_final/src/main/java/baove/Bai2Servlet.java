package baove;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import dao.UsersDAO;
import model.Users;





@WebServlet("/Bai2Servlet")
public class Bai2Servlet extends HttpServlet {
 private static final long serialVersionUID = 1L;

 protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
     findAllUsers(request, response);
     request.getRequestDispatcher("/views/bai2.jsp").forward(request, response);
 }

 protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
     String url = request.getRequestURL().toString();

     if (url.contains("Create")) {
         insertUser(request, response);
     } else if (url.contains("Delete")) {
         deleteUser(request, response);
     }

     findAllUsers(request, response);
     request.getRequestDispatcher("/views/bai2.jsp").forward(request, response);
 }
 protected void insertUser(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
     try {
         Users user = new Users();
         BeanUtils.populate(user, request.getParameterMap());

         UsersDAO dao = new UsersDAO();
         dao.insertUser(user);

         request.setAttribute("message", "User inserted successfully");
     } catch (Exception e) {
         e.printStackTrace();
         request.setAttribute("error", "Error: " + e.getMessage());
     }
 }

 protected void deleteUser(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
     try {
         int userId = Integer.parseInt(request.getParameter("id"));

         UsersDAO dao = new UsersDAO();
         dao.deleteUser(userId);

         request.setAttribute("message", "User deleted successfully");
     } catch (Exception e) {
         e.printStackTrace();
         request.setAttribute("error", "Error: " + e.getMessage());
     }
 }

 protected void findAllUsers(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
     try {
         UsersDAO dao = new UsersDAO();
         List<Users> userList = dao.findAllUsers();

         request.setAttribute("listUser", userList);
     } catch (Exception e) {
         e.printStackTrace();
         request.setAttribute("error", "Error: " + e.getMessage());
     }
 }
}



