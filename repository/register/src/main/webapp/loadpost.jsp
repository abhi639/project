<%@ page import="register.dao.PostDao" %>
   <%@ page import="java.util.List" %>
   <%@ page import="register.model.Post" %>
   <%@ page import="register.model.RegisterModel" %>
   <%@ page import="register.dao.LikeDao" %>
    <%@ page import="register.model.RegisterModel" %>
   <%@page errorPage="error.jsp" %>
     
  
     
   <div class="row">
   
   <%
   RegisterModel user=(RegisterModel)session.getAttribute("currentuser");
   PostDao po=new PostDao();
  int cid=Integer.parseInt(request.getParameter("cid"));
  
  List<Post>lis=null;
  if(cid==0){
	  
	  lis=po.getallPost();
	  
  }else{
	  lis=po.getPostByid(cid);
  }
  
  if(lis.size()==0){
	  
	  
	  out.println("<h3 class='display-3 text-center'>No post in this category...<h3>");
  }
   for( Post a:lis){
	       %>
   <div class="col-md-6 mt-2">
   <div class="card">
  <img class="card-img-top" src="bogpic/<%= a.getpPic()%>" alt="Card image cap">
   <div class="card-body">
   <b> <%=a.getpTitel() %>  </b>
   <p><%=a.getpContent() %></p>
   
   </div>
   <div class="card-footer primary-background text-center">
   <a href="show_blogpage.jsp?post_id=<%=a.getpId() %>" class="btn btn-outline-primary btn-sm">read more</a>
  <%
                         LikeDao ld=new LikeDao();
                         %>                                             
   <a href="#!" onclick="doLike(<%=a.getpId()%>,<%=user.getId() %>)" class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=ld.countlike(a.getpId()) %></span></a>
    <a href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o"></i><span>10</span></a>
   </div>
   </div>
   
   
   </div>
   <%}
   %>
     </div>
 