<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/portfolio" user="root" password="root" />
<jsp:include page="header.jsp" />

<c:if test="${pageContext.request.method=='POST'}">

	<sql:update dataSource="${db}" var="count">  
		UPDATE contact_info SET 
			address = "${param.address}", 
			phone= "${param.phone}", 
			email= "${param.email}"
		where user_id = ${user_id}
	</sql:update>

	<c:if test="${count eq \"0\" or count eq \"null\"}">

		<sql:update dataSource="${db}" var="count">  
			INSERT INTO contact_info(address , phone, email, user_id) VALUES ("${param.address}", "${param.phone}", "${param.email}", ${user_id} );
		</sql:update>

	</c:if>

</c:if>

<div class="content pb-0">
	<div class="animated fadeIn">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-header">
						<strong>Contact Information</strong><small> Form</small>
						<h4 class="box-link">
							<label class="switch"> <input id="edit" type="checkbox"
								onclick="formSetting()"> <span class="slider round"></span>
							</label>
						</h4>
					</div>
					<form method="post" action="contact_info.jsp" id="editForm">
						<div class="card-body card-block">
							<div class="form-group">

								<sql:query var="rs" dataSource="${db}">SELECT * from contact_info where user_id = ${user_id} ;	</sql:query>

								<div class="form-group">
									<label for="contact" class=" form-control-label">Address</label>
									<textarea name="address" class="form-control" required disabled><c:out
											value="${rs.rows[0].address}" /></textarea>
								</div>

								<div class="form-group">
									<label for="contact" class=" form-control-label">Phone</label>
									<textarea name="phone" class="form-control" required disabled><c:out
											value="${rs.rows[0].phone}" /></textarea>
								</div>

								<div class="form-group">
									<label for="contact" class=" form-control-label">Email</label>
									<textarea name="email" class="form-control" required disabled><c:out
											value="${rs.rows[0].email}" /></textarea>
								</div>

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

<!-- FOOTER -->
<jsp:include page="footer.jsp" />
