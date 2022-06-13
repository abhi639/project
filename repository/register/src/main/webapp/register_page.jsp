<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register page</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<link href="css/style.css" rel="stylesheet">
<link href="js/myjs.js" rel="text/javascript">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
	.banner-backgrround{
clip-path: polygon(30% 0%, 100% 0, 100% 93%, 68% 98%, 35% 94%, 17% 92%, 0 95%, 0 0);}
	
	</style>
</head>
<body>
<%@include file="normalnav.jsp"%>
<main class="primary-baground p-5 banner-backgrround">
<div class="container">
<div class="col-md-6 offset-md-3">
<div class="card">
<div class="card-header text-center">
<span class="fa fa-3x fa-user-circle"></span>


<br>
Register here
</div>
<div class="card-body">
<form id="reg-form"action="RegisterServlet" method="POST">
 <div class="form-group">
    <label for="user_name">User name</label>
    <input name="name"type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name">
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input name="email"type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  
  
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input name="password"type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  <div class="form-group">
    <label for="gender">Select Gender</label><br>
    <input type="radio"  id="gender" name="gen" value="male">Male
    <input type="radio"  id="gender" name="gen" value=female>female
  </div>
<div class="form-group">
<textarea name="about"class="form-control"rows="5" placeholder="Enter your self"></textarea>

</div>
  <div class="form-check">
    <input name="check"type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Agree terms and condition</label>
  </div>
  <br>
  <div class="container text-center "id="loader"style="display:none;">
  <span class="	fa fa-refresh fa-spin fa-4x"></span>
  <h4>Please wait...</h4>
  </div>
  <button id="submit-btn"type="submit" class="btn btn-primary">Submit</button>

</form>
</div>

</div>
</div>
</div>
</main>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>">
<script>
$(document).ready(function(){
	console.log("loaded");
	$('#reg-form').on('submit',function(event){
		event.preventDefault();
		let form=new FormData(this);
        $("#submit-btn").hide();
        $("#loader").show();
        $.ajax({
url:"RegisterServlet",
type:'POST',
data: form,
success:function(data,textStatus,jqXHR){
console.log(data);

$("#submit-btn").show();
$("#loader").hide();
if(data.trim()==='done'){
swal("Register successfully....we are going redirect to login page.")
.then((value) => {
 window.location="login.jsp"
});
}
        else{
        	
        	swal(data);
        	console.log("success");
        }
},
error:function(jqXHR,textStatus,errorThrown){

$("#submit-btn").show();
$("#loader").hide();
swal(" Not Register....")

},
processData:false,
contentType:false,
        })	
	});	
});
</script>

</body>
</html>