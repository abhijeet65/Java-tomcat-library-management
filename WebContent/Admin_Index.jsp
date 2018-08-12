<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="common.Common_Things"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1 style="font-family:Comic Sans Ms;text-align="center";font-size:20pt;
color:#00FF00;>
Admin
</h1>
<form name="login" action="<%=Common_Things.url%>/ADMIN-LOGIN" method="post">
User Name<input type="text" name="user_name"/>
Password<input type="password" name="password"/>
<input type="submit" onclick="check(this.form)" value="Login"/>

</form>





		<%
		String message=(String)session.getAttribute("ss_admin_index_message");
		if(message!=null){
		%>
			<%=message%>
		<%			session.removeAttribute("ss_admin_index_message");
		}
		%>



</body>
</html>