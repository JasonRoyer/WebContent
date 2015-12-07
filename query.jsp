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
	  <input type="radio" name="query" value="query1" checked>query1
	  <br>
	  <input type="radio" name="query" value="query2">query2
	  <br>
	  <input type="radio" name="query" value="query3">query3
	  <br>
	  <input type="radio" name="query" value="query4">query4
	  <br>
	  <input type="radio" name="query" value="query5">query5
	   <br/><br/>
	  <input type ="submit" value="Execute Query">
	</form>

	</body>
</html>