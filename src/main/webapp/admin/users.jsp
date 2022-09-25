<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
<%@ page import="servlet.data"  %>

<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/portfolio" user="root" password="root" />

<c:if test="${pageContext.request.method=='POST'}">
	<sql:update dataSource="${db}" var="count">  
		UPDATE user SET 
			username = "<%= request.getParameter("username") %>", 
			pass= "<%= data.getMd5(request.getParameter("password")) %>", 
			email= "<%= request.getParameter("email") %>"
		where id = ${user_id}
	</sql:update> 
</c:if>


<jsp:include page="header.jsp" />
<div class="content pb-0">
	<div class="animated fadeIn">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-header">
						<strong>User</strong> <span class="box-link" style="float: right;"><label
							class="switch"> <input id="edit" type="checkbox"
								onclick="formSetting()"> <span class="slider round"></span>
						</label> </span>
					</div>
					<form method="post" id="editForm" action="users.jsp">
						<sql:query var="rs" dataSource="${db}">SELECT * from user where id =${user_id} ; </sql:query>

						<c:forEach var="data" items="${rs.rows}">
							<div class="card-body card-block">
								<div class="form-group">
									<div class="form-group">
										<label for="users" class=" form-control-label">User
											Name</label> <input type="text" name="username"
											placeholder="Enter user name" class="form-control"
											value='<c:out value="${data.username}"></c:out>' required
											disabled>
									</div>

									<div class="form-group">
										<label for="users" class=" form-control-label">Email</label> <input
											type="email" name="email" placeholder="Enter email"
											class="form-control"
											value='<c:out value="${data.email}"></c:out>' required
											disabled>
									</div>

									<div class="form-group">
										<label for="users" class=" form-control-label">Password</label>
										<input type="password" name="password"
											placeholder="Enter password" class="form-control"
											value='<c:out value="${data.pass}"></c:out>' required
											disabled>
									</div>

									<button id="payment-button" name="submit" type="submit"
										class="btn btn-lg btn-info btn-block" disabled>
										<span id="payment-button-amount">Submit</span>
									</button>
								</div>
							</div>
						</c:forEach>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>


<jsp:include page="footer.jsp" />