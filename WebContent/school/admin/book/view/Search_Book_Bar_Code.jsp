<!DOCTYPE html>


<%@page import="common_use_bean.Book_Use_Bean"%>
<%@page import="Inventry_Table_Model.Inventry_Table_Model"%><html class="no-js">

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
		$("#search").autocomplete("<%=Common_Things.url%>/search-book-form/");
	});
   </script>
    
      <script> 
	jQuery(function(){  
		$("#bar").autocomplete("<%=Common_Things.url%>/search-bar-code-form/");
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
                            <h3 class="no-margin">Book Search </h3>
                             
                        </div> 
                       <a href="<%=Common_Things.url %>/admin-add-book/?kou=<%="232323243kihnadfhlacfhdkaudfhnakcdfchakdfhbkavhdfhna" %>" class="btn btn-info">Add Book</a>
                       
                    </div>             

                    
                                                


							


						
                    <div class="col-lg-6">
                    
                    
                    
                        
                    
                                            <section class="panel">
                                                <header class="panel-heading">Search Book</header>
                                                <div class="panel-body">

                                                    <form action="<%=Common_Things.url%>/search-book/" class="form-horizontal" role="form">
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Book </label>
                                                            	<div class="col-sm-10">
                                                               	<input type="text" class="form-control" name="search" id="search" data-parsley-required="true" data-parsley-trigger="change" placeholder="Book Search">
                                                               </div> 
                                                             
                                                        </div> 
                                                        
                                                        
                                                         
                                                     
                                                     <hr> 
                                                     
                                                         
                                                        </div>
                                                        <div class="form-group">   
                                                            <div class="col-sm-offset-2 col-sm-15">
                                                                <button type="submit" class="btn btn-default">Search Book</button>
                                                            </div>
                                                        </div>
                                                    </form>

                                                </div> 


							<div class="col-lg-6">
                    
                    
                    
                        
                    
                                            <section class="panel">
                                                <header class="panel-heading">Search Barcode</header>
                                                <div class="panel-body">

                                                    <form action="<%=Common_Things.url%>/search-bar-code/" class="form-horizontal" role="form">
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Barcode </label>
                                                            	<div class="col-sm-10">
                                                               	<input type="text" class="form-control" name="search" id="bar" data-parsley-required="true" data-parsley-trigger="change" placeholder="Search Bar Code">
                                                               </div> 
                                                             
                                                        </div> 
                                                        
                                                        
                                                         
                                                     
                                                     <hr> 
                                                     
                                                         
                                                        </div>
                                                        <div class="form-group">   
                                                            <div class="col-sm-offset-2 col-sm-15">
                                                                <button type="submit" class="btn btn-default">Search Bar Code</button>
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
                                <div class="panel-heading">Search Book : <%=search %>
                                    
                                </div>
                                <ul class="list-group">
                                
                                
                                	 <table class="table table-hover no-margin">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Book Title </th>
                                                <th>Book Bar Code </th>
                                                <th>Status</th>
                                                <th>Issue/Return</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                           
                                          
                                 
                                	<%  
                                	
                                	Inventry_Table_Model obj_Inventry_Table_Model=new Inventry_Table_Model();  
                       	                  	List<Book_Use_Bean> list_books=obj_Inventry_Table_Model.get_serial_from_bar_code(search);
                       	                                	 
                       	                                	
                       	                                	if(list_books!=null){
                       	                                		Iterator<Book_Use_Bean> it_list_books=list_books.iterator();
                       	                                		Book_Use_Bean obj_Book_Use_Bean=new Book_Use_Bean();
                       	                                	int temp_count=1;
                       	                                		while(it_list_books.hasNext()){
                       	                                			obj_Book_Use_Bean=it_list_books.next();
                           	%>
 
                                	                                    
                                   			 <tr>
                                                <td><%=temp_count++ %></td>
                                                    <td>      	<a href="<%=Common_Things.url %>/complete-details-of-book/?s=<%=obj_Book_Use_Bean.getBook_sl_no() %>"  class="btn btn-success btn-xs" ><%=obj_Book_Use_Bean.getBook_title() %></a></td>
                                            <td><%=obj_Book_Use_Bean.getBar_code() %></td>
                                               
                                                <td>
                                                	<%
                                                	
                                                	if(obj_Book_Use_Bean.getBook_status()!=null){
                                                		if(obj_Book_Use_Bean.getBook_status().contains("Not")){
                                                	%>
                                                		<button type="button" class="btn btn-danger btn-xs">Not Available</button>
                                                	<%	
                                                		}else{
                                                	%>
                                                    		<button type="button" class="btn btn-success btn-xs">Available</button>
                                                    <%	
                                                    			
                                                			
                                                		}
                                                	}
                                                	%>
                                                </td>
                                               
                                                <td>
                                                
                                                <%
                                                	
                                                	if(obj_Book_Use_Bean.getBook_status()!=null){
                                                		if(obj_Book_Use_Bean.getBook_status().contains("Not")){
                                                	%>
                                                		
                                                		<a href="<%=Common_Things.url %>/issue-history/?jin=<%=obj_Book_Use_Bean.getBook_title() %>&bn=<%=obj_Book_Use_Bean.getBar_code() %>" class="btn btn-danger btn-xs">View Details</a>
                                                
                                                	<%	
                                                		}else{
                                                	%>
                                                    		
                                                    		<a href="<%=Common_Things.url %>/issue-book/?jin=<%=obj_Book_Use_Bean.getSl_no() %>" class="btn btn-success btn-xs">ISSUE</a>
                                                
                                                    <%	
                                                    			
                                                			
                                                		}
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
