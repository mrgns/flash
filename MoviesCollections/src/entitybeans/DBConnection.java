package entitybeans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class DBConnection 
{
	public Connection dbConnection()
	{
		Connection con = null;
	try
	{	
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/moviesdb?user=root&password=Hello@dude1");
	}
	catch(Exception ex)
	{
		System.out.println("Error " +ex);
	}
	return con;
	}
}
