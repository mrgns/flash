<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="java.io.*" %>
     <%@page import="entitybeans.*" %>
    <%@page import="beans.*" %>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="resources/bootstrap.min.css"/>
	 <link rel="text/javascript" src="resources/bootstrap.min.js"/>
  <link rel="stylesheet" type="text/css" href="resources/design.css"/>
<meta charset="ISO-8859-1">
<title>Search</title>
<style type="text/css">
.dropdrown{width:250px; background-color:grey; margin-left:20px;}
</style>
</head>
<body>
<script>$(document).ready(function() {
$('.mdb-select').materialSelect();
});</script>
<div class="dropdrown">
<form name="frm">
<select name="genre"  class="form-control" onclick="makeGetRequest()">
<option value="Popular">Popular</option>
<%
Connection con;
try
{
	PreparedStatement pst;
	ResultSet rs;
	DBConnection db=new DBConnection();
	con=db.dbConnection();
		pst=con.prepareStatement("select * from genre");
		rs=pst.executeQuery();
		while(rs.next())
		{
			String value=rs.getString("genre_name");
			%>
			<option value=" <%=value%>"><%=value %></option>
			<%
		}
}
catch(Exception ex)
{
	System.out.println(ex.toString());
}
%>
</select>
</form>

</div>

<script language="Javascript" type="text/javascript">
            
            
            function createRequestObject() {
                var tmpXmlHttpObject;
                if (window.XMLHttpRequest) {
                        tmpXmlHttpObject = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    tmpXmlHttpObject = new ActiveXObject("Microsoft.XMLHTTP");
                }
            
                return tmpXmlHttpObject;
            }
            
            
            var http = createRequestObject();
            
            function makeGetRequest() {
                ty=document.frm.genre.value;
                http.open('get', 'Movies?type=' + ty);
                http.onreadystatechange = processResponse;
                http.send(null);
            }
            
            function processResponse() {
                if(http.readyState == 4){
                    var response = http.responseText;
                    document.getElementById('result').innerHTML = response;
                }
            }
            
            </script>
            
            <div id='result'></div>
            <br><br>
</body>
</html>