<%@ page import="java.util.*, dbController.*" %>
<html>

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
	out.write("Inser Successful");
}else {
	out.write("Inser Failed");
}

dbcontroller.closeConnection();







%>


</body>

</html>