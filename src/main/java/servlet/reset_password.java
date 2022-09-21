package servlet;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class reset_password
 */
public class reset_password extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public reset_password() {
        super();
        // TODO Auto-generated constructor stub
    }

    public user get_person(String email, String city, String nickname , String DOB) {

		user p = null;
		ResultSet rs = null;
		ResultSet rts = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			// creating connection
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/portfolio", "root", "root");

			// creating statement
			PreparedStatement s = c.prepareStatement("select user_id from security_questions sq , user s where s.email = ? and city = ? and nickname = ? and DOB = ? and s.id = sq.user_id ;");
			s.setString(1, email);
			s.setString(2, city);
			s.setString(3, nickname);
			s.setString(4, DOB);
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

    private boolean validate(String email, String city, String nickname , String DOB) {

		user p = get_person(email, city , nickname , DOB);

		if ( p == null || p.email == null) {

			return false;

		} else {

			return true;

		}

	}
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ServletContext s = getServletContext();
		
		String email = s.getAttribute("user").toString();
		String city = request.getParameter("city");
		String nickname = request.getParameter("nickname");
		String DOB = request.getParameter("DOB");
		
		if(validate(email, city, nickname, DOB)) {
			
			request.getRequestDispatcher("users.jsp").forward(request, response);
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
