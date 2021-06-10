<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/bootstrap.min.css"/>
	 <link rel="text/javascript" src="resources/bootstrap.min.js"/>
<link rel="stylesheet" type="text/css" href="resources/design.css"/>
<link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300' rel='stylesheet' type='text/css'>
<style type="text/css">
.register{
	font-family: 'Open Sans Condensed', arial, sans;
	width: 500px;
	padding: 30px;
	background: #FFFFFF;
	margin: 50px auto;
	box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.22);
	-moz-box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.22);
	-webkit-box-shadow:  0px 0px 15px rgba(0, 0, 0, 0.22);

}
.register h2{
	background: #4D4D4D;
	text-transform: uppercase;
	font-family: 'Open Sans Condensed', sans-serif;
	color: #797979;
	font-size: 18px;
	font-weight: 100;
	padding: 20px;
	margin: -30px -30px 30px -30px;
}
.register input[type="text"],
.register input[type="date"],
.register input[type="datetime"],
.register input[type="email"],
.register input[type="number"],
.register input[type="search"],
.register input[type="time"],
.register input[type="url"],
.register input[type="password"],
.register textarea,
.register select 
{
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	outline: none;
	display: block;
	width: 100%;
	padding: 7px;
	border: none;
	border-bottom: 1px solid #ddd;
	background: transparent;
	margin-bottom: 10px;
	font: 16px Arial, Helvetica, sans-serif;
	height: 45px;
}
.register input[type="button"], 
.register input[type="submit"]{
	-moz-box-shadow: inset 0px 1px 0px 0px #45D6D6;
	-webkit-box-shadow: inset 0px 1px 0px 0px #45D6D6;
	box-shadow: inset 0px 1px 0px 0px #45D6D6;
	background-color: #2CBBBB;
	border: 1px solid #27A0A0;
	display: inline-block;
	cursor: pointer;
	color: #FFFFFF;
	font-family: 'Open Sans Condensed', sans-serif;
	font-size: 14px;
	padding: 8px 18px;
	text-decoration: none;
	text-transform: uppercase;
} 
.register input[type="submit"]:hover {
	background:linear-gradient(to bottom, #34CACA 5%, #30C9C9 100%);
	background-color:#34CACA;
}

.link{background-color:grey; flow:center; align:center; color:red; height:30px; width:100px;}
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<header>
<div class="title"><p style="font-size:50px;">ShowTime</p><i class="fas fa-popcorn fa-4x"></i> </div><br>
</header>
<div class="register">
  <h2>Create a account</h2>
  <form name="frm" method="post" action="register">
    <input type="text" name="name" placeholder="Full Name" />
    <input type="email" name="usnm" placeholder="Email" />
    <input type="password" name="pswd" placeholder="Password" />
    <input type="password" name="pswd1" placeholder="Confimed Password" />
    <input type="submit" value="Ragister" />
  </form>
</div>
<div  class="link"><a href="index"><center><b><- Back</b></center></a></div>
</body>
</html>