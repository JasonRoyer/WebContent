<!DOCTYPE html PUBLIC>
<html xmln="http://www.w3.org/1999/xhtml">
	<head>
		<title>CSc 460 Program 4 Queries</title>
		<meta http-equiv="Content-type" content="text/html;charset=UTF-8" />
		<script type="text/javascript" src="scripts/scripts.js"></script>
		<style>
			* {
				background-color: #505050;
				color: #FFF;
			}
			body {
				text-align: center;
				font-family: "Courier", Ariel,sans-serif;
			}
			a {
				color: #FF0;
			}
		</style>
	</head>
	<body>
		<h2>CSc 460 Program 4 Queries</h2>
		<a href="index.html">Home</a>		
		<br />
		<h5>Below are a list of queries, click on which one you want to run.</h5>
		<br />
		<br />
	<form action ="queryProcess.jsp">
	  <input type="radio" name="query" value="query1" checked>What are the CarIds of the cars without faults?
	  <br>
	  <input type="radio" name="query" value="query2">What are the names and numbers of managers?
	  <br>
	  <input type="radio" name="query" value="query3">What are the Postal addresses of all offices in Tucson?
	  <br>
	  <input type="radio" name="query" value="query4">How many employees work at each office?
	  <br>
	  <input type="radio" name="query" value="query5">What is the average miles driven during lessons?
	   <br/><br/>
	  <input type ="submit" value="Execute Query">
	</form>

	</body>
</html>