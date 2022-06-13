package register.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import register.dbconnection.MyDBConnection;

public class LikeDao {

Connection con;
PreparedStatement pre;
MyDBConnection db=new MyDBConnection();
	
	
	public boolean insertLike(int pid, int uid) {
		boolean f=false;
		con=db.getMyConnection();
		try {
			pre= con.prepareStatement("insert into liked(pid,uid) values(?,?)");
			pre.setInt(1, pid);
			pre.setInt(2, uid);
			pre.executeUpdate();
			f=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return f;
	}
	public int countlike(int pid) {
		int count=0;
	
		con=db.getMyConnection();
	
			try {
				pre= con.prepareStatement("select count(*) from liked where pid=?");
				pre.setInt(1, pid);
				ResultSet set=pre.executeQuery();
				
				if(set.next()) {
					count=set.getInt("count(*)");
					
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return count;
	}
	
	public boolean isLikedByUser(int pid, int uid) {
		boolean f=false;
		con=db.getMyConnection();
		
			try {
				pre= con.prepareStatement("select * from liked where pid=? and uid=?");
				pre.setInt(1, pid);
				pre.setInt(2, uid);
				ResultSet set=pre.executeQuery();
				if(set.next()) {
					
					f=true;
					
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
		return f;
	}
	public boolean deleteLike(int pid, int uid) {
		boolean f=false;
		con=db.getMyConnection();
		
			try {
				pre= con.prepareStatement("delete from liked where pid=? and uid=? ");
				pre.setInt(1, pid);
				pre.setInt(2, uid);
		       	pre.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
		return f;
	}
}
