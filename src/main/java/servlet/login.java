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
		PrintWriter out = response.getWriter();

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

				// set cookie
				cookie = new Cookie("user", email);
				// 604800 secs = week of time
				cookie.setMaxAge(604800);
				response.addCookie(cookie);
				
				user u = data.get_person(email);
				
				// set attribute
				sc.setAttribute("user", u);

				// redirect to user admin panel
				response.sendRedirect("admin/index.jsp");

			} else {

				// redirect back with warning
				out.append("<center><h2 style=\"color: red ;\" >warning : user already exists</h2></center>");
				request.getRequestDispatcher("admin/login.jsp").include(request, response);

			}

		} else if (form.equals("signin")) {

			if (data.validate(email, password)) {

				// edirect to user admin panel
				System.out.println("sign in");
				System.out.println("Email : " + email + " Password : " + password);

				// set cookie
				cookie = new Cookie("user", email);
				// 604800 secs = week of time
				cookie.setMaxAge(604800);
				response.addCookie(cookie);

				user u = data.get_person(email);
				
				// set attribute
				sc.setAttribute("user", u);

//				request.getRequestDispatcher("dashboard.jsp").include(request, response);
				response.sendRedirect("admin/index.jsp");

			} else {

				// redirect back with warning
				out.append("<center><h2 style=\"color: red ;\" >warning : wrong email id or password </h2></center>");
				request.getRequestDispatcher("admin/login.jsp").include(request, response);

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
