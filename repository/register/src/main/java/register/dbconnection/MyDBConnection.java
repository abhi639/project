package register.dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class MyDBConnection {

	Connection con;
	
	public Connection getMyConnection() {
		 
		try {
			Class.forName("com.mysql.jdbc.Driver");
			 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/abhijit","root","");
		} 
		catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
			
			e.printStackTrace( );
		} 
		
		return con;
	}
	
	
	
}
