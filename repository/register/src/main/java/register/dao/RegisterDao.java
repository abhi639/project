package register.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import register.dbconnection.MyDBConnection;
import register.model.RegisterModel;

public class RegisterDao {

	MyDBConnection dbcon=new MyDBConnection();
	Connection con;
	PreparedStatement pre;
	public boolean saveuser(RegisterModel mod) {
		boolean status=false;
		con=dbcon.getMyConnection();
		try {
			pre=con.prepareStatement("insert into blog(name,email,password,gender,about)values(?,?,?,?,?)");
			
		       pre.setString(1,mod.getName());
		       pre.setString(2, mod.getEmail());
		       pre.setString(3, mod.getPassword());
		       pre.setString(4, mod.getGender());
		       pre.setString(5, mod.getAbout());
		      pre.executeUpdate();
		      status=true;
		} 
		
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		return status;
	}
	
	//get user by email and password
	
	
	public RegisterModel getuserByemailandPass(String email,String Password) {
		RegisterModel user=null;
		con=dbcon.getMyConnection();
		
		try {
			pre=con.prepareStatement("select * from blog where email=? and password=?");
			
			pre.setString(1, email);
			pre.setString(2, Password);
			ResultSet set=pre.executeQuery();
			if(set.next()) {
				user=new RegisterModel();
				user.setId(set.getInt(1));
				user.setName(set.getString(2));
		        user.setEmail(set.getString(3));
		        user.setPassword(set.getString(4));
		        user.setGender(set.getString(5));
		        user.setAbout(set.getString(6));
				user.setTimestamp(set.getTimestamp(7));
				user.setProfile(set.getString(8));
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return user;
	}
	
	public boolean updateUser(RegisterModel user) {
		boolean f=true;
		con=dbcon.getMyConnection();
		try {
			pre=con.prepareStatement("update blog set name=?,email=?,password=?,gender=?,about=?,profile=? where id=? ");
		 pre.setString(1, user.getName());
		 pre.setString(2, user.getEmail());
		 pre.setString(3,user.getPassword() );
		 pre.setString(4,user.getGender() );
		 pre.setString(5,user.getAbout());
		 pre.setString(6,user.getProfile() );
		 pre.setInt(7,user.getId());
		pre.executeUpdate();
		f=true;
		
		} 
		
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return f;
	}
	public RegisterModel getpostByid(int userid) {
		RegisterModel user=null;
con=dbcon.getMyConnection();
		
		try {
			pre=con.prepareStatement("select * from blog where id=?");
			
			pre.setInt(1, userid);
			
			ResultSet set=pre.executeQuery();
			if(set.next()) {
				user=new RegisterModel();
				user.setId(set.getInt(1));
				user.setName(set.getString(2));
		        user.setEmail(set.getString(3));
		        user.setPassword(set.getString(4));
		        user.setGender(set.getString(5));
		        user.setAbout(set.getString(6));
				user.setTimestamp(set.getTimestamp(7));
				user.setProfile(set.getString(8));
			}
		}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
		
		
		return user;
	}
	
}
