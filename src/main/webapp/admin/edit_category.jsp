<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="header.jsp" />
<%@ page import="servlet.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/portfolio" user="root" password="root" />

<c:if test="${pageContext.request.method=='POST'}">
	<sql:update dataSource="${db}" var="count">  
		UPDATE categories SET category_name = "<%=request.getParameter("title")%>" WHERE id = <%=request.getParameter("id") %>;
	</sql:update>
	
	<% response.sendRedirect("categories.jsp"); %>
</c:if>

<form method="post" action="edit_category.jsp" id="editForm">
<input type="hidden" name="id" value="${param.id}" >
	<div class="card-body card-block">
		<div class="form-group">
		
			<div class="form-group">
			<sql:query var="rs" dataSource="${db}">sELECT category_name  from categories where id = ${param.id};</sql:query>
			
				<label for="contact" class=" form-control-label">Title</label> <input
					type="text" name="title" class="form-control" placeholder="title" value="${rs.rows[0].category_name}" >
					
			</div>

			<button id="add_category" name="submit" type="submit" class="btn btn-lg btn-info btn-block">
				<span>Update</span>
			</button>
			
		</div>
	</div>
</form>


<script src="assets/js/vendor/jquery-2.1.4.min.js"
	type="text/javascript"></script>
<script src="assets/js/popper.min.js" type="text/javascript"></script>
<script src="assets/js/plugins.js" type="text/javascript"></script>
<script src="assets/js/main.js" type="text/javascript"></script>
</body>
</html>