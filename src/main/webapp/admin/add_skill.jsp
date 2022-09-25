<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/portfolio" user="root" password="root" />
<jsp:include page="header.jsp" />

<c:if test="${pageContext.request.method=='POST'}">

	<c:choose>

		<c:when test="${param.execute eq \"Submit\"}">

			<sql:update dataSource="${db}" var="count">  
				INSERT INTO skills(skill , user_id , category, level) VALUES ("<%=request.getParameter("title")%>", ${user_id} , (select c.id from categories c where category_name = "<%= request.getParameter("skills") %>" and c.user_id = ${user_id}) , <%=request.getParameter("level")%> );
			</sql:update>

		</c:when>

		<c:when test="${param.execute eq \"Update\"}">

			<sql:update dataSource="${db}" var="count">  
				UPDATE skills SET 
				category = (select id from categories where category_name = "<%=request.getParameter("skills")%>" and user_id = ${user_id}), 
				skill= "<%=request.getParameter("title")%>", 
				level= <%=request.getParameter("level")%>
				where user_id = ${user_id} and id = "<%=request.getParameter("save_skill")%>";
			</sql:update>

		</c:when>

	</c:choose>

	<%
	response.sendRedirect("skills.jsp");
	%>

</c:if>

<c:choose>

	<c:when test="${not empty param.id}">

		<sql:query var="skill" dataSource="${db}">SELECT s.* , category_name from skills s , categories c where s.id = "${param.id}" and s.user_id = ${user_id} and c.id = s.category ;</sql:query>
		<c:set var="level" value="${skill.rows[0].level}"></c:set>
		<c:set var="skill_name" value="${skill.rows[0].skill}"></c:set>
		<c:set var="category_name" value="${skill.rows[0].category_name}"></c:set>

		<c:set var="page_name" value="Edit Skill"></c:set>
		<c:set var="submit_button" value="Update"></c:set>

	</c:when>
	<c:otherwise>

		<c:set var="page_name" value="Add Skill"></c:set>
		<c:set var="submit_button" value="Submit"></c:set>

	</c:otherwise>

</c:choose>


<div class="content pb-0">
	<div class="animated fadeIn">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-header">
						<strong> ${page_name} </strong> 
					</div>
					<form method="post" action="add_skill.jsp" id="editForm">
						<input type="hidden" name="execute" value="${submit_button}">
						<input type="hidden" name="save_skill" value="${param.id}">
						<div class="card-body card-block">
							<div class="form-group">

								<sql:query var="rs" dataSource="${db}">SELECT * from categories where user_id = ${user_id} ;</sql:query>
								<div class="form-group">
									<label for="skills" class=" form-control-label">Skills</label>
									<!-- get data and fill in the options -->
									<select name="skills" class=" form-control">
										<c:forEach var="skill_catagories" items="${rs.rows}">

											<c:choose>

												<c:when
													test="${not empty param.id && category_name eq skill_catagories.category_name }">
													<%="selected"%>
													<option selected="selected"
														value="${skill_catagories.category_name}">
														${skill_catagories.category_name}</option>

												</c:when>
												<c:otherwise>
													<%="not selected"%>
													<option value="${skill_catagories.category_name}">
														${skill_catagories.category_name}</option>

												</c:otherwise>

											</c:choose>

										</c:forEach>
									</select>
								</div>

								<div class="form-group">
									<label for="contact" class=" form-control-label">Title</label>
									<input type="text" name="title" class="form-control"
										value="${skill_name}" required >
								</div>

								<div class="form-group">
									<label for="contact" class=" form-control-label">Level</label>
									<input type="number" name="level" class="form-control" min="0"
										max="100" value="${level}" required>
								</div>

								<c:choose>

									<c:when test="${not empty param.id}">

										<button id="payment-button" name="submit" type="submit"
											class="btn btn-lg btn-info btn-block">
											<span id="payment-button-amount">Update</span>
										</button>

									</c:when>

									<c:when test="${empty param.id}">


										<button id="payment-button" name="submit" type="submit"
											class="btn btn-lg btn-info btn-block">
											<span id="payment-button-amount">Submit</span>
										</button>

									</c:when>

								</c:choose>
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
