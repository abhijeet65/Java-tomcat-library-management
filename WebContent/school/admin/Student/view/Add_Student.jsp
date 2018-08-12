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
    
    
    
     <script type="text/javascript">
		function validateForm() {
		    var x = document.forms["myForm"]["admission_no"].value;
		    if (x==null || x=="") {
		        alert("Please enter Admission No");
		        return false;
		    }

 
		    var x = document.forms["myForm"]["student_name"].value;
		    if (x==null || x=="") {
		        alert("Please enter Student Name");
		        return false;
		    }

		    var x = document.forms["myForm"]["section"].value;
		    if (x==null || x=="") {
		        alert("Please enter Section");
		        return false;
		    }

		    var x = document.forms["myForm"]["grade"].value;
		    if (x==null || x=="") {
		        alert("Please enter Grade");
		        return false;
		    }



		    
		}
	</script>
    
    
    
    
    
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
                            <h3 class="no-margin">Add Student</h3>
                            
                        </div>
                        <a href="<%=Common_Things.url %>/add-student/?kou=<%="232323243kihnadfhlacfhdkaudfhnakcdfchakdfhbkavhdfhna" %>" class="btn btn-info">Add Student</a>
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
                                                <header class="panel-heading">Add Student Form</header>
                                                <div class="panel-body">

                                                    <form action="<%=Common_Things.url%>/add-student-contro/" class="form-horizontal" role="form" name="myForm"  onsubmit="return validateForm()">
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Admission No</label>
                                                            	<div class="col-sm-10">
                                                               	<input type="text" class="form-control" name="admission_no" data-parsley-required="true" data-parsley-trigger="change" placeholder="Admission No">
                                                               </div> 
                                                             
                                                        </div> 
                                                        
                                                       
                                                        	<hr>
                                                           
                                                       
                                                         
                                                        
                                                        
                                                         <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Name</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" placeholder="Name" name="student_name">
                                                            </div>
                                                        </div>
                                                        
                                                        
                                                       		<hr> 
                                                        
                                                        
                                                         
                                                        
                                                        
                                                        
                                                         <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Grade</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" placeholder="Grade" name="grade">
                                                            </div>
                                                        </div>
                                                        
                                                        
                                                       		
                                                          	<hr> 
                                                        
                                                        
                                                          
                                                        
                                                        
                                                         <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Section</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" placeholder="Section" name="section">
                                                            </div>
                                                        </div>
                                                       
                                                    
                                                          <hr> 
                                                     	 <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Description</label>
                                                            <div class="col-sm-10"> 
                                                            
                                                            	<textarea rows="5" class="form-control" placeholder="Description" name="profile"></textarea>
                                                            
                                                            
                                                                
                                                            </div>
                                                        </div>
                                                     
                                                     <hr>  
                                                      <div class="form-group">
                                                             <label for="inputPassword3" class="col-sm-2 control-label">Profile Status</label>
                                                            <div class="col-sm-10">
                                                                    <label> 
                                                                        <input type="radio" name="status" value="1" checked="checked">Active
																		<input type="radio" name="status" value="0">Inactive
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                         <hr>
                                                        
                                                        <div class="form-group">  
                                                            <div class="col-sm-offset-2 col-sm-15">
                                                                <button type="submit" class="btn btn-default">Add Student</button>
                                                            </div>
                                                        </div>
                                                        
                                                        </div>
                                                    </form>




                                                  <div class="col-lg-4">
                                            <section class="panel panel-primary">
                                <div class="panel-heading">Recently Added Students 
                                    
                                </div>
                                <ul class="list-group">
                                
                                
                                
                                
                                	<%
                                	Student_Table_Model obj_Student_Table_Model=new Student_Table_Model(); 
                              	List<Student_Use_Bean> list_students=obj_Student_Table_Model.get_all_recently_added_students();
            	                                	
            	                                	
            	                                	if(list_students!=null){
            	                                		Iterator<Student_Use_Bean> it_list_students=list_students.iterator();
            	                                		Student_Use_Bean obj_Student_Use_Bean=new Student_Use_Bean();
            	                                		while(it_list_students.hasNext()){
            	                                			obj_Student_Use_Bean=it_list_students.next();
                                    	%>
                                	
                                	  <li class="list-group-item">
                                        <span class="pull-left mg-t-xs mg-r-md">
                                           1.
                                        </span>
                                        <div class="show no-margin pd-t-xs">
                                            
                                           
                                       <a href="<%=Common_Things.url %>/complete-details-student/?lm=<%=obj_Student_Use_Bean.getStudent_id() %>" class="btn btn-primary btn-xs"><%=obj_Student_Use_Bean.getStudent_name() %></a>  </div>
                                         
                                    </li>
                                   
                                	<%		 
                                			
                                			
                                		}
                                		
                                		
                                	}
                                	
                                	%>
                                
                                
                                
                                  
                                  

                                </ul>

                            </section> 
                                        </div> 










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
