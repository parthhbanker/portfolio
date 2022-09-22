<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/portfolio" user="root" password="root" />
<jsp:include page="header.jsp" />

<c:if test="${pageContext.request.method=='POST'}">
	<sql:update dataSource="${db}" var="count">  
		INSERT INTO skills(skill , user_id , category, level) VALUES ("<%=request.getParameter("title")%>", ${user_id} , (select c.id from categories c where category_name = "Language Siklls" and c.user_id = ${user_id}) , <%=request.getParameter("level")%> );
	</sql:update>
	<%
	response.sendRedirect("skills.jsp");
	%>
</c:if>

<div class="content pb-0">
	<div class="animated fadeIn">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-header">
						<strong>Add Skill</strong><small> Form</small>
					</div>
					<form method="post" action="add_skill.jsp" id="editForm">
						<div class="card-body card-block">
							<div class="form-group">

								<sql:query var="rs" dataSource="${db}">SELECT category_name from categories where user_id = ${user_id} ;</sql:query>
								<div class="form-group">
									<label for="skills" class=" form-control-label">Skills</label>
									<!-- get data and fill in the options -->
									<select name="skills" class=" form-control">
										<c:forEach var="skill_catagories" items="${rs.rows}">
											<option value="${skill_catagories.category_name}">
												${skill_catagories.category_name}</option>
										</c:forEach>
									</select>
								</div>

								<div class="form-group">
									<label for="contact" class=" form-control-label">Title</label>
									<input type="text" name="title" class="form-control">
								</div>

								<div class="form-group">
									<label for="contact" class=" form-control-label">Level</label>
									<input type="number" name="level" class="form-control" min="0"
										max="100">
								</div>

								<button id="payment-button" name="submit" type="submit"
									class="btn btn-lg btn-info btn-block">
									<span id="payment-button-amount">Submit</span>
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- FOOTER -->
<jsp:include page="footer.jsp" />
