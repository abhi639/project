package register.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import register.dbconnection.MyDBConnection;
import register.model.Categories;
import register.model.Post;


public class PostDao {

	Connection con;
	MyDBConnection dbcon=new MyDBConnection();
	PreparedStatement pre;
	
	public List<Categories> getallCategories(){
	
		List<Categories>list=new LinkedList<Categories>();
		
		con=dbcon.getMyConnection();
		try {
			pre=con.prepareStatement("select * from categories");
			ResultSet s= pre.executeQuery();
			while(s.next()) {
				Categories p=new Categories();
				p.setcId(s.getInt(1));
				p.setName(s.getString(2));
				p.setDiscription(s.getString(3));
				list.add(p);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}	
	
	public boolean saveblog(Post u) {
		boolean f=false;
		con=dbcon.getMyConnection();
		try {
			pre=con.prepareStatement("insert into post(ptTitel,pContent,pcode,pPic,catID,userId)value(?,?,?,?,?,?)");
		  pre.setString(1, u.getpTitel());
		  pre.setString(2, u.getpContent());
		  pre.setString(3, u.getpCode());
		  pre.setString(4, u.getpPic());
		  pre.setInt(5, u.getCatId());
	    	pre.setInt(6, u.getUserId());
		pre.executeUpdate();
		f=true;
		} 
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return f;
	}
	
	
	
	public List<Post>getallPost(){
		List<Post>list=new ArrayList<Post>();
		con=dbcon.getMyConnection();
		try {
			pre=con.prepareStatement("select * from post order by pid desc");
            ResultSet set1=pre.executeQuery(); 		
		   while(set1.next()) {
			   Post p=new Post();
			   p.setpTitel(set1.getString("ptTitel"));
			   p.setCatId(set1.getInt("catID"));
			   p.setpCode(set1.getString("pcode"));
			   p.setpContent(set1.getString("pContent"));
			   p.setpId(set1.getInt("pid"));
			   p.setpPic(set1.getString("pPic"));
			   p.setpTime(set1.getString("pDate"));
			   p.setUserId(set1.getInt("userId"));
			   list.add(p);
		   } 
		
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		
		return list;
	}
	public List<Post>getPostByid(int catid){
		List<Post>list=new ArrayList<Post>();
		
		con=dbcon.getMyConnection();
		try {
			pre=con.prepareStatement("select * from post where catID=? ");
		   pre.setInt(1, catid);
		ResultSet set=pre.executeQuery();
		
		while(set.next()) {
			 Post p=new Post();
			   p.setpTitel(set.getString("ptTitel"));
			   p.setCatId(set.getInt("catID"));
			   p.setpCode(set.getString("pcode"));
			   p.setpContent(set.getString("pContent"));
			   p.setpId(set.getInt("pid"));
			   p.setpPic(set.getString("pPic"));
			   p.setpTime(set.getString("pDate"));
			   p.setUserId(set.getInt("userId"));
			   list.add(p);
			
			
		}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list; 
	}
	
	public Post getpostById(int pid) {
		Post p=null;
		con=dbcon.getMyConnection();
		try {
			pre=con.prepareStatement("select * from post where pid=?");
		     pre.setInt(1,pid);
		ResultSet set=pre.executeQuery();
		if(set.next()) {
			     p=new Post();
			    p.setpPic(set.getString("pPic"));
			   p.setpTitel(set.getString("ptTitel"));
			   p.setCatId(set.getInt("catID"));
			   p.setpCode(set.getString("pcode"));
			   p.setpContent(set.getString("pContent"));
			   p.setpId(set.getInt("pid"));
			  
			   p.setpTime(set.getString("pDate"));
			   p.setUserId(set.getInt("userId"));
			   
		}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return p;
	}
	
}
