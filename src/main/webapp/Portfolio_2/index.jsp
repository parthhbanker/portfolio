<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@ page import="java.util.Base64"%>
	<%
	String a = request.getParameter("userId").toString();
	byte[] decodedBytes = Base64.getDecoder().decode(a);
	String decodedString = new String(decodedBytes);
	application.setAttribute("UserId", decodedString);
	%>

<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/portfolio" user="root" password="root" />


<!DOCTYPE HTML>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Profile &mdash; Free Website Template, Free HTML5
	Template by freehtml5.co</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://fonts.googleapis.com/css?family=Space+Mono"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Kaushan+Script"
	rel="stylesheet">

<!-- Animate.css -->
<link rel="stylesheet" href="css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="css/bootstrap.css">

<!-- Theme style  -->
<link rel="stylesheet" href="css/style.css">

<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min.js"></script>

</head>

<body>

	<div class="fh5co-loader"></div>

	<div id="page">
		<header id="fh5co-header" class="fh5co-cover js-fullheight"
			role="banner" style="background-image: url(images/cover_bg_3.jpg);"
			data-stellar-background-ratio="0.5">
			<div class="overlay"></div>
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 text-center">
						<div class="display-t js-fullheight">
								<div class="display-tc js-fullheight animate-box"
									data-animate-effect="fadeIn">
							<sql:query var="rs" dataSource="${db}">SELECT * from about where user_id =${UserId} ;	</sql:query>
							<c:forEach var="data" items="${rs.rows}">
									<div class="profile-thumb"
										style="background: url(images/user-3.jpg);"></div>

									<h1>
										<span><c:out value="${data.name_}"></c:out></span>
									</h1>
									<h3>
										<span><c:out value="${data.positions}"></c:out></span>
									</h3>
									<!-- <p>
								<ul class="fh5co-social-icons">
									<li><a href="#"><i class="icon-twitter2"></i></a></li>
									<li><a href="#"><i class="icon-facebook2"></i></a></li>
									<li><a href="#"><i class="icon-linkedin2"></i></a></li>
									<li><a href="#"><i class="icon-dribbble2"></i></a></li>
								</ul>
							</p> -->
							</c:forEach>
								</div>
						</div>
					</div>
				</div>
			</div>
		</header>
		
		<sql:query var="rs" dataSource="${db}">SELECT a.*, c.* from about a join contact_info c on a.user_id = c.user_id where a.user_id =${UserId} ;	</sql:query>

	<c:forEach var="data" items="${rs.rows}">

		<div id="fh5co-about" class="animate-box">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
						<h2>About Me</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<ul class="info">
							<li><span class="first-block">Full Name:</span><span
								class="second-block"><c:out value="${data.name_}"></c:out></span></li>
							<li><span class="first-block">Phone:</span><span
								class="second-block"><c:out value="${data.phone}"></c:out></span></li>
							<li><span class="first-block">Email:</span><span
								class="second-block"><c:out value="${data.email}"></c:out></span></li>
							<li><span class="first-block">Website:</span><span
								class="second-block">www.yoursite.com</span></li>
							<li><span class="first-block">Address:</span><span
								class="second-block"><c:out value="${data.address}"></c:out></span></li>
						</ul>
					</div>
					<div class="col-md-8">
						<h2>Hello There!</h2>
						<p><c:out value="${data.about_me}"></c:out></p>
						<p><c:out value="${data.about_me}"></c:out></p>
						<!-- <p>
						<ul class="fh5co-social-icons">
							<li><a href="#"><i class="icon-twitter2"></i></a></li>
							<li><a href="#"><i class="icon-facebook3"></i></a></li>
							<li><a href="#"><i class="icon-linkedin2"></i></a></li>
							<li><a href="#"><i class="icon-dribbble2"></i></a></li>
						</ul>
					</p> -->
					</div>
				</div>
			</div>
		</div>

</c:forEach>
		<div id="fh5co-resume" class="fh5co-bg-color">
			<div class="container">
				<div class="row animate-box">
					<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
						<h2>My Resume</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 col-md-offset-0">
						<ul class="timeline">
							<li class="timeline-heading text-center animate-box">
								<div>
									<h3>Work Experience</h3>
								</div>
							</li>
							<li class="animate-box timeline-unverted">
								<div class="timeline-badge">
									<i class="icon-suitcase"></i>
								</div>
								<div class="timeline-panel">
									<div class="timeline-heading">
										<h3 class="timeline-title">Senior Developer</h3>
										<span class="company">Company Name - 2016 - Current</span>
									</div>
									<div class="timeline-body">
										<p>Far far away, behind the word mountains, far from the
											countries Vokalia and Consonantia, there live the blind
											texts.</p>
									</div>
								</div>
							</li>

							<br>
							<li class="timeline-heading text-center animate-box">
								<div>
									<h3>Education</h3>
								</div>
							</li>
							<li class="timeline-inverted animate-box">
								<div class="timeline-badge">
									<i class="icon-graduation-cap"></i>
								</div>
								<div class="timeline-panel">
									<div class="timeline-heading">
										<h3 class="timeline-title">Masters Degree</h3>
										<span class="company">University Name - 2007 - 2009</span>
									</div>
									<div class="timeline-body">
										<p>Far far away, behind the word mountains, they live in
											Bookmarksgrove right at the coast of the Semantics, a large
											language ocean.</p>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		<sql:query var="rs" dataSource="${db}">SELECT * from skills where user_id =${UserId} ;	</sql:query>
		<%! int i=1, j=1; %>
		<c:forEach var="data" items="${rs.rows}">
					<% i+=1; %>
				</c:forEach>

		<div id="fh5co-skills" class="animate-box">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
						<h2>Skills</h2>
					</div>
				</div>
				<sql:query var="rs" dataSource="${db}">SELECT * from skills where user_id =${UserId} ;	</sql:query>
				<div class="row row-pb-md">
	<c:forEach var="data" items="${rs.rows}">
					<div class="col-md-3 col-sm-6 col-xs-12 text-center">
						<div class="chart" data-percent="<c:out value="${data.level}"></c:out>">
							<span><strong><c:out value="${data.skill}"></c:out></strong><c:out value="${data.level}"></c:out>%</span>
						</div>
					</div>
				</c:forEach>
				</div>
				
				<% int k=1 ; %>
				<div class="row">
				<c:forEach var="data" items="${rs.rows}">
				
				<% if (k++ <= i/2) { %>
         <div class="col-md-6">
						<div class="progress-wrap">
							<h3>
								<span class="name-left"><c:out value="${data.skill}"></c:out></span><span
									class="value-right"><c:out value="${data.level}"></c:out>%</span>
							</h3>
							<div class="progress">
								<div
									class="progress-bar progress-bar-1 progress-bar-striped active"
									role="progressbar" aria-valuenow="<c:out value="${data.level}"></c:out>" aria-valuemin="0"
									aria-valuemax="100" style="width: 90%"></div>
							</div>
						</div>
					</div>
      <% } else { %>
         <div class="col-md-6">
						<div class="progress-wrap">
							<h3>
								<span class="name-left"><c:out value="${data.skill}"></c:out></span><span
									class="value-right"><c:out value="${data.level}"></c:out>%</span>
							</h3>
							<div class="progress">
								<div
									class="progress-bar progress-bar-1 progress-bar-striped active"
									role="progressbar" aria-valuenow="<c:out value="${data.level}"></c:out>" aria-valuemin="0"
									aria-valuemax="100" style="width: 90%"></div>
							</div>
						</div>
					</div>
      <% } %>
					
				</c:forEach>
				</div>
			</div>
		</div>

		<div id="fh5co-started" class="fh5co-bg-dark">
			<div class="overlay"></div>
			<div class="container">
				<div class="row animate-box">
					<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
						<h2>Hire Me!</h2>
						<p>Facilis ipsum reprehenderit nemo molestias. Aut cum
							mollitia reprehenderit. Eos cumque dicta adipisci architecto
							culpa amet.</p>
						<p>
							<a href="#" class="btn btn-default btn-lg">Contact Us</a>
						</p>
					</div>
				</div>
			</div>
		</div>

		<div id="fh5co-consult">
			<div class="video fh5co-video"
				style="background-image: url(images/cover_bg_1.jpg);">
				<div class="overlay"></div>
			</div>
			<div class="choose animate-box">
				<h2>Contact</h2>
				<form action="#">
					<div class="row form-group">
						<div class="col-md-6">
							<input type="text" id="fname" class="form-control"
								placeholder="Your firstname">
						</div>
					</div>
					<div class="row form-group">
						<div class="col-md-6">
							<input type="text" id="lname" class="form-control"
								placeholder="Your lastname">
						</div>
					</div>

					<div class="row form-group">
						<div class="col-md-12">
							<input type="text" id="email" class="form-control"
								placeholder="Your email address">
						</div>
					</div>

					<div class="row form-group">
						<div class="col-md-12">
							<input type="text" id="subject" class="form-control"
								placeholder="Your subject of this message">
						</div>
					</div>

					<div class="row form-group">
						<div class="col-md-12">
							<textarea name="message" id="message" cols="30" rows="10"
								class="form-control" placeholder="Say something about us"></textarea>
						</div>
					</div>
					<div class="form-group">
						<input type="submit" value="Send Message" class="btn btn-primary">
					</div>

				</form>
			</div>
		</div>

		<div id="map" class="fh5co-map"></div>
	</div>

	<div id="fh5co-footer">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<p>
						&copy; 2022. All Rights Reserved. <br>Designed by Some One
				</div>
			</div>
		</div>
	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up22"></i></a>
	</div>

	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Stellar Parallax -->
	<script src="js/jquery.stellar.min.js"></script>
	<!-- Easy PieChart -->
	<script src="js/jquery.easypiechart.min.js"></script>

	<!-- Main -->
	<script src="js/main.js"></script>

</body>
</html>

