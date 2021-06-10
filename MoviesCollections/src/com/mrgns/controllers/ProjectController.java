package com.mrgns.controllers;

import java.sql.*;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import entitybeans.DBConnection;
import entitybeans.Users;


@Controller
public class ProjectController {
	
	Users us=new Users();
	
	@RequestMapping("/")  
	public String home()
	{
		return"index";
	}
	
	@RequestMapping("/index")  
	public String index()
	{
		return"index";
	}
	@RequestMapping("/Movies")  
	public String Movies()
	{
		return"Movies";
	}
	@RequestMapping("/rest")  
	public String rest()
	{
		return"Search";
	}
	
	
	@RequestMapping("/AddMovie")  
	public String AddMovies()
	{
		
		return"AddMovie";
	}
	
	
	@RequestMapping(value = "/MovieDetail", method = RequestMethod.GET) 
	public String MovieDetail(@RequestParam("getId") String getId)
	{
		
		return"MovieDetail";
	}
	
	@RequestMapping("/review")
	public String MovieDetail2(@RequestParam("imdb_id") String imdb_id ,@RequestParam("comment") String comment)
	{
		
		Connection con;
		try
		{
			PreparedStatement pst;
			
			DBConnection db=new DBConnection();
			con=db.dbConnection();
			pst=con.prepareStatement("Insert into moviereview values(?,?);");
			pst.setString(1,imdb_id);
			pst.setString(2,comment);
			int cat=pst.executeUpdate();
			}
			catch(Exception ex)
			{
				System.out.println(ex.toString());
			}
		return"Success";
	}
	
	
	@RequestMapping("/SignUp")  
	public String Register()
	{
		return"SignUp";
	}
	
	@RequestMapping("/check")
	public ModelAndView CheckUserStatus(String usnm,String pswd)
	{
		ModelAndView mv=new ModelAndView();
		
	
		
		String stat;
		us.setUsernm(usnm);
		us.setPswd(pswd);
		mv=us.userlogin();

		return mv;
	}
	@RequestMapping("/register")
	public ModelAndView Register(String usnm,String pswd)
	{
		ModelAndView mv=new ModelAndView();
		Users us=new Users();
		us.setUsernm(usnm);
		us.setPswd(pswd);
		String status=us.registeration();
		if(status.equals("success"))
			mv.setViewName("Success");
		else
			mv.setViewName("Success");
		return mv;
		
	}
	@RequestMapping("delete")
	public String Delete(String imdb_id)
	{
		System.out.println(imdb_id);
		String status="";
		int cat=0;
		try
		{	Connection con;
			PreparedStatement pst;
			
			DBConnection db=new DBConnection();
			con=db.dbConnection();
			pst=con.prepareStatement("delete from moviedata where imdb_id=?");
			pst.setString(1,imdb_id);
			cat=pst.executeUpdate();
			}
			catch(Exception ex)
			{
				System.out.println(ex.toString());
			}
		if(cat>0)
			status="Success";
		else
			status="Failure";
		
		return status;
	}
	
	@RequestMapping("/logOut")
	  public String logout(HttpSession session) {
	    session.invalidate();
	    return "LogOut";
	  }
	
}
