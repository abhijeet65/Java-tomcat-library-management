<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<%@page import="book_table.Admin_Book_Table_Model"%>
<%@page import="common.Common_Things"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<jsp:useBean id="obj_Book_Use_Bean" class="common_use_bean.Book_Use_Bean"></jsp:useBean>
	<jsp:setProperty property="*" name="obj_Book_Use_Bean"/>
	
	<%
			
	
	  
	  
	   
	Admin_Book_Table_Model obj_Admin_Book_Table_Model=new Admin_Book_Table_Model();
	     
	   int flag=obj_Admin_Book_Table_Model.edit_book(obj_Book_Use_Bean);
	   
	   if(flag==1){
		   
			
			session.setAttribute("edit_book_message","Book Edited Successfully");
		
			
			
	   }else{

			 session.setAttribute("edit_book_message","Failed");
		 
	   } 
	   
	    
	   
		%>
		
		
		 
		  
		  		 <script type="text/javascript">
						window.location.href="<%=Common_Things.url%>/edit-book/?s=<%=obj_Book_Use_Bean.getBook_sl_no() %>";
				</script>
	
	
	  
</body>
</html>