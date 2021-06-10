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

<script src="https://kit.fontawesome.com/85e0da534d.js" crossorigin="anonymous"></script>

 <link rel="stylesheet" href="resources/bootstrap.min.css"/>
<link rel="text/javascript" src="resources/bootstrap.min.js"/>
<link rel="stylesheet" type="text/css" href="resources/design.css"/>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
/* (A) 3 COLUMNS ON BIG SCREEN */
.floatWrap { width: 100%; padding: 10px; }
.floatCol {
  float: left;
  box-sizing: border-box;
  padding: 30px;

}
/* (B) CLEARFIX - FLOATWRAP TO "MAINTAIN" 100% WIDTH */
.floatWrap { overflow: auto; }
.floatWrap::after {
  content: "";
  clear: both;
  display: table;
}
/* (C) 1 COLUMN ON SMALL SCREENS */
@media only screen and (max-width: 768px) {
  .floatCol {
    float: none;
    display: block;
    width: 100%;
    padding: 10px;
  }
}
</style>
<style type="text/css">
$primary: #11998e;
$secondary: #38ef7d;
$white: #fff;
$gray: #9b9b9b;
.form__group {
  position: relative;
  padding: 15px 0 0;
  margin-top: 10px;
  width: 50%;
}

.form__field {
  font-family: inherit;
  width: 100%;
  border: 0;
  border-bottom: 2px solid $gray;
  outline: 0;
  font-size: 1.3rem;
  color: $white;
  padding: 7px 0;
  background: transparent;
  transition: border-color 0.2s;

  &::placeholder {
    color: transparent;
  }

  &:placeholder-shown ~ .form__label {
    font-size: 1.3rem;
    cursor: text;
    top: 20px;
  }
}

.form__label {
  position: absolute;
  top: 0;
  display: block;
  transition: 0.2s;
  font-size: 1rem;
  color: $gray;
}

.form__field:focus {
  ~ .form__label {
    position: absolute;
    top: 0;
    display: block;
    transition: 0.2s;
    font-size: 1rem;
    color: $primary;
    font-weight:700;    
  }
  padding-bottom: 6px;  
  font-weight: 700;
  border-width: 3px;
  border-image: linear-gradient(to right, $primary,$secondary);
  border-image-slice: 1;
}
/* reset input */
.form__field{
  &:required,&:invalid { box-shadow:none; }
}
/* demo */
</style>
</head>
<body>

<header>
<div class="title"><center><p style="font-size:50px;">ShowTime</p></center></div>
</header>

<jsp:include page="Search.jsp" flush="true"/>
<br>
<%
String imdb_id=request.getParameter("getId");
String comment = request.getParameter("comment");

final String uri = "http://www.omdbapi.com/?i="+imdb_id+"&apikey=2c643b7c";

//TODO: Autowire the RestTemplate in all the examples
RestTemplate restTemplate = new RestTemplate();
String result = restTemplate.getForObject(uri, String.class);
int startIn =result.intern().indexOf("Poster")+9;
int endIn =result.intern().indexOf("Ratings")-3;
String url=result.substring(startIn, endIn);

try
{
	Connection con;
		PreparedStatement pst;
		ResultSet rs;
		DBConnection db=new DBConnection();
		con=db.dbConnection();
		pst=con.prepareStatement("select * from moviedata where imdb_id=?");
		pst.setString(1, imdb_id);
			rs=pst.executeQuery();
			while(rs.next())
			{        
			%>
			<div class="floatWrap">
  				<div class="floatCol"><img alt="" src="<%=url%>"></div>
  				<div class="w-75 p-3"><br>
  				<h3>Title : <%=rs.getString("title") %></h3>
  				<p>Genre : <%=rs.getString("genre") %><br>
  				runtime : <i class="fa fa-clock" style="color:white;"></i> <%= rs.getString("runtime")%><br>
  				imdb_rating : <%= rs.getString("imdb_rating")%><i class="fa fa-star" style="color:gold;"></i><br>
  				actors : <%=rs.getString("actors") %><br>
  				released : <i class="fa fa-calender" style="color:;"></i><%=rs.getString("released_at") %><br>
  				language : <%= rs.getString("language")%><br></p>
  				<p>Story : <%=rs.getString("plot") %>
  				<div class="container"><a href=""><button type="button" class="btn btn-outline-success btn-lg">Play</button></a></div>
  				
  				<!--form is created for comment-->
  				<div class="container" width=500px>
  				<form name="frm" method="post" action="review">
  				<div class="container" class="form__group field" >
  				<input type="hidden" name="imdb_id" value="<%= imdb_id%>">
  				<input type="text" name="comment" class="form__field"placeholder="write a comments....here" id='name'>
  				<input type="submit" value="Enter" class="btn btn-outline-success btn-sm" style="align:right;"></div>
  				</form>
  				</div></div>
  				<div class="comments"  style="margin-left:10%;margin-top:1%;">
  				<h3>Comments</h3>
  				<%
  				ResultSet rs1;
  				pst=con.prepareStatement("select review from moviereview where imdb_id=?");
  				pst.setString(1,imdb_id);
				rs1=pst.executeQuery();
				while(rs1.next())
				{
				%><hr>
				<div><p><%= rs1.getString("review") %></p></div>
				
				<%
				}
  				%>
  				<hr>
  				</div>
			</div>
			<%
			}
}
catch(Exception ex)
{
	System.out.println(ex.toString());
}

%>

<br>
<footer>
<div  align="right">
<hr>
<center>
<b>&copy; Show Time.</b>
All Right Reserved | Design by Ganesh N. Shinde
</center></div>
</footer>
</body>
</html>