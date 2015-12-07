/**
 *	DatabaseController.java --	This program is what connectes all our jsp files to
 *	our database server. It establishes our connection and it will allow us to call
 *  the methods needed to run our queries that include: insert, delete, update, and 
 *  other queries specified in Prog4 specs.	
 *
 *  course: csc460
 *	authors: Jorge Naranjo, Jason Royer, Brett Dunbar
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import java.sql.ResultSet;
import java.util.*;

public class DatabaseController {

	/**
	 * next few variables handles the connection, statement, username, and password
	 */
	static final long serialVersionUID = 1L;
	protected Conenction conn;
	protected Statement stmt;
	protected String connectString = null;
	protected String username = null, password = null;

	// contructor to get the connection going
	public DatabaseController() {
		// username and password to connect to DB, change if needed
		username = "bidunbar";
		password = "a9730";
		connectString = "jdbc:oracle:thin:@aloe.cs.arizona.edu:1521:oracle";
	} // end DatabaseController()

	public void openConnection() {
		boolean opened = false;
		while(!opened) {
			try {
				Class.forName("oracle.jdbc.OracleDriver");
				conn = DriverManager.getConnection(connectString, username, password);
				statement = conn.createStatement();
				opened = true;
				return;
			} catch (SQLException sqlE) {
				sqlE.printStackTrace();
				opened = false;
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
				System.exit(1);
			} catch (Exception ex) {
				ex.printStackTrace();
				System.exit(2);
			}
		} // end while
	} // end openConnection()

	public void closeConnection() {
		try {
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		conn = null;
	} // end closeConnetion()

	public boolean update(String tablename, ArrayList<String> attrs) {
		delete(tablename, )
	}
} // end DatabaseController
