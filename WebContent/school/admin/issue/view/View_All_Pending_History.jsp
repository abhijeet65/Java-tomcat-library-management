<!DOCTYPE html>


<%@page import="Issue_Table_Model.Issue_Table_Model"%>
<%@page import="common_use_bean.Issue_Use_Bean"%>
<%@page import="home_page_model.Home_Page_Model"%>
<%@page import="common_use_bean.Home_Page_Use_Bean"%><html class="no-js">

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
    <!-- /core styles -->

    <!-- page styles -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/toastr/toastr.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/jvectormap/jquery-jvectormap-1.2.2.css">
    <!-- /page styles -->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- load modernizer -->
    <script src="<%=request.getContextPath()%>/vendor/modernizr.js"></script>
    
    
    
    
      <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.autocomplete.js"></script>
   
    <script> 
	jQuery(function(){  
		$("#search").autocomplete("<%=Common_Things.url%>/search-form-student/");
	});
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
                            <h3 class="no-margin">All Pending Issue History</h3>
                             
                        </div> 
                       <a href="<%=Common_Things.url %>/add-student/?kou=<%="232323243kihnadfhlacfhdkaudfhnakcdfchakdfhbkavhdfhna" %>" class="btn btn-info">Add Student</a>
                       
                    </div>             

                    
                             

					
<%
                    
                        
    					
    					
                    int temp_count=1;
                    int int_lim=0;
					
                    
                    String lim=(String)request.getParameter("lim");	
                    if(lim==null){
                    	int_lim=0;
                    }else{
                    	int_lim=Integer.parseInt(lim.trim());
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
                                                <th>Student Name </th>
                                                <th>Book Name </th>
                                                <th>Barcode</th>
                                                <th>Issue Date</th>
                                                <th>Renewed Date 1-5</th>
                                                <th>Return Date</th> 
                                                <th>Description</th> 
                                                <th>Status</th>
                                                <th>Delay Days</th>
                                                <th>Update</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                           
                                          
                                 
                                	<% 
                                	
                                	Issue_Table_Model obj_Issue_Table_Model=new Issue_Table_Model();  
                                	List<Issue_Use_Bean> list_history=obj_Issue_Table_Model.get_all_pending_issues(int_lim);
                       	                                	 
                       	                                	
                       	                                	if(list_history!=null){
                       	                                		Iterator<Issue_Use_Bean> it_list_history=list_history.iterator();
                       	                                		Issue_Use_Bean obj_Issue_Use_Bean=new Issue_Use_Bean();
                       	                                	
                       	                                		while(it_list_history.hasNext()){
                       	                                			obj_Issue_Use_Bean=it_list_history.next();
                           	%>
 
                                	                                    
                                   			  <tr>
                                                <td><%=temp_count++ %></td>
                                                 <td> <a href="<%=Common_Things.url %>/complete-details-student/?lm=<%=obj_Issue_Use_Bean.getStudent_id() %>" class="btn btn-primary btn-xs"><%=obj_Issue_Use_Bean.getStudent_name() %></a>          </td>
                                               <td><%=obj_Issue_Use_Bean.getBook_title() %></td>
                                               <td> 
                                               <%=obj_Issue_Use_Bean.getBarcode() %>
                                               
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
                                               
                                               
                                             				  <%
                                             					 TimeZone.setDefault(TimeZone.getTimeZone("Asia/Qatar"));
																SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
																 
																  Date today4 = new Date();
																  String date4 = format.format(today4);
																
                                             				  
                                             				  
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
                                               <td><%if(days_count!=null){out.println(days_count);} %></td>
                                               
                                                
                                               <td><a href="<%=Common_Things.url %>/update-issue-book/?lololo=<%=obj_Issue_Use_Bean.getIssue_sl_no() %> " class="btn btn-success btn-xs">Update</a> </td> 
                                               
                                            </tr>
                                   
                                    
                                   
                                   
                                   
                                	<%		
                                			
                                			
                                		}
                                		
                                		
                                	}
                       	                             	if(temp_count==101){  
                       	                                	%>
                       	                                			<tr>
                       	                                					<td></td>
                       	                                			 
                       	                                					<td></td>
                       			                                			<td></td>
                       			                                			<td></td>
                       			                                			<td>
                       			                              <%
                       			                              					if(int_lim==1){
                       			                              %>
                       			            	          						 <a href="<%=Common_Things.url %>/view-all-pending-issues/?lim=<%=0 %>"  class="btn btn-danger btn-xs">Previous</a>
                       	                     											
                       			                              <%						
                       			                              					}else if(int_lim!=0){    
                       			                              %>
                       			            	          								<a href="<%=Common_Things.url %>/view-all-pending-issues/?lim=<%=int_lim-1 %>"  class="btn btn-danger btn-xs">Previous</a>
                       	                    
                       			                              <%						
                       			                             						
                       			                              					}
                       			                              %>  			
                       			                                			
                       			                                				 
                       			                                			</td>
                       			                                			<td></td>
                       			                							<td>
                       			                                				   <a href="<%=Common_Things.url %>/view-all-pending-issues/?lim=<%=int_lim+1 %>"  class="btn btn-danger btn-xs">Next</a>
                       	                    
                       			                                			</td>
                       			                                			
                       			                                			<td></td>
                       	                                			<td></td>
                       	                                			<td></td>
                       	                                			 
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
                    
                
                    
                </div>
                <!-- /content wrapper -->
            </section>
            <!-- /main content -->
        </section>

    </div>

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
      
</body>
<!-- /body -->

</html>
