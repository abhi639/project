<%@page import="register.dao.LikeDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="register.model.Post" %>
     <%@ page import="register.dao.PostDao" %>
      <%@ page import="java.util.ArrayList" %>
    <%@ page import="register.dao.RegisterDao" %>
    <%@ page import="register.model.RegisterModel" %>
    <%@ page import="register.model.Mess" %>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.LinkedList" %>
    <%@ page import="register.dao.PostDao" %>
        <%@ page import="register.model.Categories" %>
        <%@ page import="java.text.DateFormat" %>
        <%@ page import="register.dao.LikeDao" %>
   <%
    RegisterModel user=(RegisterModel)session.getAttribute("currentuser");
	if(user==null){
   
   response.sendRedirect("login.jsp");
	}
    %>
    <%
    int postid=Integer.parseInt(request.getParameter("post_id"));
   PostDao da=new PostDao();
    Post pa=da.getpostById(postid);
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=pa.getpTitel() %></title>
<!-- CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<link href="css/style.css" rel="stylesheet">
       
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
	.banner-backgrround{
clip-path: polygon(0 0, 100% 0, 100% 98%, 86% 92%, 66% 94%, 35% 95%, 15% 92%, 0 95%);}
	
	</style>
	<style>
	.post-title{
                font-weight: 100;
                font-size: 30px;
            }
            .post-content{
                font-weight: 100;
                font-size: 18px;

            }
            .post-date{
                font-style: italic;
                font-weight: bold;
                font-size: 13px;
            }
            .post-user-info{
                font-size: 13px;

            }


            .row-user{
                border:1px solid #e2e2e2;
                padding-top: 20px;
            }

            body{
                background:url(img/a.jpg);
                background-size: cover;
                background-attachment: fixed;
                
            }
            </style>
            <script src="js/myjs.js" type="text/javascript"></script>
</head>
<body>
<body>

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
                        
                         <div class="container">
                         <div class="row">
                         <div class="col-md-6 offset-md-3">
                         <div class="card border-info mb-3">
                         <div class="card-header text-info text-center">
                        <h4 class="post-title"><%=pa.getpTitel() %></h4>
                         
                         </div>
                         
                         
                         <div class="card-body ">
                           <img class="card-img-top my-2" src="bogpic/<%= pa.getpPic()%>" alt="Card image cap">
                           <div class="row my-3 row-user">
                           <div class="col-md-8">
                           <%
                           RegisterDao u=new RegisterDao();
                         RegisterModel r=  u.getpostByid(pa.getUserId());
                           %>
                                <p class="post-user-info"><a href="#!"><%=r.getName() %></a> has posted</p>                    
                          
                           </div>
                           <div class="col-md-4">
                           
                           <p class="post-date"><%=pa.getpTime()%> </p>
                           </div>
                           
                           </div>
                         <p class="post-content"> <%=pa.getpContent() %></p>
                         <div class="post-code">
                         <pre><%=pa.getpCode() %></pre>
                         </div>
                         </div>
                         <div class="card-footer text-center">
                         <%
                         LikeDao ld=new LikeDao();
                         %>                                             
   <a href="#!" onclick="doLike(<%=pa.getpId()%>,<%=user.getId() %>)" class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=ld.countlike(pa.getpId()) %></span></a>
    <a href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o"></i><span>10</span></a>
                         
                         
                         </div>
                         </div>
                         
                         
                         </div>
                         
                         </div>                                          
                        </div>
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
              


</body>



</body>
</html>