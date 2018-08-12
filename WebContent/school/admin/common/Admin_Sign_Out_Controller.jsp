<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="common.Common_Things"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="common_use_bean.Admin_Use_Bean"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>

	<%
	
	out.println("Please wait..");
	
	
	List<Admin_Use_Bean> list1=(List<Admin_Use_Bean>)session.getAttribute("ss_ADMIN_bean");
	Admin_Use_Bean obj_Admin_Use_Bean=new Admin_Use_Bean();
	if(list1==null){
		
		
		 
		session.setAttribute("ss_school_index_message","Opps..Your session expired,Please Login Again");
	%>
		<script type="text/javascript">
			window.location.href="<%=Common_Things.url %>";
		</script>
	<%
	}else{
	 
	Iterator<Admin_Use_Bean> it_list=list1.iterator();
	obj_Admin_Use_Bean=it_list.next();
	
	session.removeAttribute("ss_ADMIN_bean");
	
	%>
	<script type="text/javascript">
			window.location.href="<%=Common_Things.url %>/";
		</script>
	<%
	}
	%>
</body>
</html>