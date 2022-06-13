<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Blog</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link href="css/style.css" rel="stylesheet">
<link href="js/myjs.js" rel="text/javascript">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
	.banner-backgrround{
clip-path: polygon(30% 0%, 100% 0, 100% 88%, 75% 84%, 53% 91%, 28% 95%, 0 90%, 0 0);	}
	
	</style>
</head>
<body>
	<!-- navbar -->
	<%@include file="normalnav.jsp"%>
	<div class="container-fluid m-0 p-0">
		<div class="jumbotron primary-baground text-white banner-backgrround">
			<div class="container">
				<h1 class="display-3 ">Welcome to tech-blog</h1>
				<p>Programming is the process of creating a set 
				of instructions that tell a computer how to perform a 
				task. Programming can be done using a variety of computer programming languages, such as JavaScript, Python, and C++. Created by Pamela Fox</p>
			
			<p>If you’re a newbie to the world of coding and thinking about learning how to code? Are you looking for the best programming blogs to sharpen your coding skills? You’re in the right place.
             Here’s a list of some of the best programming and web development blogs that you can follow to improve your coding skills or learn better programming. Are you curious to find them out? Let’ find out the list of all the best programming blogs for 2022.</p>
			<button class="btn btn-outline-light btn-lg"><span class="fa fa-user-plus"></span>Start it,s</button>
						<a href="login.jsp"class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle-o fa-spin"></span>Login</a>
			
			</div>
		</div>
	</div>
<!-- cards -->

<div class="container">
<div class="row">
<div class="col-md-4">
<div class="card">
  <div class="card-body">
    <h5 class="card-title">Java Program</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class=" btn bg-primary text-white">Read more</a>
  </div>
</div>
</div>
<div class="col-md-4">
<div class="card">
  <div class="card-body">
    <h5 class="card-title">Java Program</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn bg-primary text-white">Read more</a>
  </div>
</div>
</div>
<div class="col-md-4">
<div class="card">
  <div class="card-body">
    <h5 class="card-title">Java Program</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class=" btn bg-primary text-white">Read more</a>
  </div>
</div>
</div>

</div>
<div class="row">
<div class="col-md-4">
<div class="card">
  <div class="card-body">
    <h5 class="card-title">Java Program</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class=" btn bg-primary text-white">Read more</a>
  </div>
</div>
</div>
<div class="col-md-4">
<div class="card">
  <div class="card-body">
    <h5 class="card-title">Java Program</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn bg-primary text-white">Read more</a>
  </div>
</div>
</div>
<div class="col-md-4">
<div class="card">
  <div class="card-body">
    <h5 class="card-title">Java Program</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class=" btn bg-primary text-white">Read more</a>
  </div>
</div>
</div>

</div>

</div>
</body>
</html>