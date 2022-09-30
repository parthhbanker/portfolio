 package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import servlet.data;

/**
 * Servlet implementation class login
 */
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public login() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public boolean check_availability(String email, String password) {

		user p = data.get_person(email, password);
		
		if ( p == null || p.email == null) {

			System.out.println("available");
			return true;

		} else {

			System.out.println("not available");
			return false;

		}

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ServletContext sc = getServletContext();
		response.setContentType("text/html");

		Cookie cookie;

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String form = request.getParameter("form");

		if (form.equals("sign_up")) {

			if (check_availability(email, password)) {

				user p = new user();

				p.name = name;
				p.email = email;
				p.pass = password;

				data.insert_person(p, true);

				System.out.println("sign_up");
				System.out.println("Name : " + name + " Email : " + email + " Password : " + password);

				user u = data.get_person(email);
				
				// set cookie
				cookie = new Cookie("user_id", "" + u.user_id);
				// 604800 secs = week of time
				cookie.setMaxAge(604800);
				response.addCookie(cookie);
				
				// set attribute
				sc.setAttribute("user", u);
				System.out.println("User id is "+u.user_id);
				sc.setAttribute("user_id", u.user_id);
				sc.setAttribute("username",	 u.name);
				System.out.println("username is ");

				// redirect to user admin panel
				System.out.println("Redirecting to security page");
				response.sendRedirect("admin/security_question.jsp");

			} else {

				response.sendRedirect("admin/login.jsp?warning=1");

			}

		} else if (form.equals("signin")) {

			if (data.validate(email, password)) {

				// edirect to user admin panel
				System.out.println("sign in");
				System.out.println("Email : " + email + " Password : " + password);

				user u = data.get_person(email);
				
				// set cookie
				cookie = new Cookie("user_id", ""+u.user_id);
				// 604800 secs = week of time
				cookie.setMaxAge(604800);
				response.addCookie(cookie);

				
				// set attribute
				sc.setAttribute("user", u);
				System.out.println("User id is "+u.user_id);
				sc.setAttribute("user_id", u.user_id);
				sc.setAttribute("username",	 u.name);
				System.out.println("username is ");

//				request.getRequestDispatcher("dashboard.jsp").include(request, response);
				response.sendRedirect("admin/index.jsp");

			} else {

				// redirect back with warning
				
				response.sendRedirect("admin/login.jsp?warning=2");

			}
		}
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
		
	}

}
