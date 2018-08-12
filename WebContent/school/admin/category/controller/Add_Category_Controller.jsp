<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<%@page import="common.Common_Things"%>
<%@page import="category_table.Category_Table"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<jsp:useBean id="obj_Category_Use_Bean" class="common_use_bean.Category_Use_Bean"></jsp:useBean>
	<jsp:setProperty property="*" name="obj_Category_Use_Bean"/>
	
	<%
			
	
	  
	   
	   
	Category_Table obj_Category_Table=new Category_Table();
	      
	   int flag=obj_Category_Table.insert_category(obj_Category_Use_Bean);
	   
	   if(flag==1){
		   
			
			session.setAttribute("add_category_message","Category Added Successfully");
		
			
			
	   }else{

			 session.setAttribute("add_category_message","Failed");
		 
	   } 
	   
	    
	   
		%>
		
		
		 
		  
		  		 <script type="text/javascript">
						window.location.href="<%=Common_Things.url%>/admin-add-category";
				</script>
	
	
	  
</body>
</html>