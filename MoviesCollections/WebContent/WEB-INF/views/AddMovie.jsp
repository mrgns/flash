<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.io.*" %>
    <%@page import="java.util.*"%>
    <%@page import="java.nio.file.*" %>
    <%@page import="java.sql.*" %>
    <%@page import="entitybeans.*" %>
  
    
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="resources/bootstrap.min.css"/>
	 <link rel="text/javascript" src="resources/bootstrap.min.js"/>
<link rel="stylesheet" type="text/css" href="resources/design.css"/>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.title{background-color:crimson;}
</style>
</head>
<body>
<header>
<div class="title"><center><p style="font-size:50px;">ShowTime</p><i class="fas fa-popcorn fa-4x"></i></center> </div>
<br><hr>
</header>
<%
String path=request.getParameter("path");
String path2 = "C:\\Users\\GANESH\\Desktop\\"+path;
String line = "";
String splitBy = ",";
int cat=0;
try {
	Connection con;
	PreparedStatement pst;
	ResultSet rs;
	DBConnection db=new DBConnection();
	con=db.dbConnection();
    //parsing a CSV file into BufferedReader class constructor  
    BufferedReader br = new BufferedReader(new FileReader("C:\\Users\\GANESH\\Desktop\\"+path));
    while ((line = br.readLine()) != null)
    //returns a Boolean value  
    {
      String[] m = line.split(splitBy);
      //use comma as separator  
     pst=con.prepareStatement("Insert into moviedata values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
      pst.setString(1, m[0]);
      pst.setString(2, m[1]);
      pst.setString(3, m[2]);
      pst.setString(4, m[3]);
      pst.setString(5, m[4]);
      pst.setString(6, m[5]);
      pst.setString(7, m[6]);
      pst.setString(8, m[7]);
      pst.setString(9, m[8]);
      pst.setString(10, m[9]);
      pst.setString(11, m[10]);
      pst.setString(12, m[11]);
      pst.setString(13, m[12]);
      pst.setString(14, m[13]);
      pst.setString(15, m[14]);
      pst.setString(16, m[15]);
      pst.setString(17, m[16]);
     cat = pst.executeUpdate();
    }
    if(cat>0)
    {
    	%>
    	<h1>Movie Added....</h1>
    	<%
    }
    else
    {
    	%>
    	<h1>Movie is not Added....</h1>
    	<%
    }
    br.close();
    con.close();
  }
  catch(IOException e) {
    e.printStackTrace();
  }
%>

</body>
</html>