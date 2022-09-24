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
		INSERT INTO categories(category_name ,user_id ) VALUES( "<%=request.getParameter("title")%>" , ${user_id});
	</sql:update>
	<%
	response.sendRedirect("categories.jsp");
	%>

</c:if>


<c:if test="${not empty param.id}">

	<sql:update dataSource="${db}" var="count">  
		DELETE FROM categories where id = ${param.id} ;
	</sql:update>

	<%
	response.sendRedirect("categories.jsp");
	%>

</c:if>

<form method="post" action="categories.jsp" id="editForm">

	


	<div class="card-body card-block">

		
		<div class="container mt-3">
		<label for="contact" class=" form-control-label">Add Category</label>
		<div class="input-group mb-3">
			<input type="text" name="title" class="form-control"
				placeholder="Add Category" required>

			<div class="input-group-append">
				<button id="add_category" name="submit" type="submit"
					class="btn bg-secondary text-white">
					<span>Add Category</span>
				</button>
			</div>
		</div>


	</div>

	</div>
</form>

<div class="content pb-0">
	<div class="orders">
		<div class="row">
			<div class="col-xl-12">
				<div class="card">
					<div class="card-body">
						<h4 class="box-title">Categories</h4>
						<h4 class="box-link">
							<!-- <a href="manage_plant.php">Add category</a> -->
						</h4>
					</div>
					<div class="card-body--">
						<div class="table-stats order-table ov-h">
							<table class="table ">
								<thead>
									<tr>
										<th>Title</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<sql:query var="rs" dataSource="${db}">select * from categories c  where c.user_id = ${user_id} ;</sql:query>
									<c:forEach var="data" items="${rs.rows}">

										<tr>
											<td><c:out value="${data.category_name}"></c:out></td>
											<td>&nbsp;<span class='badge badge-edit'><a
													href='edit_category.jsp?id=${data.id}'>Edit</a></span>&nbsp;<span
												class='badge badge-delete'><a
													href='categories.jsp?id=${data.id}'>Delete</a></span></td>
										</tr>


										<tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="footer.jsp" />
