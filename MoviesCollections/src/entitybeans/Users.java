package entitybeans;

import java.io.IOException;
import java.io.*;
import java.net.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;


@Controller
@SessionAttributes("usernm")
public class Users {

	private int userid=0;
	private String pswd="";
	private String usernm="";
	Connection con;
	public Users()
	{
	
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/moviesdb?user=root&password=Hello@dude1");
		}
		catch(Exception e)
		{
			System.out.print(e);
		}
	}
	
	public String registeration()
	{
		String status="";
		PreparedStatement pst;
		
		try
		{
			pst=con.prepareStatement("insert into users(pswd,usernm) values(?,?);");
			pst.setNString(1, pswd);
			pst.setNString(2, usernm);
			int cat = pst.executeUpdate();
			
			if(cat>=0)
				status="Success";
			else
				status="failed";
		}
		catch(Exception e)
		{
			System.out.print(e);
		}
		return status;
	}
	
	public ModelAndView userlogin()
	{
		ModelAndView mv = new ModelAndView();
		String status="";
		PreparedStatement pst;
		ResultSet rs;
		try
		{
			pst=con.prepareStatement("select * from users where usernm=? and pswd=? and userstatus='Active';");
			pst.setNString(1, usernm);
			pst.setNString(2, pswd);
			rs=pst.executeQuery();
			
			mv.addObject("usernm", usernm);
			if(rs.next())
				status=rs.getString("usertype");
			else
				status="failed";
			
			if(status.equals("Admin"))
			{
					mv.setViewName("Admin");
			}
			else if(status.equals("User"))
			{
				mv.setViewName("Homepage");
		}
			else
					mv.setViewName("Failure");
		}
		catch(Exception e)
		{
			System.out.print(e);
		}
		return mv;
	}
	
	

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getPswd() {
		return pswd;
	}

	public void setPswd(String pswd) {
		this.pswd = pswd;
	}

	public String getUsernm() {
		return usernm;
	}

	public void setUsernm(String usernm) {
		this.usernm = usernm;
	}

	
	
}
