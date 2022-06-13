package register.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import register.dao.LikeDao;


@WebServlet("/LikeServlet")
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String operation= request.getParameter("operation");
		System.out.println(operation);
		int pid=Integer.parseInt(request.getParameter("pid"));
		int uid=Integer.parseInt(request.getParameter("uid"));
		
		boolean f=true;
		LikeDao dao=new LikeDao();
		if(operation.equals("like")) {
			if(dao.isLikedByUser(pid, uid)) {
				
				dao.deleteLike(pid, uid);
				f=false;
				out.println(f);
			}
			else {
			f=dao.insertLike(pid, uid);
            out.println(f);
		}
	}

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

}
}