<%@ page import="java.util.*" %>

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
		<h2>CSc 460 Program 4 Delete</h2>
		<a href="index.html">Home</a>		
		<br />
		<form action="deleteSelected.jsp">
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
					form = createTableSelected("OfficeID_Office");
					break;
				case "Employee":
					form = createTableSelected("EmpID_Employee");
					break;
				case "Client":
					form = createTableSelected("ClientID_Client");
					break;
				case "Lesson":
					form = createTableSelected("LessonNum_Lesson");
					break;
				case "Car":
					form = createTableSelected("CarID_Car");
					break;
				case "Interview":
					form = createTableSelected("ClientID_Interview");
					break;	
				case "Test":
					form = createTableSelected("ClientID_Test","TestType","TestDate");
					break;	
			
			};
			
			document.getElementById("selectedTable").innerHTML = form;
		}
		function createTableSelected(){
			var returnedString = "<form action=\"deleteProcess.jsp\">"+"<table>"+"<tr>";
			for (i=0; i < arguments.length; i++){
				returnedString = returnedString + "<th>" + arguments[i].split("_")[0] + "</th>";
			}
			returnedString = returnedString + "</tr>"+"<tr>";
			for (i=0; i < arguments.length; i++){
				returnedString = returnedString + "<td><input type = \"text\" name=\""+ arguments[i] +"\"/> </td>";
			}
			returnedString = returnedString + "</tr> </table><input type =\"submit\" value=\"Delete\"></form>"
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
		//DatabaseController dbcontroller = new DatabaseController();

		//dbcontroller.openConnection();

		
		//ArrayList<ArrayList<String>> relation =  dbcontroller.findAll(table)
				ArrayList<ArrayList<String>> relation = new ArrayList<ArrayList<String>>();
		relation.add(new ArrayList<String>(){{
			add("tommy");
			add("likes");
			add("pickles");
			add("Yummy");
											}});
		relation.add(new ArrayList<String>(){{
			add("tommy1");
			add("likes1");
			add("pickles1");
			add("Yummy1");
											}});
		relation.add(new ArrayList<String>(){{
			add("tommy2");
			add("likes2");
			add("pickles2");
			add("Yummy2");
											}});
		relation.add(new ArrayList<String>(){{
			add("tommy3");
			add("likes3");
			add("pickles3");
			add("Yummy3");
											}});
		StringBuffer content = new StringBuffer();
		
		content.append("<table border=\"1\" align=\"center\">");
		for (int i = 0; i < relation.size(); i++){
			// each tuple
			content.append("<tr>");
			for (int j =0; j < relation.get(i).size(); j++){
					// each attribute
				content.append("<td>" + relation.get(i).get(j) + table+ "</td>");
			}
			content.append("</tr>");
		}
		content.append("</table>");
		
		out.write(content.toString());
		
		//dbcontroller.closeConnection();
		
		
		
		%>
		
		<br />
		<div id="selectedTable" align="center">
		
		
		</div>

	</body>
</html>