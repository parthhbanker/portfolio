package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * Servlet implementation class SendMessage
 */
public class SendMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMessage() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/portfolio", "root", "root");

			PreparedStatement s;
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");  
			LocalDateTime now = LocalDateTime.now();  
			
				s = c.prepareStatement("INSERT INTO messages(name_, email, message,date_, user_id) VALUES (?, ?, ?, ?, ?)");
				
				s.setString(1, request.getParameter("name"));
				s.setString(2, request.getParameter("email"));
				s.setString(3, request.getParameter("message"));
				s.setString(4, dtf.format(now).toString());
				s.setInt(5, Integer.parseInt(request.getParameter("user_id")));
				
				

			int x = s.executeUpdate();

			if (x == 0) {
				System.out.println("values not inserted");
			} else {
				System.out.println("values inserted successfull");
			}
			
			response.sendRedirect("Portfolio_1/index.jsp?userId="+request.getParameter("user_id"));
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
