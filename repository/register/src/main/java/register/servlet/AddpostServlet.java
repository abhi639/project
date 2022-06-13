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

import register.dao.PostDao;
import register.dbconnection.Helper;
import register.model.Post;
import register.model.RegisterModel;


@WebServlet("/AddpostServlet")
@MultipartConfig
public class AddpostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		String i=request.getParameter("cID");
		int cID=Integer.parseInt(i);
		String pTitele=request.getParameter("pTitle");
		String content=request.getParameter("pcontent");
		String code=request.getParameter("pcode");
		Part part=request.getPart("ppic");
		String image_name=part.getSubmittedFileName();
		
		HttpSession session=request.getSession();
		RegisterModel user=(RegisterModel)session.getAttribute("currentuser");
		int id=user.getId();
		Post u=new Post();
		u.setpTitel(pTitele);
		u.setpContent(content);
		u.setpCode(code);
		u.setCatId(cID);
		u.setUserId(id);
		u.setpPic(image_name);
		PostDao post=new PostDao();
		boolean f=post.saveblog(u);
		
		if(f==true) {
			
			
			
			String path =request.getRealPath("/")+"bogpic"+File.separator+user.getProfile();
			Helper.saveFile(part.getInputStream(), path);
			out.println("done");
			
		}
		else {
			
			out.println("not done");
			
		}
	}

}
