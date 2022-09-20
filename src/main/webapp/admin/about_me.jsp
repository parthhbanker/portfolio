<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<jsp:include page="header.jsp" />  

<%! String data="disabled"; %>  

<div class="content pb-0">
            <div class="animated fadeIn">
               <div class="row">
                  <div class="col-lg-12">
                     <div class="card">
                        <div class="card-header"><strong>About Me</strong><small> Form</small>
                           <% 
                           
                           	out.print("<h4 class='box-link'><button name='edit' type='submit' class='btn btn-lg  btn-info' onclick=hey()");
                           %>
							   <span id="payment-button-amount">Edit</span>
							   </button> </h4></div>
                        <form method="post" enctype="multipart/form-data">
							<div class="card-body card-block">
							   <div class="form-group">
								<div class="form-group">
									<label for="about" class=" form-control-label">Name</label>
									<input type="text" name="name"  class="form-control" required>
								</div>

                        <div class="form-group">
									<label for="about" class=" form-control-label">Nationality</label>
									<input type="text" name="nationality"  class="form-control" required>
								</div>
								
								<div class="form-group">
									<label for="about" class=" form-control-label">About Me</label>
									<textarea name="about_me" class="form-control" required></textarea>
								</div>

                        <div class="form-group">
									<label for="about" class=" form-control-label">My Positions</label>
									<textarea name="positions" class="form-control" required></textarea>
								</div>

                        <div class="form-group">
									<label for="about" class=" form-control-label">Projects</label>
									<input type="number" name="projects"  class="form-control" required>
								</div>
								
							   <button id="payment-button" name="submit" type="submit" class="btn btn-lg btn-info btn-block" <%= data	 %>>
							   <span id="payment-button-amount">Submit</span>
							   </button>
							   
						</form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         
<!-- FOOTER -->
<div class="clearfix"></div>
         <footer class="site-footer">
            <div class="footer-inner bg-white">
               <div class="row">
                  <div class="col-sm-6">
                     Copyright &copy; Text
                  </div>
                  
               </div>
            </div>
         </footer>
      </div>
      <script src="assets/js/vendor/jquery-2.1.4.min.js" type="text/javascript"></script>
      <script src="assets/js/popper.min.js" type="text/javascript"></script>
      <script src="assets/js/plugins.js" type="text/javascript"></script>
      <script src="assets/js/main.js" type="text/javascript"></script>
   </body>
</html>