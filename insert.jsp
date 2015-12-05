<!DOCTYPE html>
<html>
	<head>
		<title>CSc 460 Program 4 Insert</title>
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
			select{
			width: 200px;
			}
		</style>
	</head>
	<body>
		<h2>CSc 460 Program 4 Insert</h2>
		<a href="index.html">Home</a>		
		<br />
		<form>
		On Table: 
		<select name="insertTableSelect">
		
		<option value="Office">Office</option>
		<option value="Employee">Employee</option>
		<option value="Client">Client</option>
		<option value="Lession">Lession</option>
		</select></form>
		<br /><br />
		Dynamicaly called table schema
		<br/><br />
		Form fields to fill in based on table schema
		<h5>Inserting.......</h5>
		<br />
		<br />
		<input type="button" id="button_query1" value="Insert" onClick=""/>

	</body>
</html>