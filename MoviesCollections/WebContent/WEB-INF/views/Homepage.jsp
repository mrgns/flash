<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.nio.file.*"%>
    <%@page import="java.sql.*" %>
    <%@page import="java.io.*" %>
    <%@page import="java.lang.*" %>
    <%@page import="java.net.URI" %>
    <%@page import="entitybeans.*" %>
    <%@page import="beans.*" %>
    <%@page import="java.net.http.*" %>
    <%@page import="org.springframework.web.client.RestTemplate"%>

<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="resources/bootstrap.min.css"/>
<link rel="text/javascript" src="resources/bootstrap.min.js"/>
<link rel="stylesheet" type="text/css" href="resources/design.css"/>

<style>
img{
height:160px;
width:160px;
}
.title{background-color:crimson;}

</style>
<meta charset="ISO-8859-1">
<title>Homepage</title>
</head>
<body style="margin:0 20px;">

<header>
<div class="title"><center><p style="font-size:50px;">ShowTime</p></center></div>
<div class="container" align="right" style="color:LightSkyBlue;"><h4><b>Welcome : ${usernm}</b></h4></div>
</header><hr>
<a href="logOut" style="color:white;">Sign Out</a>
<div style="display:inline;">
<jsp:include page="Search.jsp" flush="true"/>
<jsp:include page="Search2.jsp" flush="true"/>
</div>

<div class="container-fluid">
<h2>Marval</h2>
  <div class="row">
<%
String imdb_id="";
Connection con;
try
{
	PreparedStatement pst;
	ResultSet rs;
	DBConnection db=new DBConnection();
	con=db.dbConnection();
	pst=con.prepareStatement("select * from moviedata  WHERE FIND_IN_SET(' Marval',genre)  limit 6;");
		rs=pst.executeQuery();
		while(rs.next())
		{
			String id=rs.getString("imdb_id");
			 String title=rs.getNString("title");
			 imdb_id = id.replaceAll("'", "");
			 
			 final String uri = "http://www.omdbapi.com/?i="+imdb_id+"&apikey=2c643b7c";
			  
		     //TODO: Autowire the RestTemplate in all the examples
		     RestTemplate restTemplate = new RestTemplate();
		     String result = restTemplate.getForObject(uri, String.class);
		    int startIn =result.intern().indexOf("Poster")+9;
		    int endIn =result.intern().indexOf("Ratings")-3;
		    String url=result.substring(startIn, endIn);
		    //System.out.println(url);
		    
		        
			%>
			<div class="col" style="margin-left:2px;">
			<a href="MovieDetail?getId=<%=imdb_id%>"><img alt="" src="<%=url%>"></a>
			</div>
			<%
		}
		%>
		<div class="col" style="padding:5px; margin-top:40px;">
			<div class="nextLink"><a href="#"><span class="inner"></span><i class="icon-chevron-sign-right icon-4x"></i></a></div>
			</div>
		<%
}
catch(Exception ex)
{
	System.out.println(ex);
}
%>
</div>
</div>
<jsp:include page="Structure.jsp"></jsp:include>
<footer style="margin-top:10%;">
</footer>
</body>
</html>