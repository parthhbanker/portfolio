<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- <div class="clearfix"></div>
         <footer class="site-footer position-relative overflow-hidden container-fluid p-0" style="margin-top:100%">
            <div class="footer-inner bg-white m-0">
               <div class="row d-flex justify-content-center align-items-center">
                  <div class="col-sm-6 text-center">
                     Copyright &copy; Text
                  </div>
                  
               </div>
            </div>
         </footer>
      </div> -->
      <script src="assets/js/vendor/jquery-2.1.4.min.js" type="text/javascript"></script>
      <script src="assets/js/popper.min.js" type="text/javascript"></script>
      <script src="assets/js/plugins.js" type="text/javascript"></script>
      <script src="assets/js/main.js" type="text/javascript"></script>
      <script>
		function formSetting() {
			  // Get the checkbox
			  var checkBox = document.getElementById("edit");
			  if (checkBox.checked == true){
				  var form = document.getElementById("editForm");
				  var elements = form.elements;
				  for (var i = 0, len = elements.length; i < len; ++i) {
				      elements[i].disabled = false;
				  }
			  } else {
				  var form = document.getElementById("editForm");
				  var elements = form.elements;
				  for (var i = 0, len = elements.length; i < len; ++i) {
				      elements[i].disabled = true;
				  }
			  }
			}
		</script>
   </body>
</html>