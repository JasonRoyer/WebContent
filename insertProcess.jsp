<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="java.util.*,DatabaseController" %>
<html>
<head>
	<title>Insert Results</title>
</head>
<body>
<%

ArrayList<String> requestParameterNames = Collections.list((Enumeration<String>)request.getParameterNames());
ArrayList<String> values = new ArrayList<String>();

String table = requestParameterNames.get(0).split("_")[1];


for ( String parameterName:requestParameterNames){
	values.add(request.getParameter(parameterName));
}


DatabaseController dbcontroller = new DatabaseController();

dbcontroller.openConnection();

if(dbcontroller.insert(table,values)){
	out.write("Insert Successful");
}else {
	out.write("Insert Failed");
}

dbcontroller.closeConnection();







%>


</body>

</html>