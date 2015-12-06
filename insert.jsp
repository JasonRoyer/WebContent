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
		<select name="insertTableSelect" id="selecttableID" onChange="tableSelect()">
		
		<option value="Office">Office</option>
		<option value="Employee">Employee</option>
		<option value="Client">Client</option>
		<option value="Lession">Lesson</option>
		</select></form>
		<br /><br />
		<script>
		function tableSelect() {
			var e = document.getElementById("selecttableID");
			var selectedText = e.options[e.selectedIndex].text;
			var tableSchema;
			switch (selectedText){
			case "Office":
				tableSchema = " Name | Adrress | Office ID | ManagerID | Phone# | City | State <br/>";
				break;
			
			};
			
			document.getElementById("selectedTable").innerHTML = tableSchema;
		}</script>
		<br />
		<div id="selectedTable">
		<form action="index.html">
		<table>
			<tr>
				<th>Name</th>
				<th>Adrress</th>
				<th>officeID</th>
				<th>ManagerID</th>
				<th>phone#</th>
				<th>City</th>
				<th>State</th>				
			</tr>
			<tr> 
				<td><input type = "text" name="name"/> </td>
				<td><input type = "text" name="Adrress"/> </td>
				<td><input type = "text" name="officeID"/> </td>
				<td><input type = "text" name="ManagerID"/> </td>
				<td><input type = "text" name="phone#"/> </td>
				<td><input type = "text" name="City"/> </td>
				<td><input type = "text" name="State"/> </td>
			
			</tr>
		
		</table>
		
		</form>
		
		</div>
		<br />
		<input type="button" id="button_query1" value="Insert" onClick=""/>

	</body>
</html>