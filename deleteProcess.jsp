
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="java.util.*, dbController.*" %>
<html>
<head>
	<title>Delete Results</title>
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

if (table.equals("Office")){tempArray = new String[]{"OfficeID_Office"};}
if (table.equals("Employee")){tempArray = new String[]{"EmpID_Employee"};}
if (table.equals("Client")){ tempArray = new String[]{"ClientID_Client"};}
if (table.equals("Lesson")){ tempArray = new String[]{"LessonNum_Lesson"};}
if (table.equals("Car")){tempArray = new String[]{"CarID_Car"};}
if (table.equals("Interview")){ tempArray = new String[]{"ClientID_Interview"};}
if (table.equals("Test")){ tempArray = new String[]{"ClientID_Test","TestType","TestDate"};}


for(String str: tempArray){
	values.add(request.getParameter(str));
}

DatabaseControllerRedux dbcontroller = new DatabaseControllerRedux();

dbcontroller.Open();

if(dbcontroller.delete(table,(String[]) values.toArray())){
	out.write("delete Successful");
}else {
	out.write("delete Failed");
}


dbcontroller.Close();







%>


</body>

</html>