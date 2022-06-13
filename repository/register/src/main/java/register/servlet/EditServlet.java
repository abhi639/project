package register.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import register.dao.RegisterDao;
import register.dbconnection.Helper;
import register.model.Mess;
import register.model.RegisterModel;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_name=request.getParameter("name");
		String user_mail=request.getParameter("email");
		String user_Pass=request.getParameter("password");
		String user_gender=request.getParameter("gender");
		String user_about=request.getParameter("about");
		Part part=request.getPart("image");
		String image_name=part.getSubmittedFileName();
		HttpSession session=request.getSession();
		
		RegisterModel user=(RegisterModel)session.getAttribute("currentuser");
		user.setName(user_name);
		user.setEmail(user_mail);
		user.setPassword(user_Pass);
		user.setGender(user_gender);
		user.setAbout(user_about);
	   String oldFile=user.getProfile();
		user.setProfile(image_name);
		
		RegisterDao dao=new RegisterDao();
		boolean a=dao.updateUser(user);
		PrintWriter out=response.getWriter();
		if(a=true)
		{
			
			
			String path =request.getRealPath("/")+"pics"+File.separator+user.getProfile();
			String patholdFile =request.getRealPath("/")+"pics"+File.separator+oldFile;
		           
			if(!patholdFile.equals("default.png")) {
			Helper.deleteFile(patholdFile);
			}
				if(Helper.saveFile(part.getInputStream(), path)) {
					
				
					out.println("Update Successfully");
					Mess msg=new Mess("Profile detailes Updated...", "success", "alert-success");
				
					session.setAttribute("mssg", msg);
					
				}
				else
				{	out.println(Helper.saveFile(part.getInputStream(), path));
					out.println("not");
					Mess msg=new Mess("Profile detailes NOT Updated...", "danger", "alert-danger");
					
					session.setAttribute("mssg", msg);
				}
				
		
		
		}
		else { 
			
			out.println("Not Updated");
			Mess msg=new Mess("Somthing went wrong...", "error", "alert-danger");
			
			session.setAttribute("mssg", msg);
			
		}
		response.sendRedirect("profile.jsp");
	}

}
