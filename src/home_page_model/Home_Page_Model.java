package home_page_model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import common.DBConnection_LMS_Portal;
import common_use_bean.Home_Page_Use_Bean;



public class Home_Page_Model {
	public Home_Page_Use_Bean select_counts(){
		Connection connection=null;
		DBConnection_LMS_Portal obj_DBConnection_SMS_Portal=new DBConnection_LMS_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		Home_Page_Use_Bean obj_Home_Page_Use_Bean=new Home_Page_Use_Bean();
	try { 
		
		
		
		
		String query="select count(*) from serial_number";
		
		ps=connection.prepareStatement(query);
		rs=ps.executeQuery();
		if(rs.next()){
			obj_Home_Page_Use_Bean.setBook_count(rs.getInt(1));
		}
		
		
		query="select count(*) from serial_number where book_status=?";
		
		ps=connection.prepareStatement(query);
		ps.setString(1, "Not Available");
		rs=ps.executeQuery();
		if(rs.next()){
			obj_Home_Page_Use_Bean.setTotal_books_out(rs.getInt(1));
		}
		
		
		
		query="select count(*) from student_table";
		ps=connection.prepareStatement(query);
		rs=ps.executeQuery();
		if(rs.next()){
			obj_Home_Page_Use_Bean.setStudent_count(rs.getInt(1));
		}
		
		TimeZone.setDefault(TimeZone.getTimeZone("Asia/Qatar"));
		SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		 
		  Date today4 = new Date();
		  String date4 = format.format(today4);
		
		  query="select count(*) from issue_book where issue_date=?";
			ps=connection.prepareStatement(query);
			ps.setString(1, date4);
			rs=ps.executeQuery();
			if(rs.next()){
				obj_Home_Page_Use_Bean.setTotal_issues_today(rs.getInt(1));
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
	
	return obj_Home_Page_Use_Bean;

	}	
	
	
	
	
	
	
	
	
	
	

}
