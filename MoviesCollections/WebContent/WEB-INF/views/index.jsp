<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="beans.*" %>
<!DOCTYPE html>
<html>
<head>

<script src="https://kit.fontawesome.com/85e0da534d.js" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="resources/bootstrap.min.css"/>
	 <link rel="text/javascript" src="resources/bootstrap.min.js"/>
<link rel="stylesheet" type="text/css" href="resources/design.css"/>
<style>
h1.hidden {
  visibility: hidden;
}
#link{background-color:grey; flow:center; align:center; color:red; height:30px; width:100px;}
a.hover{color:white;}
.title{background-color:crimson;}
body{margin-left:5%; margin-right:5%; background:#0A596A}
</style>
<meta charset="ISO-8859-1">
<title>Homepage</title>
</head>
<body id="IndexBody">
<header>
<div class="title"><p style="font-size:50px;">ShowTime</p><i class="fas fa-popcorn fa-4x"></i> </div>
<div class="container" align="right" style="display:inline;">
<div  id="link" class="rounded-pill"><a href="SignUp"><center><b>Register</b></center></a></div>
<div><i class="fas fa-home fa-2x"></i></div>
</div>
</header>
<br>
<center>
<div class="OuterDiv">
<center>
<div class='login' class='container'>
<h2>Login Here</h2>
  <form method="post" action="check" name='frm'>
  
    <div class="form-group">
      <input type="text" name="usnm" id="form1example1" class='form-control' placeholder="username"/>
    </div>
    <div class='form-group'>
      <input type="password" name="pswd" id="form1example1" class='form-control' placeholder="password">
    </div>
    <div class='row mb-4'>
      <div class='col d-flex justify-content-center'>
    	<div class='form-check'>
      	  <input type="checkbox" class='form-check-input' id="form1example3" checked>
          <label class='form-check-label' for='form1example3'>Remember Me</label>
    	</div>
       </div>
    </div>
    <input type="submit" value="Login" class='' id="button">
    <div class='row' style="padding:5px;"> 
    <div align="right"><small>New User ? <a href="SignUp">Register </a></small></div>
    <div align="left"><small> <a href="ChangePassword"> Recover Password</a></small></div>
    
    </div>
  </form>
 </div>
 </center>
</div>
</center>
<footer>
<div  align="right">
<hr>
<center>
&copy; Show Time.
All Right Reserved | Design by Ganesh N. Shinde
</center></div>
</footer>
</body>
</html>
