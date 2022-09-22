<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="header.jsp" />
<%@ page import="servlet.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!--  -->
<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/portfolio" user="root" password="root" />

<div class="content pb-0">
	<div class="orders">
		<div class="row">
			<div class="col-xl-12">
				<div class="card">
					<div class="card-body">
						<h4 class="box-title">Skills</h4>
						<h4 class="box-link">
							<a href="add_skill.jsp">Add Skill</a>
						</h4>
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
								<% int i = 1; %>

									<sql:query var="rs" dataSource="${db}">SELECT s.* , c.category_name from skills s , categories c where s.user_id = ${user_id} and s.user_id = c.user_id and s.category = c.id ;</sql:query>

									<c:forEach var="data" items="${rs.rows}">
						
										<tr>
											<td><%= i++ %></td>
											<td><c:out value="${data.skill}"></c:out></td>
											<td><c:out value="${data.category_name}"></c:out></td>
											<td>&nbsp;<span
												class='badge badge-edit'><a
													href='manage_plant.php?id=1'>Edit</a></span>&nbsp;<span
												class='badge badge-delete'><a
													href='?type=delete&id=1'>Delete</a></span></td>
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

<div class="clearfix"></div>
<footer class="site-footer">
	<div class="footer-inner bg-white">
		<div class="row">
			<div class="col-sm-6">Copyright &copy;</div>

		</div>
	</div>
</footer>
</div>
<script src="assets/js/vendor/jquery-2.1.4.min.js"
	type="text/javascript"></script>
<script src="assets/js/popper.min.js" type="text/javascript"></script>
<script src="assets/js/plugins.js" type="text/javascript"></script>
<script src="assets/js/main.js" type="text/javascript"></script>
</body>
</html>