<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<link href="css/style.css" rel="stylesheet">
</head>
<body>
<div class="container text-center ">
<img alt="" src="img/error.png"class="img-fluid"style="width:60vh">
<h3 class="display-3">Something went wrong...</h3>
<%= exception %>
<a href ="login.jsp"class="btn primary-baground btn-lg text-white mt-3">Home</a>
</div>



</body>
</html>