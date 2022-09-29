<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="style.css" type="text/css">
<link rel="stylesheet" href="assets/css/login.css" type="text/css">
<title>Login</title>


</head>
<body>

	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ page import="servlet.*"%>


	<%
	if (getServletContext().getAttribute("warning") != null) {

		if (getServletContext().getAttribute("warning").toString().equals("1")) {
			
			%> <h2 id="h" style="color: red;">warning : user already exists</h2> <%
			getServletContext().setAttribute("warning", 0);

		} else if (getServletContext().getAttribute("warning").toString().equals("2")) {
			
			%> <h2 id="h" style="color: red;">warning : wrong email id or password</h2> <%
			getServletContext().setAttribute("warning", 0);

		}

	}
	%>

	<%
	ServletContext sc = getServletContext();
	response.setContentType("text/html");

	Cookie cookie;

	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String form = request.getParameter("form");
	%>

	<c:if test="${pageContext.request.method=='POST'}">

		<c:choose>

			<c:when test="${ param.form eq \"sign_up\" }">

				<%
				if (data.check_availability(email, password)) {

					user p = new user();

					p.name = name;
					p.email = email;
					p.pass = password;

					data.insert_person(p, true);

					System.out.println("sign_up");
					System.out.println("Name : " + name + " Email : " + email + " Password : " + password);

					user u = data.get_person(email);

					// set cookie
					cookie = new Cookie("user_id", "" + u.user_id);
					// 604800 secs = week of time
					cookie.setMaxAge(604800);
					response.addCookie(cookie);

					// set attribute
					sc.setAttribute("user", u);
					System.out.println("User id is " + u.user_id);
					sc.setAttribute("user_id", u.user_id);
					sc.setAttribute("username", u.name);
					System.out.println("username is ");

					// redirect to user admin panel
					System.out.println("Redirecting to security page");
					response.sendRedirect("security_question.jsp");

				} else {

					getServletContext().setAttribute("warning", "1");
					response.sendRedirect("login.jsp");

				}
				%>

			</c:when>
			
			<c:when test="${ param.form eq \"signin\" }">
			
				<%
				
				if (data.validate(email, password)) {

					// edirect to user admin panel
					System.out.println("sign in");
					System.out.println("Email : " + email + " Password : " + password);

					user u = data.get_person(email);
					
					// set cookie
					cookie = new Cookie("user_id", ""+u.user_id);
					// 604800 secs = week of time
					cookie.setMaxAge(604800);
					response.addCookie(cookie);

					
					// set attribute
					sc.setAttribute("user", u);
					System.out.println("User id is "+u.user_id);
					sc.setAttribute("user_id", u.user_id);
					sc.setAttribute("username",	 u.name);
					System.out.println("username is ");

//					request.getRequestDispatcher("dashboard.jsp").include(request, response);
					response.sendRedirect("index.jsp");

				} else {

					getServletContext().setAttribute("warning", "2");
					response.sendRedirect("login.jsp");

				}
				
				%>
			
			</c:when>

		</c:choose>

	</c:if>

	<div class="container" id="container">

		<!-- SIgn up -->
		<div class="form-container sign-up-container">
			<form action="login.jsp" method="post">
				<input type="hidden" name="form" value="sign_up">
				<h1>Create Account</h1>
				<input type="text" placeholder="User Name"  name="name" required />
				<input type="email" placeholder="Email" name="email" required /> <input
					type="password" placeholder="Password" name="password" required />
				<button>Sign Up</button>
			</form>
		</div>


		<!-- Sign in -->
		<div class="form-container sign-in-container">
			<form action="login.jsp" method="post">
				<input type="hidden" name="form" value="signin">
				<h1>Sign in</h1>
				<input type="email" placeholder="Email" name="email"  onclick="warning()" required /> <input
					type="password" placeholder="Password" name="password" onclick="warning()" required />
				<a href="forgot_password.jsp">Forgot your password?</a>
				<button>Sign In</button>
			</form>
		</div>

		<!-- overlay -->
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-left">
					<h1>Welcome Back!</h1>
					<p>To keep connected with us please login with your personal
						info</p>
					<button class="ghost" id="signIn">Sign In</button>
				</div>
				<div class="overlay-panel overlay-right">
					<h1>Hello, Friend!</h1>
					<p>Enter your personal details and start journey with us</p>
					<button class="ghost" id="signUp">Sign Up</button>
				</div>
			</div>
		</div>
	</div>
</body>

<script>
   const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
	container.classList.add("right-panel-active");
	hidden();
});

signInButton.addEventListener('click', () => {
	container.classList.remove("right-panel-active");
	hidden();
});

function hidden(){
	document.getElementById("h").style.visibility = "hidden";
}

function warning(){
	hidden();
}
</script>
</html>