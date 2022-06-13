package register.servlet;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import register.dao.RegisterDao;
import register.dbconnection.MD5;
import register.model.RegisterModel;

@MultipartConfig
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		PrintWriter out=response.getWriter();
		String check=request.getParameter("check");
		if(check==null) 
		{
		out.println("box not checked...Please check terms and condition");
	
		}
		else {
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String gender=request.getParameter("gen");
		String about=request.getParameter("about");
		
		RegisterModel mod=new RegisterModel();
		mod.setName(name);
		mod.setEmail(email);
		mod.setGender(gender);
	String pass=	MD5.getMd5(password);
	mod.setPassword(pass);
		mod.setAbout(about);
		RegisterDao dao=new RegisterDao();
		
		boolean a=dao.saveuser(mod);
		
		if(a=true) {
			out.println("done");
			
			
		}
		else {
			out.println("no add");
			
			
		}
		}
	}

}
