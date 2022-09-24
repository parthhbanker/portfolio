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
import servlet.data;
import servlet.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

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
				
				if(ck[i].getName().equals("user_id")) {
					
					String user_id = ck[i].getValue();
					
					// set attribute
					
					System.out.println(user_id);
					
					user u = data.get_person(Integer.parseInt(user_id));
					
					sc.setAttribute("user", u);
					System.out.println("User id is "+u.user_id);
					sc.setAttribute("user_id", u.user_id);
					sc.setAttribute("username",	 u.name);
					System.out.println("username is ");
					
					user_cookie_found = true ;
					
					// pass the request along the filter chain i.e index.jsp
					System.out.println("end");
					chain.doFilter(request, response);
				
				}
				
			}
			
			if(!user_cookie_found) {
				
				System.out.println("redirect to login 1");
				req.getRequestDispatcher("login.jsp").forward(req, response);
				
			}
			
		}else {
			
			System.out.println("redirect to login 2");
			req.getRequestDispatcher("login.jsp").forward(req, response);
			
		}
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
