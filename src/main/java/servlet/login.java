package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class login
 */
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public login() {
		super();
		// TODO Auto-generated constructor stub
	}

	public user get_person(String email, String password) {

		user p = null;
		ResultSet rs = null;
		ResultSet rts = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			// creating connection
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/portfolio", "root", "root");

			// creating statement
			PreparedStatement s = c.prepareStatement("SELECT * FROM user where email = ? AND pass = ?");
			s.setString(1, email);
			s.setString(2, password);
			rs = s.executeQuery();

			rs = s.executeQuery();

			if (rs == null) {

				return null;

			}

			while (rs.next()) {

				p = new user();
				p.setEmail(rs.getString("email"));
				p.setPass(rs.getString("pass"));

				break;

			}

		} catch (Exception e) {

			System.out.println(e);

		} finally {

			try {
				rs.close();
			}catch (NullPointerException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			}

		}

		return p;

	}

	public void insert_person(user per, boolean sign_up) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/portfolio", "root", "root");

			PreparedStatement s;

			if (sign_up) {

				s = c.prepareStatement("insert into user(email , pass , username) values(?,?,?)");

				s.setString(1, per.email);
				s.setString(2, per.pass);
				s.setString(3, per.name);

			} else {

				s = c.prepareStatement("insert into user(email , pass) values(?,?)");
				s.setString(1, per.email);
				s.setString(2, per.pass);

			}

			int x = s.executeUpdate();

			if (x == 0) {
				System.out.println("values not inserted");
			} else {
				System.out.println("values inserted successfull");
			}
		} catch (Exception e) {
			System.out.println(e);
		}

	}

	public boolean check_availability(String email, String password) {

		if ( get_person(email, password) == null || get_person(email, password).email == null) {

			System.out.println("available");
			return true;

		} else {

			System.out.println("not available");
			return false;

		}

	}

	private boolean validate(String email, String password) {

		user p = get_person(email, password);

		if (p.email == null) {

			return false;

		} else {

			return true;

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

				insert_person(p, true);

				System.out.println("sign_up");
				System.out.println("Name : " + name + " Email : " + email + " Password : " + password);

				// set cookie
				cookie = new Cookie("user", email);
				// 604800 secs = week of time
				cookie.setMaxAge(604800);
				response.addCookie(cookie);

				// set attribute
				sc.setAttribute("user", email);

				// redirect to user admin panel
				request.getRequestDispatcher("dashboard.jsp").forward(request, response);

			} else {

				// redirect back with warning
				out.append("<center><h2 style=\"color: red ;\" >warning : user already exists</h2></center>");
				request.getRequestDispatcher("login.html").include(request, response);

			}

		} else if (form.equals("signin")) {

			if (validate(email, password)) {

				// edirect to user admin panel
				System.out.println("sign in");
				System.out.println("Email : " + email + " Password : " + password);

				// set cookie
				cookie = new Cookie("user", email);
				// 604800 secs = week of time
				cookie.setMaxAge(604800);
				response.addCookie(cookie);

				// set attribute
				sc.setAttribute("user", email);

				request.getRequestDispatcher("dashboard.jsp").include(request, response);

			} else {

				// redirect back with warning
				out.append("<center><h2 style=\"color: red ;\" >warning : wrong email id or password </h2></center>");
				request.getRequestDispatcher("login.html").include(request, response);

			}

		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
