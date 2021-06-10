package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserLogin
 */
@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String usernm;
	private String pswd;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLogin(String usernm,String pswd) {
        super();
        this.usernm=usernm;
        this.pswd=pswd;
        
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html");  
        PrintWriter out = response.getWriter();
		int userid = 0;
		
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/walletdb?user=root&password=Hello@dude1");
		
			pst=con.prepareStatement("select * from users where usernm=? and pswd=? and userstatus='Active';");
			pst.setString(1, usernm);
			pst.setString(2, pswd);
			rs=pst.executeQuery();  
			if(rs.next())
			{
				
			HttpSession sec=request.getSession(true);
			sec.setAttribute("userid", rs.getString("userid"));
			sec.setAttribute("usernm", usernm);
			sec.getId();
			String utype=rs.getString("usertype");
			if(utype.equals("Admin"))
				response.sendRedirect("Admin.jsp");
			else
				response.sendRedirect("Homepage.jsp");
			}
			else
				response.sendRedirect("Failure.jsp");
			con.close();
		 }
			catch(Exception e)
			{
				out.println(e);
			}
		
	}

}
