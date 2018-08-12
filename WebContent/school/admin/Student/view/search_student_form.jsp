
<%@page import="common.DBConnection_LMS_Portal"%><%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

 <% 
	try{      
		 String s[]=null;
		DBConnection_LMS_Portal obj_DBConnection_FLY_HIND=new DBConnection_LMS_Portal();
		Connection con=obj_DBConnection_FLY_HIND.getConnection();
		Statement st=con.createStatement(); 
		ResultSet rs = st.executeQuery("select student_name from student_table");
		
	    	List li = new ArrayList();
	    
			while(rs.next()) 
 			{ 	           
				System.out.println(rs.getString(1));
 			    li.add(rs.getString(1));
 			}  
			
			String[] str = new String[li.size()];			
			Iterator it = li.iterator();
			
			int i = 0;
			while(it.hasNext())
			{
				String p = (String)it.next();	
				str[i] = p;
				i++;
			}
		
			//jQuery related start		
				String query = (String)request.getParameter("q");
				
				int cnt=1;
				for(int j=0;j<str.length;j++)
				{
					if(str[j].toUpperCase().startsWith(query.toUpperCase()))
					{
						out.print(str[j]+"\n");
						if(cnt>=5)
							break;
						cnt++;
					}
				}
			//jQuery related end	
		
			
 		rs.close(); 
 		st.close(); 
		con.close();

		    } 
		catch(Exception e){ 
 			e.printStackTrace(); 
 		}
          
//www.java4s.com
 %>