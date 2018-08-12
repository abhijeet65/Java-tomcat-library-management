<!DOCTYPE html>


<%@page import="student_table.Student_Table_Model"%>
<%@page import="common_use_bean.Student_Use_Bean"%><html class="no-js">

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
               
           
		<%
		String Student_id=(String)request.getParameter("lm");
		Student_Table_Model obj_Student_Table_Model=new Student_Table_Model();
		
		Student_Use_Bean obj_Student_Use_Bean=obj_Student_Table_Model.get_complete_details_student(Student_id);
		%>
           

            <!-- main content -->
            <section class="main-content">

                <!-- content wrapper -->
                <div class="content-wrap">

                    <div class="row mg-b">
                        <div class="col-xs-6"> 
                            <h3 class="no-margin">Student:<%=obj_Student_Use_Bean.getStudent_name() %></h3>
                            
                        </div>
                        <a href="<%=Common_Things.url %>/issue-history-student/?sid=<%=obj_Student_Use_Bean.getStudent_id()%>&n=<%=obj_Student_Use_Bean.getStudent_name()%>" class="btn btn-success">Issue History</a>
                        <a href="<%=Common_Things.url %>/student-search/?kou=<%=12 %>" class="btn btn-info">Search Student</a>
                     
                    </div>

                    <div class="col-lg-8">
                    
                    
                    
                    
                    
                    		<%
							String message=(String)session.getAttribute("add_student_message");
							if(message!=null){
							%>
								
								 <div class="alert alert-success">
                                        <%=message%>
                                    </div>


							<%			session.removeAttribute("add_student_message");
							}
							%>
                    
                    
                    
                    
                    
                    
                    
                    
                                            <section class="panel">
                                                <header class="panel-heading">Complete Details</header>
                                                <div class="panel-body">

                                                    <form action="<%=Common_Things.url%>/edit-profile-student-controller/" class="form-horizontal" role="form">
                                                      <input type="hidden" name="student_id" value="<%=Student_id %>">
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Admission No</label>
                                                            	<div class="col-sm-10">
                                                               	<input type="text" class="form-control" name="admission_no" data-parsley-required="true" data-parsley-trigger="change" placeholder="Admission No" value="<%if(obj_Student_Use_Bean.getAdmission_no()!=null){out.println(obj_Student_Use_Bean.getAdmission_no());} %>" >
                                                               </div> 
                                                             
                                                        </div> 
                                                        
                                                       
                                                        	<hr>
                                                           
                                                       
                                                         
                                                        
                                                        
                                                         <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Name</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" placeholder="Name" name="student_name" value="<%if(obj_Student_Use_Bean.getStudent_name()!=null){out.println(obj_Student_Use_Bean.getStudent_name());} %>" >
                                                            </div>
                                                        </div>
                                                        
                                                        
                                                       		<hr> 
                                                        
                                                        
                                                         
                                                        
                                                        
                                                        
                                                         <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Grade</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" placeholder="Grade" name="grade" value="<%if(obj_Student_Use_Bean.getGrade()!=null){out.println(obj_Student_Use_Bean.getGrade());} %>" >
                                                            </div>
                                                        </div>
                                                        
                                                        
                                                       		
                                                          	<hr> 
                                                        
                                                        
                                                          
                                                        
                                                        
                                                         <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Section</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" placeholder="Section" name="section" value="<%if(obj_Student_Use_Bean.getSection()!=null){out.println(obj_Student_Use_Bean.getSection());} %>" >
                                                            </div>
                                                        </div>
                                                       <hr> 
                                                       
                                                       
                                                       
                                                    <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Status</label>
                                                            <div class="col-sm-10">
                                                         			<label>
                                                         			
                                                         			<%
                                                         			String active_selected=null;
                                                         			String inactive_selected=null;
                                                         			if(obj_Student_Use_Bean.getStatus()==1){
                                                         				active_selected="checked='checked'";
                                                         			}else{
                                                         				inactive_selected="checked='checked'";
                                                         			}
                                                         			
                                                         			%>
                                                         			
                                                         			 
                                                                        <input type="radio" name="status" value="1" <%=active_selected %>>Active
																		<input type="radio" name="status" value="0" <%=inactive_selected %>>Inactive
                                                                    </label> 
                                                              </div>
                                                        </div>
                                                       
                                                           
                                                          <hr> 
                                                     	 <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Description</label>
                                                            <div class="col-sm-10"> 
                                                            
                                                            	<textarea rows="5" class="form-control" placeholder="Description" name="profile" ><%if(obj_Student_Use_Bean.getProfile()!=null){out.println(obj_Student_Use_Bean.getProfile());} %></textarea>
                                                            
                                                            
                                                                
                                                            </div>
                                                        </div>
                                                     
                                                     <hr>  
                                                     
                                                        </div>
                                                        <div class="form-group">  
                                                            <div class="col-sm-offset-2 col-sm-15">
                                                                <button type="submit" class="btn btn-warning">Update</button>
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
