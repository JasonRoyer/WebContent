
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="java.util.*, dbController.*" %>
<html>
<head>
	<title>Insert Results</title>
</head>
		<style>
			* {
				background-color: #505050;
				color: #FFF;
			}
			body {
				text-align: center;
				font-family: "Courier", Ariel,sans-serif;
			}
			
		</style>
<body>
<%

ArrayList<String> requestParameterNames = Collections.list((Enumeration<String>)request.getParameterNames());
ArrayList<String> values = new ArrayList<String>();
String table ="";
for (String str : requestParameterNames){
	if (str.contains("_")){
		table = str.split("_")[1];
	}
}
String[] tempArray ={};

if (table.equals("Office")){tempArray = new String[]{"OfficeID_Office","Name","ManagerID","phone#","Address","City","State"};}
if (table.equals("Employee")){tempArray = new String[]{"EmpID_Employee","Name","DOB","Phone#","Gender","JobTitle","CarID","OfficeID"};}
if (table.equals("Client")){ tempArray = new String[]{"ClientID_Client","Name","Gender","Address","City","PhoneNum","ValidLicense"};}
if (table.equals("Lesson")){ tempArray = new String[]{"LessonNum_Lesson","CarID","ClientID","EmployeeID","Fee","LessonDate","MilesDriven"};}
if (table.equals("Car")){tempArray = new String[]{"CarID_Car","Mileage","Faults","EmpID"};}
if (table.equals("Interview")){ tempArray = new String[]{"ClientID_Interview","EmpID","InterviewDate","Needs"};}
if (table.equals("Test")){ tempArray = new String[]{"ClientID_Test","TestType","Passed","Reason","TestDate"};}


for(String str: tempArray){
	values.add(request.getParameter(str));
}


// TODO this throws and out of bound exception sometimes
//String table = requestParameterNames.get(0).split("_")[1];




DatabaseControllerRedux dbcontroller = new DatabaseControllerRedux();

dbcontroller.Open();
if(dbcontroller.insert(table,values)){
	out.write("insert Successful");
}else {
	out.write("insert Failed");
}


dbcontroller.Close();







%>
<a href="index.html">Home</a>

</body>

</html>