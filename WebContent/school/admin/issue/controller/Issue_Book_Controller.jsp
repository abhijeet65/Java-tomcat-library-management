<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@page import="common.Common_Things"%>
<%@page import="Issue_Table_Model.Issue_Table_Model"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<jsp:useBean id="obj_Issue_Use_Bean" class="common_use_bean.Issue_Use_Bean"></jsp:useBean>
	<jsp:setProperty property="*" name="obj_Issue_Use_Bean"/>
	
	<%
			
	
	  
	  
	   
	Issue_Table_Model obj_Issue_Table_Model=new Issue_Table_Model();
	     
	   int flag=obj_Issue_Table_Model.issue_book(obj_Issue_Use_Bean);
	   
	   if(flag==1){
		   
			
			session.setAttribute("issue_book_message","Book Issued Successfully");
		
	   }else if(flag==18){		
		   
		   session.setAttribute("issue_book_message","Student with Admission Number "+obj_Issue_Use_Bean.getAdmission_no()+" not available");
		   
	   }else if(flag==20){		
		   
		   session.setAttribute("issue_book_message","Admission Number "+obj_Issue_Use_Bean.getAdmission_no()+" profile not active");
		   
	   }else{

			 session.setAttribute("issue_book_message","Failed");
		 
	   } 
	   
	    
	   
		%>
		
		
		 
		  
		  		 <script type="text/javascript">
						window.location.href="<%=Common_Things.url%>/issue-book/?jin=<%=obj_Issue_Use_Bean.getSerial_sl_no()%>";
				</script>
	
	
	  
</body>
</html>