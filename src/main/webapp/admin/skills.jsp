<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="header.jsp" />
<%@ page import="servlet.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/portfolio" user="root" password="root" />

<c:if test="${not empty param.id}">

	<sql:update dataSource="${db}" var="count">  
		DELETE FROM skills where id = "${param.id}" ; 
	</sql:update>
	
	<%
	response.sendRedirect("skills.jsp");
	%>

</c:if>

<div class="content pb-0">
	<div class="orders">
		<div class="row">
			<div class="col-xl-12">
				<div class="card">
					<div class="card-body">
						<strong>About Me</strong>
						<span class="" style="float:right;">
							<a href="add_skill.jsp" class="btn text-decoration-none bg-secondary text-white" role="button">Add Skill</a>
						</span>
					</div>
					<div class="card-body--">
						<div class="table-stats order-table ov-h">
							<table class="table ">
								<thead>
									<tr>
										<th>ID</th>
										<th>Name</th>
										<th>Category</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<%
									int i = 1;
									%>
									

									<sql:query var="rs" dataSource="${db}">SELECT s.* , c.category_name from skills s , categories c where s.user_id = ${user_id} and s.user_id = c.user_id and s.category = c.id ;</sql:query>

									<c:forEach var="data" items="${rs.rows}">

										<tr>
											<td><%=i++%></td>
											<td><c:out value="${data.skill}"></c:out></td>
											<td><c:out value="${data.category_name}"></c:out></td>
											<td>&nbsp;<span class='badge badge-edit'><a
													href='add_skill.jsp?id=${data.id}'>Edit</a></span>&nbsp;<span
												class='badge badge-delete'><a
													href='skills.jsp?id=${data.id}'>Delete</a></span></td>
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