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
		<option value="Lesson">Lesson</option>
		<option value="Car">Car</option>
		<option value="Interview">Interview</option>
		<option value="Test">Test</option>
		</select></form>
		<br /><br />
		<script>
		function tableSelect() {
			var e = document.getElementById("selecttableID");
			var selectedText = e.options[e.selectedIndex].text;
			var form;
			switch (selectedText){
				case "Office":
					form = createTableSelected("OfficeID_Office","Adrress","Name","ManagerID","phone#","City","State");
					break;
				case "Employee":
					form = createTableSelected("Name_Employee","DOB","EmpID","Title","CarID","Phone#","OfficeID","Gender");
					break;
				case "Client":
					form = createTableSelected("Name_Client","Gender","Address","City","Phone#","ValidLicense","ClientID");
					break;
				case "Lesson":
					form = createTableSelected("CarID_Lesson","ClientID","Fee","OfficeID","Lesson#","EmpID","MilesDriven");
					break;
				case "Car":
					form = createTableSelected("OfficeID_Car","CarID","Mileage","Faults");
					break;
				case "Interview":
					form = createTableSelected("EmpID_Interview","ClientID","Date","Needs","ValidLicense");
					break;	
				case "Test":
					form = createTableSelected("ClientID_Test","TestType","Passed","Reason","Date");
					break;	
			
			};
			
			document.getElementById("selectedTable").innerHTML = form;
		}
		function createTableSelected(){
			var returnedString = "<form action=\"insertProcess.jsp\">"+"<table>"+"<tr>";
			for (i=0; i < arguments.length; i++){
				returnedString = returnedString + "<th>" + arguments[i].split("_")[0] + "</th>";
			}
			returnedString = returnedString + "</tr>"+"<tr>";
			for (i=0; i < arguments.length; i++){
				returnedString = returnedString + "<td><input type = \"text\" name=\""+ arguments[i] +"\"/> </td>";
			}
			returnedString = returnedString + "</tr> </table><input type =\"submit\" value=\"Insert\"></form>"
			return returnedString;
			
		}
		</script>
		<br />
		<div id="selectedTable" align="center">
		
		
		</div>

	</body>
</html>