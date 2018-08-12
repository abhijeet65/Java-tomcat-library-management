<!DOCTYPE html>


<%@page import="student_table.Student_Table_Model"%>
<%@page import="common_use_bean.Student_Use_Bean"%>
<%@page import="admin_table.Admin_Profile_Model"%><html class="no-js">

<head>
    <!-- meta -->
    <meta charset="utf-8">
    


    <!-- bootstrap -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
    <!-- /bootstrap -->

    <!-- core styles -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/animate.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/offline/theme.css">
     
    
    <link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/bootstrap-datepicker/datepicker.css">
    <!-- /core styles -->

    <!-- page styles -->
    
    <!-- /page styles -->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- load modernizer -->
    <script src="<%=request.getContextPath()%>/vendor/modernizr.js"></script>
    
    
    
    
    
    
    
     
    
</head>

<!-- body -->

<body>
		

	
    <div class="app" data-sidebar="locked">
        <!-- top header -->
        
               <%@include file="../../common/tab.jsp" %>
               
           

           

            <!-- main content -->
            <section class="main-content">

                <!-- content wrapper -->
                <div class="content-wrap">

                    <div class="row mg-b">
                        <div class="col-xs-6"> 
                            <h3 class="no-margin">Edit Admin</h3>
                            
                        </div>
                        
                    </div>

                    <div class="col-lg-8">
                    
                    
                    
                    
                    
                    		<%
							String message=(String)session.getAttribute("edit_profle_message");
							if(message!=null){
							%>
								
								 <div class="alert alert-success">
                                        <%=message%>
                                    </div>


							<%			session.removeAttribute("edit_profle_message");
							}
							%>
                    
                    
                    
                    	<%
                    	Admin_Profile_Model obj_Admin_Profile_Model=new Admin_Profile_Model();
                    	obj_Admin_Use_Bean=obj_Admin_Profile_Model.get_admin_details(obj_Admin_Use_Bean);
                    	%>
                    
                    
                     
                    
                                            <section class="panel"> 
                                                <header class="panel-heading">Edit Admin Details</header>
                                                <div class="panel-body">

                                                    <form action="<%=Common_Things.url%>/edit-profile-controller/" class="form-horizontal" role="form" method="post">
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">User Name</label>
                                                            	<div class="col-sm-10">
                                                               	<input type="text" class="form-control" name="admission_no" data-parsley-required="true" data-parsley-trigger="change" placeholder="User Name" value="<%if(obj_Admin_Use_Bean.getUser_name()!=null){out.println(obj_Admin_Use_Bean.getUser_name());} %>" readonly="readonly">
                                                               </div> 
                                                             
                                                        </div> 
                                                        
                                                       
                                                        	<hr>
                                                           
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">New User Name</label>
                                                            	<div class="col-sm-10">
                                                               	<input type="text" class="form-control" name="user_name" data-parsley-required="true" data-parsley-trigger="change" placeholder="User Name" value="<%if(obj_Admin_Use_Bean.getUser_name()!=null){out.println(obj_Admin_Use_Bean.getUser_name());} %>">
                                                               </div> 
                                                             
                                                        </div> 
                                                        
                                                       
                                                        	<hr>
                                                           
                                                       
                                                         
                                                         
                                                        
                                                         <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Old Password</label>
                                                            <div class="col-sm-10">
                                                                <input type="password" class="form-control" placeholder="Password" name="password">
                                                            </div>
                                                        </div>
                                                        
                                                        
                                                       		<hr> 
                                                        
                                                        
                                                          <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">New Password</label>
                                                            <div class="col-sm-10">
                                                                <input type="password" class="form-control" placeholder="Password" name="new_password">
                                                            </div>
                                                        </div>
                                                        
                                                        
                                                       		<hr> 
                                                        
                                                        
                                                         
                                                        
                                                        
                                                        
                                                        
                                                        <div class="form-group">  
                                                            <div class="col-sm-offset-2 col-sm-15">
                                                                <button type="submit" class="btn btn-default">Update</button>
                                                            </div>
                                                        </div>
                                                        
                                                        </div>
                                                    </form>

                                                </div> 
                                                
                                                  



                    
                </div>
                <!-- /content wrapper -->
            </section>
            <!-- /main content -->
        </section>

    </div>

    <!-- core scripts --> 
 	
    <!-- /core scripts -->

    <!-- page scripts -->
  	<script src="<%=Common_Things.url %>/vendor/bootstrap-select/bootstrap-select.js"></script>
    <script src="<%=Common_Things.url %>/vendor/datatables/jquery.dataTables.js"></script>
    <!-- /page scripts -->

    <!-- theme scripts -->
    <script src="<%=Common_Things.url %>/vendor/slider/bootstrap-slider.js"></script>
    <script src="<%=Common_Things.url %>/js/off-canvas.js"></script>
    <script src="<%=Common_Things.url %>/vendor/offline/offline.min.js"></script>
     <script src="<%=Common_Things.url %>/vendor/bootstrap-datepicker/bootstrap-datepicker.js"></script>
       
     
        <script src="<%=Common_Things.url %>/js/main.js"></script>
	<script src="<%=Common_Things.url %>/js/datatables.js"></script>
	 <script src="<%=Common_Things.url %>/vendor/switchery/switchery.js"></script>
     <script src="<%=Common_Things.url %>/js/forms.js"></script>
      
	  

    <!-- /theme scripts -->

</body>
<!-- /body -->

</html>
