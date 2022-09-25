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

<meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href  ="assets/css/normalize.css">
      <link rel="stylesheet" href="assets/css/bootstrap.min.css">
      <link rel="stylesheet" href="assets/css/font-awesome.min.css">
      <link rel="stylesheet" href="assets/css/themify-icons.css">
      <link rel="stylesheet" href="assets/css/pe-icon-7-filled.css">
      <link rel="stylesheet" href="assets/css/flag-icon.min.css">
      <link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
      <link rel="stylesheet" href="assets/css/style.css">
      <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
</head>
<!-- <script type="text/javascript">
	window.history.forward();
	function noBack() {
		window.history.forward();
	}
</script> -->
<body>


	<%@ page import="java.sql.*"%>
	<%@ page import="servlet.user"%>
	<%@ page import="servlet.data"%>

	<%

	if (request.getParameter("email") != null) {

		String email = request.getParameter("email");

		out.print(email);

		boolean validation = data.validate(email);

		if (validation) {
			
			user u = data.get_person(email); 
			getServletContext().setAttribute("user", u);
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
				<form action="../reset_password" method="post">
					<div class="form-group">
						<label for="forgot">Hobby:</label> <input type="text"
							class="form-control" id="hobby"
							placeholder="Enter your hobby" name="hobby">
					</div>
					<div class="form-group">
						<label for="nickname">Nickname:</label> <input type="nickname"
							class="form-control" id="nickname"
							placeholder="Enter your nickname" name="nickname">
					</div>
					<!-- enter dob -->
					
					<!-- <input type="date" name="begin" id="date" placeholder="dd-mm-yyyy" value="" min="1997-01-01" max="2030-12-31" -->
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