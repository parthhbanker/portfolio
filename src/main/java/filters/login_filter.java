package filters;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;

import java.io.IOException;

/**
 * Servlet Filter implementation class login_filter
 */
public class login_filter extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public login_filter() {
        super();
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
		// TODO Auto-generated method stub
		// place your code here

		System.out.println("calling filter");
		
		HttpServletRequest req = (HttpServletRequest) request;
		ServletContext sc = req.getSession().getServletContext();
		Cookie ck[] = req.getCookies();
		boolean user_cookie_found = false ;
		
		if(ck != null ) {
			
			for(int i = 0 ; i < ck.length ; i++) {
				
				if(ck[i].getName().equals("user")) {
					
					String user_email = ck[i].getValue();
					sc.setAttribute("user", user_email);
					System.out.println("setting attribute email : " + user_email);
					user_cookie_found = true ;
					// pass the request along the filter chain
					System.out.println("end");
					chain.doFilter(request, response);
				
				}
				
			}
			
			if(!user_cookie_found) {
				
				System.out.println("redirect to login 1");
				req.getRequestDispatcher("login.html").forward(req, response);
				
			}
			
		}else {
			
			System.out.println("redirect to login 2");
			req.getRequestDispatcher("login.html").forward(req, response);
			
		}
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
