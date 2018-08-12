<!DOCTYPE html>

<%@page import="book_table.Admin_Book_Table_Model"%>
<%@page import="common_use_bean.Book_Use_Bean"%>
<%@page import="category_table.Category_Table"%>
<%@page import="common_use_bean.Category_Use_Bean"%>
<%@page import="student_table.Student_Table_Model"%>
<%@page import="common_use_bean.Student_Use_Bean"%>
<%@page import="Inventry_Table_Model.Inventry_Table_Model"%>
<%@page import="Issue_Table_Model.Issue_Table_Model"%>
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
    <script type="text/javascript">

	function confSubmit(form) { 
	if (confirm("Are you sure??..")) {
	form.submit();
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
			String issue_sl_no=(String)request.getParameter("lololo");
			Issue_Table_Model  obj_Issue_Table_Model=new Issue_Table_Model();
			
			Issue_Use_Bean obj_Issue_Use_Bean=obj_Issue_Table_Model.get_complete_details_of_issue(issue_sl_no);
			%>
           

            <!-- main content -->
            <section class="main-content">

                <!-- content wrapper -->
                <div class="content-wrap">

                    <div class="row mg-b">
                        <div class="col-xs-8"> 
                            <h3 class="no-margin">Update Issued Book :<%=obj_Issue_Use_Bean.getBook_title() %></h3> 
                             
                        </div> 
                        <a href="<%=Common_Things.url %>/issue-history/?jin=<%=obj_Issue_Use_Bean.getBook_title() %>&bn=<%=obj_Issue_Use_Bean.getBarcode() %>" class="btn btn-info">Back</a>
                      
                    </div>             

                    
                                                


							


						
                    <div class="col-lg-6">
                    
                    
                      
                    
                  			  <%
							String message=(String)session.getAttribute("issue_book_message");
							if(message!=null){
							%>
								
								 <div class="alert alert-success">
                                        <%=message%>
                                    </div>


							<%			session.removeAttribute("issue_book_message");
							}
							%>
                    
                    
                    
                        
                    
                                            <section class="panel">
                                                <header class="panel-heading">Issue Book</header>
                                                <div class="panel-body">

                                                    <form action="<%=Common_Things.url%>/update-issue-book-contro/" class="form-horizontal" role="form" method="post" name="myForm"  onsubmit="return validateForm()">
                                                    
                                                    	<input type="hidden" name="book_sl_no" value="<%=obj_Issue_Use_Bean.getBook_sl_no() %>">
                                                    <input type="hidden" name="issue_sl_no" value="<%=issue_sl_no %>"> 
                                                    <input type="hidden" name="bar_code" value="<%=obj_Issue_Use_Bean.getBarcode() %>"> 
                                                    
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Book Title </label>
                                                            	<div class="col-sm-10">
                                                               	<input type="text" class="form-control" name="book_title"  data-parsley-required="true" value="<%=obj_Issue_Use_Bean.getBook_title() %>" data-parsley-trigger="change" placeholder="Book Title" readonly="readonly">
                                                               </div> 
                                                             
                                                        </div> 
                                                     <hr> 
                                                         <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Bar Code </label> 
                                                            	<div class="col-sm-10">
                                                               	<input type="text" class="form-control" name="barcode"  data-parsley-required="true" value="<%=obj_Issue_Use_Bean.getBarcode()%>" data-parsley-trigger="change" placeholder="Bar Code" readonly="readonly">
                                                               </div> 
                                                             
                                                        </div> 
                                                     
                                                     <hr> 
                                                         <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Student Admission No* </label>
                                                            	<div class="col-sm-10">
                                                               	<input type="text" class="form-control" name="admission_no" id="search" value="<%if(obj_Issue_Use_Bean.getAdmission_no()!=null){out.println(obj_Issue_Use_Bean.getAdmission_no());}%>" data-parsley-required="true" data-parsley-trigger="change" placeholder="Student Admission No" readonly="readonly">
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
                                                                    <input type="text" class="form-control" value="<%if(obj_Issue_Use_Bean.getIssue_date()!=null){out.println(obj_Issue_Use_Bean.getIssue_date());}%>" name="issue_date">
                                                                    <span class="input-group-btn">
                                                                        <button class="btn btn-white add-on" type="button">
                                                                            <i class="fa fa-calendar"></i>
                                                                        </button>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        
                                                        
                                                          <div class="form-group">
                                                            <label class="col-sm-2 control-label">Renew Date 1</label>
                                                            <div class="col-sm-6">
																
                                                                <div class="input-group mg-b-md input-append date datepicker"  data-date="<%=date4 %>"  data-date-format="dd-mm-yyyy">
                                                                    <input type="text" class="form-control" value="<%if(obj_Issue_Use_Bean.getRenew_date1()!=null){out.println(obj_Issue_Use_Bean.getRenew_date1());}%>" name="renew_date1">
                                                                    <span class="input-group-btn">
                                                                        <button class="btn btn-white add-on" type="button">
                                                                            <i class="fa fa-calendar"></i>
                                                                        </button>
                                                                    </span>
                                                                </div> 
                                                            </div>
                                                        </div>
                                                        
                                                        
                                                          <div class="form-group">
                                                            <label class="col-sm-2 control-label">Renew Date 2</label>
                                                            <div class="col-sm-6">
																
                                                                <div class="input-group mg-b-md input-append date datepicker"  data-date="<%=date4 %>"  data-date-format="dd-mm-yyyy">
                                                                    <input type="text" class="form-control" value="<%if(obj_Issue_Use_Bean.getRenew_date2()!=null){out.println(obj_Issue_Use_Bean.getRenew_date2());}%>" name="renew_date2">
                                                                    <span class="input-group-btn">
                                                                        <button class="btn btn-white add-on" type="button">
                                                                            <i class="fa fa-calendar"></i>
                                                                        </button>
                                                                    </span>
                                                                </div> 
                                                            </div>
                                                        </div>
                                                        
                                                        
                                                          <div class="form-group">
                                                            <label class="col-sm-2 control-label">Renew Date 3</label>
                                                            <div class="col-sm-6">
																
                                                                <div class="input-group mg-b-md input-append date datepicker"  data-date="<%=date4 %>"  data-date-format="dd-mm-yyyy">
                                                                    <input type="text" class="form-control" value="<%if(obj_Issue_Use_Bean.getRenew_date3()!=null){out.println(obj_Issue_Use_Bean.getRenew_date3());}%>" name="renew_date3">
                                                                    <span class="input-group-btn">
                                                                        <button class="btn btn-white add-on" type="button">
                                                                            <i class="fa fa-calendar"></i>
                                                                        </button>
                                                                    </span>
                                                                </div> 
                                                            </div>
                                                        </div>
                                                        
                                                        
                                                          <div class="form-group">
                                                            <label class="col-sm-2 control-label">Renew Date 4</label>
                                                            <div class="col-sm-6">
																
                                                                <div class="input-group mg-b-md input-append date datepicker"  data-date="<%=date4 %>"  data-date-format="dd-mm-yyyy">
                                                                    <input type="text" class="form-control" value="<%if(obj_Issue_Use_Bean.getRenew_date4()!=null){out.println(obj_Issue_Use_Bean.getRenew_date4());}%>" name="renew_date4">
                                                                    <span class="input-group-btn">
                                                                        <button class="btn btn-white add-on" type="button">
                                                                            <i class="fa fa-calendar"></i>
                                                                        </button>
                                                                    </span>
                                                                </div> 
                                                            </div>
                                                        </div>
                                                         
                                                        
                                                          <div class="form-group">
                                                            <label class="col-sm-2 control-label">Renew Date 5</label>
                                                            <div class="col-sm-6">
																
                                                                <div class="input-group mg-b-md input-append date datepicker"  data-date="<%=date4 %>"  data-date-format="dd-mm-yyyy">
                                                                    <input type="text" class="form-control" value="<%if(obj_Issue_Use_Bean.getRenew_date5()!=null){out.println(obj_Issue_Use_Bean.getRenew_date5());}%>" name="renew_date5">
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

                                                                <div class="input-group mg-b-md input-append date datepicker" data-date="<%if(obj_Issue_Use_Bean.getReturn_date()!=null){out.println(obj_Issue_Use_Bean.getReturn_date());}%>" data-date-format="dd-mm-yyyy">
                                                                    <input type="text" class="form-control" value="<%if(obj_Issue_Use_Bean.getReturn_date()!=null){out.println(obj_Issue_Use_Bean.getReturn_date());}%>" name="return_date">
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
                                                            <label class="col-sm-2 control-label">Returned Date</label>
                                                            <div class="col-sm-6">

                                                                <div class="input-group mg-b-md input-append date datepicker" data-date="<%if(obj_Issue_Use_Bean.getReturned_date()!=null){out.println(obj_Issue_Use_Bean.getReturned_date());} %>" data-date-format="dd-mm-yyyy">
                                                                    <input type="text" class="form-control" value="<%if(obj_Issue_Use_Bean.getReturned_date()!=null){out.println(obj_Issue_Use_Bean.getReturned_date());} %>" name="returned_date">
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
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Total Days Delayed </label> 
                                                            	<div class="col-sm-10">
                                                            	
                                                            	<%
                                                            	String days_count=null;
                                                            	if(obj_Issue_Use_Bean.getReturned_date()==null){
                                                            	
                                                            		days_count=obj_Issue_Table_Model.get_days_delay(obj_Issue_Use_Bean.getReturn_date(),date4);
                                                            		if(days_count!=null){
                                                            			if(days_count.contains("-")){
                                                            				days_count=null;
                                                                		}	
                                                            		}
                                                            	}
                                                            	%>
                                                            	
                                                            	
                                                               	<input type="text" class="form-control" name="barcode"  data-parsley-required="true" value="<%if(days_count!=null){out.println(days_count);} %>" data-parsley-trigger="change" placeholder="" readonly="readonly">
                                                               </div> 
                                                             
                                                        </div> 
                                                        
                                                        
                                                     <hr> 
                              
                                                      <div class="form-group">
                                                            <label class="col-sm-2 control-label">Status</label>
                                                            <div class="col-sm-6">
																<%
																String selected_pending=null;
																String selected_retuned=null;
																String selected_lost=null;
																String selected_other=null;
																if(obj_Issue_Use_Bean.getStatus()!=null){
																	if(obj_Issue_Use_Bean.getStatus().contains("pending")){
																		selected_pending="selected='selected'";
																	}	
																	if(obj_Issue_Use_Bean.getStatus().contains("Returned")){
																		selected_retuned="selected='selected'";
																	}	
																	if(obj_Issue_Use_Bean.getStatus().contains("Lost")){
																		selected_lost="selected='selected'";
																	}	
																	if(obj_Issue_Use_Bean.getStatus().contains("Other")){
																		selected_other="selected='selected'";
																	}	
																}
																%>
                                                                <select name="status">
                                                                	<option value="Pending" <%=selected_pending %> >Pending</option>
                                                               		 <option value="Returned" <%=selected_retuned %>>Returned</option>
                                                                	<option value="Lost" <%=selected_lost %>>Lost</option>
                                                              		 <option value="Other" <%=selected_other %>>Other</option>
                                                                
                                                                </select>
                                                            </div>
                                                        </div>
                                                        
                                                        
                                                     <hr> 
                                                     
                                                      <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Description</label>
                                                            <div class="col-sm-10"> 
                                                            
                                                            	<textarea rows="5" class="form-control" placeholder="Description" name="description"><%if(obj_Issue_Use_Bean.getDescription()!=null){out.println(obj_Issue_Use_Bean.getDescription());} %></textarea>
                                                            
                                                            
                                                                
                                                            </div>
                                                        </div>
                                                     
                                                     <hr>  
                                                     
            
                                                         
                                                        </div> 
                                                        <div class="form-group">   
                                                            <div class="col-sm-offset-2 col-sm-15">
                                                                
                                                                <input type="button" value="Update Issue" class="btn btn-warning" onClick="confSubmit(this.form);"></input>	
						
                                                                
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
