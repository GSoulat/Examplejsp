package fr.formation.afpa;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class AuthentificationFilter
 */
@WebFilter("/*")
public class AuthentificationFilter implements Filter {

    /**
     * Default constructor. 
     */
    public AuthentificationFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession(false);
		
		String loginURI = req.getRequestURI();
		boolean isLoginRequest = loginURI.equals("/Examplejsp/login");
		boolean isLoggedIn = (session != null && session.getAttribute("customer") != null);
		System.out.println(req.getRequestURI());
		
		boolean isStaticResource = loginURI.equals("Examplejsp/css/style.css");
		if(isLoggedIn || isLoginRequest || isStaticResource) {
			chain.doFilter(request, response);
		}else {
			req.getRequestDispatcher("/login.jsp").forward(request, response);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}
}
