<%@ page import="java.util.*,dbController.*" %>

<!DOCTYPE html>
<html>
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
			select{
			width: 200px;
			}
		</style>
	</head>
	<body>
		<h2>CSc 460 Program 4 Update</h2>
		<a href="index.html">Home</a>		
		<br />
		<form action="updateSelected.jsp">
		On Table: 
		<select name="insertTableSelect" id="selecttableID" onChange="this.form.submit()">
		
		<option value="Office" id="Office">Office</option>
		<option value="Employee" id="Employee">Employee</option>
		<option value="Client" id="Client">Client</option>
		<option value="Lesson" id="Lesson">Lesson</option>
		<option value="Car" id="Car">Car</option>
		<option value="Interview" id="Interview">Interview</option>
		<option value="Test" id="Test">Test</option>
		</select></form>
		<br /><br />

		<script>

		function tableSelect() {
				var e = document.getElementById("selecttableID");
				var selectedText = e.options[e.selectedIndex].text;
	
			var form;
			switch (selectedText){
			case "Office":
				form = createTableSelected("OfficeID_Office","Name","ManagerID","phone#","Address","City","State");
				break;
			case "Employee":
				form = createTableSelected("EmpID_Employee","Name","DOB","Phone#","Gender","JobTitle","CarID","OfficeID");
				break;
			case "Client":
				form = createTableSelected("ClientID_Client","Name","Gender","Address","City","PhoneNum","ValidLicense");
				break;
			case "Lesson":
				form = createTableSelected("LessonNum_Lesson","CarID","ClientID","EmployeeID","Fee","LessonDate","MilesDriven");
				break;
			case "Car":
				form = createTableSelected("CarID_Car","Mileage","Faults","EmpID");
				break;
			case "Interview":
				form = createTableSelected("ClientID_Interview","EmpID","InterviewDate","Needs");
				break;	
			case "Test":
				form = createTableSelected("ClientID_Test","TestType","Passed","Reason","TestDate");
				break;	
			
			};
			
			document.getElementById("selectedTable").innerHTML = form;
		}
		function createTableSelected(){
			var returnedString = "<form action=\"updateProcess.jsp\">"+"<table>"+"<tr>";
			for (i=0; i < arguments.length; i++){
				returnedString = returnedString + "<th>" + arguments[i].split("_")[0] + "</th>";
			}
			returnedString = returnedString + "</tr>"+"<tr>";
			for (i=0; i < arguments.length; i++){
				returnedString = returnedString + "<td><input type = \"text\" name=\""+ arguments[i] +"\"/> </td>";
			}
			returnedString = returnedString + "</tr> </table><input type =\"submit\" value=\"Update\"></form>"
			return returnedString;
			
		}
		
		<%
		ArrayList<String> requestParameterNames = Collections.list((Enumeration<String>)request.getParameterNames());
		String table =  request.getParameter(requestParameterNames.get(0));
		out.write("document.getElementById(\"" + table + "\").selected = true;");
		%>
	
		window.onload = tableSelect;
		</script>
		<%
		DatabaseControllerRedux dbcontroller = new DatabaseControllerRedux();

		dbcontroller.Open();

		
		ArrayList<ArrayList<String>> relation =  dbcontroller.findAll(table);

		StringBuffer content = new StringBuffer();
		
		content.append("<table border=\"1\" align=\"center\">");
		for (int i = 0; i < relation.size(); i++){
			// each tuple
			content.append("<tr>");
			for (int j =0; j < relation.get(i).size(); j++){
					// each attribute
				content.append("<td>" + relation.get(i).get(j) + "</td>");
			}
			content.append("</tr>");
		}
		content.append("</table>");
		
		out.write(content.toString());
		dbcontroller.Close();
		
		
		
		%>
		
		<br />
		<div id="selectedTable" align="center">
		
		
		</div>

	</body>
</html>