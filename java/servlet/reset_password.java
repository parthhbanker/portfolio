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

 
public class reset_password extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		
		
		ServletContext s = getServletContext();
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		user u = (user)s.getAttribute("user");
		
		String email = u.email;
		String hobby = request.getParameter("hobby");
		String nickname = request.getParameter("nickname");
		String DOB = request.getParameter("dob");
		
		System.out.println("Details are "+DOB+" "+email+" "+nickname+" "+hobby);
		
		user p = data.get_person(email, hobby , nickname , DOB);
		
		if(data.validate(p)) {
			
			System.out.println("validated");
			request.getServletContext().setAttribute("user_id", p.user_id);
//			request.getRequestDispatcher("admin/users.jsp").forward(request, response);
			response.sendRedirect("admin/users.jsp");
			
		}else {
			
			System.out.println("not validated");
			
			out.append("<center><h2 style=\"color: red;\">warning : Data doesn't match</h2></center>");
			request.getRequestDispatcher("admin/forgot_password.jsp").include(request, response);
			
		}
		
	}

 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
		doGet(request, response);
	}

}
