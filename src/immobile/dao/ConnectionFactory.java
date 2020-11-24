package immobile.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {

	public Connection getConnection() {
		String url = "jdbc:postgresql://127.0.0.1:5432/immobile";
		String usuario ="postgres";
		String senha ="0320";
		
		
		try { 
			Class.forName("org.postgresql.Driver");
		}catch (ClassNotFoundException e) {
			
			e.printStackTrace();
			
		}
		 
		 try {
			 
		 
			  return DriverManager.getConnection(url, usuario, senha);
			  
		 }catch(SQLException e){
		 
			e. printStackTrace();
			  return null;
		 }  
		 
	 }
		 
      public static void close(Connection con){
    	  
    	  try{
    		  con.close();
    		  
    	  }catch (Exception e){
    		  e.printStackTrace();
    		  
    		  
    	  }
    	  
    }

}



