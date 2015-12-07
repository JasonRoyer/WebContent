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
	 * next few variables handles the connection, statement, username, and
	 * password
	 */
	static final long serialVersionUID = 1L;
	protected Connection conn;
	protected Statement stmt;
	protected String connectString = null;
	protected String username = null, password = null;

	private final String testClientID = "\"clientID\"",
			testType = "\"testType\"",
			testPassed = "\"passed\"",
			testReason = "\"reason\"",
			testDate = "\"testDate\"", // test
			
			clientID = "\"clientID\"",
			clientName = "\"name\"",
			clientGender = "\"gender\"",
			clientAddress = "\"address\"",
			clientCity = "\"city\"",
			clientPhone = "\"phoneNum\"",
			clientLicense = "\"valid license\"", // client
			
			interviewEmployeeID = "\"empID\"",
			interviewClientID = "\"clientID\"",
			interviewDate = "\"interviewDate\"",
			interviewNeeds = "\"needs\"", // interview
			
			lessonNum = "\"lessonNum\"",
			lessonCarID = "\"carID\"",
			lessonClientID = "\"clientID\"",
			lessonEmployeeID = "\"empID\"",
			lessonFee = "\"fee\"",
			lessonDate = "\"lessonDate\"",
			lessonMilesDriven = "\"milesDriven\"", // lesson
			
			employeeID = "\"empID\"",
			employeeName = "\"name\"",
			employeeDOB = "\"DOB\"",
			employeePhoneNum = "\"phoneNum\"",
			employeeGender = "\"gender\"",
			employeeJobTitle = "\"jobTitle\"",
			employeeCarID = "\"carID\"",
			employeeOfficeID = "\"officeID\"", // employee
			
			carID = "\"carID\"",
			carMileage = "\"mileage\"",
			carFaults = "\"faults\"",
			carEmpID = "\"empID\"", // car
			
			officeID = "\"officeID\"", officeName = "\"officeName\"",
			officeManagerID = "\"managerID\"", officePhoneNum = "\"phoneNum\"",
			officeAddress = "\"address\"", officeCity = "\"city\"",
			officeState = "\"state\""; // office

	// contructor to get the connection going
	public void openConnection() {
		boolean opened = false;
		while (!opened) {
			try {
				Class.forName("oracle.jdbc.OracleDriver");
				conn = DriverManager.getConnection(connectString, username,
						password);
				stmt = conn.createStatement();
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

	public boolean insert(String tableName, ArrayList<String> attributes) {
		String query = "";
		Statement stmt = null;
		ResultSet answer = null;

		try {
			switch (tableName) {
			case "test":
				stmt = conn.createStatement();
				query = "insert into " + tableName + " (" + testClientID + ", "
						+ testType + ", " + testPassed + ", " + testReason + ", "
						+ testDate + ") " + " values" + " ("
						+ Integer.parseInt(attributes.get(0)) + ", '"
						+ attributes.get(1) + "', '" + attributes.get(2) + "', '"
						+ attributes.get(3) + "', '" + attributes.get(4) + "')";
				answer = stmt.executeQuery(query);
				break;
			case "client":
				stmt = conn.createStatement();
				query = "insert into " + tableName + " (" + clientID +  ", "
						+ clientName + ", " + clientGender + ", " + clientAddress + ", "
						+ clientCity + ", " + clientPhone + ", " + clientLicense + ") " + " values" + " ("
						+ Integer.parseInt(attributes.get(0)) + ", '"
						+ attributes.get(1) + "', '" + attributes.get(2) + "', '"
						+ attributes.get(3) + "', '" + attributes.get(4) + "', " + Integer.parseInt(attributes.get(5)) 
						+ ", '" + attributes.get(6) + "')";
				answer = stmt.executeQuery(query);
				break;
			case "interview":
				stmt = conn.createStatement();
				query = "insert into " + tableName + " (" + interviewClientID +  ", "
						+ interviewEmployeeID + ", " + interviewDate + ", " + interviewNeeds + " values" + " ("
						+ Integer.parseInt(attributes.get(0)) + ", '"
						+ attributes.get(1) + "', '" + attributes.get(2) + "', '"
						+ attributes.get(3) + "', '" + attributes.get(4) + "')";
				answer = stmt.executeQuery(query);
				break;
			case "lesson":
				stmt = conn.createStatement();
				query = "insert into " + tableName + " (" + lessonNum +  ", "
						+ lessonCarID + ", " + lessonClientID + ", " + lessonEmployeeID + ", "
						+ lessonFee + ", " + lessonDate + ", " + lessonMilesDriven + ") " + " values" + " ("
						+ Integer.parseInt(attributes.get(0)) + ", "
						+ Integer.parseInt(attributes.get(1)) + ", " + Integer.parseInt(attributes.get(2)) + ", "
						+ Integer.parseInt(attributes.get(3)) + ", " + Integer.parseInt(attributes.get(4)) + ", " + Integer.parseInt(attributes.get(5)) 
						+ ", " + Integer.parseInt(attributes.get(6)) + ")";
				answer = stmt.executeQuery(query);
				break;
			case "employee":
				stmt = conn.createStatement();
				query = "insert into " + tableName + " (" + employeeID +  ", "
						+ employeeName + ", " + employeeDOB + ", " + employeePhoneNum + ", "
						+ employeeGender + ", " + employeeJobTitle + ", " + employeeCarID + "," 
						+ employeeOfficeID + ") " + " values" + " ("
						+ Integer.parseInt(attributes.get(0)) + ", '"
						+ attributes.get(1) + "', " + Integer.parseInt(attributes.get(2)) + ", "
						+ Integer.parseInt(attributes.get(3)) + ", '" + attributes.get(4) + "', " + Integer.parseInt(attributes.get(5)) 
						+ ", " + Integer.parseInt(attributes.get(6)) + Integer.parseInt(attributes.get(7)) + ")";
				answer = stmt.executeQuery(query);
				break;
			case "car":
				stmt = conn.createStatement();
				query = "insert into " + tableName + " (" + carID +  ", "
						+ carMileage + ", " + carFaults + ", " + carEmpID + " values" + " ("
						+ Integer.parseInt(attributes.get(0)) + ", "
						+ Integer.parseInt(attributes.get(1)) + ", " + attributes.get(2) + ", "
						+ Integer.parseInt(attributes.get(3)) + ")";
				answer = stmt.executeQuery(query);
				break;
			case "office":
				stmt = conn.createStatement();
				query = "insert into " + tableName + " (" + officeID +  ", "
						+ officeName + ", " + officeManagerID + ", " + officePhoneNum + ", "
						+ officeAddress + ", " + officeCity + ", " + officeState + ") " + " values" + " ("
						+ Integer.parseInt(attributes.get(0)) + ", '"
						+ attributes.get(1) + "', " + Integer.parseInt(attributes.get(2)) + ", "
						+ Integer.parseInt(attributes.get(3)) + ", '" + attributes.get(4) + "', '" + attributes.get(5) 
						+ "', '" + attributes.get(6) + "')";
				answer = stmt.executeQuery(query);
				break;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("Unable to insert into database!");
			System.exit(-1);
		}
		return false;
	} //insert
	
	public void closeConnection() {
		try {
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		conn = null;
	} // end closeConnetion()

	/** update --	@param tablename - the name of the relation
	 *				@param attr - list of the attribute info
	 *	This method calls delete and then insert instead of actually
	 *	updating the table directly.
	 */
 	public boolean update(String tablename, ArrayList<String> attrs) {
		boolean returned = false;
		returned = delete(tablename, attrs.get(0));
		// if delete returned false, then return false
		if (!returned) {
			return returned;
		}
		returned = insert(tablename, attrs);
		// if insert returned false, return false
		if (!returned) {
			return returned;
		}
		return true;
 	}
} // end DatabaseController
