<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- HEADER -->
<!doctype html>
<html class="no-js" lang="">

   <head>
      <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <title>Dashboard Page</title>
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
   
   <%
   
   response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
   
   /* if(application.getAttribute("user") == null){

	   out.print("user not found");
	   response.sendRedirect("dashboard.jsp");
   }  */
   
   %>

   <body>
      <aside id="left-panel" class="left-panel">
         <nav class="navbar navbar-expand-sm navbar-default">
            <div id="main-menu" class="main-menu collapse navbar-collapse">
               <ul class="nav navbar-nav">
                  <li class="menu-title">Menu</li>
                  
                  <li class="menu-item-has-children dropdown">
                     <a href="about_me.jsp" > About Me</a>
                  </li>
				      
                  <li class="menu-item-has-children dropdown">
                     <a href="contact_info.jsp" > Contact Information</a>
                  </li>
				      <li class="menu-item-has-children dropdown">
                     <a href="users.jsp" > Edit Profile</a>
                  </li>

                  <li class="menu-item-has-children dropdown">
                     <a href="contact_us.jsp" > Messages</a>
                  </li>

                  <li>
                     <a href="../logout"> <i class="menu-icon fa fa-sign-out"></i>Logout </a>  
                  </li>
				  
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
                     Welcome <%= getServletContext().getAttribute("user") %>
                  </div>
               </div>
            </div>
         </header>