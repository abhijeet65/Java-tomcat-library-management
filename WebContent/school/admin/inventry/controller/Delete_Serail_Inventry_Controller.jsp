<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<%@page import="common.Common_Things"%>
<%@page import="Inventry_Table_Model.Inventry_Table_Model"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<jsp:useBean id="obj_Book_Use_Bean" class="common_use_bean.Book_Use_Bean"></jsp:useBean>
	<jsp:setProperty property="*" name="obj_Book_Use_Bean"/>
	
	<%
			
	
	  
	   
	   
	Inventry_Table_Model obj_Inventry_Table_Model=new Inventry_Table_Model();
	      
	   int flag=obj_Inventry_Table_Model.delete_serial(obj_Book_Use_Bean);
	   
	   if(flag==1){
		   
			
			session.setAttribute("add_inventry_message","Deleted Successfully");
		
	   }else{

			 session.setAttribute("add_inventry_message","Failed");
		 
	   } 
	   
	    
	   
		%>
		
		
		 
		  
		  		 <script type="text/javascript">
						window.location.href="<%=Common_Things.url%>/inventry-books/?kou=<%=obj_Book_Use_Bean.getBook_sl_no()%>";
				</script>
	
	
	  
</body>
</html>