
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="java.util.*" %>
<html>
<head>
	<title>Delete Results</title>
</head>
<body>
<%

ArrayList<String> requestParameterNames = Collections.list((Enumeration<String>)request.getParameterNames());
ArrayList<String> values = new ArrayList<String>();

String table = requestParameterNames.get(0).split("_")[1];


for ( String parameterName:requestParameterNames){
	values.add(request.getParameter(parameterName));
}

out.write(values.toString());

//DatabaseController dbcontroller = new DatabaseController();

//dbcontroller.openConnection();

//if(dbcontroller.delete(table,values)){
//	out.write("delete Successful");
//}else {
//	out.write("delete Failed");
//}


//dbcontroller.closeConnection();







%>


</body>

</html>