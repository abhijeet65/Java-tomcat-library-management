package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

public class my_main {
	public static void main(String[] args) {
		try {
			Connection connection=null;
			DBConnection_LMS_Portal obj_DBConnection_SMS_Portal=new DBConnection_LMS_Portal();
			connection=obj_DBConnection_SMS_Portal.getConnection();
			PreparedStatement ps=null;
			for(int i=30;i<555;i++){
				
				TimeZone.setDefault(TimeZone.getTimeZone("Asia/Qatar"));
				SimpleDateFormat format = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss a");
				 
				  Date today4 = new Date();
				  String date4 = format.format(today4);
				
				
				String query="insert into issue_book(student_id,admission_no,student_name,book_title,book_sl_no,barcode,issue_date,return_date,status,issue_sl_no,description) values('MESSTU100','100','Vishak100','Dongri to Dubai','1000','100012','28-09-2014','08-10-2014','Pending','IS4',null)" ;
						
				ps=connection.prepareStatement(query);
				
				
				System.out.println(ps);
				
				ps.executeUpdate();
				
				//Thread.sleep(1000);
			}
			
			
			
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
