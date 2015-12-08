<%@page import="java.util.*" %>

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
		//DatabaseController dbcontroller = new DatabaseController();

		//dbcontroller.openConnection();

		
		//ArrayList<ArrayList<String>> relation =  dbcontroller.query(table)
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


</body>


</html>