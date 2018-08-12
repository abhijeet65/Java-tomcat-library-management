<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.Iterator"%>
<%@page import="common.Common_Things"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

 
 <!-- meta -->
    <meta charset="utf-8">
    
     

    <!-- bootstrap -->
    <link rel="stylesheet" href="<%=Common_Things.url %>/bootstrap/css/bootstrap.min.css">
    <!-- /bootstrap -->

    <!-- core styles -->
    <link rel="stylesheet" href="<%=Common_Things.url %>/css/main.css">
    <!-- /core styles -->

    <!-- page styles -->
    <!-- /page styles -->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- load modernizer -->
    <script src="<%=Common_Things.url %>/vendor/modernizr.js"></script>








			<script type="text/javascript">
				function validateForm() {
				    var x = document.forms["myForm"]["user_name"].value;
				    if (x==null || x=="") {
				        alert("Please enter User Name");
				        return false;
				    }

				    var x = document.forms["myForm"]["password"].value;
				    if (x==null || x=="") {
				        alert("Please enter Password");
				        return false;
				    }
				    
				}
			</script>



			<script type="text/javascript">
				function validateForm1() {
				    var x = document.forms["myForm1"]["admission_no"].value;
				    if (x==null || x=="") {
				        alert("Please enter Admission Number");
				        return false;
				    }

				    var x = document.forms["myForm1"]["password"].value;
				    if (x==null || x=="") {
				        alert("Please enter Password");
				        return false;
				    }
				    
				}
			</script>

</head>
<body>	

	
		

	
		

			 <div class="app-user"> 
				        <div class="user-container"> 








		<%
		

	
	
	
	
	 
	 
	
	 
		 

			
			
		 
		 	
	%>
							
		

				
					

					

 

				            <section class="panel panel-default">
				                <header class="panel-heading"><%=" Library Management System - MIS" %></header>
				                <div class="bg-white user pd-lg">
				                    <h6>
				                        <strong>Welcome.</strong>Sign in to get started!</h6>
				
				                  <form name="myForm" action="<%=Common_Things.url %>/admin-sign-in" method="post" onsubmit="return validateForm()">
									<input type="text" class="form-control mg-b-sm" name="user_name" placeholder="User Name" autofocus >
				                        <input type="password" class="form-control" placeholder="Password"  name="password" >
				                         
				                        <div class="text-right mg-b-sm mg-t-sm">
				                            <a href="#"><%="" %></a>
				                        </div>
				                        <button class="btn btn-info btn-block" type="submit">Sign in</button>
				                    </form>
				
				                   
				                </div>
				            </section>
						 



						<%
					String message=(String)session.getAttribute("ss_index_message");
					if(message!=null){
					%>
						
						<div class="alert alert-warning alert-dismissable">
                                        <%=message%>
                                    </div>


					<%			session.removeAttribute("ss_index_message");
					}
					%>









				       



	
	

		




 								</div>
				
				
				
				
				
				
				
				
				
				    </div>







</body>
</html>