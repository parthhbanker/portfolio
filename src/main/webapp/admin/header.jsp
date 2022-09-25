<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- HEADER -->
<!doctype html>
<html class="no-js" lang="">
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Dashboard Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="assets/css/normalize.css">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/themify-icons.css">
<link rel="stylesheet" href="assets/css/pe-icon-7-filled.css">
<link rel="stylesheet" href="assets/css/flag-icon.min.css">
<link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
<link rel="stylesheet" href="assets/css/style.css">
<!-- font awesome  -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous" />
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>
<style>
.switch {
	position: relative;
	display: inline-block;
	width: 60px;
	height: 34px;
}

.switch input {
	opacity: 0;
	width: 0;
	height: 0;
}

.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 26px;
	width: 26px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked+.slider {
	background-color: #2196F3;
}

input:focus+.slider {
	box-shadow: 0 0 1px #2196F3;
}

input:checked+.slider:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
	border-radius: 34px;
}

.slider.round:before {
	border-radius: 50%;
}
</style>
</head>

<%@ page import="java.util.Base64" %>
<%
	String a = application.getAttribute("user_id").toString();
	String encodedString = Base64.getEncoder().encodeToString(a.getBytes());
%>



<body>
	<aside id="left-panel" class="left-panel">
		<nav class="navbar navbar-expand-sm navbar-default">
			<div id="main-menu" class="main-menu collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="menu-title">Menu</li>



					<li class="menu-item-has-children dropdown"><a
						href="about_me.jsp"> About Me</a></li>

					<li class="menu-item-has-children dropdown"><a
						href="contact_info.jsp"> Contact Information</a></li>
					<li class="menu-item-has-children dropdown"><a
						href="users.jsp"> Edit Profile</a></li>
					<li class="menu-item-has-children dropdown"><a
						href="education.jsp"> Education</a></li>

					<li class="menu-item-has-children dropdown"><a
						href="contact_us.jsp"> Messages</a></li>

					<li class="menu-item-has-children dropdown"><a
						href="categories.jsp"> Categories</a></li>
					<li class="menu-item-has-children dropdown"><a
						href="skills.jsp"> Skills</a></li>


					<li class="menu-item-has-children dropdown">
                  
                     <a href="../Portfolio_2/index.jsp?userId=<%= encodedString %>" target="_blank"> Create Portfolio
                     </a>
                  </li>

					<li><a href="../logout"> <i
							class="menu-icon fa fa-sign-out"></i>Logout
					</a></li>

				</ul>
			</div>
		</nav>
	</aside>
	<div id="right-panel" class="right-panel">
		<header id="header" class="header">
			<!-- <div class="top-left">
               <div class="navbar-header">
                  <a class="navbar-brand" href="plant.php">Name</a>
                  <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
               </div>
            </div> -->
			<div class="top-right">
				<div class="header-menu">
					<div class="user-area dropdown float-right">

						<c:out value="Welcome ${username}"></c:out>
					</div>
				</div>
			</div>
		</header>