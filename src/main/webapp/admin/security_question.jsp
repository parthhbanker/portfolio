<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/portfolio" user="root" password="root" />
	
<c:if test="${pageContext.request.method=='POST'}">

	<sql:update dataSource="${db}" var="count">  
			INSERT INTO security_questions(hobby, nickname, DOB, user_id) VALUES
				("${param.q2}", "${param.q1}", "${param.q3}", "${user_id}");
		</sql:update>
			<% response.sendRedirect("index.jsp"); %>
</c:if>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="style.css" type="text/css">
<title>Login</title>

<style>
* {
	box-sizing: border-box;
}

body {
	background: #f6f5f7;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	font-family: 'Montserrat', sans-serif;
	height: 100vh;
	margin: -20px 0 50px;
}

h1 {
	font-weight: bold;
	margin: 0;
}

button {
	border-radius: 20px;
	border: 1px solid #FF4B2B;
	background-color: #FF4B2B;
	color: #FFFFFF;
	font-size: 12px;
	font-weight: bold;
	padding: 12px 45px;
	letter-spacing: 1px;
	text-transform: uppercase;
	transition: transform 80ms ease-in;
}

form {
	background-color: #FFFFFF;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	padding: 0 50px;
	height: 100%;
	text-align: center;
}

input {
	background-color: #eee;
	border: none;
	padding: 12px 15px;
	margin: 8px 0;
	width: 100%;
}

.container {
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px
		rgba(0, 0, 0, 0.22);
	position: relative;
	overflow: hidden;
	width: 408px;
	max-width: 100%;
	min-height: 480px;
}

.form-container {
	position: absolute;
	top: 0;
	height: 100%;
	transition: all 0.6s ease-in-out;
}

.sign-in-container {
	left: 0;
	width: 100%;
	z-index: 2;
}

.innerDiv {
	width: 100%;
	padding: 5px;
}

/* align label to start */
label {
	display: flex;
	align-items: flex-start;
}
</style>
</head>
<body>

	<div class="container">
		<!-- Sign in -->
		<div class="form-container sign-in-container">
			<form action="#" method="post">
				<input type="hidden" name="form" value="signin">
				<h1>Security Questions</h1>
				<div>&nbsp;</div>
				<div class="innerDiv">
					<label>Nick Name</label> <input type="text"
						placeholder="Enter your nickname" name="q1" required />
				</div>
				<div class="innerDiv">
					<label>Hobby</label> <input type="text"
						placeholder="Enter your hobby" name="q2" required />
				</div>
				<div class="innerDiv">
					<label>DOB</label> <input type="date" name="q3" required />
				</div>
				<div>&nbsp;</div>
				<button>Continur</button>
			</form>
		</div>
	</div>
</body>
</html>