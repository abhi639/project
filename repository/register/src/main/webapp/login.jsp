<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="register.model.Mess" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>

        <!--css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<link href="css/style.css" rel="stylesheet">
       
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
	.banner-backgrround{
clip-path: polygon(0 0, 100% 0, 100% 98%, 86% 92%, 66% 94%, 35% 95%, 15% 92%, 0 95%);}
	
	</style>
</head>
<body>
	<%@include file="normalnav.jsp"%>
	<main class="primary-baground p-5 banner-backgrround">
		<div class="container ">
				<div class="col-md-4 offset-md-3 ">
				<div class="card">
			
					<div class="card-header text-center ">
						<span class="fa fa-3x fa-user-plus "></span><br>
						login here

					</div>
					<%
					Mess ms=(Mess)session.getAttribute("mssg");
					if(ms!=null){
					
					%>
					<div class="alert <%=ms.getCssclass() %>" role="alert">
                      <%=ms.getContent() %>
                         </div>
                         <% 
                         session.removeAttribute("mssg");
					     }
                         %>
					<div class="card-body ">
					
						<form action="LoginServlet" method="POST">
							<div class="form-group">
								<label for="emaildata">Email address</label>
								 <input name="email" required	type="email" class="form-control" id="emaildata"
									aria-describedby="emailHelp" placeholder="Enter email">
					
							</div>
							<div class="form-group">
								<label for="passworddata">Password</label> 
								<input name="password" required type="password" class="form-control" id="passworddata"
									placeholder="Password">
							</div>
							<div class="container text-center">
							<button type="submit" class="btn btn-primary">Submit</button>
	                        </div>					
						</form>
					</div>
				</div>
			</div>
		</div>
	</main>
<!--javascripts-->
        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
</body>
</html>