package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

 
public class logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		System.out.println("logedout");
		// removing cookies
		Cookie c = new Cookie("user_id","") ;
		c.setMaxAge(0);
		response.addCookie(c);
		
		// setting the user attribute to null
		getServletContext().setAttribute("user_id", null);
		
//		System.out.println("redirecting to dashboard");
		response.sendRedirect("admin/index.jsp");
		
		
	}
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		doGet(request, response);
	}

}
