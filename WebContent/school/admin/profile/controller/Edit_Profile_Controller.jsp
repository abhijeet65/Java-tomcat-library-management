<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<%@page import="common.Common_Things"%>
<%@page import="admin_table.Admin_Profile_Model"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<jsp:useBean id="obj_Admin_Use_Bean" class="common_use_bean.Admin_Use_Bean"></jsp:useBean>
	<jsp:setProperty property="*" name="obj_Admin_Use_Bean"/>
	
	<%
			
	 
	  
	  
	   
	Admin_Profile_Model obj_Admin_Profile_Model=new Admin_Profile_Model();
	     
	   int flag=obj_Admin_Profile_Model.edit_profile(obj_Admin_Use_Bean);
	   
	   if(flag==1){
		   
			
			session.setAttribute("edit_profle_message","Edit Successfull");
		
			
			
	   }else{

			 session.setAttribute("edit_profle_message","Old Password Mismatch");
		 
	   } 
	   
	    
	   
		%>
		
		
		 
		  
		  		 <script type="text/javascript">
						window.location.href="<%=Common_Things.url%>/edit-profile-admin/";
				</script>
	
	
	  
</body>
</html>