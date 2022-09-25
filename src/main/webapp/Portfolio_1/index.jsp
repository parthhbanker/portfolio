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
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Portfolio 1</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/aos/aos.css" rel="stylesheet">
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">
</head>

<body>

	


	<!-- ======= Mobile nav toggle button ======= -->
	<i class="bi bi-list mobile-nav-toggle d-xl-none"></i>

	<sql:query var="rs" dataSource="${db}">SELECT * from about where user_id =${UserId} ;	</sql:query>

	<c:forEach var="data" items="${rs.rows}">

		<!-- ======= Header ======= -->
		<header id="header">
			<div class="d-flex flex-column">

				<div class="profile">
					<img src="assets/img/profile-img.jpg" alt=""
						class="img-fluid rounded-circle">
					<h1 class="text-light">
						<a href="index.html"> <c:out value="${data.name_}"></c:out>
						</a>
					</h1>
					<!-- Social Links -->
					<!-- <div class="social-links mt-3 text-center">
          <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
          <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
          <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
          <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
          <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
        </div> -->
				</div>



				<nav id="navbar" class="nav-menu navbar">
					<ul>
						<li><a href="#hero" class="nav-link scrollto active"><i
								class="bx bx-home"></i> <span>Home</span></a></li>
						<li><a href="#about" class="nav-link scrollto"><i
								class="bx bx-user"></i> <span>About</span></a></li>
						<li><a href="#resume" class="nav-link scrollto"><i
								class="bx bx-file-blank"></i> <span>Resume</span></a></li>
						<li><a href="#contact" class="nav-link scrollto"><i
								class="bx bx-envelope"></i> <span>Contact</span></a></li>
					</ul>
				</nav>
				<!-- .nav-menu -->
			</div>
		</header>
		<!-- End Header -->

		<!-- ======= Hero Section ======= -->
		<section id="hero"
			class="d-flex flex-column justify-content-center align-items-center">
			<div class="hero-container" data-aos="fade-in">
				<h1>
					<c:out value="${data.name_}"></c:out>
				</h1>
				<p>
					I'm <span class="typed"
						data-typed-items="<c:out value="${data.positions}"></c:out>"></span>
				</p>
			</div>
		</section>
		<!-- End Hero -->

	</c:forEach>

	<main id="main">

		<sql:query var="rs" dataSource="${db}">SELECT a.*, c.* from about a join contact_info c on a.user_id = c.user_id where a.user_id =${UserId} ;	</sql:query>

		<c:forEach var="data" items="${rs.rows}">


			<!-- ======= About Section ======= -->
			<section id="about" class="about">
				<div class="container">

					<div class="section-title">
						<h2>About</h2>
						<!-- <p>Magnam dolores commodi suscipit. Necessitatibus eius
						consequatur ex aliquid fuga eum quidem. Sit sint consectetur
						velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit
						suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem
						hic quas.</p> -->
					</div>

					<div class="row">
						<div class="col-lg-4" data-aos="fade-right">
							<img src="assets/img/profile-img.jpg" class="img-fluid" alt="">
						</div>
						<div class="col-lg-8 pt-4 pt-lg-0 content" data-aos="fade-left">
							<h3>UI/UX Designer &amp; Web Developer.</h3>
							<!-- <p class="fst-italic">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
              magna aliqua.
            </p> -->
							<div class="row">
								<div class="col-lg-6">
									<ul>
										<li><i class="bi bi-chevron-right"></i> <strong>Website:</strong>
											<span>www.example.com</span></li>
										<li><i class="bi bi-chevron-right"></i> <strong>Phone:</strong>
											<span><c:out value="${data.phone}"></c:out></span></li>
									</ul>
								</div>
								<div class="col-lg-6">
									<ul>
										<li><i class="bi bi-chevron-right"></i> <strong>Email:</strong>
											<span><c:out value="${data.email}"></c:out></span></li>
										<li><i class="bi bi-chevron-right"></i> <strong>Freelance:</strong>
											<span>Available</span></li>
									</ul>
								</div>
							</div>
							<p>
								<c:out value="${data.about_me}"></c:out>
							</p>
						</div>
					</div>

				</div>
			</section>
		</c:forEach>
		<!-- End About Section -->


		<sql:query var="rs" dataSource="${db}">SELECT * from skills where user_id =${UserId} ;	</sql:query>


		<!-- ======= Skills Section ======= -->
		<section id="skills" class="skills section-bg">
			<div class="container">

				<div class="section-title">
					<h2>Skills</h2>
					<!-- <p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p> -->
				</div>

				<%!int i = 1, j = 1;%>
				<div class="row skills-content">
					<c:forEach var="data" items="${rs.rows}">
						<%
						i += 1;
						%>
					</c:forEach>
					<sql:query var="rs" dataSource="${db}">SELECT * from skills where user_id =${UserId} ;	</sql:query>
					<c:forEach var="data" items="${rs.rows}">

						<%
						if (j++ <= i / 2) {
						%>
						<div class="col-lg-6" data-aos="fade-up">

							<div class="progress">
								<span class="skill"><c:out value="${data.skill}"></c:out>
									<i class="val"><c:out value="${data.level}"></c:out>%</i></span>
								<div class="progress-bar-wrap">
									<div class="progress-bar" role="progressbar"
										aria-valuenow="<c:out value="${data.level}"></c:out>"
										aria-valuemin="0" aria-valuemax="100"></div>
								</div>
							</div>

						</div>
						<%
						} else {
						%>
						<div class="col-lg-6" data-aos="fade-up">

							<div class="progress">
								<span class="skill"><c:out value="${data.skill}"></c:out>
									<i class="val"><c:out value="${data.level}"></c:out> %</i></span>
								<div class="progress-bar-wrap">
									<div class="progress-bar" role="progressbar"
										aria-valuenow="<c:out value="${data.level}"></c:out>"
										aria-valuemin="0" aria-valuemax="100"></div>
								</div>
							</div>

						</div>
						<%
						}
						%>
					</c:forEach>

				</div>

			</div>
		</section>
		<!-- End Skills Section -->

		<!-- ======= Resume Section ======= -->
		<section id="resume" class="resume">
			<div class="container">

				<div class="section-title">
					<h2>Resume</h2>
					<!-- <p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p> -->
				</div>


				<div class="row">
					<div class="col-lg-6" data-aos="fade-up">
						<h3 class="resume-title">Sumary</h3>
						<sql:query var="rs" dataSource="${db}">SELECT a.*, c.* from about a join contact_info c on a.user_id = c.user_id where a.user_id =${UserId} ;</sql:query>

						<c:forEach var="data" items="${rs.rows}">
							<div class="resume-item pb-0">
								<h4>
									<c:out value="${data.name_}"></c:out>
								</h4>
								<p>
									<em><c:out value="${data.about_me}"></c:out></em>
								</p>
								<ul>
									<li><c:out value="${data.address}"></c:out></li>
									<li><c:out value="${data.phone}"></c:out></li>
									<li><c:out value="${data.email}"></c:out></li>
								</ul>
							</div>

						</c:forEach>

						<sql:query var="rs" dataSource="${db}">SELECT a.*, c.* from about a join contact_info c on a.user_id = c.user_id where a.user_id =${UserId} ;</sql:query>

						<h3 class="resume-title">Education</h3>
						<c:forEach var="data" items="${rs.rows}">
							<div class="resume-item">
								<h4>Master of Fine Arts &amp; Graphic Design</h4>
								<h5>2015 - 2016</h5>
								<p>
									<em>Rochester Institute of Technology, Rochester, NY</em>
								</p>
								<p>Qui deserunt veniam. Et sed aliquam labore tempore sed
									quisquam iusto autem sit. Ea vero voluptatum qui ut dignissimos
									deleniti nerada porti sand markend</p>
							</div>
						</c:forEach>
					</div>
					<div class="col-lg-6" data-aos="fade-up" data-aos-delay="100">
						<h3 class="resume-title">Professional Experience</h3>

						<div class="resume-item">
							<h4>Senior graphic design specialist</h4>
							<h5>2019 - Present</h5>
							<p>
								<em>Experion, New York, NY </em>
							</p>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Blanditiis quia aperiam dignissimos vel odio autem sunt qui
								quisquam, maxime eligendi sit perspiciatis fuga provident nemo
								voluptate illo. Placeat, dolore esse.</p>
							<!-- <ul>
                <li>Lead in the design, development, and implementation of the graphic, layout, and production communication materials</li>
                <li>Delegate tasks to the 7 members of the design team and provide counsel on all aspects of the project. </li>
                <li>Supervise the assessment of all graphic materials in order to ensure quality and accuracy of the design</li>
                <li>Oversee the efficient use of production project budgets ranging from $2,000 - $25,000</li>
              </ul> -->
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End Resume Section -->

		<!-- ======= Contact Section ======= -->
		<section id="contact" class="contact">
			<div class="container">

				<div class="section-title">
					<h2>Contact</h2>
					<!-- <p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p> -->
				</div>

				<div class="row" data-aos="fade-in">
					<sql:query var="rs" dataSource="${db}">SELECT * FROM contact_info where user_id =${UserId} ;</sql:query>

					<c:forEach var="data" items="${rs.rows}">
						<div class="col-lg-5 d-flex align-items-stretch">
							<div class="info">
								<div class="address">
									<i class="bi bi-geo-alt"></i>
									<h4>Location:</h4>
									<p>
										<c:out value="${data.address}"></c:out>
									</p>
								</div>

								<a href="mailto:admin@gmail.com">
									<div class="email">
										<i class="bi bi-envelope"></i>
										<h4>Email:</h4>
										<p>
											<c:out value="${data.email}"></c:out>
										</p>
									</div>
								</a>

								<div class="phone">
									<i class="bi bi-phone"></i>
									<h4>Call:</h4>
									<p>
										<c:out value="${data.phone}"></c:out>
									</p>
								</div>
							</div>


						</div>
					</c:forEach>

					<div class="col-lg-7 mt-5 mt-lg-0 d-flex align-items-stretch">
						<form action="../SendMessage" method="post">
							<input type="hidden" name="user_id"
								value="<c:out value="${UserId}"></c:out>">
							<div class="row">
								<div class="form-group col-md-6">
									<label for="name">Your Name</label> <input type="text"
										name="name" placeholder="Enter name" class="form-control"
										required>
								</div>
								<div class="form-group col-md-6">
									<label for="email">Your Email</label> <input type="email"
										name="email" placeholder="Enter email" class="form-control"
										required>
								</div>
							</div>
							<div class="form-group">
								<label for="message">Message</label>
								<textarea class="form-control" name="message" id="message"
									rows="10" required></textarea>
							</div>
							<div class="text-center">
								<button type="submit" name="submit">Send Message</button>
							</div>
						</form>
					</div>

				</div>

			</div>
		</section>
		<!-- End Contact Section -->

	</main>
	<!-- End #main -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script src="assets/vendor/aos/aos.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="assets/vendor/typed.js/typed.min.js"></script>
	<script src="assets/vendor/waypoints/noframework.waypoints.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>

</body>

</html>