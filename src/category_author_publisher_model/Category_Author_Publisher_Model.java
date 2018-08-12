package category_author_publisher_model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.DBConnection_LMS_Portal;
import common_use_bean.Book_Use_Bean;



public class Category_Author_Publisher_Model {
	public int insert_category(String category_name,String profile,String added_on){
		Connection connection=null;
		DBConnection_LMS_Portal obj_DBConnection_SMS_Portal=new DBConnection_LMS_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		int flag=0;
	try { 
		
		
		
		
		String query="select sl_no from category where category_name=?";
		
		ps=connection.prepareStatement(query);
		ps.setString(1, category_name);
		rs=ps.executeQuery();
		
		
		if(rs.next()){
			flag=rs.getInt(1);
		}else{
			query="insert into category (" +
			"category_name," +
			"profile," +
			"added_on" +
			") values(?,?,?)";
			ps=connection.prepareStatement(query);
		
			ps.setString(1,category_name);
			ps.setString(2,profile);
			ps.setString(3,added_on);
			
		    System.out.println(ps);
			 ps.executeUpdate();
			 
			 query="SELECT LAST_INSERT_ID()";
				ps=connection.prepareStatement(query);
				rs=ps.executeQuery();
				rs.next();
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
	
	
	
	
	
	
	public int insert_author(String author_name,String profile,String added_on){
		Connection connection=null;
		DBConnection_LMS_Portal obj_DBConnection_SMS_Portal=new DBConnection_LMS_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		int flag=0;
	try { 
		
		
		
		
		String query="select sl_no from author where author_name=?";
		
		ps=connection.prepareStatement(query);
		ps.setString(1, author_name);
		rs=ps.executeQuery();
		
		
		if(rs.next()){
			flag=rs.getInt(1);
		}else{
			query="insert into author (" +
			"author_name," +
			"profile," +
			"added_on" +
			") values(?,?,?)";
			ps=connection.prepareStatement(query);
		
			ps.setString(1,author_name);
			ps.setString(2,profile);
			ps.setString(3,added_on);
			
		    System.out.println(ps);
			 ps.executeUpdate();
			 
			 query="SELECT LAST_INSERT_ID()";
				ps=connection.prepareStatement(query);
				rs=ps.executeQuery();
				rs.next();
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
	
	
	
	public int insert_publisher(String publisher_name,String profile,String added_on){
		Connection connection=null;
		DBConnection_LMS_Portal obj_DBConnection_SMS_Portal=new DBConnection_LMS_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		int flag=0;
	try { 
		
		
		
		
		String query="select sl_no from publisher where publisher_name=?";
		
		ps=connection.prepareStatement(query);
		ps.setString(1, publisher_name);
		rs=ps.executeQuery();
		
		
		if(rs.next()){
			flag=rs.getInt(1);
		}else{
			query="insert into publisher (" +
			"publisher_name," +
			"profile," +
			"added_on" +
			") values(?,?,?)";
			ps=connection.prepareStatement(query);
		
			ps.setString(1,publisher_name);
			ps.setString(2,profile);
			ps.setString(3,added_on);
			
		    System.out.println(ps);
			 ps.executeUpdate();
			 
			 query="SELECT LAST_INSERT_ID()";
				ps=connection.prepareStatement(query);
				rs=ps.executeQuery();
				rs.next();
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
