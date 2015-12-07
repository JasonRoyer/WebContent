package dbController;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import java.sql.ResultSet;
import java.util.*;
/**
 *	DatabaseController.java --	This program is what connectes all our jsp files to
 *	our database server. It establishes our connection and it will allow us to call
 *  the methods needed to run our queries that include: insert, delete, update, and 
 *  other queries specified in Prog4 specs.	
 *
 *  course: csc460
 *	authors: Jorge Naranjo, Jason Royer, Brett Dunbar
 */

public class DatabaseControllerRedux {
	static final long serialVersionUID = 1L;
  	/**
   	 * A handle to the connection to the DBMS.
   	 */
  	protected Connection connection_;
  	/**
   	 * A handle to the statement.
   	 */
  	protected Statement statement_;
  	/**
   	 * The connect string to specify the location of DBMS
   	 */
  	protected String connect_string_ = null;
  	/**
   	 * The password that is used to connect to the DBMS.
   	 */
  	protected String password = null;
  	/**
   	 * The username that is used to connect to the DBMS.
   	*/
  	protected String username = null;

  	public DatabaseControllerRedux() {
  		// username and password
  		username = "bidunbar";
  		password = "a9730";
  		connect_string_ = "jdbc:oracle:thin:@aloe.cs.arizona.edu:1521:oracle";
  	} // DatabaseController

  	// opens the connection for DBMS
  	public void Open() {
  		boolean opened = false;
  		while (!opened) {
  			try {
		        Class.forName("oracle.jdbc.OracleDriver");
		        connection_ = DriverManager.getConnection(connect_string_, username, password);
		        statement_ = connection_.createStatement();
		        opened = true;
		        return;
		    } catch (SQLException sqlex) {
		    	sqlex.printStackTrace();
		        opened  = false;
		    } catch (ClassNotFoundException e) {
		    	e.printStackTrace();
		        System.exit(1); 
		    } catch (Exception ex) {
		        ex.printStackTrace();
		        System.exit(2);
		    }
  		} // while
  	} // end open

  	public void Close() {
  		try {
  			statement_.close();
  			connection_.close();
  		} catch (SQLException e) {
  			System.err.println("Commit failed");
  			e.printStackTrace();
  		}
  	}
}
