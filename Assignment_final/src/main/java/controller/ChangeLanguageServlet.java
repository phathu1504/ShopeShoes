package controller;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class y18nFilter
 */
@WebFilter("/*")
public class ChangeLanguageServlet extends HttpFilter implements Filter {
       
   @Override
	public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {
		String lang = request.getParameter("lang");
		if(lang!=null) {
			request.getSession().setAttribute("lang",lang);
		}
	
		chain.doFilter(request, response);
	}

		public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
