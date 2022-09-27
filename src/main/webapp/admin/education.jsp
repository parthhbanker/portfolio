<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/portfolio" user="root" password="root" />
<jsp:include page="header.jsp" />
<%!int study;%>
<%
if (request.getParameter("check") == null)
	study = 0;
else
	study = 1;
%>

<c:if test="${pageContext.request.method=='POST'}">
	<sql:update dataSource="${db}" var="count">  
		UPDATE education SET 
			school = "<%=request.getParameter("school")%>", 
			college="<%=request.getParameter("college")%>", 
			degree= "<%=request.getParameter("degree")%>",
			start_date= "<%=request.getParameter("start_date")%>",
			end_date="<%=request.getParameter("end_date")%>",
	        study="<%=study%>"
		where user_id = ${user_id}
	</sql:update>

	<c:if test="${count eq \"0\" or  \"null\"}">

		<sql:update dataSource="${db}" var="count">  
			INSERT INTO education(school ,college,degree, start_date,end_date,study, user_id) VALUES
			 ("<%=request.getParameter("school")%>","<%=request.getParameter("college")%>", "<%=request.getParameter("degree")%>",
			 "<%=request.getParameter("start_date")%>","<%=request.getParameter("end_date")%>","<%=study%>", ${user_id} );
		</sql:update>

	</c:if>


</c:if>

<div class="content pb-0">
	<div class="animated fadeIn">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-header">
						<strong>Education</strong> <span class="box-link"
							style="float: right;"> <label class="switch"> <input
								id="edit" type="checkbox" onclick="formSetting()"> <span
								class="slider round"></span>
						</label>
						</span>
					</div>
					<form method="post" action="education.jsp" id="editForm">
						<div class="card-body card-block">
							<div class="form-group">

								<sql:query var="rs" dataSource="${db}">SELECT * from education where user_id = ${user_id} ;	</sql:query>

								<div class="form-group">
									<label for="education" class=" form-control-label">school</label>
									<input type="text" value="${rs.rows[0].school}" name="school"
										class="form-control" id="sch" required disabled>

								</div>

								<div class="form-group">
									<label for="education" class=" form-control-label">college</label>
									<input type="text" value="${rs.rows[0].college}" name="college"
										class="form-control" required disabled>

								</div>


								<div class="form-group">
									<label for="education" class=" form-control-label">graduation</label>
									<input type="text" class="form-control"
										value="${rs.rows[0].degree}" name="degree" required disabled>
								</div>


								<div class="form-group">
									<label for="education" class=" form-control-label">start_date</label>
									<input type="date" class="form-control" name="start_date"
										value="${rs.rows[0].start_date}" required disabled>
								</div>

								<div class="form-group">
									<label for="education" class=" form-control-label">end_date</label>
									<input type="date" class="form-control" name="end_date"
										value="${rs.rows[0].end_date}" required disabled>
								</div>

								<c:choose>
									<c:when test="${rs.rows[0].study==true}">
										<div class="form-group ml-4">

											<input type="checkbox" class="form-check-input" name="check"
												checked disabled> currently studying
										</div>
									</c:when>
									<c:otherwise>
										<div class="form-group ml-4">

											<input type="checkbox" class="form-check-input" name="check"
												disabled> currently studying
										</div>
									</c:otherwise>
								</c:choose>

								<button id="payment-button" name="submit" type="submit"
									class="btn btn-lg btn-info btn-block" disabled>
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
<script>
	
</script>
<!-- FOOTER -->
<jsp:include page="footer.jsp" />
