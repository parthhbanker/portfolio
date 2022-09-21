<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
 <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 

<sql:setDataSource  var="db" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/portfolio" user="root"  password="root"/>
    
    
<jsp:include page="header.jsp" />  

<div class="content pb-0">
	<div class="orders">
	   <div class="row">
		  <div class="col-xl-12">
			 <div class="card">
				<div class="card-body">
				   <h4 class="box-title">Messages </h4>
				</div>
				<div class="card-body--">
				   <div class="table-stats order-table ov-h">
					  <table class="table ">
						 <thead>
							<tr>
							   <th>ID</th>
							   <th>Name</th>
							   <th>Email</th>
							   <th>Message</th>
							   <th>Date</th>
							   <th></th>
							</tr>
						 </thead>
						 <tbody>
						 <sql:query var="rs" dataSource="${db}">SELECT * from messages where user_id = ${user_id} ;	</sql:query>
							   
							   <c:forEach var="data" items="${rs.rows}"> 
							<tr>
							   <td><c:out value="${data.id}"></c:out></td>
							   <td><c:out value="${data.name_}"></c:out></td>
							   <td><c:out value="${data.email}"></c:out></td>
							   <td><c:out value="${data.message}"></c:out></td>
							   <td><c:out value="${data.date_}"></c:out></td>
							   <td></td>
							</tr>
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