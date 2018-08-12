<!DOCTYPE html>

<%@page import="Issue_Table_Model.Issue_Table_Model"%>
<%@page import="common_use_bean.Book_Use_Bean"%>
<%@page import="common_use_bean.Issue_Use_Bean"%><html class="no-js">

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
		    var x = document.forms["myForm"]["admission_no"].value;
		    if (x==null || x=="") {
		        alert("Please enter Admission No of Student");
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
               
           
			<%
			String inventry_sl=(String)request.getParameter("jin");
			String bn=(String)request.getParameter("bn");
			
			
			//Inventry_Table_Model obj_Inventry_Table_Model=new Inventry_Table_Model();
			
			%>
           

            <!-- main content -->
            <section class="main-content">

                <!-- content wrapper -->
                <div class="content-wrap">

                    <div class="row mg-b">
                        <div class="col-xs-8"> 
                            <h3 class="no-margin">Issue History :<%=inventry_sl %>(<%=bn %>)</h3>
                             
                        </div> 
                       <a href="<%=Common_Things.url %>/add-student/?kou=<%="232323243kihnadfhlacfhdkaudfhnakcdfchakdfhbkavhdfhna" %>" class="btn btn-info">Add Student</a>
                       
                    </div>             

                    
                   


                    <%
							String message=(String)session.getAttribute("delete_issue_message");
							if(message!=null){
							%>
								
								 <div class="alert alert-success">
                                        <%=message%>
                                    </div>


							<%			session.removeAttribute("delete_issue_message");
							}
							%>
                    
                    <div class="row">
                        <div class="col-lg-12">
                         
                            <section class="panel">
                                <div class="panel-body">
                                
                                    <div class="col-lg-12">
                                            <section class="panel panel-primary">
                                <div class="panel-heading">Issue History
                                    
                                </div>
                                <ul class="list-group">
                                
                                
                                	 <table class="table table-hover no-margin">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Admission No </th>
                                                <th>Name</th>
                                                <th>Issue Date</th>
                                                <th>Renewed Date 1-5</th>
                                                <th>Return Date</th> 
                                                <th>Description</th> 
                                                <th>Status</th>
                                                <th>Update</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                           
                                          
                                 
                                	<% 
                                	
                                	Issue_Table_Model obj_Issue_Table_Model=new Issue_Table_Model();
                                	
                                	List<Issue_Use_Bean> list_issue_history=obj_Issue_Table_Model.issue_history_for_a_barcode(bn);
                       	                                	 
                       	                                	
                       	                                	if(list_issue_history!=null){
                       	                                		Iterator<Issue_Use_Bean> it_list_issue_history=list_issue_history.iterator();
                       	                                		Issue_Use_Bean obj_Issue_Use_Bean=new Issue_Use_Bean();
                       	                                	int temp_count=1;
                       	                                		while(it_list_issue_history.hasNext()){
                       	                                			obj_Issue_Use_Bean=it_list_issue_history.next();
                           	%>
 
                                	                                    
                                   			 <tr>
                                                <td><%=temp_count++ %></td>
                                                <td><%=obj_Issue_Use_Bean.getAdmission_no() %></td>
                                               <td> 
                                               
                                                <a href="<%=Common_Things.url %>/complete-details-student/?lm=<%=obj_Issue_Use_Bean.getStudent_id() %>" class="btn btn-primary btn-xs"><%=obj_Issue_Use_Bean.getStudent_name() %></a> 
                                               </td>
                                               <td><%=obj_Issue_Use_Bean.getIssue_date() %></td>
                                               <td><%
                                               
                                               if(obj_Issue_Use_Bean.getRenew_date1()!=null){
                                            	   out.println(obj_Issue_Use_Bean.getRenew_date1()+"<br>");
                                               }
                                               if(obj_Issue_Use_Bean.getRenew_date2()!=null){
                                            	   out.println(obj_Issue_Use_Bean.getRenew_date2()+"<br>");
                                               }
                                               if(obj_Issue_Use_Bean.getRenew_date3()!=null){
                                            	   out.println(obj_Issue_Use_Bean.getRenew_date3()+"<br>");
                                               }
                                               if(obj_Issue_Use_Bean.getRenew_date4()!=null){
                                            	   out.println(obj_Issue_Use_Bean.getRenew_date4()+"<br>");
                                               }
                                               if(obj_Issue_Use_Bean.getRenew_date5()!=null){
                                            	   out.println(obj_Issue_Use_Bean.getRenew_date5()+"<br>");
                                               }
                                                
                                               
                                               %></td>
                                               <td><%=obj_Issue_Use_Bean.getReturn_date() %></td>
                                               <td><%if(obj_Issue_Use_Bean.getDescription()!=null){out.println(obj_Issue_Use_Bean.getDescription());} %></td>
                                               <td><%=obj_Issue_Use_Bean.getStatus() %></td>
                                               <td><a href="<%=Common_Things.url %>/update-issue-book/?lololo=<%=obj_Issue_Use_Bean.getIssue_sl_no() %> " class="btn btn-success btn-xs">Update</a> </td> 
                                               
                                            </tr>
                                   
                                    
                                   
                                   
                                   
                                	<%		
                                			
                                			
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
