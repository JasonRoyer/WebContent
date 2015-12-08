<!DOCTYPE html PUBLIC>
<html xmln="http://www.w3.org/1999/xhtml">
	<head>
		<title>CSc 460 Program 4 Update</title>
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
		<h2>CSc 460 Program 4 Update</h2>
		<a href="index.html">Home</a>		
		<br />
		<form action="updateSelected.jsp">
		On Table: 
		<select name="insertTableSelect" onchange="this.form.submit()">
		
		<option value="Office">Office</option>
		<option value="Employee">Employee</option>
		<option value="Client">Client</option>
		<option value="Lesson">Lesson</option>
		<option value="Car">Car</option>
		<option value="Interview">Interview</option>
		<option value="Test">Test</option>
		</select></form>
		<br /><br />

		<br />


	</body>
</html>