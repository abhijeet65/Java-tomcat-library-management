package book_table;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import category_author_publisher_model.Category_Author_Publisher_Model;

import common.DBConnection_LMS_Portal;
import common_use_bean.Book_Use_Bean;
import common_use_bean.Sequence_Book_Id;
import common_use_bean.Sequence_inventry_Id;
import common_use_bean.Student_Use_Bean;



public class Admin_Book_Table_Model {
	public int insert_book(Book_Use_Bean obj_Book_Use_Bean){
		Connection connection=null;
		DBConnection_LMS_Portal obj_DBConnection_SMS_Portal=new DBConnection_LMS_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		int flag=0;
		
		
		TimeZone.setDefault(TimeZone.getTimeZone("Asia/Qatar"));
		SimpleDateFormat format = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss a");
		 
		  Date today4 = new Date();
		  String date4 = format.format(today4);
	try { 
		
		String query="insert into book_table (" +
				"book_title," +
				"category_name," +
				"category_num," +
				"author_name," +
				"author_num," +
				"publisher_name," +
				"publisher_num," +
				"edition," +
				"volume," +
				"ean_code," +
				"total_book_in_library," +
				"total_book_available," +
				"description," +
				"added_on," +
				"edited_on," +
				"added_by,isbn,language,purchase_date,price,book_sl_no" +
				") values(?,?,?,?," +
					"?,?,?,?," +
					"?,?,?,?," +
					"?,?,?,?," +
					"?,?,?,?,?)";
			ps=connection.prepareStatement(query);
		
			ps.setString(1,obj_Book_Use_Bean.getBook_title());
			ps.setString(2,obj_Book_Use_Bean.getCategory_name());
			
			Category_Author_Publisher_Model obj_Category_Table_Model=new Category_Author_Publisher_Model();
			
			int categroy_sl_no=obj_Category_Table_Model.insert_category(obj_Book_Use_Bean.getCategory_name(), "",date4);
			 
			ps.setInt(3,categroy_sl_no);
			ps.setString(4,obj_Book_Use_Bean.getAuthor_name());
			
			int author_sl_no=obj_Category_Table_Model.insert_author(obj_Book_Use_Bean.getAuthor_name(), "",date4);
			
			
			ps.setInt(5,author_sl_no);
		
			ps.setString(6,obj_Book_Use_Bean.getPublisher_name());
			
			
			ps.setString(7,obj_Category_Table_Model.insert_publisher(obj_Book_Use_Bean.getPublisher_name(), "",date4)+"");
			
			ps.setString(8,obj_Book_Use_Bean.getEdition());
			ps.setString(9,obj_Book_Use_Bean.getVolume());
			ps.setString(10,obj_Book_Use_Bean.getEan_code());
			ps.setInt(11,obj_Book_Use_Bean.getTotal_book_in_library());
			ps.setInt(12,0);
			ps.setString(13,obj_Book_Use_Bean.getDescription());
			 
			
			
					
					
			      
			
			
			ps.setString(14,date4);
			ps.setString(15,null);
			ps.setString(16,"ADMIN");
			ps.setString(17,obj_Book_Use_Bean.getIsbn());
			ps.setString(18,obj_Book_Use_Bean.getLanguage());
			ps.setString(19,obj_Book_Use_Bean.getPurchase_date());
			ps.setString(20,obj_Book_Use_Bean.getPrice());
			
			
			Sequence_Book_Id obj_Sequence_Book_Id=new Sequence_Book_Id();
			
			String book_sl_no=obj_Sequence_Book_Id.get_book_id();
			
			ps.setString(21,book_sl_no);
			    System.out.println(ps);
			 flag=ps.executeUpdate();
			 
			 /*
			 
			 query="insert into inventry_table (" +
				"book_sl_no," +
				"book_title," +
				"count," +
				"added_on," +
				"added_by,sl_no" +
					") values(?,?,?,?,?,?)";
			 ps=connection.prepareStatement(query);
				ps.setString(1,book_sl_no);
				ps.setString(2,obj_Book_Use_Bean.getBook_title());
				ps.setInt(3,obj_Book_Use_Bean.getTotal_book_in_library());
				ps.setString(4,date4);
				ps.setString(5,"ADMIN");
					Sequence_inventry_Id obj_Sequence_inventry_Id=new Sequence_inventry_Id();
				String inve_sl_no=obj_Sequence_inventry_Id.get_inv_id();
				ps.setString(6,inve_sl_no);
				ps.executeUpdate();
				 
				
				if(obj_Book_Use_Bean.getTotal_book_in_library()!=0){

				 query="insert into serial_number (" +
					"invertry_sl_no," +
					"book_title," +
					"book_sl_no," +
					"bar_code," +
					"book_status,added_on" +
						") values ";
				 
				 
				 for(int i=1;i<=obj_Book_Use_Bean.getTotal_book_in_library();i++){
					 query=query+"('"+inve_sl_no+"','"+obj_Book_Use_Bean.getBook_title()+"','"+book_sl_no+"','"+book_sl_no+categroy_sl_no+i+"','Available','"+date4+"'),";
				 }
				 query=query.substring(0, query.length()-1);
				 ps=connection.prepareStatement(query);
					
					ps.executeUpdate();
					
				}*/
		
	 }catch(Exception e){
		e.printStackTrace();
	}finally{
		if(connection!=null){
			try {
					connection.close();
				}
			 	catch (Exception e2) {
				// TODO: handle exception
			 	}
		}
		if(ps!=null){
			try {
				
				ps.close();
				}
			 catch (Exception e2) {
				// TODO: handle exception
			}
		}
	
}
	
	return flag;

	}	
	
	
	
	
	
	
	
	
	
	public int edit_book(Book_Use_Bean obj_Book_Use_Bean){
		Connection connection=null;
		DBConnection_LMS_Portal obj_DBConnection_SMS_Portal=new DBConnection_LMS_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		int flag=0;
		
		
		TimeZone.setDefault(TimeZone.getTimeZone("Asia/Qatar"));
		SimpleDateFormat format = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss a");
		 
		  Date today4 = new Date();
		  String date4 = format.format(today4);
	try { 
		
		String query="update book_table set " +
				"book_title=?," +
				"category_name=?," +
				"category_num=?," +
				"author_name=?," +
				"author_num=?," +
				"publisher_name=?," +
				"publisher_num=?," +
				"edition=?," +
				"volume=?," +
				"ean_code=?," +
				"total_book_in_library=?," +
				"total_book_available=?," +
				"description=?," +
				"edited_on=?," +
				"isbn=?," +
				"language=?," +
				"price=? " +
				"where book_sl_no=?";
			ps=connection.prepareStatement(query);
		
			ps.setString(1,obj_Book_Use_Bean.getBook_title());
			ps.setString(2,obj_Book_Use_Bean.getCategory_name());
			
			Category_Author_Publisher_Model obj_Category_Table_Model=new Category_Author_Publisher_Model();
			
			int categroy_sl_no=obj_Category_Table_Model.insert_category(obj_Book_Use_Bean.getCategory_name(), "",date4);
			 
			ps.setInt(3,categroy_sl_no);
			ps.setString(4,obj_Book_Use_Bean.getAuthor_name());
			
			int author_sl_no=obj_Category_Table_Model.insert_author(obj_Book_Use_Bean.getAuthor_name(), "",date4);
			
			
			ps.setInt(5,author_sl_no);
		
			ps.setString(6,obj_Book_Use_Bean.getPublisher_name());
			
			
			ps.setString(7,obj_Category_Table_Model.insert_publisher(obj_Book_Use_Bean.getPublisher_name(), "",date4)+"");
			
			ps.setString(8,obj_Book_Use_Bean.getEdition());
			ps.setString(9,obj_Book_Use_Bean.getVolume());
			ps.setString(10,obj_Book_Use_Bean.getEan_code());
			ps.setInt(11,obj_Book_Use_Bean.getTotal_book_in_library());
			ps.setInt(12,0);
			ps.setString(13,obj_Book_Use_Bean.getDescription());
			ps.setString(14,date4);
			ps.setString(15,obj_Book_Use_Bean.getIsbn());
			ps.setString(16,obj_Book_Use_Bean.getLanguage());
			ps.setString(17,obj_Book_Use_Bean.getPrice());
			
			ps.setString(18,obj_Book_Use_Bean.getBook_sl_no());
			 System.out.println(ps);
			 flag=ps.executeUpdate();
			 
			 
			 
			 query="update inventry_table set " +
				"book_title=? where book_sl_no=?";
				ps=connection.prepareStatement(query);
				
				ps.setString(1,obj_Book_Use_Bean.getBook_title());
				ps.setString(2, obj_Book_Use_Bean.getBook_sl_no());
				
				ps.executeUpdate();
			 
				query="update serial_number set " +
				"book_title=? where book_sl_no=?";
				ps=connection.prepareStatement(query);
				
				ps.setString(1,obj_Book_Use_Bean.getBook_title());
				ps.setString(2, obj_Book_Use_Bean.getBook_sl_no());
				
				ps.executeUpdate();
			 
				query="update issue_book set " +
				"book_title=? where book_sl_no=?";
				ps=connection.prepareStatement(query);
				
				ps.setString(1,obj_Book_Use_Bean.getBook_title());
				ps.setString(2, obj_Book_Use_Bean.getBook_sl_no());
				
				ps.executeUpdate();
			 
			 
	 }catch(Exception e){
		e.printStackTrace();
	}finally{
		if(connection!=null){
			try {
					connection.close();
				}
			 	catch (Exception e2) {
				// TODO: handle exception
			 	}
		}
		if(ps!=null){
			try {
				
				ps.close();
				}
			 catch (Exception e2) {
				// TODO: handle exception
			}
		}
	
}
	
	return flag;

	}	
	
	
	
	
	
	
	
	
	public List<Book_Use_Bean> get_all_recently_added_books(){
		Connection connection=null;
		DBConnection_LMS_Portal obj_DBConnection_SMS_Portal=new DBConnection_LMS_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Book_Use_Bean> list=new ArrayList<Book_Use_Bean>();
	try { 
		
		String query="select * from book_table order by added_on desc limit 10";
		ps=connection.prepareStatement(query);
		
		
		System.out.println(ps);
		rs=ps.executeQuery();
		
		
		while(rs.next()){
			Book_Use_Bean obj_Book_Use_Bean=new Book_Use_Bean();
				obj_Book_Use_Bean.setBook_title(rs.getString("book_title"));
				obj_Book_Use_Bean.setBook_sl_no(rs.getString("book_sl_no"));
			
			list.add(obj_Book_Use_Bean);
		}
		
	 }catch(Exception e){
		e.printStackTrace();
	}finally{
		if(connection!=null){
			try {
					connection.close();
				}
			 	catch (Exception e2) {
				// TODO: handle exception
			 	}
		}
		if(ps!=null){
			try {
				
				ps.close();
				}
			 catch (Exception e2) {
				// TODO: handle exception
			}
		}
	
}
	
	return list;

	}	
	
	
	
						public Book_Use_Bean get_Complete_details_of_book(String book_sl_no){
							Connection connection=null;
							DBConnection_LMS_Portal obj_DBConnection_SMS_Portal=new DBConnection_LMS_Portal();
							connection=obj_DBConnection_SMS_Portal.getConnection();
							PreparedStatement ps=null;
							ResultSet rs=null;
							Book_Use_Bean obj_Book_Use_Bean=new Book_Use_Bean();
						try { 
							
							String query="select * from book_table where book_sl_no=?";
							ps=connection.prepareStatement(query);
							
							ps.setString(1, book_sl_no);
							System.out.println(ps);
							rs=ps.executeQuery();
							
							
							while(rs.next()){
								
									obj_Book_Use_Bean.setBook_title(rs.getString("book_title"));
									obj_Book_Use_Bean.setBook_sl_no(rs.getString("book_sl_no"));
									obj_Book_Use_Bean.setCategory_num(rs.getString("category_num"));
									obj_Book_Use_Bean.setCategory_name(rs.getString("category_name"));
									obj_Book_Use_Bean.setAuthor_name(rs.getString("author_name"));
									obj_Book_Use_Bean.setPublisher_name(rs.getString("publisher_name"));
									obj_Book_Use_Bean.setEdition(rs.getString("edition"));
									
									obj_Book_Use_Bean.setVolume(rs.getString("volume"));
									obj_Book_Use_Bean.setEan_code(rs.getString("ean_code"));
									obj_Book_Use_Bean.setIsbn(rs.getString("isbn"));
									obj_Book_Use_Bean.setPrice(rs.getString("price"));
									obj_Book_Use_Bean.setLanguage(rs.getString("language"));
									obj_Book_Use_Bean.setTotal_book_in_library(rs.getInt("total_book_in_library"));
									obj_Book_Use_Bean.setDescription(rs.getString("description"));
									
									
									
							}
							
						 }catch(Exception e){
							e.printStackTrace();
						}finally{
							if(connection!=null){
								try {
										connection.close();
									}
								 	catch (Exception e2) {
									// TODO: handle exception
								 	}
							}
							if(ps!=null){
								try {
									
									ps.close();
									}
								 catch (Exception e2) {
									// TODO: handle exception
								}
							}
						
					}
						
						return obj_Book_Use_Bean;
					
						}	
						
	
						public List<Book_Use_Bean> search_result_book(String search){
							Connection connection=null;
							DBConnection_LMS_Portal obj_DBConnection_SMS_Portal=new DBConnection_LMS_Portal();
							connection=obj_DBConnection_SMS_Portal.getConnection();
							PreparedStatement ps=null;
							ResultSet rs=null;
							List<Book_Use_Bean> list=new ArrayList<Book_Use_Bean>();
						try { 
							
							String query="select * from book_table where " +
									"book_sl_no like ? or " +
									"book_title like ? or " +
									"category_name like ? or " +
									"category_num like ? or " +
									"author_name like ? or " +
									"publisher_name like ? or " +
									"edition like ? or " +
									"volume like ? or " +
									"ean_code like ? or " +
									"isbn like ? or " +
									"price like ? or " +
									"language like ? or " +
									"description like ? " +
									"order by book_title desc limit 100";
							ps=connection.prepareStatement(query);
							ps.setString(1, "%"+search+"%");
							ps.setString(2, "%"+search+"%");
							ps.setString(3, "%"+search+"%");
							ps.setString(4, "%"+search+"%");
							ps.setString(5, "%"+search+"%");
							ps.setString(6, "%"+search+"%");
							ps.setString(7, "%"+search+"%");
							ps.setString(8, "%"+search+"%");
							ps.setString(9, "%"+search+"%");
							ps.setString(10, "%"+search+"%");
							ps.setString(11, "%"+search+"%");
							ps.setString(12, "%"+search+"%");
							ps.setString(13, "%"+search+"%");
							
							
							System.out.println(ps);
							rs=ps.executeQuery();
							
							
							while(rs.next()){
								Book_Use_Bean obj_Book_Use_Bean=new Book_Use_Bean();
								obj_Book_Use_Bean.setBook_title(rs.getString("book_title"));
								obj_Book_Use_Bean.setBook_sl_no(rs.getString("book_sl_no"));
								obj_Book_Use_Bean.setCategory_num(rs.getString("category_num"));
								obj_Book_Use_Bean.setCategory_name(rs.getString("category_name"));
								obj_Book_Use_Bean.setAuthor_name(rs.getString("author_name"));
								obj_Book_Use_Bean.setPublisher_name(rs.getString("publisher_name"));
								obj_Book_Use_Bean.setEdition(rs.getString("edition"));
								
								obj_Book_Use_Bean.setVolume(rs.getString("volume"));
								obj_Book_Use_Bean.setEan_code(rs.getString("ean_code"));
								obj_Book_Use_Bean.setIsbn(rs.getString("isbn"));
								obj_Book_Use_Bean.setPrice(rs.getString("price"));
								obj_Book_Use_Bean.setLanguage(rs.getString("language"));
								obj_Book_Use_Bean.setTotal_book_in_library(rs.getInt("total_book_in_library"));
								obj_Book_Use_Bean.setDescription(rs.getString("description"));
								list.add(obj_Book_Use_Bean);
							}
							
						 }catch(Exception e){
							e.printStackTrace();
						}finally{
							if(connection!=null){
								try {
										connection.close();
									}
								 	catch (Exception e2) {
									// TODO: handle exception
								 	}
							}
							if(ps!=null){
								try {
									
									ps.close();
									}
								 catch (Exception e2) {
									// TODO: handle exception
								}
							}
						
					}
						
						return list;

						}	
						
						
						public List<Book_Use_Bean> view_all_books(int lim){
							Connection connection=null;
							DBConnection_LMS_Portal obj_DBConnection_SMS_Portal=new DBConnection_LMS_Portal();
							connection=obj_DBConnection_SMS_Portal.getConnection();
							PreparedStatement ps=null;
							ResultSet rs=null;
							List<Book_Use_Bean> list=new ArrayList<Book_Use_Bean>();
						try { 
							
							String query="select * from book_table order by book_title limit "+(lim*100)+",100";
							ps=connection.prepareStatement(query);
							
							
							System.out.println(ps);
							rs=ps.executeQuery();
							
							
							while(rs.next()){
								Book_Use_Bean obj_Book_Use_Bean=new Book_Use_Bean();
								obj_Book_Use_Bean.setBook_title(rs.getString("book_title"));
								obj_Book_Use_Bean.setBook_sl_no(rs.getString("book_sl_no"));
								obj_Book_Use_Bean.setCategory_num(rs.getString("category_num"));
								obj_Book_Use_Bean.setCategory_name(rs.getString("category_name"));
								obj_Book_Use_Bean.setAuthor_name(rs.getString("author_name"));
								obj_Book_Use_Bean.setPublisher_name(rs.getString("publisher_name"));
								obj_Book_Use_Bean.setEdition(rs.getString("edition"));
								
								obj_Book_Use_Bean.setVolume(rs.getString("volume"));
								obj_Book_Use_Bean.setEan_code(rs.getString("ean_code"));
								obj_Book_Use_Bean.setIsbn(rs.getString("isbn"));
								obj_Book_Use_Bean.setPrice(rs.getString("price"));
								obj_Book_Use_Bean.setLanguage(rs.getString("language"));
								obj_Book_Use_Bean.setTotal_book_in_library(rs.getInt("total_book_in_library"));
								obj_Book_Use_Bean.setDescription(rs.getString("description"));
								list.add(obj_Book_Use_Bean);
							}
							
						 }catch(Exception e){
							e.printStackTrace();
						}finally{
							if(connection!=null){
								try {
										connection.close();
									}
								 	catch (Exception e2) {
									// TODO: handle exception
								 	}
							}
							if(ps!=null){
								try {
									
									ps.close();
									}
								 catch (Exception e2) {
									// TODO: handle exception
								}
							}
						
					}
						
						return list;

						}	
						
						
	

}
