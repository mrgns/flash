<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="entitybeans.*" %>
<!DOCTYPE html>
<html>
<head>
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
  <link rel="stylesheet" href="resources/bootstrap.min.css"/>
	 <link rel="text/javascript" src="resources/bootstrap.min.js"/>
  <link rel="stylesheet" type="text/css" href="resources/design.css"/>
<style type="text/css">
#answer{margin-left:20px;}
select{ margin-top:20px;
width:200px; height:20px;
font-align:center;
}
#main{background-color:grey;}
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<div class="w3-bar" align="center">
    <input id="qurybox" class="form-control" style="width:500px;"> 
    <input type="button" class="btn btn-outline-primary btn-sm" value="Search" onclick="getanswer(document.getElementById('qurybox').value)" data-toggle="modal" data-target="#myModal">
<div id="answer" style="margin-bottom:20px;"></div> 
</script> 
<script> var data;
function getanswer(q){
$.get("https://www.omdbapi.com/?s="+q+"&apikey=2c643b7c", function(rawdata){
var rawstring =JSON.stringify(rawdata);
data =JSON.parse(rawstring);
var title = data.Search[0].Title;
var year = data.Search[0].Year; 
var imdburl="https://www.imdb.com/title/"+data.Search[0].imdbID+"/";

var posterurl =data.Search[0].Poster;
var posterurl =data.Search[0].Poster;
document.getElementById('modal-header').innerHTML="<h2>"+title+"</h2><br><img src= '"+posterurl+"' width=300 height=300/><br>";
document.getElementById('modal-body').innerHTML="<p> Year Released: "+year+"</p> <p> IMDB page: <a href='"+imdburl+"'target='_blank'>"+imdburl+"</a></p>"; 
}); 
}</script>

<div class="container" style="Background-color:grey; color:black;">
  
  <div class="modal fade" id="myModal" style="Background-color:grey; color:black;">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <div class="modal-header" id="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <div class="modal-body" id="modal-body">
         
        </div>
        
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
</div>
</div>
</html>
</body>
</html>