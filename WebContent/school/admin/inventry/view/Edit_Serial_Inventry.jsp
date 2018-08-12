<!DOCTYPE html>


<%@page import="Inventry_Table_Model.Inventry_Table_Model"%>
<%@page import="common_use_bean.Book_Use_Bean"%><html class="no-js">

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
    
    
    
    
    
    <script type="text/javascript">
		function validateForm() {
		    var x = document.forms["myForm"]["total_book_in_library"].value;
		    if (x==null || x=="") {
		        alert("Please enter Quantity");
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
					<%
					 String serial_sl_no=(String)request.getParameter("s");
					
					Book_Use_Bean obj_Book_Use_Bean=new Book_Use_Bean();
					Inventry_Table_Model obj_Inventry_Table_Model=new Inventry_Table_Model();
					
					obj_Book_Use_Bean=obj_Inventry_Table_Model.get_serial_status(serial_sl_no);
				
					
					%> 
                    <div class="row mg-b">
                        <div class="col-xs-8"> 
                            <h3 class="no-margin">Edit Barcode
                           <a href="<%=Common_Things.url %>/inventry-books/?kou=<%=obj_Book_Use_Bean.getBook_sl_no() %>" class="btn btn-info">Back</a>
                        </h3>
                        </div>
                        <%
                       
                        %>
                       
                    </div>             

                    <div class="col-lg-6">
                    
                    
                    
                    
                    
                    		<%
							String message=(String)session.getAttribute("edit_inventry_message");
							if(message!=null){
							%> 
								
								 <div class="alert alert-success">
                                        <%=message%>
                                    </div>


							<%	session.removeAttribute("edit_inventry_message");
							}
							%>
                    
                    
                    
                    		
                    
                    
                    
                    
                                            <section class="panel">
                                                <header class="panel-heading">Edit Inventry</header>
                                                <div class="panel-body">
 
												<form action="<%=Common_Things.url%>/edit-inventry-serial-contro/" class="form-horizontal" role="form" name="myForm"  onsubmit="return validateForm()">
                                                       <input type="hidden" name="sl_no" value="<%=serial_sl_no %>">
                                                      <input type="hidden" name="old_bar_code" value="<%=obj_Book_Use_Bean.getBar_code() %>">
                                                      
                                                       
                                                     
                                                       
                                                         
                                                       
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Barcode </label> 
                                                            	<div class="col-sm-10">
                                                               	<input type="text" class="form-control" name="bar_code" data-parsley-required="true" data-parsley-trigger="change" placeholder="Barcode " value="<%if(obj_Book_Use_Bean.getBar_code()!=null){out.println(obj_Book_Use_Bean.getBar_code());} %>">
                                                               </div> 
                                                             
                                                        </div> 
                                                      <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Shelf </label> 
                                                            	<div class="col-sm-10">
                                                               	<input type="text" class="form-control" name="shelf" data-parsley-required="true" data-parsley-trigger="change" placeholder="Shelf " value="<%if(obj_Book_Use_Bean.getShelf()!=null  && !obj_Book_Use_Bean.getShelf().contains("null")){out.println(obj_Book_Use_Bean.getShelf());} %>">
                                                               </div> 
                                                             
                                                        </div>  
                                                        
                                                      <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Rack </label> 
                                                            	<div class="col-sm-10">
                                                               	<input type="text" class="form-control" name="rack" data-parsley-required="true" data-parsley-trigger="change" placeholder="Rack" value="<%if(obj_Book_Use_Bean.getRack()!=null  && !obj_Book_Use_Bean.getRack().contains("null")){out.println(obj_Book_Use_Bean.getRack());} %>" >
                                                               </div> 
                                                             
                                                        </div> 
                                                        
                                                       <hr>  
                                                     
                                                          <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Description</label>
                                                            <div class="col-sm-10"> 
                                                            
                                                            	<textarea rows="5" class="form-control" placeholder="Description" name="description"><%if(obj_Book_Use_Bean.getDescription()!=null){out.println(obj_Book_Use_Bean.getDescription());} %></textarea>
                                                            
                                                            
                                                                
                                                            </div>
                                                        </div>
                                                     
                                                     
                                                     <hr> 
                                                     
                                                         
                                                        </div>
                                                        <div class="form-group">  
                                                            <div class="col-sm-offset-2 col-sm-15">
                                                                <button type="submit" class="btn btn-default">Edit</button>
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

    <div data-phase="1" class="offline-ui">
        <div class="offline-ui-content" data-retry-in="" data-retry-in-abbr=""></div>
        <a class="offline-ui-retry"></a>
    </div>

    <!-- core scripts -->
    <script src="<%=request.getContextPath() %>/vendor/jquery-1.11.0.min.js"></script>
    <script src="<%=request.getContextPath() %>/bootstrap/js/bootstrap.js"></script>
    <!-- /core scripts -->

    <!-- page scripts -->
    <script src="<%=request.getContextPath() %>/vendor/toastr/toastr.min.js"></script>
    <script src="<%=request.getContextPath() %>/vendor/moment.js"></script>
    <script src="<%=request.getContextPath() %>/vendor/skycons.js"></script>
    <script src="<%=request.getContextPath() %>/vendor/jquery.blockUI.js"></script>
    <script src="<%=request.getContextPath() %>/vendor/raphael.min.js"></script>
    <script src="<%=request.getContextPath() %>/vendor/morris/morris.js"></script>
    <script src="<%=request.getContextPath() %>/vendor/switchery/switchery.js"></script>
    <script src="<%=request.getContextPath() %>/vendor/jquery.slimscroll.js"></script>
    <!-- /page scripts -->

    <!-- theme scripts -->
    <script src="<%=request.getContextPath() %>/js/off-canvas.js"></script>
    <script src="<%=request.getContextPath() %>/vendor/offline/offline.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/main.js"></script>
    <!-- /theme scripts -->

    <script src="<%=request.getContextPath() %>/js/dashboard.js"></script>

</body>
<!-- /body -->

</html>
