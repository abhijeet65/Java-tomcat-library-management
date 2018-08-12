<!DOCTYPE html>

<%@page import="book_table.Admin_Book_Table_Model"%>
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
    
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.autocomplete.js"></script>
    
    
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
    
    
    
    
    
    <script> 
	jQuery(function(){  
		$("#category_name").autocomplete("<%=Common_Things.url%>/search-category-list/");
	});
   </script>
    
    
    
    
    
</head>

<!-- body -->

<body>
		

	
    <div class="app" data-sidebar="locked">
        <!-- top header -->
        
               <%@include file="../../common/tab.jsp" %>
               
           
			<%
			String book_sl_no=(String)request.getParameter("s");
			Admin_Book_Table_Model obj_Admin_Book_Table_Model=new Admin_Book_Table_Model();
			Book_Use_Bean obj_Book_Use_Bean=new Book_Use_Bean();
			obj_Book_Use_Bean=obj_Admin_Book_Table_Model.get_Complete_details_of_book(book_sl_no);
			%>
           

            <!-- main content -->
            <section class="main-content">
 
                <!-- content wrapper -->
                <div class="content-wrap">

                    <div class="row mg-b">
                        <div class="col-xs-6"> 
                            <h3 class="no-margin"> <%=obj_Book_Use_Bean.getBook_title() %></h3>
                            
                        </div>
                       
                       
                       <a href="<%=Common_Things.url %>/inventry-books/?kou=<%=obj_Book_Use_Bean.getBook_sl_no() %>" class="btn btn-info">Inventry</a>
                       
                       
                    </div>
 
                    <div class="col-lg-6">
                    
                    
                    
                    
                    
                    <%
							String message=(String)session.getAttribute("add_book_message");
							if(message!=null){
							%>
								
								 <div class="alert alert-success">
                                        <%=message%>
                                    </div>


							<%			session.removeAttribute("add_book_message");
							}
							%>
                    
                    
                    
                    
                    
                    
                    
                    
                                            <section class="panel">
                                               
                                                <div class="panel-body">

                                                    <form action="<%=Common_Things.url%>/admin-add-book-controller" class="form-horizontal" role="form">
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Book Title </label>
                                                            	<div class="col-sm-10">
                                                               	<input type="text" class="form-control" name="book_title" data-parsley-required="true" data-parsley-trigger="change" placeholder="Book Title" value="<% if(obj_Book_Use_Bean.getBook_title()!=null){out.println(obj_Book_Use_Bean.getBook_title());} %>" readonly="readonly">
                                                               </div> 
                                                             
                                                        </div> 
                                                        
                                                       
                                                        	<hr>
                                                           
                                                       
                                                         
                                                        
                                                        
                                                         <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Category</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" id="category_name"  placeholder="Category" name="category_name" value="<% if(obj_Book_Use_Bean.getCategory_name()!=null){out.println(obj_Book_Use_Bean.getCategory_name());} %>" readonly="readonly">
                                                            </div>
                                                        </div>
                                                        
                                                        
                                                       		<hr> 
                                                        
                                                        
                                                         
                                                        
                                                        
                                                        
                                                         <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Author</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" placeholder="Author" name="author_name" value="<% if(obj_Book_Use_Bean.getAuthor_name()!=null){out.println(obj_Book_Use_Bean.getAuthor_name());} %>" readonly="readonly">
                                                            </div>
                                                        </div>
                                                        
                                                        
                                                       		
                                                          	<hr> 
                                                        
                                                        
                                                          
                                                        
                                                        
                                                         <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Publisher</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" placeholder="Publisher" name="publisher_name" value="<% if(obj_Book_Use_Bean.getPublisher_name()!=null){out.println(obj_Book_Use_Bean.getPublisher_name());} %>" readonly="readonly">
                                                            </div>
                                                        </div>
                                                        <hr> 
                                                        
                                                       	 <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Edition</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" placeholder="Edition" name="edition" value="<% if(obj_Book_Use_Bean.getEdition()!=null){out.println(obj_Book_Use_Bean.getEdition());} %>" readonly="readonly">
                                                            </div>
                                                        </div>
                                                        	<hr> 
                                                           
                                                       	 <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Volume</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" placeholder="Volume" name="volume" value="<% if(obj_Book_Use_Bean.getVolume()!=null){out.println(obj_Book_Use_Bean.getVolume());} %>" readonly="readonly">
                                                            </div>
                                                        </div>
                                                        
                                                        <hr> 
                                                         <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">EAN Code</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" placeholder="EAN Code" name="ean_code" value="<% if(obj_Book_Use_Bean.getEan_code()!=null){out.println(obj_Book_Use_Bean.getEan_code());} %>" readonly="readonly">
                                                            </div>
                                                        </div>
                                                        <hr> 
                                                        
                                                         
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">ISBN</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" placeholder="ISBN" name="isbn" value="<% if(obj_Book_Use_Bean.getIsbn()!=null){out.println(obj_Book_Use_Bean.getIsbn());} %>" readonly="readonly">
                                                            </div>
                                                        </div>
                                                         <hr> 
                                                        
                                                        
                                                         <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Price</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" placeholder="Price" name="price" value="<% if(obj_Book_Use_Bean.getPrice()!=null){out.println(obj_Book_Use_Bean.getPrice());} %>" readonly="readonly">
                                                            </div>
                                                        </div>
                                                         <hr> 
                                                      
                                                        
                                                           <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Language</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" placeholder="Language" name="language" value="<% if(obj_Book_Use_Bean.getLanguage()!=null){out.println(obj_Book_Use_Bean.getLanguage());} %>" readonly="readonly">
                                                            </div>
                                                        </div>
                                                         
                                                        
                                                     
                                                     <hr> 
                                                     	 <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Description</label>
                                                            <div class="col-sm-10"> 
                                                            
                                                            	<textarea rows="5" class="form-control" placeholder="Description" name="description" readonly="readonly"><% if(obj_Book_Use_Bean.getDescription()!=null){out.println(obj_Book_Use_Bean.getDescription());} %></textarea>
                                                            
                                                            
                                                                
                                                            </div>
                                                        </div>
                                                         
                                                     
                                                     <hr> 
                                                      
                                                         
                                                        </div>
                                                        <div class="form-group">  
                                                            <div class="col-sm-offset-2 col-sm-15">
                                                                <a href="<%=Common_Things.url %>/edit-book/?s=<%=obj_Book_Use_Bean.getBook_sl_no() %>" class="btn btn-success">Edit Details</a> 
                                                                
                                                                
                                                                
                                                                
                                                            </div>
                                                        </div>
                                                    </form>

                                                </div> 
                                                
                                         		 <div class="col-lg-6">
                                            <section class="panel panel-primary">
                                <div class="panel-heading">Library Availability 
                                    
                                </div>
                                <ul class="list-group">
                                
                                 <table class="table table-hover no-margin">
                                        <thead>
                                             <tr>
                                                <th>#</th>
                                                <th>Book Bar Code </th>
                                                <th>Status</th>
                                                <th>Issue</th>
                                                <th>Details</th>
                                                <th>Shelf</th>
                                                <th>Rack</th>
                                               
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                
                                
                                	<%
                                	Inventry_Table_Model obj_Inventry_Table_Model=new Inventry_Table_Model();                                                                                                                               		//Admin_Book_Table_Model obj_Admin_Book_Table_Model=new Admin_Book_Table_Model(); 
                             	List<Book_Use_Bean> list_books=obj_Inventry_Table_Model.get_books_status(book_sl_no);
                             	
                             	
                             	if(list_books!=null){
                             		Iterator<Book_Use_Bean> it_list_books=list_books.iterator();
                             		int temp_count=1;
                             		while(it_list_books.hasNext()){
                             			obj_Book_Use_Bean=it_list_books.next();
                                                                                                                                                                	%>
                                	
                                	 		 <tr>
                                                <td><%=temp_count++ %></td>
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
                                                		
                                                		
                                                	<%	
                                                		}else{
                                                	%>
                                                    		
                                                    		<a href="<%=Common_Things.url %>/issue-book/?jin=<%=obj_Book_Use_Bean.getSl_no() %>" class="btn btn-success btn-xs">ISSUE</a>
                                                
                                                    <%	
                                                    			
                                                			
                                                		}
                                                	}
                                                	%>
                                                
                                                
                                              
                                                </td>
                                                <td>
                                                <a href="<%=Common_Things.url %>/issue-history/?jin=<%=obj_Book_Use_Bean.getBook_title() %>&bn=<%=obj_Book_Use_Bean.getBar_code() %>" class="btn btn-danger btn-xs">View Details</a>
                                                
                                                </td>
                                                <td>
                                                	<%
                                                	if(obj_Book_Use_Bean.getShelf()!=null  && !obj_Book_Use_Bean.getShelf().contains("null")){
                                                		out.println(obj_Book_Use_Bean.getShelf());
                                                	}
                                                	%>
                                                
                                                </td>
                                                <td> 
                                                	<%
                                                	if(obj_Book_Use_Bean.getRack()!=null && !obj_Book_Use_Bean.getRack().contains("null")){
                                                		out.println(obj_Book_Use_Bean.getRack());
                                                	}
                                                	%>
                                                
                                                </td>
                                             
                                            
                                               
                                                
                                            </tr>
                                   
                                	<%		 
                                			
                                			
                                		}
                                		
                                		
                                	}else{ 
                                		%>
                                		 	<tr> 
                                                <td colspan="4">No Books In Library</td>
                                                
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
