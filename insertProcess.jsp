<%@ page import="java.util.*" %>
<html>

<body>
<%

List<String> requestParameterNames = Collections.list((Enumeration<String>)request.getParameterNames());
List<String> values = new ArrayList<String>();

String table = requestParameterNames.get(0).split("_")[1];


for ( String parameterName:requestParameterNames){
	values.add(request.getParameter(parameterName));
}


DatabaseController dbcontroller = new DatabaseController();

dbcontroller.Open();

out.write(dbcontroller.insert(table,values));

dbcontroller.Close();







%>


</body>

</html>