<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
     <%@page import="entitybeans.*" %>
     <%@page import="org.springframework.web.client.RestTemplate"%>
<!DOCTYPE html>
<html>
 <link rel="stylesheet" href="resources/bootstrap.min.css"/>
<link rel="text/javascript" src="resources/bootstrap.min.js"/>
<link rel="stylesheet" type="text/css" href="resources/design.css"/>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.Insidepage{margin-left:10%; margin-right:10%;}
</style>
</head>
<body >
<div class="Insidepage">
<div class="rows" style="margin-left:5px;">
<%
String genre=request.getParameter("type");
String imdb_id;
Connection con;
if(genre.equals("Popular"))
{
	%><h2>result :: Popular</h2><%
}
else
{
%>
<h2>result :: <%=genre %></h2>
<div class='row'>
<%
try
{
	PreparedStatement pst;
	ResultSet rs;
	DBConnection db=new DBConnection();
	con=db.dbConnection();
	pst=con.prepareStatement("select * from moviedata  WHERE FIND_IN_SET(?,genre);");
	pst.setString(1, genre);
		rs=pst.executeQuery();
		while(rs.next())
		{
			String id=rs.getString("imdb_id");
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
			<div class="col" style="padding:5px;">
			<a href="MovieDetail?getId=<%=imdb_id%>"><img alt="" src="<%=url%>"></a>
			</div>
			<%
		}
}
catch(Exception ex)
{
System.out.println(ex.toString());	
}
%>
<%	
}
%>

</div>
</div>
</div>
</body>
</html>