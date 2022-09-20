<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<jsp:include page="header.jsp" />  
<div class="content pb-0">
            <div class="animated fadeIn">
               <div class="row">
                  <div class="col-lg-12">
                     <div class="card">
                        <div class="card-header"><strong>Contact Information</strong><small> Form</small>
                           <h4 class="box-link"><a href="">Edit</a> </h4></div>
                        <form method="post" enctype="multipart/form-data">
							<div class="card-body card-block">
							   <div class="form-group">
								
								<div class="form-group">
									<label for="contact" class=" form-control-label">Address</label>
									<textarea name="address" class="form-control" required></textarea>
								</div>

                        <div class="form-group">
									<label for="contact" class=" form-control-label">Phone</label>
									<textarea name="phone" class="form-control" required></textarea>
								</div>

                        <div class="form-group">
									<label for="contact" class=" form-control-label">Email</label>
									<textarea name="email" class="form-control" required></textarea>
								</div>
								
							   <button id="payment-button" name="submit" type="submit" class="btn btn-lg btn-info btn-block" disabled>
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