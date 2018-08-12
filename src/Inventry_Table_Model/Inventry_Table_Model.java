package Inventry_Table_Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import common.DBConnection_LMS_Portal;
import common_use_bean.Book_Use_Bean;
import common_use_bean.Sequence_inventry_Id;
public class Inventry_Table_Model {
	public List<Book_Use_Bean> get_books_status(String book_sl_no){
		Connection connection=null;
		DBConnection_LMS_Portal obj_DBConnection_SMS_Portal=new DBConnection_LMS_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Book_Use_Bean> list=new ArrayList<Book_Use_Bean>();
	try { 
		
		
		
		
		String query="select * from serial_number where book_sl_no=?";
		
		ps=connection.prepareStatement(query);
		ps.setString(1, book_sl_no);
		System.out.println(ps);
		rs=ps.executeQuery();
		
		
		while(rs.next()){
			Book_Use_Bean  obj_Book_Use_Bean=new Book_Use_Bean();
			obj_Book_Use_Bean.setInventry_sl_no(rs.getString("invertry_sl_no"));
			obj_Book_Use_Bean.setBook_title(rs.getString("book_title"));
			obj_Book_Use_Bean.setSl_no(rs.getString("sl_no"));
			obj_Book_Use_Bean.setBar_code(rs.getString("bar_code"));
			obj_Book_Use_Bean.setBook_status(rs.getString("book_status"));
			obj_Book_Use_Bean.setAdded_on(rs.getString("added_on"));
			obj_Book_Use_Bean.setRack(rs.getString("rack"));
			obj_Book_Use_Bean.setShelf(rs.getString("shelf"));
			
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
	
	
	
	public Book_Use_Bean get_serial_status(String serial_sl_no){
		Connection connection=null;
		DBConnection_LMS_Portal obj_DBConnection_SMS_Portal=new DBConnection_LMS_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		Book_Use_Bean obj_Book_Use_Bean=new Book_Use_Bean();
	try { 
		
		
		
		
		String query="select * from serial_number where sl_no=?";
		
		ps=connection.prepareStatement(query);
		ps.setString(1, serial_sl_no);
		System.out.println(ps);
		rs=ps.executeQuery();
		
		
		if(rs.next()){
			
			obj_Book_Use_Bean.setInventry_sl_no(rs.getString("invertry_sl_no"));
			obj_Book_Use_Bean.setBook_title(rs.getString("book_title"));
			obj_Book_Use_Bean.setSl_no(rs.getString("sl_no"));
			obj_Book_Use_Bean.setBar_code(rs.getString("bar_code"));
			obj_Book_Use_Bean.setBook_status(rs.getString("book_status"));
			obj_Book_Use_Bean.setBook_sl_no(rs.getString("book_sl_no"));
			obj_Book_Use_Bean.setRack(rs.getString("rack"));
			obj_Book_Use_Bean.setShelf(rs.getString("shelf"));
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
	
	
	
	
	
	public int edit_serial_status(Book_Use_Bean obj_Book_Use_Bean){
		Connection connection=null;
		DBConnection_LMS_Portal obj_DBConnection_SMS_Portal=new DBConnection_LMS_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		
		int flag=0;
	try { 
		
		
		
		
		String query="update serial_number set " +
				"bar_code=?,shelf=?,rack=?,description=? where sl_no=?";
		
		ps=connection.prepareStatement(query);
		ps.setString(1, obj_Book_Use_Bean.getBar_code());
		ps.setString(2, obj_Book_Use_Bean.getShelf());
		ps.setString(3, obj_Book_Use_Bean.getRack());
		ps.setString(4, obj_Book_Use_Bean.getDescription());
		ps.setString(5, obj_Book_Use_Bean.getSl_no());
		System.out.println(ps);
		flag=ps.executeUpdate();
		
		
		query="update issue_book set " +
		"barcode=? where barcode=?";

			ps=connection.prepareStatement(query);
			ps.setString(1, obj_Book_Use_Bean.getBar_code());
			ps.setString(2, obj_Book_Use_Bean.getOld_bar_code());
			System.out.println(ps);
			ps.executeUpdate();

		
		
			query="update last_inventry set " +
			"bar_code=? where bar_code=?";

				ps=connection.prepareStatement(query);
				ps.setString(1, obj_Book_Use_Bean.getBar_code());
				ps.setString(2, obj_Book_Use_Bean.getOld_bar_code());
				System.out.println(ps);
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
	
	
	
	public int delete_serial(Book_Use_Bean obj_Book_Use_Bean){
		Connection connection=null;
		DBConnection_LMS_Portal obj_DBConnection_SMS_Portal=new DBConnection_LMS_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		
		int flag=0;
	try { 
		
		
		
		
		String query="delete from serial_number where sl_no=?";
		
		ps=connection.prepareStatement(query);
		ps.setString(1, obj_Book_Use_Bean.getSl_no());
		System.out.println(ps);
		flag=ps.executeUpdate();
		
		
		query="update inventry_table set count=count-1 " +
		"where book_sl_no=? and added_on=?";

			ps=connection.prepareStatement(query);
			ps.setString(1, obj_Book_Use_Bean.getBook_sl_no());
			ps.setString(2, obj_Book_Use_Bean.getAdded_on());
			System.out.println(ps);
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
	
	
	
	
	
	
	public List<Book_Use_Bean> get_serial_from_bar_code(String search){
		Connection connection=null;
		DBConnection_LMS_Portal obj_DBConnection_SMS_Portal=new DBConnection_LMS_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Book_Use_Bean> list=new ArrayList<Book_Use_Bean>();
	try { 
		
		
		
		
		String query="select * from serial_number where bar_code like ?";
		
		ps=connection.prepareStatement(query);
		ps.setString(1, "%"+search+"%");
		System.out.println(ps);
		rs=ps.executeQuery();
		
		
		if(rs.next()){
			Book_Use_Bean obj_Book_Use_Bean=new Book_Use_Bean();
			obj_Book_Use_Bean.setInventry_sl_no(rs.getString("invertry_sl_no"));
			obj_Book_Use_Bean.setBook_title(rs.getString("book_title"));
			obj_Book_Use_Bean.setSl_no(rs.getString("sl_no"));
			obj_Book_Use_Bean.setBar_code(rs.getString("bar_code"));
			obj_Book_Use_Bean.setBook_status(rs.getString("book_status"));
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
	
	
	
	
	
	
	public List<Book_Use_Bean> get_inventry_of_books(String book_sl_no){
		Connection connection=null;
		DBConnection_LMS_Portal obj_DBConnection_SMS_Portal=new DBConnection_LMS_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Book_Use_Bean> list=new ArrayList<Book_Use_Bean>();
	try { 
		
		
		
		
		String query="select * from inventry_table where book_sl_no=?";
		
		ps=connection.prepareStatement(query);
		ps.setString(1, book_sl_no);
		rs=ps.executeQuery();
		
		
		while(rs.next()){
			Book_Use_Bean  obj_Book_Use_Bean=new Book_Use_Bean();
			obj_Book_Use_Bean.setInventry_sl_no(rs.getString("sl_no"));
			obj_Book_Use_Bean.setTotal_book_available(rs.getInt("count"));
			obj_Book_Use_Bean.setAdded_on(rs.getString("added_on"));
			obj_Book_Use_Bean.setAdded_by(rs.getString("added_by"));
			
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
	
	
	
	
	
	public int add_inventry(Book_Use_Bean obj_Book_Use_Bean){
		Connection connection=null;
		DBConnection_LMS_Portal obj_DBConnection_SMS_Portal=new DBConnection_LMS_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		int flag=0;
		ResultSet rs=null;
		
	try { 
		
		
		
		
		String query="insert into inventry_table(book_sl_no,book_title,count,added_on,added_by,sl_no) values (?,?,?,?,?,?)";
		
		ps=connection.prepareStatement(query);
		ps.setString(1, obj_Book_Use_Bean.getBook_sl_no());
		ps.setString(2, obj_Book_Use_Bean.getBook_title());
		ps.setInt(3, obj_Book_Use_Bean.getTotal_book_in_library());
		 
		TimeZone.setDefault(TimeZone.getTimeZone("Asia/Qatar"));
		SimpleDateFormat format = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss a");
		 
		  Date today4 = new Date();
		  String date4 = format.format(today4);
		
		ps.setString(4, date4);
		ps.setString(5, obj_Book_Use_Bean.getBook_sl_no());
		
		
		Sequence_inventry_Id obj_Sequence_inventry_Id=new Sequence_inventry_Id();
		String inve_sl_no=obj_Sequence_inventry_Id.get_inv_id();
		
		ps.setString(6, inve_sl_no);
		
		System.out.println(ps);
		
		flag=ps.executeUpdate();
		
		
		
		

			query="select bar_code from last_inventry where book_sl_no=? order by sl_no desc";
			
			 ps=connection.prepareStatement(query);
			 ps.setString(1, obj_Book_Use_Bean.getBook_sl_no());
			 
				System.out.println(ps);
				rs=ps.executeQuery();
				int last_bar_code=0;
				if(rs.next()){
					last_bar_code=rs.getInt(1);
				}
			
			
			
			 query="insert into serial_number (" +
				"invertry_sl_no," +
				"book_sl_no," +
				"bar_code," +
				"book_status,added_on,shelf,rack" +
					") values ";
			 
			 
			 for(int i=last_bar_code;i<obj_Book_Use_Bean.getTotal_book_in_library()+obj_Book_Use_Bean.getTotal_book_available();i++){
				 query=query+"('"+inve_sl_no+"','"+obj_Book_Use_Bean.getBook_sl_no()+"','"+obj_Book_Use_Bean.getBook_sl_no()+obj_Book_Use_Bean.getCategory_num()+i+"','Available','"+date4+"','"+obj_Book_Use_Bean.getShelf()+"','"+obj_Book_Use_Bean.getRack()+"'),";
			 }
			 query=query.substring(0, query.length()-1);
			 ps=connection.prepareStatement(query);
				System.out.println(ps);
				ps.executeUpdate();
				
				
				query="update serial_number set book_title=? where book_sl_no=?";
			 
			 
				
				 ps=connection.prepareStatement(query);
				 ps.setString(1, obj_Book_Use_Bean.getBook_title());
				 ps.setString(2, obj_Book_Use_Bean.getBook_sl_no());
				 
					System.out.println(ps);
					ps.executeUpdate();
				
				
				query="update last_inventry set bar_code=? where book_sl_no=?";
		
				 ps=connection.prepareStatement(query);
				 ps.setInt(1, obj_Book_Use_Bean.getTotal_book_available()+obj_Book_Use_Bean.getTotal_book_in_library());
				 ps.setString(2, obj_Book_Use_Bean.getBook_sl_no());
				 last_bar_code=ps.executeUpdate();
				
				if(last_bar_code==0){
					query="insert into last_inventry (" +
					"bar_code," +
					"book_sl_no" +
						") values(?,?)";
			
					 ps=connection.prepareStatement(query);
					 ps.setInt(1, obj_Book_Use_Bean.getTotal_book_available()+obj_Book_Use_Bean.getTotal_book_in_library());
					 ps.setString(2, obj_Book_Use_Bean.getBook_sl_no());
					 ps.executeUpdate();
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
	
	return flag;

	}	
	
	
	
	
	
	public int get_count_serial_number(String book_sl_no){
		Connection connection=null;
		DBConnection_LMS_Portal obj_DBConnection_SMS_Portal=new DBConnection_LMS_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		int flag=0;
	try { 
		
		
		
		
		String query="select count(*) from serial_number where book_sl_no=?";
		
		ps=connection.prepareStatement(query);
		ps.setString(1, book_sl_no);
		System.out.println(ps);
		rs=ps.executeQuery();
		
		
		if(rs.next()){
			flag=rs.getInt(1);
			
			
			
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
	
	return flag;

	}	
	
	
	
	

}
