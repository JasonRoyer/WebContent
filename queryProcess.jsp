<%@page import="java.util.*, dbController.*" %>

<html>
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
		String table =  request.getParameter(requestParameterNames.get(0));
		table = table.substring(table.length()-1);

		DatabaseControllerRedux dbcontroller = new DatabaseControllerRedux();

		dbcontroller.Open();

		
		ArrayList<ArrayList<String>> relation =  dbcontroller.query(Integer.parseInt(table));

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


</body>


</html>