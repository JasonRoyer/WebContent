
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="java.util.*" %>
<html>
<head>
	<title>Update Results</title>
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

String table = requestParameterNames.get(0).split("_")[1];


for ( String parameterName:requestParameterNames){
	values.add(request.getParameter(parameterName));
}

out.write(values.toString());

//DatabaseController dbcontroller = new DatabaseController();

//dbcontroller.openConnection();

//if(dbcontroller.update(table,values)){
//	out.write("Update Successful");
//}else {
//	out.write("Update Failed");
//}


//dbcontroller.closeConnection();







%>


</body>

</html>