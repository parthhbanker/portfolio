<!-- create a modal in html using bootstrap to login -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
</head>
<body>

    <!-- make a center div with 40% of screen size -->
    <div class="container" style="width: 40%; margin-top: 10%;">
        <div class="card">
            <div class="card-header">
                <h3>Reset Password</h3>
            </div>
            <div class="card-body">
                <form action="login.php" method="post">
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" class="form-control" placeholder="Enter email" id="email" name="email">
                    </div>
                    <div class="text-center">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                            Forgot Password
                          </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- The Modal -->
    <div class="modal" id="myModal">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
    
          <!-- Modal Header -->
          <div class="modal-header">
            <h4 class="modal-title">Security Questions</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
    
          <!-- Modal body -->
          <div class="modal-body">
            <!-- make a simple html form to ask name and email -->
            <form action="forgot.php" method="post">
                <div class="form-group">
                    <label for="forgot">City:</label>
                    <input type="text" class="form-control" id="city" placeholder="Enter city you were born" name="city">
                </div>
                <div class="form-group">
                    <label for="nickname">Nickname:</label>
                    <input type="nickname" class="form-control" id="nickname" placeholder="Enter your nickname" name="nickname">
                </div>
                <!-- enter dob -->
                <div class="form-group">
                    <label for="dob">Date of Birth:</label>
                    <input type="date" class="form-control" id="dob" placeholder="Enter your date of birth" name="dob">
                </div>
            <!-- center submit button -->
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
            </form>
          </div>
        </div>
      </div>
    </div>


</body>
</html>