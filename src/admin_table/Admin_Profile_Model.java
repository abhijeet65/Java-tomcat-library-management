package admin_table;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import common.DBConnection_LMS_Portal;
import common_use_bean.Admin_Use_Bean;

public class Admin_Profile_Model {
					public Admin_Use_Bean admin_sign_in(Admin_Use_Bean obj_Admin_Use_Bean){
						PreparedStatement ps=null;
						ResultSet rs=null;
						Connection connection=null;
						DBConnection_LMS_Portal obj_DBConnection_FLY_HIND=new DBConnection_LMS_Portal();
						connection=obj_DBConnection_FLY_HIND.getConnection();
					

						 TimeZone.setDefault(TimeZone.getTimeZone("Asia/Qatar"));
							SimpleDateFormat format = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss a");
							 
							  Date today4 = new Date();
								
								
						       String date4 = format.format(today4);
						
					try { 
						
						String query="select * from admin where user_name=? and password=?";
						ps = connection.prepareStatement(query);
						ps.setString(1,obj_Admin_Use_Bean.getUser_name());
						ps.setString(2,obj_Admin_Use_Bean.getPassword());
					System.out.println(ps);
							rs=ps.executeQuery();
							
							if(rs.next()){
								obj_Admin_Use_Bean.setSl_no(rs.getString("sl_no"));
								
								obj_Admin_Use_Bean.setUser_name(rs.getString("user_name"));
								
							
								
								
								
								
								
							}else{
								return null;
							}
						
						
						  
						
						
				    }catch(Exception e){
						e.printStackTrace();
					}finally{
						if(connection!=null){
							try {
									connection.close();
								}
							 catch (Exception e2) {
								e2.printStackTrace();
							}
						}
						
						if(ps!=null){
							try {
								ps.close();
								}
							 catch (Exception e2) {
								 e2.printStackTrace();
							}
						}
						
						
					}
					return obj_Admin_Use_Bean;
				}
					
				

					
					
					public int edit_profile(Admin_Use_Bean obj_Admin_Use_Bean){
						PreparedStatement ps=null;
						ResultSet rs=null;
						Connection connection=null;
						DBConnection_LMS_Portal obj_DBConnection_FLY_HIND=new DBConnection_LMS_Portal();
						connection=obj_DBConnection_FLY_HIND.getConnection();
					

						       
						       int flag=0;
						
					try { 
						
						String query="update admin set user_name=?,password=? where password=?";
						ps = connection.prepareStatement(query);
						ps.setString(1,obj_Admin_Use_Bean.getUser_name());
						ps.setString(2,obj_Admin_Use_Bean.getNew_password());
						ps.setString(3,obj_Admin_Use_Bean.getPassword());
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
								e2.printStackTrace();
							}
						}
						
						if(ps!=null){
							try {
								ps.close();
								}
							 catch (Exception e2) {
								 e2.printStackTrace();
							}
						}
						
						
					}
					return flag;
				}
					
				
					
					public Admin_Use_Bean get_admin_details(Admin_Use_Bean obj_Admin_Use_Bean){
						PreparedStatement ps=null;
						ResultSet rs=null;
						Connection connection=null;
						DBConnection_LMS_Portal obj_DBConnection_FLY_HIND=new DBConnection_LMS_Portal();
						connection=obj_DBConnection_FLY_HIND.getConnection();
					

					
					try { 
						
						String query="select * from admin where user_name!='j'";
						ps = connection.prepareStatement(query);
					System.out.println(ps);
							rs=ps.executeQuery();
							
							if(rs.next()){
								obj_Admin_Use_Bean.setSl_no(rs.getString("sl_no"));
								
								obj_Admin_Use_Bean.setUser_name(rs.getString("user_name"));
								
																
								
							}else{
								return null;
							}
						
						
						  
						
						
				    }catch(Exception e){
						e.printStackTrace();
					}finally{
						if(connection!=null){
							try {
									connection.close();
								}
							 catch (Exception e2) {
								e2.printStackTrace();
							}
						}
						
						if(ps!=null){
							try {
								ps.close();
								}
							 catch (Exception e2) {
								 e2.printStackTrace();
							}
						}
						
						
					}
					return obj_Admin_Use_Bean;
				}
					
				

}
