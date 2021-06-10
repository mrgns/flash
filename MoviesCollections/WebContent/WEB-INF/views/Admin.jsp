<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="resources/bootstrap.min.css"/>
	 <link rel="text/javascript" src="resources/bootstrap.min.js"/>
<link rel="stylesheet" type="text/css" href="resources/design.css"/>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
<style type="text/css">
.title{background-color:crimson;}
body{margin-left:5%; margin-right:5%; background:#0A596A}
			#leftbox {
                float:left; 
                border-radius:10px;
                background:SlateGrey;
                width:30%;
                height:280px;
            }
            #middlebox{
                float:left; 
                margin-left:5%;
                border-radius:10px;
                background:RosyBrown;
                width:30%;
                height:280px;
            }
            #rightbox{
                float:right;
                border-radius:10px;
                background:#798284;
                width:30%;
                height:280px;
            }
            h1,h2{
                color:white;
                text-align:center;
                }
                
</style>
</head>
<body>
<header>
<div class="title"><center><p style="font-size:50px;">ShowTime</p><i class="fas fa-popcorn fa-4x"></i></center> </div>
<br>
 <div class="container" align="right" style="color:LightSkyBlue;"><h4><b>Welcome : ${usernm}</b></h4></div>
<hr>
</header>
<a href="logOut">Sign Out</a>
<br>


        <div id = "boxes">
            <h1>Admin Control Window</h1><br>
              
            <div id = "leftbox">
                <h2>Add Movie through file</h2> <br>
            <center> <div class="container">
					<form name="frm" method="post" action="AddMovie">
				<div class="form-group">

					<div class="container">
						<label for="file" ><b>Select .csv File</b> </label><br>
						<input type="file" name="path" class="form-control">
					</div><br>

					<div class="container">
						<input type="submit"  class="btn btn-outline-primary btn-lg" value=" ADD " />
					</div>

				</div>
				</form>
			</div>
			</center>
          </div> 
              
              
              
            <div id = "middlebox">
                <h2>Delete Movie thhrough id</h2>
                <br>
                <center><div class="container">
								<form name="frm" method="post" action="delete">
							<div class="form-group">
		
									<div class="container">
											<label for="file" ><b>Imdb_id</b> </label><br>
               								 <input type="text" name="imdb_id" class="form-control" placeholder="Imdb_id"/>
									</div><br>

									<div class="container">
                						<input type="submit"  class="btn btn-outline-danger btn-lg" value=" Delete " />
									</div>

								</div>
								</form>
						</div></center>
            </div>
            
            
              
            <div id = "rightbox">
                <h2>Modify Platform</h2><br>
                <center><div class="container">
								<form >
							<div class="form-group">

									<div class="container">
										<label for="file" ><b>Imdb_id</b> </label><br>
                						<input type="text" nane="imdb_id" class="form-control" placeholder="Imdb_id"/>
									</div><br>
											
										<div class="container">
                							<input type="text" name="platfrom" class="form-control" placeholder="Platform"/>
                						</div><br>
											
										<div class="container">
											<input type="submit"  class="btn btn-outline-success btn-lg" value=" Update " />
										</div>

							</div>
									</form>
					</div></center>
              </div>
        </div><br>
<footer style="margin-top:25%;">
<div  align="right">
<hr>
<center>
&copy; Show Time.
All Right Reserved | Design by Ganesh N. Shinde
</center></div>
</footer>
</body>
</html>