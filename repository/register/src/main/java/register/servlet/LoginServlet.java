package register.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

import register.dao.RegisterDao;
import register.dbconnection.MD5;
import register.model.Mess;
import register.model.RegisterModel;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String email1=request.getParameter("email");
		String pass1=request.getParameter("password");
		
		RegisterDao dao=new RegisterDao();
		String pass=	MD5.getMd5(pass1);
		
		RegisterModel u=dao.getuserByemailandPass(email1, pass);
		
		if(u==null) {
			//out.println("invalid details....try again");
			Mess msg=new Mess("invalid details.... try with another", "error", "alert-danger");
			
			HttpSession session=request.getSession();
			session.setAttribute("mssg", msg);
			response.sendRedirect("login.jsp");
		}
		else 
		{
			//user session
			HttpSession session=request.getSession();
			session.setAttribute("currentuser", u);
			response.sendRedirect("profile.jsp");
			
		}
	}

}
