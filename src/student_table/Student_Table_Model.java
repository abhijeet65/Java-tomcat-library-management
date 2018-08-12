package student_table;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;


import common.DBConnection_LMS_Portal;
import common_use_bean.Sequence_Student_Id;
import common_use_bean.Student_Use_Bean;



public class Student_Table_Model {
	public int insert_student(Student_Use_Bean obj_Student_Use_Bean){
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
		
		String query="insert into student_table (" +
				"student_id," +
				"student_name," +
				"grade," +
				"profile," +
				"section," +
				"added_by," +
				"added_on,admission_no,status" +
				") values(?,?,?,?," +
					"?,?,?,?,?)";
			ps=connection.prepareStatement(query);
		
			Sequence_Student_Id obj_Sequence_Student_Id=new Sequence_Student_Id();
			
			
			
			ps.setString(1,obj_Sequence_Student_Id.get_student_id());
			ps.setString(2,obj_Student_Use_Bean.getStudent_name());
		 
			ps.setString(3,obj_Student_Use_Bean.getGrade());
			ps.setString(4,obj_Student_Use_Bean.getProfile());
			
			
			
			ps.setString(5,obj_Student_Use_Bean.getSection());
		
			ps.setString(6,obj_Student_Use_Bean.getAdded_by());
			
			
			
			ps.setString(7,date4);
			ps.setString(8,obj_Student_Use_Bean.getAdmission_no());
			ps.setInt(9,obj_Student_Use_Bean.getStatus());
			
			    System.out.println(ps);
			    
			    
			 flag=ps.executeUpdate();
			 
			 
		
		
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
	
	
	
	public int edit_student(Student_Use_Bean obj_Student_Use_Bean){
		Connection connection=null;
		DBConnection_LMS_Portal obj_DBConnection_SMS_Portal=new DBConnection_LMS_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		int flag=0;
		
		
		
	try { 
		
		String query="update student_table set " +
				"student_name=?," +
				"grade=?," +
				"profile=?," +
				"section=?," +
				"admission_no=?," +
				"status=? where student_id=?";
			ps=connection.prepareStatement(query);
			ps.setString(1,obj_Student_Use_Bean.getStudent_name());
			ps.setString(2,obj_Student_Use_Bean.getGrade());
			ps.setString(3,obj_Student_Use_Bean.getProfile());
			ps.setString(4,obj_Student_Use_Bean.getSection());
			ps.setString(5,obj_Student_Use_Bean.getAdmission_no());
			ps.setInt(6,obj_Student_Use_Bean.getStatus());
			ps.setString(7,obj_Student_Use_Bean.getStudent_id());
			
			    System.out.println(ps);
			    
			    
			 flag=ps.executeUpdate();
			 
			 query="update issue_book set " +
				"admission_no=?,student_name=? where student_id=?";
				ps=connection.prepareStatement(query);
				
				ps.setString(1,obj_Student_Use_Bean.getAdmission_no());
				ps.setString(2, obj_Student_Use_Bean.getStudent_name());
				ps.setString(3, obj_Student_Use_Bean.getStudent_id());
					
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
	
	
	
	
	
	
	
	public List<Student_Use_Bean> get_all_recently_added_students(){
		Connection connection=null;
		DBConnection_LMS_Portal obj_DBConnection_SMS_Portal=new DBConnection_LMS_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Student_Use_Bean> list=new ArrayList<Student_Use_Bean>();
	try { 
		
		String query="select * from student_table order by added_on desc limit 10";
		ps=connection.prepareStatement(query);
		
		
		System.out.println(ps);
		rs=ps.executeQuery();
		
		
		while(rs.next()){
			Student_Use_Bean obj_Student_Use_Bean=new Student_Use_Bean();
			obj_Student_Use_Bean.setAdmission_no(rs.getString("admission_no"));
			obj_Student_Use_Bean.setStudent_id(rs.getString("student_id"));
			obj_Student_Use_Bean.setStudent_name(rs.getString("student_name"));
			list.add(obj_Student_Use_Bean);
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
	
	
	
	public List<Student_Use_Bean> search_result_student(String search){
		Connection connection=null;
		DBConnection_LMS_Portal obj_DBConnection_SMS_Portal=new DBConnection_LMS_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Student_Use_Bean> list=new ArrayList<Student_Use_Bean>();
	try { 
		
		String query="select * from student_table where admission_no like ? or student_name like ? or profile like ? or grade like ? or section like ? order by student_name desc limit 100";
		ps=connection.prepareStatement(query);
		ps.setString(1, "%"+search+"%");
		ps.setString(2, "%"+search+"%");
		ps.setString(3, "%"+search+"%");
		ps.setString(4, "%"+search+"%");
		ps.setString(5, "%"+search+"%");
		
		System.out.println(ps);
		rs=ps.executeQuery();
		
		
		while(rs.next()){
			Student_Use_Bean obj_Student_Use_Bean=new Student_Use_Bean();
			obj_Student_Use_Bean.setAdmission_no(rs.getString("admission_no"));
			obj_Student_Use_Bean.setStudent_id(rs.getString("student_id"));
			obj_Student_Use_Bean.setStudent_name(rs.getString("student_name"));
			obj_Student_Use_Bean.setGrade(rs.getString("grade"));
			obj_Student_Use_Bean.setSection(rs.getString("section"));
			obj_Student_Use_Bean.setProfile(rs.getString("profile"));
			obj_Student_Use_Bean.setStatus(rs.getInt("status"));
			list.add(obj_Student_Use_Bean);
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
	
	
	public Student_Use_Bean get_complete_details_student(String student_id){
		Connection connection=null;
		DBConnection_LMS_Portal obj_DBConnection_SMS_Portal=new DBConnection_LMS_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		Student_Use_Bean obj_Student_Use_Bean=new Student_Use_Bean();
	try { 
		
		String query="select * from student_table where student_id=?";
		ps=connection.prepareStatement(query);
		ps.setString(1, student_id);
		
		System.out.println(ps);
		rs=ps.executeQuery();
		
		
		if(rs.next()){
			
			obj_Student_Use_Bean.setAdmission_no(rs.getString("admission_no"));
			obj_Student_Use_Bean.setStudent_id(rs.getString("student_id"));
			obj_Student_Use_Bean.setStudent_name(rs.getString("student_name"));
			obj_Student_Use_Bean.setGrade(rs.getString("grade"));
			obj_Student_Use_Bean.setSection(rs.getString("section"));
			obj_Student_Use_Bean.setProfile(rs.getString("profile"));
			obj_Student_Use_Bean.setStatus(rs.getInt("status"));
			
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
		if(rs!=null){
			try {
				
				rs.close();
				}
			 catch (Exception e2) {
				// TODO: handle exception
			}
		}
	
}
	
	return obj_Student_Use_Bean;

	}	
	
	
	
	public List<Student_Use_Bean> get_all_students(int lim){
		Connection connection=null;
		DBConnection_LMS_Portal obj_DBConnection_SMS_Portal=new DBConnection_LMS_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Student_Use_Bean> list=new ArrayList<Student_Use_Bean>();
	try { 
		
		String query="select * from student_table order by student_name limit "+(lim*100)+",100";
		ps=connection.prepareStatement(query);

		System.out.println(ps);
		rs=ps.executeQuery();
		
		
		while(rs.next()){
			Student_Use_Bean obj_Student_Use_Bean=new Student_Use_Bean();
			obj_Student_Use_Bean.setAdmission_no(rs.getString("admission_no"));
			obj_Student_Use_Bean.setStudent_id(rs.getString("student_id"));
			obj_Student_Use_Bean.setStudent_name(rs.getString("student_name"));
			obj_Student_Use_Bean.setGrade(rs.getString("grade"));
			obj_Student_Use_Bean.setSection(rs.getString("section"));
			obj_Student_Use_Bean.setProfile(rs.getString("profile"));
			obj_Student_Use_Bean.setStatus(rs.getInt("status"));
			list.add(obj_Student_Use_Bean);
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
