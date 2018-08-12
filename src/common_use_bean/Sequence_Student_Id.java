package common_use_bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import common.DBConnection_LMS_Portal;

public class Sequence_Student_Id {
	
	
	
	
	
	public static void main(String[] args) {
		
		
		Sequence_Student_Id obj_Sequence_Student_Id=new Sequence_Student_Id();
		
		//obj_Sequence_Book_Id.create_table();
		System.out.println("Sequence student Id is "+obj_Sequence_Student_Id.get_student_id());
		
	}
	
	public String get_student_id(){
		PreparedStatement ps=null;
		Connection connection=null;
		ResultSet rs=null;
		DBConnection_LMS_Portal obj_DBConnection_LMS_Portal=new DBConnection_LMS_Portal();
		connection=obj_DBConnection_LMS_Portal.getConnection();
		String sequence_id="";
		String query="select sl_no from sequence_student_id";
		try {
			ps=connection.prepareStatement(query);
			rs=ps.executeQuery();
			rs.last();
			int sl_no=rs.getInt(1);
			
			
			query="update sequence_student_id set sl_no=sl_no+1 where sl_no=?";
			ps=connection.prepareStatement(query);
			ps.setInt(1, sl_no+0);
			//ps.setInt(2, sl_no);
			
			ps.executeUpdate();
			
			sequence_id="MESSTU"+sl_no+"";
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return sequence_id;
		
		
		
		
		
		
		
	}
	
	
	
	public  void create_table(){
		PreparedStatement ps=null;
		Connection connection=null;
		
		DBConnection_LMS_Portal obj_DBConnection_College_Portal=new DBConnection_LMS_Portal();
		connection=obj_DBConnection_College_Portal.getConnection();
		
		
		
		String query="create table sequence_student_id(sl_no int(255) not null,primary key(sl_no))";
		try {
			ps=connection.prepareStatement(query);
			ps.executeUpdate();
			
			
			
	        query="insert into sequence_student_id values(1)";
			ps=connection.prepareStatement(query);
			
			ps.executeUpdate();
			
			System.out.println("Table created");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
