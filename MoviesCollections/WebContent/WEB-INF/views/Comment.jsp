<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
     <%@page import="entitybeans.*" %>
    <%@page import="beans.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
  				
  				<%
  				String comment = request.getParameter("comment");
				String imdb_id ="";
		Connection con;
		try
		{
			PreparedStatement pst;
			ResultSet rs;
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
  				
  				%>
</body>
</html>