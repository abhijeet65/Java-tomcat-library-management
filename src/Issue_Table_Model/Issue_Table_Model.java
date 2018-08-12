package Issue_Table_Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import common.DBConnection_LMS_Portal;
import common_use_bean.Issue_Use_Bean;
import common_use_bean.Sequence_Issue_Id;
public class Issue_Table_Model {
	
	
	
	public int update_issue_book(Issue_Use_Bean obj_Issue_Use_Bean){
		Connection connection=null;
		DBConnection_LMS_Portal obj_DBConnection_SMS_Portal=new DBConnection_LMS_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		int flag=0;
	try { 
		
							String query="update issue_book set " +
									"issue_date=?," +
									"renew_date1=?," +
									"renew_date2=?," +
									"renew_date3=?," +
									"renew_date4=?," +
									"renew_date5=?," +
									"return_date=?," +
									"returned_date=?," +
									"status=?," +
									"description=? where issue_sl_no=?  ";
					
					ps=connection.prepareStatement(query);
					ps.setString(1, obj_Issue_Use_Bean.getIssue_date());
					ps.setString(2, obj_Issue_Use_Bean.getRenew_date1());
					ps.setString(3, obj_Issue_Use_Bean.getRenew_date2());
					ps.setString(4, obj_Issue_Use_Bean.getRenew_date3());
					ps.setString(5, obj_Issue_Use_Bean.getRenew_date4());
					ps.setString(6, obj_Issue_Use_Bean.getRenew_date5());
					ps.setString(7, obj_Issue_Use_Bean.getReturn_date());
					ps.setString(8, obj_Issue_Use_Bean.getReturned_date());
					ps.setString(9, obj_Issue_Use_Bean.getStatus());
					ps.setString(10, obj_Issue_Use_Bean.getDescription());
					ps.setString(11, obj_Issue_Use_Bean.getIssue_sl_no());
					
					
					System.out.println(ps);
					flag=ps.executeUpdate();
			
					
					

			
						if(obj_Issue_Use_Bean.getStatus()!=null){
							if(obj_Issue_Use_Bean.getStatus().contains("Returned")){
										query="update serial_number set " +
										"book_status=? " +
										"where bar_code=?";
						
										ps=connection.prepareStatement(query);
										ps.setString(1, "Available");
										ps.setString(2, obj_Issue_Use_Bean.getBarcode());
										
										
										System.out.println(ps);
										flag=ps.executeUpdate();
							}
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
	
	return flag;

	}	
	
	public String  get_days_delay( String dateStart,String dateStop) {
		// String dateStart = "28-09-2014";
			//String dateStop = "28-10-2014";
		 	String days=null;
			//HH converts hour in 24 hours format (0-23), day calculation
			SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");

			Date d1 = null;
			Date d2 = null;

			try {
				d1 = format.parse(dateStart);
				d2 = format.parse(dateStop);

				//in milliseconds
				long diff = d2.getTime() - d1.getTime();

			//	long diffSeconds = diff / 1000 % 60;
			//	long diffMinutes = diff / (60 * 1000) % 60;
			//	long diffHours = diff / (60 * 60 * 1000) % 24;
				long diffDays = diff / (24 * 60 * 60 * 1000);

			//	System.out.print(diffDays + " days, ");
			//	System.out.print(diffHours + " hours, ");
			//	System.out.print(diffMinutes + " minutes, ");
			//	System.out.print(diffSeconds + " seconds.");
					
				days=diffDays+"";
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return days;
		 
		 
		 
	 }
	 
	
	
	public int issue_book(Issue_Use_Bean obj_Issue_Use_Bean){
		Connection connection=null;
		DBConnection_LMS_Portal obj_DBConnection_SMS_Portal=new DBConnection_LMS_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		int flag=0;
	try { 
		
		
		String query="select * from student_table where admission_no=?";
		ps=connection.prepareStatement(query);
		ps.setString(1, obj_Issue_Use_Bean.getAdmission_no());
		System.out.println(ps);
		rs=ps.executeQuery();
		
		if(rs.next()){
			
			if(rs.getInt("status")==0){
				flag=20;
			}else{
			
			
			obj_Issue_Use_Bean.setStudent_id(rs.getString("student_id"));
			obj_Issue_Use_Bean.setStudent_name(rs.getString("student_name"));
			obj_Issue_Use_Bean.setAdmission_no(rs.getString("admission_no"));
			
			
							query="insert into issue_book(" +
							"student_id," +
							"admission_no," +
							"student_name," +
							"book_title," +
							"book_sl_no," +
							"barcode," +
							"issue_date," +
							"return_date," +
							"status,issue_sl_no,description) values(?,?,?,?,?,?,?,?,?,?,?)";
					
					ps=connection.prepareStatement(query);
					ps.setString(1, obj_Issue_Use_Bean.getStudent_id());
					ps.setString(2, obj_Issue_Use_Bean.getAdmission_no());
					ps.setString(3, obj_Issue_Use_Bean.getStudent_name());
					ps.setString(4, obj_Issue_Use_Bean.getBook_title());
					ps.setString(5, obj_Issue_Use_Bean.getBook_sl_no());
					ps.setString(6, obj_Issue_Use_Bean.getBarcode());
					ps.setString(7, obj_Issue_Use_Bean.getIssue_date());
					ps.setString(8, obj_Issue_Use_Bean.getReturn_date());
					ps.setString(9, "Pending");
					
					Sequence_Issue_Id  obj_Sequence_Issue_Id=new Sequence_Issue_Id();
					ps.setString(10, obj_Sequence_Issue_Id.get_issue_id());
					ps.setString(11, obj_Issue_Use_Bean.getDescription());
					
					
					System.out.println(ps);
					flag=ps.executeUpdate();
			
					
					query="update serial_number set book_status='Not Available' where bar_code=?";
					ps=connection.prepareStatement(query);
					ps.setString(1, obj_Issue_Use_Bean.getBarcode());
					System.out.println(ps);
					ps.executeUpdate();
			}
				}else{
					flag=18;
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
	
	return flag;

	}	
	
	
	
	
	
	
	
	public int issue_book_from_student(Issue_Use_Bean obj_Issue_Use_Bean){
		Connection connection=null;
		DBConnection_LMS_Portal obj_DBConnection_SMS_Portal=new DBConnection_LMS_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		int flag=0;
	try { 
		
		
		String query="select book_sl_no,book_title,book_status from serial_number where bar_code=?";
		ps=connection.prepareStatement(query);
		ps.setString(1, obj_Issue_Use_Bean.getBarcode());
		System.out.println(ps);
		rs=ps.executeQuery();
		
		if(rs.next()){
			
			
			obj_Issue_Use_Bean.setStatus(rs.getString("book_status"));
			
			obj_Issue_Use_Bean.setBook_sl_no(rs.getString("book_sl_no"));
			obj_Issue_Use_Bean.setBook_title(rs.getString("book_title"));
			
			if(!obj_Issue_Use_Bean.getStatus().equals("Available")){
				flag=20;
			}else{
			
							query="insert into issue_book(" +
							"student_id," +
							"admission_no," +
							"student_name," +
							"book_title," +
							"book_sl_no," +
							"barcode," +
							"issue_date," +
							"return_date," +
							"status,issue_sl_no,description) values(?,?,?,?,?,?,?,?,?,?,?)";
					
					ps=connection.prepareStatement(query);
					ps.setString(1, obj_Issue_Use_Bean.getStudent_id());
					ps.setString(2, obj_Issue_Use_Bean.getAdmission_no());
					ps.setString(3, obj_Issue_Use_Bean.getStudent_name());
					ps.setString(4, obj_Issue_Use_Bean.getBook_title());
					ps.setString(5, obj_Issue_Use_Bean.getBook_sl_no());
					ps.setString(6, obj_Issue_Use_Bean.getBarcode());
					ps.setString(7, obj_Issue_Use_Bean.getIssue_date());
					ps.setString(8, obj_Issue_Use_Bean.getReturn_date());
					ps.setString(9, "Pending");
					
					Sequence_Issue_Id  obj_Sequence_Issue_Id=new Sequence_Issue_Id();
					ps.setString(10, obj_Sequence_Issue_Id.get_issue_id());
					ps.setString(11, obj_Issue_Use_Bean.getDescription());
					
					
					System.out.println(ps);
					flag=ps.executeUpdate();
			
					
					query="update serial_number set book_status='Not Available' where bar_code=?";
					ps=connection.prepareStatement(query);
					ps.setString(1, obj_Issue_Use_Bean.getBarcode());
					System.out.println(ps);
					ps.executeUpdate();
			
			}
					
				}else{
					flag=18;
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
	
	return flag;

	}	
	
	
	
	
	
	
	
	public int delete_this_issue(Issue_Use_Bean obj_Issue_Use_Bean){
		Connection connection=null;
		DBConnection_LMS_Portal obj_DBConnection_SMS_Portal=new DBConnection_LMS_Portal();
		connection=obj_DBConnection_SMS_Portal.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		int flag=0;
	try { 
		
		
		
			
			
					String query="delete from issue_book where issue_sl_no=?";
					ps=connection.prepareStatement(query);
					ps.setString(1, obj_Issue_Use_Bean.getIssue_sl_no());
					System.out.println(ps);
					flag=ps.executeUpdate();
					query="update serial_number set book_status='Available' where bar_code=?";
					ps=connection.prepareStatement(query);
					ps.setString(1, obj_Issue_Use_Bean.getBarcode());
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
		if(rs!=null){
			try {
				
				rs.close();
				}
			 catch (Exception e2) {
				// TODO: handle exception
			}
		}
	
}
	
	return flag;

	}	
	
	
	
	
	
					public List<Issue_Use_Bean> issue_history_for_a_barcode(String barcode){
						Connection connection=null;
						DBConnection_LMS_Portal obj_DBConnection_SMS_Portal=new DBConnection_LMS_Portal();
						connection=obj_DBConnection_SMS_Portal.getConnection();
						PreparedStatement ps=null;
						ResultSet rs=null;
						List<Issue_Use_Bean> list=new ArrayList<Issue_Use_Bean>();
						
					try { 
						
						
						String query="select * from issue_book where barcode=?  order by issue_date desc  LIMIT 500";
						ps=connection.prepareStatement(query);
						ps.setString(1,barcode);
						System.out.println(ps);
						rs=ps.executeQuery();
						
						while(rs.next()){
							Issue_Use_Bean obj_Issue_Use_Bean=new Issue_Use_Bean();
							obj_Issue_Use_Bean.setStudent_id(rs.getString("student_id"));
							obj_Issue_Use_Bean.setStudent_name(rs.getString("student_name"));
							obj_Issue_Use_Bean.setAdmission_no(rs.getString("admission_no"));
							obj_Issue_Use_Bean.setBook_title(rs.getString("book_title"));
							obj_Issue_Use_Bean.setIssue_date(rs.getString("issue_date"));
							obj_Issue_Use_Bean.setReturn_date(rs.getString("return_date"));
							obj_Issue_Use_Bean.setDescription(rs.getString("description"));
							obj_Issue_Use_Bean.setRenew_date1(rs.getString("renew_date1"));
							obj_Issue_Use_Bean.setRenew_date2(rs.getString("renew_date2"));
							obj_Issue_Use_Bean.setRenew_date3(rs.getString("renew_date3"));
							obj_Issue_Use_Bean.setRenew_date4(rs.getString("renew_date4"));
							obj_Issue_Use_Bean.setRenew_date5(rs.getString("renew_date5"));
							
							
							obj_Issue_Use_Bean.setStatus(rs.getString("status"));
							obj_Issue_Use_Bean.setIssue_sl_no(rs.getString("issue_sl_no"));
							list.add(obj_Issue_Use_Bean);
							

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
					
					return list;
				
					}	
					
					
					public List<Issue_Use_Bean> issue_history_for_a_student(String Student_id){
						Connection connection=null;
						DBConnection_LMS_Portal obj_DBConnection_SMS_Portal=new DBConnection_LMS_Portal();
						connection=obj_DBConnection_SMS_Portal.getConnection();
						PreparedStatement ps=null;
						ResultSet rs=null;
						List<Issue_Use_Bean> list=new ArrayList<Issue_Use_Bean>();
						
					try { 
						
						
						String query="select * from issue_book where student_id=? order by issue_date desc LIMIT 500";
						ps=connection.prepareStatement(query);
						ps.setString(1,Student_id);
						System.out.println(ps);
						rs=ps.executeQuery();
						
						while(rs.next()){
							Issue_Use_Bean obj_Issue_Use_Bean=new Issue_Use_Bean();
							obj_Issue_Use_Bean.setStudent_id(rs.getString("student_id"));
							obj_Issue_Use_Bean.setStudent_name(rs.getString("student_name"));
							obj_Issue_Use_Bean.setAdmission_no(rs.getString("admission_no"));
							obj_Issue_Use_Bean.setBook_title(rs.getString("book_title"));
							obj_Issue_Use_Bean.setIssue_date(rs.getString("issue_date"));
							obj_Issue_Use_Bean.setReturn_date(rs.getString("return_date"));
							obj_Issue_Use_Bean.setStatus(rs.getString("status"));
							obj_Issue_Use_Bean.setBarcode(rs.getString("barcode"));
							obj_Issue_Use_Bean.setIssue_sl_no(rs.getString("issue_sl_no"));
							list.add(obj_Issue_Use_Bean);
							

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
					
					return list;
				
					}	
					
					
	
					public Issue_Use_Bean get_complete_details_of_issue(String issue_sl_no){
						Connection connection=null;
						DBConnection_LMS_Portal obj_DBConnection_SMS_Portal=new DBConnection_LMS_Portal();
						connection=obj_DBConnection_SMS_Portal.getConnection();
						PreparedStatement ps=null;
						ResultSet rs=null;
						Issue_Use_Bean obj_Issue_Use_Bean=new Issue_Use_Bean();
						
					try { 
						
						
						String query="select * from issue_book where issue_sl_no=? LIMIT 500";
						ps=connection.prepareStatement(query);
						ps.setString(1,issue_sl_no);
						System.out.println(ps);
						rs=ps.executeQuery();
						
						if(rs.next()){
							obj_Issue_Use_Bean.setStudent_id(rs.getString("student_id"));
							obj_Issue_Use_Bean.setStudent_name(rs.getString("student_name"));
							obj_Issue_Use_Bean.setAdmission_no(rs.getString("admission_no"));
							obj_Issue_Use_Bean.setBook_title(rs.getString("book_title"));
							obj_Issue_Use_Bean.setIssue_date(rs.getString("issue_date"));
							obj_Issue_Use_Bean.setReturn_date(rs.getString("return_date"));
							obj_Issue_Use_Bean.setStatus(rs.getString("status"));
							obj_Issue_Use_Bean.setBarcode(rs.getString("barcode"));
							obj_Issue_Use_Bean.setDescription(rs.getString("description"));
							obj_Issue_Use_Bean.setReturned_date(rs.getString("returned_date"));
							obj_Issue_Use_Bean.setRenew_date1(rs.getString("renew_date1"));
							obj_Issue_Use_Bean.setRenew_date2(rs.getString("renew_date2"));
							obj_Issue_Use_Bean.setRenew_date3(rs.getString("renew_date3"));
							obj_Issue_Use_Bean.setRenew_date4(rs.getString("renew_date4"));
							obj_Issue_Use_Bean.setRenew_date5(rs.getString("renew_date5"));
							
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
					
					return obj_Issue_Use_Bean;
				
					}	
					
					
					
					
					public List<Issue_Use_Bean> get_complete_issue_history(int lim){
						Connection connection=null;
						DBConnection_LMS_Portal obj_DBConnection_SMS_Portal=new DBConnection_LMS_Portal();
						connection=obj_DBConnection_SMS_Portal.getConnection();
						PreparedStatement ps=null;
						ResultSet rs=null;
						List<Issue_Use_Bean> list=new ArrayList<Issue_Use_Bean>();
						
					try { 
						
						
						String query="select * from issue_book order by issue_date desc LIMIT "+(lim*100)+",100";
						ps=connection.prepareStatement(query);
						System.out.println(ps);
						rs=ps.executeQuery();
						
						while(rs.next()){
							Issue_Use_Bean obj_Issue_Use_Bean=new Issue_Use_Bean();
							obj_Issue_Use_Bean.setStudent_id(rs.getString("student_id"));
							obj_Issue_Use_Bean.setStudent_name(rs.getString("student_name"));
							obj_Issue_Use_Bean.setAdmission_no(rs.getString("admission_no"));
							obj_Issue_Use_Bean.setBook_title(rs.getString("book_title"));
							obj_Issue_Use_Bean.setIssue_date(rs.getString("issue_date"));
							obj_Issue_Use_Bean.setReturn_date(rs.getString("return_date"));
							obj_Issue_Use_Bean.setStatus(rs.getString("status"));
							obj_Issue_Use_Bean.setBarcode(rs.getString("barcode"));
							obj_Issue_Use_Bean.setDescription(rs.getString("description"));
							obj_Issue_Use_Bean.setIssue_sl_no(rs.getString("issue_sl_no"));
							obj_Issue_Use_Bean.setRenew_date1(rs.getString("renew_date1"));
							obj_Issue_Use_Bean.setRenew_date2(rs.getString("renew_date2"));
							obj_Issue_Use_Bean.setRenew_date3(rs.getString("renew_date3"));
							obj_Issue_Use_Bean.setRenew_date4(rs.getString("renew_date4"));
							obj_Issue_Use_Bean.setRenew_date5(rs.getString("renew_date5"));
							list.add(obj_Issue_Use_Bean);
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
					
					return list;
				
					}	
					
					
					
					
					 
					
					public List<Issue_Use_Bean> get_all_pending_issues(int lim){
						Connection connection=null;
						DBConnection_LMS_Portal obj_DBConnection_SMS_Portal=new DBConnection_LMS_Portal();
						connection=obj_DBConnection_SMS_Portal.getConnection();
						PreparedStatement ps=null;
						ResultSet rs=null;
						List<Issue_Use_Bean> list=new ArrayList<Issue_Use_Bean>();
						
					try { 
						
						
						String query="select * from issue_book where status='Pending' order by issue_date desc LIMIT "+(lim*100)+",100";
						ps=connection.prepareStatement(query);
						System.out.println(ps);
						rs=ps.executeQuery();
						
						while(rs.next()){
							Issue_Use_Bean obj_Issue_Use_Bean=new Issue_Use_Bean();
							obj_Issue_Use_Bean.setStudent_id(rs.getString("student_id"));
							obj_Issue_Use_Bean.setStudent_name(rs.getString("student_name"));
							obj_Issue_Use_Bean.setAdmission_no(rs.getString("admission_no"));
							obj_Issue_Use_Bean.setBook_title(rs.getString("book_title"));
							obj_Issue_Use_Bean.setIssue_date(rs.getString("issue_date"));
							obj_Issue_Use_Bean.setReturn_date(rs.getString("return_date"));
							obj_Issue_Use_Bean.setStatus(rs.getString("status"));
							obj_Issue_Use_Bean.setBarcode(rs.getString("barcode"));
							obj_Issue_Use_Bean.setDescription(rs.getString("description"));
							obj_Issue_Use_Bean.setIssue_sl_no(rs.getString("issue_sl_no"));
							obj_Issue_Use_Bean.setRenew_date1(rs.getString("renew_date1"));
							obj_Issue_Use_Bean.setRenew_date2(rs.getString("renew_date2"));
							obj_Issue_Use_Bean.setRenew_date3(rs.getString("renew_date3"));
							obj_Issue_Use_Bean.setRenew_date4(rs.getString("renew_date4"));
							obj_Issue_Use_Bean.setRenew_date5(rs.getString("renew_date5"));
							list.add(obj_Issue_Use_Bean);
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
					
					return list;
				
					}	
					
					
					
					
					
					
					
					
					public List<Issue_Use_Bean> search_issue_history(String search){
						Connection connection=null;
						DBConnection_LMS_Portal obj_DBConnection_SMS_Portal=new DBConnection_LMS_Portal();
						connection=obj_DBConnection_SMS_Portal.getConnection();
						PreparedStatement ps=null;
						ResultSet rs=null;
						List<Issue_Use_Bean> list=new ArrayList<Issue_Use_Bean>();
						
					try { 
						
						
						String query="select * from issue_book where " +
											"admission_no like ? or " +
											"student_name like ? or " +
											"book_title like ? or " +
											"barcode like ? or " +
											"issue_date like ? or " +
											"renew_date1 like ? or " +
											"renew_date2 like ? or " +
											"renew_date3 like ? or " +
											"renew_date4 like ? or " +
											"renew_date5 like ? or " +
											"return_date like ? or " +
											"returned_date like ? or " +
											"status like ? or " +
											"description like ?  " +
											"order by issue_date desc limit 500";
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
						ps.setString(14, "%"+search+"%");
						
						System.out.println(ps);
						rs=ps.executeQuery();
						
						while(rs.next()){
							Issue_Use_Bean obj_Issue_Use_Bean=new Issue_Use_Bean();
							obj_Issue_Use_Bean.setStudent_id(rs.getString("student_id"));
							obj_Issue_Use_Bean.setStudent_name(rs.getString("student_name"));
							obj_Issue_Use_Bean.setAdmission_no(rs.getString("admission_no"));
							obj_Issue_Use_Bean.setBook_title(rs.getString("book_title"));
							obj_Issue_Use_Bean.setIssue_date(rs.getString("issue_date"));
							obj_Issue_Use_Bean.setReturn_date(rs.getString("return_date"));
							obj_Issue_Use_Bean.setStatus(rs.getString("status"));
							obj_Issue_Use_Bean.setBarcode(rs.getString("barcode"));
							obj_Issue_Use_Bean.setDescription(rs.getString("description"));
							obj_Issue_Use_Bean.setIssue_sl_no(rs.getString("issue_sl_no"));
							obj_Issue_Use_Bean.setRenew_date1(rs.getString("renew_date1"));
							obj_Issue_Use_Bean.setRenew_date2(rs.getString("renew_date2"));
							obj_Issue_Use_Bean.setRenew_date3(rs.getString("renew_date3"));
							obj_Issue_Use_Bean.setRenew_date4(rs.getString("renew_date4"));
							obj_Issue_Use_Bean.setRenew_date5(rs.getString("renew_date5"));
							list.add(obj_Issue_Use_Bean);
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
					
					return list;
				
					}	
					
					
					
	

}
