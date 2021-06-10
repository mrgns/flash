<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="entitybeans.*" %>
    <%@page import="org.springframework.web.client.RestTemplate"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="resources/bootstrap.min.css"/>
<link rel="text/javascript" src="resources/bootstrap.min.js"/>
<link rel="stylesheet" type="text/css" href="resources/design.css"/>
<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
<style>
#row2{height:300px; width:auto;}

.col{margin-left:2px;}
.nextLink{
 margin-top:5%;
 }
 .i{background-color:blue;}
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<body>
<%
try
{
	String imdb_id="";
	Connection con;
	PreparedStatement pst;
	ResultSet rs,rs1,rs2;
	DBConnection db=new DBConnection();
	con=db.dbConnection();
%>

<div class="container-fluid">
<h2>Family </h2>
  <div class="row" style="padding:2px;">

<%

		pst=con.prepareStatement("select imdb_id from moviedata  WHERE FIND_IN_SET(' Family',genre)  limit 6;");
		rs=pst.executeQuery();
		while(rs.next())
		{
			String id=rs.getString("imdb_id");
			 imdb_id = id.replaceAll("'", "");
			 
			 final String uri = "http://www.omdbapi.com/?i="+imdb_id+"&apikey=2c643b7c";
			  
		     RestTemplate restTemplate = new RestTemplate();
		     String result = restTemplate.getForObject(uri, String.class);
		    int startIn =result.intern().indexOf("Poster")+9;
		    int endIn =result.intern().indexOf("Ratings")-3;
		    String url=result.substring(startIn, endIn);
		        
			%>
			<div class="col">
			<a href="MovieDetail?getId=<%=imdb_id%>"><img alt="" src="<%=url%>"></a>
			</div>
			<%
		}
		
		%>
		<div class="col" style="padding:5px; margin-top:40px;">
			<div class="nextLink"><a href="#"><span class="inner"></span><i class="icon-chevron-sign-right icon-4x"></i></a></div>
			</div>
		<%
		
%>
</div>
</div>


<div class="container-fluid">
<h2>Sci-Fi </h2>
  <div class="row" style="padding:2px;">

<%

		pst=con.prepareStatement("select imdb_id from moviedata  WHERE FIND_IN_SET(' Sci-Fi',genre)  limit 6;");
		rs1=pst.executeQuery();
		while(rs1.next())
		{
			String id=rs1.getString("imdb_id");
			 imdb_id = id.replaceAll("'", "");
			 
			 final String uri = "http://www.omdbapi.com/?i="+imdb_id+"&apikey=2c643b7c";
			  
		     RestTemplate restTemplate = new RestTemplate();
		     String result = restTemplate.getForObject(uri, String.class);
		    int startIn =result.intern().indexOf("Poster")+9;
		    int endIn =result.intern().indexOf("Ratings")-3;
		    String url=result.substring(startIn, endIn);
		        
			%>
			<div class="col">
			<a href="MovieDetail?getId=<%=imdb_id%>"><img alt="" src="<%=url%>"></a>
			</div>
			<%
		}
		%>
		<div class="col" style="padding:5px; margin-top:40px;">
			<div class="nextLink"><a href="#"><span class="inner"></span><i class="icon-chevron-sign-right icon-4x"></i></a></div>
			</div>
		<%
%>
</div>
</div>

<div class="container-fluid">
<h2>Action </h2>
  <div class="row" style="padding:2px;">

<%

		pst=con.prepareStatement("select * from moviedata  WHERE FIND_IN_SET(' Action',genre)  limit 6;");
		rs=pst.executeQuery();
		while(rs.next())
		{
			String id=rs.getString("imdb_id");
			 String title=rs.getNString("title");
			 imdb_id = id.replaceAll("'", "");
			 
			 final String uri = "http://www.omdbapi.com/?i="+imdb_id+"&apikey=2c643b7c";
			  
		     RestTemplate restTemplate = new RestTemplate();
		     String result = restTemplate.getForObject(uri, String.class);
		    int startIn =result.intern().indexOf("Poster")+9;
		    int endIn =result.intern().indexOf("Ratings")-3;
		    String url=result.substring(startIn, endIn);
		        
			%>
			<div class="col">
			<a href="MovieDetail?getId=<%=imdb_id%>"><img alt="" src="<%=url%>"></a>
			</div>
			<%
		}
		%>
		<div class="col" style="padding:5px; margin-top:40px;">
			<div class="nextLink"><a href="#"><span class="inner"></span><i class="icon-chevron-sign-right icon-4x"></i></a></div>
			</div>
		<%
%>
</div>
</div>

<div class="container-fluid">
<h2>Comedy </h2>
  <div class="row" style="padding:2px;">

<%

		pst=con.prepareStatement("select * from moviedata  WHERE FIND_IN_SET(' Comedy',genre)  limit 6;");
		rs=pst.executeQuery();
		while(rs.next())
		{
			String id=rs.getString("imdb_id");
			 String title=rs.getNString("title");
			 imdb_id = id.replaceAll("'", "");
			 
			 final String uri = "http://www.omdbapi.com/?i="+imdb_id+"&apikey=2c643b7c";
			  
		     RestTemplate restTemplate = new RestTemplate();
		     String result = restTemplate.getForObject(uri, String.class);
		    int startIn =result.intern().indexOf("Poster")+9;
		    int endIn =result.intern().indexOf("Ratings")-3;
		    String url=result.substring(startIn, endIn);
		        
			%>
			<div class="col" >
			<a href="MovieDetail?getId=<%=imdb_id%>"><img alt="" src="<%=url%>"></a>
			</div>
			<%
		}
		%>
		<div class="col" style="padding:5px; margin-top:40px;">
			<div class="nextLink"><a href="#"><span class="inner"></span><i class="icon-chevron-sign-right icon-4x"></i></a></div>
			</div>
		<%
%>
</div>
</div>

<div class="container-fluid">
<h2>Fantasy</h2>
  <div class="row" style="padding:2px;">

<%

		pst=con.prepareStatement("select * from moviedata  WHERE FIND_IN_SET(' Fantasy',genre)  limit 6;");
		rs=pst.executeQuery();
		while(rs.next())
		{
			String id=rs.getString("imdb_id");
			 String title=rs.getNString("title");
			 imdb_id = id.replaceAll("'", "");
			 
			 final String uri = "http://www.omdbapi.com/?i="+imdb_id+"&apikey=2c643b7c";
			  
		     RestTemplate restTemplate = new RestTemplate();
		     String result = restTemplate.getForObject(uri, String.class);
		    int startIn =result.intern().indexOf("Poster")+9;
		    int endIn =result.intern().indexOf("Ratings")-3;
		    String url=result.substring(startIn, endIn);
		        
			%>
			<div class="col" >
			<a href="MovieDetail?getId=<%=imdb_id%>"><img alt="" src="<%=url%>"></a>
			</div>
			<%
		}
		%>
		<div class="col" style="padding:5px; margin-top:40px;">
			<div class="nextLink"><a href="#"><span class="inner"></span><i class="icon-chevron-sign-right icon-4x"></i></a></div>
			</div>
		<%
%>
</div>
</div>

<div class="container-fluid">
<h2>Adventure </h2>
  <div class="row" style="padding:2px;">

<%

		pst=con.prepareStatement("select * from moviedata  WHERE FIND_IN_SET(' Adventure',genre)  limit 6;");
		rs=pst.executeQuery();
		while(rs.next())
		{
			String id=rs.getString("imdb_id");
			 String title=rs.getNString("title");
			 imdb_id = id.replaceAll("'", "");
			 
			 final String uri = "http://www.omdbapi.com/?i="+imdb_id+"&apikey=2c643b7c";
			  
		     RestTemplate restTemplate = new RestTemplate();
		     String result = restTemplate.getForObject(uri, String.class);
		    int startIn =result.intern().indexOf("Poster")+9;
		    int endIn =result.intern().indexOf("Ratings")-3;
		    String url=result.substring(startIn, endIn);
		        
			%>
			<div class="col">
			<a href="MovieDetail?getId=<%=imdb_id%>"><img alt="" src="<%=url%>"></a>
			</div>
			<%
		}
		%>
		<div class="col" style="padding:5px; margin-top:40px;">
			<div class="nextLink"><a href="#"><span class="inner"></span><i class="icon-chevron-sign-right icon-4x"></i></a></div>
			</div>
		<%
%>
</div>
</div>


<div class="container-fluid">
<h2>Short </h2>
  <div class="row" style="padding:2px;">

<%

		pst=con.prepareStatement("select * from moviedata  WHERE FIND_IN_SET(' Short',genre)  limit 6;");
		rs=pst.executeQuery();
		while(rs.next())
		{
			String id=rs.getString("imdb_id");
			 String title=rs.getNString("title");
			 imdb_id = id.replaceAll("'", "");
			 
			 final String uri = "http://www.omdbapi.com/?i="+imdb_id+"&apikey=2c643b7c";
			  
		     RestTemplate restTemplate = new RestTemplate();
		     String result = restTemplate.getForObject(uri, String.class);
		    int startIn =result.intern().indexOf("Poster")+9;
		    int endIn =result.intern().indexOf("Ratings")-3;
		    String url=result.substring(startIn, endIn);
		        
			%>
			<div class="col">
			<a href="MovieDetail?getId=<%=imdb_id%>"><img alt="" src="<%=url%>"></a>
			</div>
			<%
		}
		%>
		<div class="col" style="padding:5px; margin-top:40px;">
			<div class="nextLink"><a href="#"><span class="inner"></span><i class="icon-chevron-sign-right icon-4x"></i></a></div>
			</div>
		<%
%>
</div>
</div>

<div class="container-fluid">
<h2>Musical </h2>
  <div class="row" style="padding:2px;">

<%

		pst=con.prepareStatement("select * from moviedata  WHERE FIND_IN_SET(' Musical',genre)  limit 6;");
		rs=pst.executeQuery();
		while(rs.next())
		{
			String id=rs.getString("imdb_id");
			 String title=rs.getNString("title");
			 imdb_id = id.replaceAll("'", "");
			 
			 final String uri = "http://www.omdbapi.com/?i="+imdb_id+"&apikey=2c643b7c";
			  
		     RestTemplate restTemplate = new RestTemplate();
		     String result = restTemplate.getForObject(uri, String.class);
		    int startIn =result.intern().indexOf("Poster")+9;
		    int endIn =result.intern().indexOf("Ratings")-3;
		    String url=result.substring(startIn, endIn);
		        
			%>
			<div class="col">
			<a href="MovieDetail?getId=<%=imdb_id%>"><img alt="" src="<%=url%>"></a>
			</div>
			<%
		}
		%>
		<div class="col" style="padding:5px; margin-top:40px;">
			<div class="nextLink"><a href="#"><span class="inner"></span><i class="icon-chevron-sign-right icon-4x"></i></a></div>
			</div>
		<%
%>
</div>
</div>


<div class="container-fluid">
<h2>Reality-TV </h2>
  <div class="row" style="padding:2px;">

<%

		pst=con.prepareStatement("select * from moviedata  WHERE FIND_IN_SET(' Reality-TV',genre)  limit 6;");
		rs=pst.executeQuery();
		while(rs.next())
		{
			String id=rs.getString("imdb_id");
			 String title=rs.getNString("title");
			 imdb_id = id.replaceAll("'", "");
			 
			 final String uri = "http://www.omdbapi.com/?i="+imdb_id+"&apikey=2c643b7c";
			  
		     RestTemplate restTemplate = new RestTemplate();
		     String result = restTemplate.getForObject(uri, String.class);
		    int startIn =result.intern().indexOf("Poster")+9;
		    int endIn =result.intern().indexOf("Ratings")-3;
		    String url=result.substring(startIn, endIn);
		        
			%>
			<div class="col">
			<a href="MovieDetail?getId=<%=imdb_id%>"><img alt="" src="<%=url%>"></a>
			</div>
			<%
		}
		%>
		<div class="col" style="padding:5px; margin-top:40px;">
			<div class="nextLink"><a href="#"><span class="inner"></span><i class="icon-chevron-sign-right icon-4x"></i></a></div>
			</div>
		<%
%>
</div>
</div>



<%
}
catch(Exception ex)
{
System.out.println(ex);	
}
%>
</body>
</html>