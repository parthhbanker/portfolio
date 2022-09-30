<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
<title>Login</title>

 <style type="text/css">

		.pass-div {
			width: 100%;
		}

		input {
			background-color: #eee;
			border: none;
			padding: 12px 15px;
			margin: 8px 0;
			width: 100%;
		}

		.pass-div input {
			width: 98.5%;
		}

		.container {
			background-color: #fff;
			border-radius: 10px;
			box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
			position: relative;
			overflow: hidden;
			width: 768px;
			max-width: 100%;
			min-height: 480px;
		}
		
		@import url("https://fonts.googleapis.com/css?family=Montserrat:400,800");

* {
  box-sizing: border-box;
}

body {
  background: #f6f5f7;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  font-family: "Montserrat", sans-serif;
  height: 100vh;
  margin: -20px 0 50px;
}

h1 {
  font-weight: bold;
  margin: 0;
}

h2 {
  text-align: center;
}

p {
  font-size: 14px;
  font-weight: 100;
  line-height: 20px;
  letter-spacing: 0.5px;
  margin: 20px 0 30px;
}

span {
  font-size: 12px;
}

a {
  color: #333;
  font-size: 14px;
  text-decoration: none;
  margin: 15px 0;
}

button {
  border-radius: 20px;
  border: 1px solid #ff4b2b;
  background-color: #ff4b2b;
  color: #ffffff;
  font-size: 12px;
  font-weight: bold;
  padding: 12px 45px;
  letter-spacing: 1px;
  text-transform: uppercase;
  transition: transform 80ms ease-in;
}

button:active {
  transform: scale(0.95);
}

button:focus {
  outline: none;
}

button.ghost {
  background-color: transparent;
  border-color: #ffffff;
}

form {
  background-color: #ffffff;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  padding: 0 50px;
  height: 100%;
  text-align: center;
}

.form-container {
  position: absolute;
  top: 0;
  height: 100%;
  transition: all 0.6s ease-in-out;
}

.sign-in-container {
  left: 0;
  width: 50%;
  z-index: 2;
}

.container.right-panel-active .sign-in-container {
  transform: translateX(100%);
}

.sign-up-container {
  left: 0;
  width: 50%;
  opacity: 0;
  z-index: 1;
}

.container.right-panel-active .sign-up-container {
  transform: translateX(100%);
  opacity: 1;
  z-index: 5;
  animation: show 0.6s;
}

@keyframes show {
  0%,
  49.99% {
    opacity: 0;
    z-index: 1;
  }

  50%,
  100% {
    opacity: 1;
    z-index: 5;
  }
}
.overlay-container {
  position: absolute;
  top: 0;
  left: 50%;
  width: 50%;
  height: 100%;
  overflow: hidden;
  transition: transform 0.6s ease-in-out;
  z-index: 100;
}

.container.right-panel-active .overlay-container {
  transform: translateX(-100%);
}

.overlay {
  background: #ff416c;
  background: -webkit-linear-gradient(to right, #ff4b2b, #ff416c);
  background: linear-gradient(to right, #ff4b2b, #ff416c);
  background-repeat: no-repeat;
  background-size: cover;
  background-position: 0 0;
  color: #ffffff;
  position: relative;
  left: -100%;
  height: 100%;
  width: 200%;
  transform: translateX(0);
  transition: transform 0.6s ease-in-out;
}

.container.right-panel-active .overlay {
  transform: translateX(50%);
}

.overlay-panel {
  position: absolute;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  padding: 0 40px;
  text-align: center;
  top: 0;
  height: 100%;
  width: 50%;
  transform: translateX(0);
  transition: transform 0.6s ease-in-out;
}

.overlay-left {
  transform: translateX(-20%);
}

.container.right-panel-active .overlay-left {
  transform: translateX(0);
}

.overlay-right {
  right: 0;
  transform: translateX(0);
}

.container.right-panel-active .overlay-right {
  transform: translateX(20%);
}

.social-container {
  margin: 20px 0;
}

.social-container a {
  border: 1px solid #dddddd;
  border-radius: 50%;
  display: inline-flex;
  justify-content: center;
  align-items: center;
  margin: 0 5px;
  height: 40px;
  width: 40px;
}

footer {
  background-color: #222;
  color: #fff;
  font-size: 14px;
  bottom: 0;
  position: fixed;
  left: 0;
  right: 0;
  text-align: center;
  z-index: 999;
}

footer p {
  margin: 10px 0;
}

footer i {
  color: red;
}

footer a {
  color: #3c97bf;
  text-decoration: none;
}
		
</style>

</head>
<body>

	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ page import="servlet.*"%>


	<%
	if (getServletContext().getAttribute("warning") != null) {

		if (getServletContext().getAttribute("warning").toString().equals("1")) {
	%>
	<h2 id="h" style="color: red;">warning : user already exists</h2>
	<%
	getServletContext().setAttribute("warning", 0);

	} else if (getServletContext().getAttribute("warning").toString().equals("2")) {
	%>
	<h2 id="h" style="color: red;">warning : wrong email id or
		password</h2>
	<%
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
					<form action="admin/login.jsp" method="post">
						<input type="hidden" name="form" value="sign_up">
						<h1>Create Account</h1>
						<input type="text" placeholder="User Name" name="name" required />
						<input type="email" placeholder="Email" name="email" required />
						
						<div class="pass-div">
					<input type="password"
					placeholder="Password" name="password" onclick="warning()" id="password" required /><i class="far fa-eye"
						id="togglePassword" style="margin-left: -30px; cursor: pointer;"></i>
				</div>
						<button>Sign Up</button>
					</form>
				</div>


		<!-- Sign in -->
		<div class="form-container sign-in-container">
			<form action="admin/login.jsp" method="post">
				<input type="hidden" name="form" value="signin">
				<h1>Sign in</h1>
				<input type="email" placeholder="Email" name="email"
					onclick="warning()" required /> 
				<div class="pass-div">
					<input type="password"
					placeholder="Password" name="password" onclick="warning()" id="lpassword" required /><i class="far fa-eye"
						id="ltogglePassword" style="margin-left: -30px; cursor: pointer;"></i>
				</div>
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

const togglePassword = document.querySelector('#togglePassword');
const password = document.querySelector('#password');

togglePassword.addEventListener('click', function (e) {
  // toggle the type attribute
  const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
  password.setAttribute('type', type);
  // toggle the eye slash icon
  this.classList.toggle('fa-eye-slash');
});

const ltogglePassword = document.querySelector('#ltogglePassword');
const lpassword = document.querySelector('#lpassword');

ltogglePassword.addEventListener('click', function (e) {
  // toggle the type attribute
  const type = lpassword.getAttribute('type') === 'password' ? 'text' : 'password';
  lpassword.setAttribute('type', type);
  // toggle the eye slash icon
  this.classList.toggle('fa-eye-slash');
});

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