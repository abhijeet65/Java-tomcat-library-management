<!DOCTYPE html>

<%@page import="book_table.Admin_Book_Table_Model"%>
<%@page import="common_use_bean.Book_Use_Bean"%>
<%@page import="category_table.Category_Table"%>
<%@page import="common_use_bean.Category_Use_Bean"%>
<%@page import="author_table_model.Author_Table_Model"%>
<%@page import="common_use_bean.Author_Use_Bean"%><html class="no-js">

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
                            <h3 class="no-margin">Add Author</h3>
                            
                        </div>
                       
                    </div>             

                    <div class="col-lg-6">
                    
                    
                    
                    
                    
                    		<%
							String message=(String)session.getAttribute("add_atuhor_message");
							if(message!=null){
							%> 
								
								 <div class="alert alert-success">
                                        <%=message%>
                                    </div>


							<%			session.removeAttribute("add_atuhor_message");
							}
							%>
                    
                    
                    
                    		
                    
                    
                    
                    
                                            <section class="panel">
                                                <header class="panel-heading">Add Author</header>
                                                <div class="panel-body">

                                                    <form action="<%=Common_Things.url%>/add-author-contro/" class="form-horizontal" role="form">
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Author </label>
                                                            	<div class="col-sm-10">
                                                               	<input type="text" class="form-control" name="author_name" data-parsley-required="true" data-parsley-trigger="change" placeholder="Author ">
                                                               </div> 
                                                             
                                                        </div>                          
                                                        
                                                       <div class="form-group"> 
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Description</label>
                                                            <div class="col-sm-10"> 
                                                            
                                                            	<textarea rows="5" class="form-control" placeholder="Description" name="profile"></textarea>
                                                            
                                                             
                                                                
                                                            </div> 
                                                        </div>
                                                        
                                                     
                                                     <hr> 
                                                     
                                                         
                                                        </div>
                                                        <div class="form-group">  
                                                            <div class="col-sm-offset-2 col-sm-15">
                                                                <button type="submit" class="btn btn-default">Add Author</button>
                                                            </div>
                                                        </div>
                                                    </form>

                                                </div> 
                                                


							


						
                    <div class="col-lg-6">
                    
                    	<%
                    	String search=(String)request.getParameter("search");
                    	%>
                    
                        
                    
                                            <section class="panel">
                                                <header class="panel-heading">Search Author</header>
                                                <div class="panel-body">

                                                    <form action="<%=Common_Things.url%>/search-author/" class="form-horizontal" role="form">
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Author </label>
                                                            	<div class="col-sm-10">
                                                               	<input type="text" class="form-control" name="search" data-parsley-required="true" data-parsley-trigger="change" placeholder="Author Search" value="<%if(search!=null){out.println(search);} %>">
                                                               </div> 
                                                             
                                                        </div> 
                                                        
                                                       
                                                         
                                                     
                                                     <hr> 
                                                     
                                                         
                                                        </div>
                                                        <div class="form-group">   
                                                            <div class="col-sm-offset-2 col-sm-15">
                                                                <button type="submit" class="btn btn-default">Search</button>
                                                            </div>
                                                        </div>
                                                    </form>

                                                </div> 




					<div class="row">
                        <div class="col-lg-12">
                            <section class="panel">
                                <div class="panel-body">
                                
                                    <div class="col-lg-12">
                                            <section class="panel panel-primary">
                                <div class="panel-heading">Author Search : <%=search %>
                                    
                                </div>
                                <ul class="list-group">
                                
                                
                                	 <table class="table table-hover no-margin">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Author </th>
                                                <th>Profile</th>
                                                <th>Edit</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                           
                                        
                                 
                                	<% 
                                	Author_Table_Model obj_Author_Table_Model=new Author_Table_Model();  
                       	                  	List<Author_Use_Bean> list_author=obj_Author_Table_Model.get_search_result_author(search);
                       	                                	 
                       	                                	
                       	                                	if(list_author!=null){
                       	                                		Iterator<Author_Use_Bean> it_list_author=list_author.iterator();
                       	                                		Author_Use_Bean obj_Author_Use_Bean=new Author_Use_Bean();
                       	                                	int temp_count=1;
                       	                                		while(it_list_author.hasNext()){
                       	                                			obj_Author_Use_Bean=it_list_author.next();
                           	%>

                                	                                   
                                   			 <tr>
                                                <td><%=temp_count++ %></td>
                                                <td><%=obj_Author_Use_Bean.getAuthor_name() %></td>
                                                <td><%if(obj_Author_Use_Bean.getProfile()!=null){out.println(obj_Author_Use_Bean.getProfile());} %></td>
                                               	<td><a href="" class="btn btn-success btn-xs">Edit</a> </td>
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
