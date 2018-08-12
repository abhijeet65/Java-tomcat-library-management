<!DOCTYPE html>

<%@page import="book_table.Admin_Book_Table_Model"%>
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
   <script> 
	jQuery(function(){  
		$("#book_title").autocomplete("<%=Common_Things.url%>/search-book-form/");
	});
   </script>
    
    <script type="text/javascript">
		function validateForm() {
		    var x = document.forms["myForm"]["book_title"].value;
		    if (x==null || x=="") {
		        alert("Please enter Book Title");
		        return false;
		    }


		    var x = document.forms["myForm"]["category_name"].value;
		    if (x==null || x=="") {
		        alert("Please enter Category");
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
                            <h3 class="no-margin">Edit Book</h3>   
                            
                        </div>
                       <a href="<%=Common_Things.url %>/complete-details-of-book/?s=<%=book_sl_no %>" class="btn btn-info">Complete Details</a>
                       <a href="<%=Common_Things.url %>/search-book/?kou=<%="232323243kihnadfhlacfhdkaudfhnakcdfchakdfhbkavhdfhna" %>" class="btn btn-info">Search Book</a>
                       
                    </div>

                    <div class="col-lg-8">
                    
                    
                    
                    
                    
                    <%
							String message=(String)session.getAttribute("edit_book_message");
							if(message!=null){
							%>
								
								 <div class="alert alert-success">
                                        <%=message%>
                                    </div>


							<%			session.removeAttribute("edit_book_message");
							}
							%>
                    
                    
                    
                    
                    
                    
                    
                    
                                            <section class="panel">
                                                <header class="panel-heading">Add Book Form</header>
                                                <div class="panel-body">

                                                    <form action="<%=Common_Things.url%>/edit-book-controller/" class="form-horizontal" role="form" name="myForm"  onsubmit="return validateForm()">
                                                        
                                                        <input type="hidden" name="book_sl_no" value="<%=book_sl_no %>">
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Book Title* </label>
                                                            	<div class="col-sm-10">
                                                               	<input type="text" class="form-control" id="book_title"  name="book_title" data-parsley-required="true" data-parsley-trigger="change" value="<% if(obj_Book_Use_Bean.getBook_title()!=null){out.println(obj_Book_Use_Bean.getBook_title());} %>" placeholder="Book Title">
                                                               </div> 
                                                             
                                                        </div> 
                                                        
                                                       
                                                        	<hr>
                                                           
                                                       
                                                         
                                                        
                                                        
                                                         <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Category*</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" id="category_name"  placeholder="Category" name="category_name" value="<% if(obj_Book_Use_Bean.getCategory_name()!=null){out.println(obj_Book_Use_Bean.getCategory_name());} %>">
                                                            </div>
                                                        </div>
                                                        
                                                        
                                                       		<hr> 
                                                        
                                                        
                                                         
                                                        
                                                        
                                                        
                                                         <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Author</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" placeholder="Author" name="author_name" value="<% if(obj_Book_Use_Bean.getAuthor_name()!=null){out.println(obj_Book_Use_Bean.getAuthor_name());} %>">
                                                            </div>
                                                        </div>
                                                        
                                                        
                                                       		
                                                          	<hr> 
                                                        
                                                        
                                                          
                                                        
                                                        
                                                         <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Publisher</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" placeholder="Publisher" name="publisher_name" value="<% if(obj_Book_Use_Bean.getPublisher_name()!=null){out.println(obj_Book_Use_Bean.getPublisher_name());} %>">
                                                            </div>
                                                        </div>
                                                        <hr> 
                                                        
                                                       	 <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Edition</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" placeholder="Edition" name="edition" value="<% if(obj_Book_Use_Bean.getEdition()!=null){out.println(obj_Book_Use_Bean.getEdition());} %>">
                                                            </div>
                                                        </div>
                                                        	<hr> 
                                                           
                                                       	 <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Volume</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" placeholder="Volume" name="volume" value="<% if(obj_Book_Use_Bean.getVolume()!=null){out.println(obj_Book_Use_Bean.getVolume());} %>">
                                                            </div>
                                                        </div>
                                                        
                                                        <hr> 
                                                         <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">EAN Code</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" placeholder="EAN Code" name="ean_code" value="<% if(obj_Book_Use_Bean.getEan_code()!=null){out.println(obj_Book_Use_Bean.getEan_code());} %>">
                                                            </div>
                                                        </div>
                                                        <hr> 
                                                        
                                                         
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">ISBN</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" placeholder="ISBN" name="isbn" value="<% if(obj_Book_Use_Bean.getIsbn()!=null){out.println(obj_Book_Use_Bean.getIsbn());} %>">
                                                            </div>
                                                        </div>
                                                         <hr> 
                                                        
                                                        
                                                         <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Price</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" placeholder="Price" name="price" value="<% if(obj_Book_Use_Bean.getPrice()!=null){out.println(obj_Book_Use_Bean.getPrice());} %>">
                                                            </div>
                                                        </div>
                                                         <hr> 
                                                      
                                                        
                                                           <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Language</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" placeholder="Language" name="language" value="<% if(obj_Book_Use_Bean.getLanguage()!=null){out.println(obj_Book_Use_Bean.getLanguage());} %>">
                                                            </div>
                                                        </div>
                                                         
                                                         
                                                         
                                                     
                                                     <hr> 
                                                     	 <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Description</label>
                                                            <div class="col-sm-10"> 
                                                            
                                                            	<textarea rows="5" class="form-control" placeholder="Description" name="description"><% if(obj_Book_Use_Bean.getDescription()!=null){out.println(obj_Book_Use_Bean.getDescription());} %></textarea>
                                                            
                                                            
                                                                
                                                            </div>
                                                        </div>
                                                         
                                                     
                                                     <hr> 
                                                     
                                                         
                                                        </div>
                                                        <div class="form-group">  
                                                            <div class="col-sm-offset-2 col-sm-15">
                                                                <button type="submit" class="btn btn-default">Update</button>
                                                            </div>
                                                        </div>
                                                    </form>

                                                </div> 
                                                
                                                 <div class="col-lg-4">
                                            <section class="panel panel-primary">
                                <div class="panel-heading">Recently Added Books 
                                    
                                </div>
                                <ul class="list-group">
                                
                                
                                
                                
                                	<%
                                                                                                                                                                		//Admin_Book_Table_Model obj_Admin_Book_Table_Model=new Admin_Book_Table_Model(); 
                                                                                                                                                                	                                	List<Book_Use_Bean> list_books=obj_Admin_Book_Table_Model.get_all_recently_added_books();
                                                                                                                                                                	                                	
                                                                                                                                                                	                                	
                                                                                                                                                                	                                	if(list_books!=null){
                                                                                                                                                                	                                		Iterator<Book_Use_Bean> it_list_books=list_books.iterator();
                                                                                                                                                                	                                		obj_Book_Use_Bean=new Book_Use_Bean();
                                                                                                                                                                	                                		while(it_list_books.hasNext()){
                                                                                                                                                                	                                			obj_Book_Use_Bean=it_list_books.next();
                                                                                                                                                                	%>
                                	
                                	  <li class="list-group-item">
                                        <span class="pull-left mg-t-xs mg-r-md">
                                           1.
                                        </span>
                                        <div class="show no-margin pd-t-xs">
                                            
                                           
                                           	<a href="<%=Common_Things.url %>/complete-details-of-book/?s=<%=obj_Book_Use_Bean.getBook_sl_no() %>"  class="btn btn-success btn-xs" ><%=obj_Book_Use_Bean.getBook_title() %></a>
                                        </div>
                                         
                                    </li>
                                   
                                	<%		 
                                			
                                			
                                		}
                                		
                                		
                                	}
                                	
                                	%>
                                
                                
                                
                                  
                                  

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
