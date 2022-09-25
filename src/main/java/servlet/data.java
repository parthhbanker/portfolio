package servlet;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class data {
	
	public static String getMd5(String input)
    {
        try {
 
          
            MessageDigest md = MessageDigest.getInstance("SHA-1");
            byte[] messageDigest = md.digest(input.getBytes());
 
            BigInteger no = new BigInteger(1, messageDigest);

            String hashtext = no.toString(16);
            
            return hashtext;
        }
 
        // For specifying wrong message digest algorithms
        catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
    
	public static Connection connect() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/portfolio","root","root");
		return c;
	}
	public static user get_person(String email, String password) {

		user p = null;
		ResultSet rs = null;
		ResultSet rts = null;

		try {
			// creating statement
			Connection c=connect();
			PreparedStatement s = c.prepareStatement("SELECT * FROM user where email = ? AND pass = ?");
			s.setString(1, email);
			s.setString(2, getMd5(password));
			rs = s.executeQuery();

			rs = s.executeQuery();

			if (rs == null) {

				return null;

			}

			while (rs.next()) {

				p = new user();
				p.setEmail(rs.getString("email"));
				p.setPass(rs.getString("pass"));
				p.setName(rs.getString("username"));

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

	public static user get_person(String email) {

		user p = null;
		ResultSet rs = null;
		ResultSet rts = null;

		try {

			Connection c=connect();
			// creating statement
			PreparedStatement s = c.prepareStatement("SELECT * FROM user where email = ?");
			s.setString(1, email);

			rs = s.executeQuery();

			rs = s.executeQuery();

			if (rs == null) {

				return null;

			}

			while (rs.next()) {

				p = new user();
				p.setEmail(rs.getString("email"));
				p.setPass(rs.getString("pass"));
				p.setName(rs.getString("username"));
				p.setUser_id(rs.getInt("id"));

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

	public static user get_person(int id) {

		user p = null;
		ResultSet rs = null;
		ResultSet rts = null;

		try {
			Connection c=connect();
			// creating statement
			PreparedStatement s = c.prepareStatement("SELECT * FROM user where id = ?");
			s.setInt(1, id);

			rs = s.executeQuery();

			rs = s.executeQuery();

			if (rs == null) {

				return null;

			}

			while (rs.next()) {

				p = new user();
				p.setEmail(rs.getString("email"));
				p.setPass(rs.getString("pass"));
				p.setName(rs.getString("username"));
				p.setUser_id(rs.getInt("id"));

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
	
	public static user get_person(String email, String hobby, String nickname, String DOB) {

		user p = null;
		ResultSet rs = null;
		
		

		try {
			Connection c=connect();
			// creating statement
			PreparedStatement s = c.prepareStatement(
					"select s.id, s.email from security_questions sq , user s where s.email = ? and hobby = ? and nickname = ? and DOB = ? and s.id = sq.user_id ;");
			s.setString(1, email);
			s.setString(2, hobby);
			s.setString(3, nickname);
			s.setString(4, DOB);

			System.out.println(s.toString());

			rs = s.executeQuery();

			while (rs.next()) {

				p = new user();
				p.setUser_id(rs.getInt("s.id"));
				p.setEmail(rs.getString("s.email"));
				
				System.out.println("id is "+p.user_id+"email is "+p.email);
				

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

	public static void insert_person(user per, boolean sign_up) {

		try {
			Connection c=connect();
			PreparedStatement s;

			if (sign_up) {

				s = c.prepareStatement("insert into user(email , pass , username) values(?,?,?)");

				s.setString(1, per.email);
				s.setString(2, getMd5(per.pass));
				s.setString(3, per.name);

			} else {

				s = c.prepareStatement("insert into user(email , pass) values(?,?)");
				s.setString(1, per.email);
				s.setString(2, getMd5(per.pass));

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

	public static boolean validate(String email, String password) {

		System.out.println("Email : " + email + " Password : " + password);
		
		user p = data.get_person(email, password);

		if (p == null || p.email == null) {

			return false;

		} else {

			return true;

		}

	}

	public static boolean validate(String email) {

		user p = get_person(email);

		if (p == null || p.email == null) {

			return false;

		} else {

			return true;

		}
	}

	public static boolean validate(user p) {

//		user p = data.get_person(email, city , nickname , DOB);

		if ( p == null) {

			return false;

		} else {

			return true;

		}

	}

	public static boolean check_availability(String email, String password) {

		user p = data.get_person(email, password);
		
		if ( p == null || p.email == null) {

			System.out.println("available");
			return true;

		} else {

			System.out.println("not available");
			return false;

		}

	}

}
