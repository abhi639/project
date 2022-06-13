<%@page import="register.model.Categories"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="register.dao.RegisterDao" %>
    <%@ page import="register.model.RegisterModel" %>
    <%@ page import="register.model.Mess" %>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.LinkedList" %>
    <%@ page import="register.dao.PostDao" %>
        <%@ page import="register.model.Categories" %>
 <%@page errorPage="error.jsp" %>
   <%
    RegisterModel user=(RegisterModel)session.getAttribute("currentuser");
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile page</title>
    <!-- CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<link href="css/style.css" rel="stylesheet">
       
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
	.banner-backgrround{
clip-path: polygon(0 0, 100% 0, 100% 98%, 86% 92%, 66% 94%, 35% 95%, 15% 92%, 0 95%);}
	 body{
                background:url(img/a.jpg);
                background-size: cover;
                background-attachment: fixed;
                
            }
	</style>
	      <script src="js/myjs.js" type="text/javascript"></script>
</head>
<body>
 <%try{ %>
<nav class="navbar navbar-expand-lg navbar-dark primary-baground">
  <a class="navbar-brand" href="#"><span class="	fa fa-newspaper-o"></span>Abhijit Blog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#"><span class="fa fa-home"></span>Home <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      <span class="fa fa-calendar-check-o"></span> Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
     <li class="nav-item active">
        <a class="nav-link" href="#"data-toggle="modal" data-target="#add-post-model"><span class="	fa fa-envelope-o"></span>DoPost <span class="sr-only">(current)</span></a>
      </li>
       
    </ul>
    <ul class="navbar-nav mr-right">
     <li class="nav-item">
        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="	fa fa-user-circle"></span><%=user.getName() %></a>
      </li>
    <li class="nav-item">
        <a class="nav-link" href="LogoutServlet"><span class="fa fa-sign-out"></span>Log out</a>
      </li>
    
    </ul>
  </div>
</nav>

 <!-- End of nav -->
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
                         <!-- stating of main content -->
                         <br>
<main>
<div class="container">

 <div class="row mt-4">
<div class="col-md-4"> 
<!-- categories -->
<div class="list-group">
  <a href="#" onclick="getpost(0,this)"class="c-link list-group-item list-group-item-action active">
   All Posts
  </a>
  <%
  PostDao d=new PostDao();
 List<Categories>list1=d.getallCategories();
 for(Categories cc:list1){
  
  %>
  <a href="#" onclick="getpost(<%=cc.getcId()%>,this)"class="c-link list-group-item list-group-item-action"><%=cc.getName() %></a>
 <%} %>
</div>
</div>
<div class="col-md-8"> 
<!-- Posts -->
<div class="container text-center"id="loader1">
 <i class="fa fa-refresh fa-4x fa-spin"></i>
  <h3 class="mt-2">Loading...</h3>

</div>
<div class="container-fluid" id="post-container">


</div>
</div>
</div>

</div>


</main>
 <!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-baground text-white text-center">
        <h5 class="modal-title" id="exampleModalLabel">Tech Blog</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="container text-center">
     <img class="img-fluid"src="pics/<%=user.getProfile()%>" style="width:150px">
        <h5 class="modal-title" id="exampleModalLabel"><%=user.getName() %></h5>
        <!-- detailes -->
        <div id="profile-details">
        <table class="table">
  
  <tbody>
    <tr>
      <th scope="row">ID</th>
      <td><%=user.getId() %></td>
      
    </tr>
    <tr>
      <th scope="row">Gmail</th>
      <td><%=user.getEmail() %></td>
     
    </tr>
    <tr>
      <th scope="row">Gender</th>
      <td><%=user.getGender() %></td>
     
    </tr>
     <tr>
      <th scope="row">Registered on</th>
      <td><%=user.getTimestamp() %></td>
      
    </tr>
    <tr>
      <th scope="row">About</th>
      <td><%=user.getAbout() %></td>
      
    </tr>
  </tbody>
</table>
      </div>  
      <div id="profile-edit"style="display:none;">
      <h3 class="mt-2">Please edit carefully</h3>
      <form action="EditServlet" method="POST" enctype="multipart/form-data">
      <table class="table">
      <tr>
      <td>ID</td>
      <td><%=user.getId() %></td>
      </tr>
      <tr>
      <td>Name:</td>
      <td><input type="text"name="name" value="<%=user.getName()%>"></td>
      </tr>
      <tr>
      <td>Email:</td>
      <td><input type="email"name="email" value="<%=user.getEmail()%>"></td>
      </tr>
      <tr>
      <td>Password:</td>
      <td><input type="password"name="password" value="<%=user.getPassword()%>"></td>
      </tr>
      <tr>
      <td>Gender:</td>
      <td><input type="text"name="gender" value="<%=user.getGender()%>"></td>
      </tr>
      <tr>
      <td>About:</td>
      <td> <textarea rows="3" class="form-control" name="about"><%=user.getAbout() %></textarea></td>
      </tr>
      <tr>
      <td> New profile:</td>
      <td> <input type="file" name="image" class="form-control"></td>
      </tr>
      </table>
      <div class="container text-center">
      <button class="btn primary-baground text-white">Update</button>
      </div>
      
      </form>
      </div>
      </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="edit-profile-button"type="button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>
<!-- end of update model -->





<!-- start post model -->
<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="add-post-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"> provide post title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <form id="form-submit"action="AddpostServlet" method="POST" enctype="multipart/form-data">
      <div class="form group">
      <select class="form-control" name="cID">
      
      <option>---select category---</option>
      <%
      PostDao dao=new PostDao();
      List<Categories>list=dao.getallCategories();
      for(Categories c:list){
      
      %>
      <option value="<%=c.getcId()%>"><%=c.getName() %></option>
     <%}
      
      %>
      </select>
      
      
      </div><br>
           <div class="form-group">
           <input name="pTitle"type="text" placeholder="Enter Title" class="form-control">
           </div>      
      <div class="form-group">
      <textarea name="pcontent"class="form-control" style="height:200px"  placeholder="Enter your content"></textarea>
      
      </div>
      <div class="form-group">
      <textarea name="pcode"class="form-control" style="height:200px" placeholder="Enter your code"></textarea>
      
      </div>
       <div class="form-group">
       <label>Select your pic</label><br>
           <input type="file" name="ppic" class="form-control">
           </div>
           <div class ="container text-center">
           <button type="submit"class="btn btn-outline-primary">Post</button>
           </div>
      </form>
      </div>
     
    </div>
  </div>
</div>
<!--javascripts-->
        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  
      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
      
         <script>
         $(document).ready(function(){
          let editstatus=false;
        	 $('#edit-profile-button').click(function(){
        		 if(editstatus==false){
        		 $('#profile-details').hide();
        		 $('#profile-edit').show();
        		 editstatus=true;
        		$(this).text("Back");
        	 }
        	 else{
        		 $('#profile-details').show();
        		 $('#profile-edit').hide();
        		 editstatus=false;
        		 $(this).text("Edit");
        	 }
        	 })
        	 
         })
         
         
         </script>
         <script>
         $(document).ready(function(){
        	 
        	 $("#form-submit").on("submit",function(event){
        		 event.preventDefault();
        		 console.log("click buton");
        		 	let form=new FormData(this); 
        		 $.ajax({
        			 url:'AddpostServlet',
        			type:'POST',
        			data: form,
        			 
        			 success:function(data,textStatus,jqXHR){
        				 console.log("Submited buton");
        				 console.log(data);
        				 if(data.trim()=="done"){
        					 
        					 swal("Good job!", "Save Succesfully!", "success");
        				 }
        				 else{
        					 
        					 swal("Error!", "Somthing went wrong..try again...!", "error");
        					 
        				 }
        			 },
        		 error:function(jqXHR,textStatus,errorThrown){
        			 
        			 console.log("not Submited buton");
        			 swal("Error!", "Somthing went wrong..try again...!", "error");
        		 },
        			 processData:false,
        			 contentType:false,
        		 })
        		 
        	 }) 
         })
              </script>
              <script>
              
              function getpost(catId,temp){
            	  $("#loader1").show();
    			  $("#post-container").hide();
    			  $(".c-link").removeClass('active');
                     $.ajax({
            		  
            		  url:'loadpost.jsp',
            		  data: {cid: catId},
            		  success:function(data,textStatus,jqXHR){
            			  
            			  console.log(data);	
            			  $("#loader1").hide();
            			  $("#post-container").show();
            			  $("#post-container").html(data);
            			  $(temp).addClass('active');
            		  },
            		  
            		  
            	  })
            	  
              }
              $(document).ready(function(e){
            	  let allPostRef = $('.c-link')[0]
                  getpost(0, allPostRef);
            	           	  
                  })
              
                                         
              </script>
<%
}
 catch(Exception e){
	 
	   
	    	
	    	response.sendRedirect("login.jsp"); 
	 
 }
 
 
 %>
</body>
</html>