<!-- create a modal in html using bootstrap to login -->
<!DOCTYPE html>
<%@page import="javax.naming.Context"%>
<%@page import="javax.swing.text.AbstractDocument.Content"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
	window.history.forward();
	function noBack() {
		window.history.forward();
	}
</script>
<body>


	<%@ page import="java.sql.*"%>
	<%@ page import="servlet.user "%>

	<%!public user get_person(String email) {

		user p = null;
		ResultSet rs = null;
		ResultSet rts = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			// creating connection
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/portfolio", "root", "root");

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

	private boolean validate(String email) {

		user p = get_person(email);

		if (p == null || p.email == null) {

			return false;

		} else {

			return true;

		}

	}%>

	<%

	if (request.getParameter("email") != null) {

		String email = request.getParameter("email");
		get_person(email);

		out.print(email);

		boolean validation = validate(email);

		if (validation) {
	%>

	<!-- The Modal -->
	<!-- 	<div class="modal" id="myModal"> -->
	<div class="modal-dialog modal-lg">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">Security Questions</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<!-- make a simple html form to ask name and email -->
				<form action="reset_password" method="post">
					<div class="form-group">
						<label for="forgot">City:</label> <input type="text"
							class="form-control" id="city"
							placeholder="Enter city you were born" name="city">
					</div>
					<div class="form-group">
						<label for="nickname">Nickname:</label> <input type="nickname"
							class="form-control" id="nickname"
							placeholder="Enter your nickname" name="nickname">
					</div>
					<!-- enter dob -->
					<div class="form-group">
						<label for="dob">Date of Birth:</label> <input type="date"
							class="form-control" id="dob"
							placeholder="Enter your date of birth" name="dob">
					</div>
					<!-- center submit button -->
					<div class="text-center">
						<button type="submit" class="btn btn-primary">Submit</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!--</div> -->

	<%
	} else if (!validation) {
		
		getServletContext().setAttribute("user", email);
		
	%>


	<!-- make a center div with 40% of screen size -->
	<center>
		<h2 style="color: red;">warning : user does not exists</h2>
	</center>
	<div class="container" style="width: 40%; margin-top: 10%;">
		<div class="card">
			<div class="card-header">
				<h3>Reset Password</h3>
			</div>
			<div class="card-body">
				<form action="forgot_password.jsp" method="post">
					<div class="form-group">
						<label for="email">Email:</label> <input type="email"
							class="form-control" placeholder="Enter email" id="email"
							name="email" required>
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-primary" data-toggle="modal"
							data-target="#myModal">Forgot Password</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<%
	}
	} else {
	%>

	<div class="container" style="width: 40%; margin-top: 10%;">
		<div class="card">
			<div class="card-header">
				<h3>Reset Password</h3>
			</div>
			<div class="card-body">
				<form action="forgot_password.jsp" method="post">
					<div class="form-group">
						<label for="email">Email:</label> <input type="email"
							class="form-control" placeholder="Enter email" id="email"
							name="email" required>
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-primary" data-toggle="modal"
							data-target="#myModal">Forgot Password</button>
					</div>
				</form>
			</div>
		</div>
	</div>


	<%
	}
	%>

</body>


</html>