<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 

<sql:setDataSource  var="db" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/portfolio" user="root"  password="root"/>
    
<jsp:include page="header.jsp" />  

<div class="content pb-0">
   <div class="animated fadeIn">
      <div class="row">
         <div class="col-lg-12">
            <div class="card">
               <div class="card-header"><strong>User</strong><small> Form</small><h4 class="box-link"><a href="">Edit</a> </h4></div>
               <form method="post" enctype="multipart/form-data">
               <sql:query var="rs" dataSource="${db}">SELECT * from user where id =${user_id} ;	</sql:query>
							   
				<c:forEach var="data" items="${rs.rows}"> 
				<div class="card-body card-block">
				   <div class="form-group">
					<div class="form-group">
						<label for="users" class=" form-control-label">User Name</label>
						<input type="text" name="username" placeholder="Enter user name" class="form-control" value='<c:out value="${data.username}"></c:out>' required>
					</div>

               <div class="form-group">
						<label for="users" class=" form-control-label">Email</label>
						<input type="email" name="email" placeholder="Enter email" class="form-control" value='<c:out value="${data.email}"></c:out>'  required>
					</div>

					<div class="form-group">
						<label for="users" class=" form-control-label">Password</label>
						<input type="password" name="password" placeholder="Enter password" class="form-control" value=	'<c:out value="${data.pass}"></c:out>'  required>
					</div>
					
				   <button id="payment-button" name="submit" type="submit" class="btn btn-lg btn-info btn-block" disabled>
				   <span id="payment-button-amount">Submit</span>
				   </button>
				   </c:forEach>  
			</form>
            </div>
         </div>
      </div>
   </div>
</div>

<div class="clearfix"></div>
         <footer class="site-footer">
            <div class="footer-inner bg-white">
               <div class="row">
                  <div class="col-sm-6">
                     Copyright &copy; Text
                  </div>
                  
               </div>
            </div>
         </footer>
      </div>
      <script src="assets/js/vendor/jquery-2.1.4.min.js" type="text/javascript"></script>
      <script src="assets/js/popper.min.js" type="text/javascript"></script>
      <script src="assets/js/plugins.js" type="text/javascript"></script>
      <script src="assets/js/main.js" type="text/javascript"></script>
   </body>
</html>