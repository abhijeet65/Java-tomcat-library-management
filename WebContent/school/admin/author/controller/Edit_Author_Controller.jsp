<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<%@page import="common.Common_Things"%>
<%@page import="category_table.Category_Table"%>
<%@page import="author_table_model.Author_Table_Model"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<jsp:useBean id="obj_Author_Use_Bean" class="common_use_bean.Author_Use_Bean"></jsp:useBean>
	<jsp:setProperty property="*" name="obj_Author_Use_Bean"/>
	
	<%
			
	
	    
	   
	   
	Author_Table_Model obj_Author_Table_Model=new Author_Table_Model();
	      
	   int flag=obj_Author_Table_Model.edit_author(obj_Author_Use_Bean);
	   
	   if(flag==1){
		   
			
			session.setAttribute("add_atuhor_message","Author Updated Successfully");
		
			
			
	   }else{

			 session.setAttribute("add_atuhor_message","Failed");
		 
	   } 
	   
	    
	   
		%>
		
		
		 
		  
		  		 <script type="text/javascript">
						window.location.href="<%=Common_Things.url%>/add-author";
				</script>
	
	
	  
</body>
</html>