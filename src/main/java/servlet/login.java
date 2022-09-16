package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
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
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/hr", "root", "21062004H");

			// creating statement
			PreparedStatement s = c.prepareStatement("SELECT * FROM my where email = ? AND password = ?");
			s.setString(1, email);
			s.setString(2, password);
			rs = s.executeQuery();

//			if(s.execute()) {
//				
//				System.out.println("get outside person : ");
//				
//			}

			rs = s.executeQuery();

			if (rs == null) {

				return null;

			}

			while (rs.next()) {

				p = new user();
				p.setEmail(rs.getString("email"));
				p.setPass(rs.getString("password"));

				break;

			}

		} catch (Exception e) {

			System.out.println(e);

		} finally {

			try {
				rs.close();
			} catch (NullPointerException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			}

		}

		return p;

	}

	public void insert_person(user per) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/hr", "root", "21062004H");

			PreparedStatement s = c.prepareStatement("insert into my values(?,?,?,?)");

			s.setString(3, per.email);
			s.setString(4, per.pass);

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

		if (get_person(email, password).email == null) {

			return true;

		} else {

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

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String form = request.getParameter("form");

		if (form.equals("sign_up")) {

//			if (check_availability(email, password)) {

//				user p = new user();
//				p.email = email ;
//				p.pass = password ;
//				insert_person(p);
			System.out.println("sign_up");
			System.out.println("Name : "+request.getParameter("name")+" Email : " + email +" Password : " + password);

// 				redirect to user admin panel

//			} else {
//				redirect back with warning
//				out.append("<center><h2 style=\"color: red ;\" >warning : user already exists</h2></center>");
//				request.getRequestDispatcher("user.html").include(request, response);

//			}

		} else if (form.equals("signin")) {

//			if (validate(email, password)) {

//				redirect to user admin panel
			System.out.println("sign in");
			System.out.println("Email : " + email +" Password : " + password);

//			} else {

//				redirect back with warning
//				out.append("<center><h2 style=\"color: red ;\" >warning : wrong email id or password </h2></center>");
//				request.getRequestDispatcher("user.html").include(request, response);

//			}

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
