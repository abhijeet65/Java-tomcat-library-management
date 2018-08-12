<!DOCTYPE html>

<%@page import="book_table.Admin_Book_Table_Model"%>
<%@page import="common_use_bean.Book_Use_Bean"%>
<%@page import="category_table.Category_Table"%>
<%@page import="common_use_bean.Category_Use_Bean"%>
<%@page import="student_table.Student_Table_Model"%>
<%@page import="common_use_bean.Student_Use_Bean"%>
<%@page import="Inventry_Table_Model.Inventry_Table_Model"%><html class="no-js">

<head>
    <!-- meta -->
    <meta charset="utf-8">
    


     <link rel="stylesheet" href="<%=Common_Things.url %>/bootstrap/css/bootstrap.min.css">
    <!-- /bootstrap -->

    <!-- core styles -->
    <link rel="stylesheet" href="<%=Common_Things.url %>/css/main.css">
    <link rel="stylesheet" href="<%=Common_Things.url %>/css/animate.min.css">
    <link rel="stylesheet" href="<%=Common_Things.url %>/vendor/offline/theme.css">
    <!-- /core styles -->

    <!-- page styles -->
    <link rel="stylesheet" href="<%=Common_Things.url %>/vendor/bootstrap-select/bootstrap-select.css">
    <link rel="stylesheet" href="<%=Common_Things.url %>/vendor/dropzone/dropzone.css">
    <link rel="stylesheet" href="<%=Common_Things.url %>/vendor/slider/slider.css">
    <link rel="stylesheet" href="<%=Common_Things.url %>/vendor/bootstrap-datepicker/datepicker.css">
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
		    var x = document.forms["myForm"]["barcode"].value;
		    if (x==null || x=="") {
		        alert("Please enter Barcode");
		        return false;
		    }



		    
		}
	</script>
    <script> 
	jQuery(function(){  
		$("#search").autocomplete("<%=Common_Things.url%>/search-bar-code-form/");
	});
   </script>
    
</head>

<!-- body -->

<body>
		

	
    <div class="app" data-sidebar="locked">
        <!-- top header -->
        
               <%@include file="../../common/tab.jsp" %>
               
           
			<%
			String student_id=(String)request.getParameter("id");
			String Student_name=(String)request.getParameter("n");
			String admission_no=(String)request.getParameter("ad");
			//Inventry_Table_Model obj_Inventry_Table_Model=new Inventry_Table_Model();
			//Book_Use_Bean obj_Book_Use_Bean=obj_Inventry_Table_Model.get_serial_status(inventry_sl);
			
			%>
           

            <!-- main content -->
            <section class="main-content">

                <!-- content wrapper -->
                <div class="content-wrap">

                    <div class="row mg-b">
                        <div class="col-xs-6"> 
                            <h3 class="no-margin">Issue Book :<%=Student_name%></h3>
                             
                        </div> 
                          <a href="<%=Common_Things.url %>/add-student/?kou=<%="232323243kihnadfhlacfhdkaudfhnakcdfchakdfhbkavhdfhna" %>" class="btn btn-info">Add Student</a>
                          <a href="<%=Common_Things.url %>/student-search/?kou=<%=12 %>" class="btn btn-info">Search Student</a>
                     
                    </div>             

                    
                                                


							


						
                    <div class="col-lg-6">
                    
                    
                      
                    
                  			  <%
							String message=(String)session.getAttribute("issue_book_student_message");
							if(message!=null){
							%>
								
								 <div class="alert alert-success">
                                        <%=message%>
                                    </div>


							<%			session.removeAttribute("issue_book_student_message");
							}
							%>
                    
                    
                    
                        
                    
                                            <section class="panel">
                                                <header class="panel-heading">Issue Book</header>
                                                <div class="panel-body">

                                                    <form action="<%=Common_Things.url%>/issue-book-student-controller/" class="form-horizontal" role="form" method="post" name="myForm"  onsubmit="return validateForm()">
                                                    
                                                    	<input type="hidden" name="student_id" value="<%=student_id %>">
                                                    
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Student Name </label>
                                                            	<div class="col-sm-10">
                                                               	<input type="text" class="form-control" name="student_name"  data-parsley-required="true" value="<%=Student_name %>" data-parsley-trigger="change" placeholder="Book Title" readonly="readonly">
                                                               </div> 
                                                             
                                                        </div> 
                                                     <hr> 
                                                         <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Admission No </label>
                                                            	<div class="col-sm-10">
                                                               	<input type="text" class="form-control" name="admission_no"  data-parsley-required="true" value="<%=admission_no %>" data-parsley-trigger="change" placeholder="Bar Code" readonly="readonly">
                                                               </div> 
                                                             
                                                        </div> 
                                                     
                                                     <hr> 
                                                         <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Barcode No* </label>
                                                            	<div class="col-sm-10">
                                                               	<input type="text" class="form-control" name="barcode" id="search" data-parsley-required="true" data-parsley-trigger="change" placeholder="Barcode">
                                                               </div> 
                                                             
                                                        </div> 
                                                     <hr> 
                                                    
                                                         
                                                         
                                                       
                                                          <div class="form-group">
                                                            <label class="col-sm-2 control-label">Issue Date</label>
                                                            <div class="col-sm-6">
																<%
																TimeZone.setDefault(TimeZone.getTimeZone("Asia/Qatar"));
																SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
																 
																  Date today4 = new Date();
																  String date4 = format.format(today4);
																
																
																%>
                                                                <div class="input-group mg-b-md input-append date datepicker"  data-date="<%=date4 %>"  data-date-format="dd-mm-yyyy">
                                                                    <input type="text" class="form-control" value="<%=date4 %>" name="issue_date">
                                                                    <span class="input-group-btn">
                                                                        <button class="btn btn-white add-on" type="button">
                                                                            <i class="fa fa-calendar"></i>
                                                                        </button>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        
                                                        
                                                        
                                                        
                                                        
                                                        
                                                        <div class="form-group">
                                                            <label class="col-sm-2 control-label">Return Date</label>
                                                            <div class="col-sm-6">

                                                                <div class="input-group mg-b-md input-append date datepicker" data-date="<%=date4 %>" data-date-format="dd-mm-yyyy">
                                                                    <input type="text" class="form-control" value="<%=date4 %>" name="return_date">
                                                                    <span class="input-group-btn">
                                                                        <button class="btn btn-white add-on" type="button">
                                                                            <i class="fa fa-calendar"></i>
                                                                        </button>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        
                                                        
                                                     <hr> 
                                                     
                                                         <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Description</label>
                                                            <div class="col-sm-10"> 
                                                            
                                                            	<textarea rows="5" class="form-control" placeholder="Description" name="description"></textarea>
                                                            
                                                            
                                                                
                                                            </div>
                                                        </div>
                                                     
                                                     <hr>  
                                                        </div> 
                                                        <div class="form-group">   
                                                            <div class="col-sm-offset-2 col-sm-15">
                                                                <button type="submit" class="btn btn-warning">Issue Book</button>
                                                            </div>
                                                        </div>
                                                    </form>

                                                </div> 


                    <%
                    String search=(String)request.getParameter("search");
                    
                    if(search!=null && !search.equals("")){
                    	
                    
                    %>
                    
                    <div class="row">
                        <div class="col-lg-12">
                            <section class="panel">
                                <div class="panel-body">
                                
                                    <div class="col-lg-12">
                                            <section class="panel panel-primary">
                                <div class="panel-heading">Search Student : <%=search %>
                                    
                                </div>
                                <ul class="list-group">
                                
                                
                                	 <table class="table table-hover no-margin">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Admission No </th>
                                                <th>Name</th>
                                                <th>Grade</th>
                                                <th>Section</th>
                                                 <th>Status</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                           
                                          
                                 
                                	<% 
                                	
                                	Student_Table_Model obj_Student_Table_Model=new Student_Table_Model();  
                       	                  	List<Student_Use_Bean> list_students=obj_Student_Table_Model.search_result_student(search);
                       	                                	 
                       	                                	
                       	                                	if(list_students!=null){
                       	                                		Iterator<Student_Use_Bean> it_list_students=list_students.iterator();
                       	                                		Student_Use_Bean obj_Student_Use_Bean=new Student_Use_Bean();
                       	                                	int temp_count=1;
                       	                                		while(it_list_students.hasNext()){
                       	                                			obj_Student_Use_Bean=it_list_students.next();
                           	%>
 
                                	                                    
                                   			 <tr>
                                                <td><%=temp_count++ %></td>
                                                <td><%=obj_Student_Use_Bean.getAdmission_no() %></td>
                                               <td> <a href="<%=Common_Things.url %>/complete-details-student/?lm=<%=obj_Student_Use_Bean.getStudent_id() %>" class="btn btn-warning btn-outline btn-rounded"><%=obj_Student_Use_Bean.getStudent_name() %></a>          </td>
                                               <td><%=obj_Student_Use_Bean.getGrade() %></td>
                                               <td><%=obj_Student_Use_Bean.getSection() %></td>
                                               <td><%if(obj_Student_Use_Bean.getStatus()==1){
                                            	 		  out.println("Active");
	                                               }else{
	                                            		   out.println("Not Active");		   
	                                               }	
                                            	   %>
                                               
                                               
                                               
                                               
                                               </td>
                                            </tr>
                                   
                                    
                                   
                                   
                                   
                                	<%		
                                			
                                			
                                		}
                                		
                                		
                                	}
                                	
                                	%>
                                
                                  
                                        </tbody>
                                    </table>
                                
                                  
                                  

                                </ul>

                            </section> 
                                        </div>
                                
                                
                                
                                
                                
                                
                                
                                
                                </div>
                            </section>
                        </div>
                    </div>
                    
                 <%
                    }
                 
                 %>   
                    
                    
                </div>
                <!-- /content wrapper -->
            </section>
            <!-- /main content -->
        </section>

    </div>

   <!-- core scripts -->
    <script src="<%=Common_Things.url %>/vendor/jquery-1.11.0.min.js"></script>
    <script src="<%=Common_Things.url %>/bootstrap/js/bootstrap.js"></script>
    <!-- /core scripts -->

    <!-- page scripts -->
    <script src="<%=Common_Things.url %>/vendor/bootstrap-select/bootstrap-select.js"></script>
    <script src="<%=Common_Things.url %>/vendor/dropzone/dropzone.js"></script>
    <script src="<%=Common_Things.url %>/vendor/parsley.min.js"></script>
    <script src="<%=Common_Things.url %>/vendor/jquery.maskedinput.min.js"></script>
    <script src="<%=Common_Things.url %>/vendor/fuelux/checkbox.js"></script>
    <script src="<%=Common_Things.url %>/vendor/fuelux/radio.js"></script>
    <script src="<%=Common_Things.url %>/vendor/fuelux/wizard.js"></script>
    <script src="<%=Common_Things.url %>/vendor/fuelux/pillbox.js"></script>
    <script src="<%=Common_Things.url %>/vendor/fuelux/spinner.js"></script>
    <script src="<%=Common_Things.url %>/vendor/slider/bootstrap-slider.js"></script>
    <script src="<%=Common_Things.url %>/vendor/bootstrap-datepicker/bootstrap-datepicker.js"></script>
    <script src="<%=Common_Things.url %>/vendor/wysiwyg/jquery.hotkeys.js"></script>
    <script src="<%=Common_Things.url %>/vendor/wysiwyg/bootstrap-wysiwyg.js"></script>
    <script src="<%=Common_Things.url %>/vendor/switchery/switchery.js"></script>
    <!-- /page scripts -->

    <!-- theme scripts -->
    <script src="<%=Common_Things.url %>/js/off-canvas.js"></script>
    <script src="<%=Common_Things.url %>/vendor/offline/offline.min.js"></script>
    <script src="<%=Common_Things.url %>/js/main.js"></script>
    <!-- /theme scripts -->

    <script src="<%=Common_Things.url %>/js/forms.js"></script>
      
</body>
<!-- /body -->

</html>
