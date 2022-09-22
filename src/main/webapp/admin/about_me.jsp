<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
 <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 

<sql:setDataSource  var="db" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/portfolio" user="root"  password="root"/>
    
<jsp:include page="header.jsp" />  

<c:if test="${pageContext.request.method=='POST'}">
	<sql:update dataSource="${db}" var="count">  
		UPDATE about SET 
			name_ = "<%= request.getParameter("name") %>", 
			nationality= "<%= request.getParameter("nationality") %>", 
			about_me= "<%= request.getParameter("about_me") %>",
			positions= "<%= request.getParameter("positions") %>",
			projects= <%= request.getParameter("projects") %>
		where user_id = ${user_id}
	</sql:update> 
</c:if>

<div class="content pb-0">
            <div class="animated fadeIn">
               <div class="row">
                  <div class="col-lg-12">
                     <div class="card">
                        <div class="card-header"><strong>About Me</strong><small> Form</small>
                           <h4 class="box-link"><label class="switch">
  <input id="edit" type="checkbox" onclick="formSetting()">
  <span class="slider round"></span>
</label> </h4></div>
							   <sql:query var="rs" dataSource="${db}">SELECT * from about where user_id = ${user_id};	</sql:query>
							   <c:forEach var="data" items="${rs.rows}"> 
                        <form method="post" id="editForm" action="about_me.jsp">
							<div class="card-body card-block">
							   <div class="form-group">
							   
								<div class="form-group">
									<label for="about" class=" form-control-label">Name</label>
									<input type="text" name="name" id="name" value='<c:out value="${data.name_}"></c:out>' class="form-control" required disabled>
								</div>

                        <div class="form-group">
									<label for="about" class=" form-control-label">Nationality</label>
									<input type="text" name="nationality"  class="form-control" value='<c:out value="${data.nationality}"></c:out>' required disabled>
								</div>
								
								<div class="form-group">
									<label for="about" class=" form-control-label">About Me</label>
									<textarea name="about_me" class="form-control" required disabled><c:out value="${data.about_me}"></c:out></textarea>
								</div>

                        <div class="form-group">
									<label for="about" class=" form-control-label">My Positions</label>
									<textarea name="positions" class="form-control" required disabled><c:out value="${data.positions}"></c:out></textarea>
								</div>

                        <div class="form-group">
									<label for="about" class=" form-control-label">Projects</label>
									<input type="number" name="projects" value=	'<c:out value="${data.projects}"></c:out>' class="form-control" required disabled>
								</div>
								
							   <button id="payment-button" name="submit" type="submit"  class="btn btn-lg btn-info btn-block" disabled>
							   <span id="payment-button-amount">Submit</span>
							   </button>
							   </c:forEach>  
						</form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         
         <script>
         	function printD(){
         		alert(document.getElementById("name").value);
         	}
         </script>
         
<!-- FOOTER -->
<jsp:include page="footer.jsp" />  