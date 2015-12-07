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
	
	private final String testClientID = "clientID", testType = "testType", testPassed = "passed", testReason = "reason", testDate = "testDate",     // test
                       	 clientID = "clientID", clientName = "name", clientGender = "gender", clientAddress = "address", clientCity = "city", clientPhone = "phoneNum", clientLicense = "valid license",  // client
                         interviewEmployeeID = "empID",  interviewClientID = "clientID", interviewDate = "interviewDate", interviewNeeds = "needs",                   // interview
                         lessonNum = "lessonNum", lessonCarID = "carID", lessonClientID = "clientID", lessonFee = "fee", lessonDate = "lessonDate", lessonMilesDriven = "milesDriven", // lesson
                         employeeID = "empID", employeeName = "name", employeeDOB = "DOB", employeePhoneNum = "phoneNum", employeeGender = "gender", employeeJobTitle = "jobTitle", employeeCarID = "carID", employeeOfficeID = "officeID", // employee	
                         carID = "carID", carMileage = "mileage", carFaults = "faults", carEmpID = "empID",  // car 
                         officeID = "officeID", officeName = "officeName", officeManagerID = "managerID", officePhoneNum = "phoneNum", officeAddress = "address", officeCity = "city", officeState = "state";        //office				 
                         						 

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
				conn = DriverManager.getConnection
			}
		} // end while
	} // end openConnection()
	
	public boolean insert(String tableName, ArrayList<String> attributes) {
		String query = "";
		Statement stmt =  null;
		ResultSet answer = null;
		
		switch (tableName) {
			case "test":
				query = "insert into " + tableName + " (" + 
				break;
			case "client":
				insertValues("client", client);
				break;
			case "interview":
				insertValues("interview", interview);
				break;
			case "lesson":
				insertValues("lesson", lesson);
				break;
			case "employee":
				insertValues("employee", employee);
				break;
			case "car":
				insertValues("car", car);
				break;
			case "office":
				insertValues("office", office);
				break;
		}	
	}
} // end DatabaseController
