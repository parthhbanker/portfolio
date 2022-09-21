package servlet;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

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
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ServletContext s = getServletContext();
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		user u = (user)s.getAttribute("user");
		
		String email = u.email;
		String city = request.getParameter("city");
		String nickname = request.getParameter("nickname");
		String DOB = request.getParameter("dob");
		
		System.out.println("DOB is "+DOB);
		
		if(data.validate(email, city, nickname, DOB)) {
			
			System.out.println("validated");
			request.getRequestDispatcher("admin/users.jsp").forward(request, response);
			
		}else {
			
			System.out.println("not validated");
			
			out.append("<center><h2 style=\"color: red;\">warning : Data doesn't match</h2></center>");
			request.getRequestDispatcher("admin/forgot_password.jsp").include(request, response);
			
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
