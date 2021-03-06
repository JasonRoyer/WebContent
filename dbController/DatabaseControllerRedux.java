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
  	private Connection connection_;
  	/**
   	 * A handle to the statement.
   	 */
  	private Statement statement_;
  	/**
   	 * The connect string to specify the location of DBMS
   	 */
  	private String connect_string_ = null;
  	/**
   	 * The password that is used to connect to the DBMS.
   	 */
  	private String password = null;
  	/**
   	 * The username that is used to connect to the DBMS.
   	*/
  	private String username = null;

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


  	public DatabaseControllerRedux() {
  		// username and password
  		username = "jnaranjo1";
  		password = "a5650";
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
  	} // close

  	public boolean insert(String tableName, ArrayList<String> attributes) {
		String query = "";
		Statement stmt = null;
		ResultSet answer = null;
		try {
			switch (tableName) {
			case "test":
				stmt = connection_.createStatement();
				query = "insert into " + tableName + " (" + testClientID + " "
						+ testType + " " + testPassed + " " + testReason + " "
						+ testDate + ") " + " values" + " ("
						+ Integer.parseInt(attributes.get(0)) + ", "
						+ attributes.get(1) + ", " + attributes.get(2) + ", "
						+ attributes.get(3) + ", " + attributes.get(4) + ")";
				answer = stmt.executeQuery(query);
				break;
			case "client":
				stmt = connection_.createStatement();
				query = "insert into " + tableName + " (" + clientID +  " "
						+ clientName + " " + clientGender + " " + clientAddress + " "
						+ clientCity + " " + clientPhone + " " + clientLicense + ") " + " values" + " ("
						+ Integer.parseInt(attributes.get(0)) + ", "
						+ attributes.get(1) + ", " + attributes.get(2) + ", "
						+ attributes.get(3) + ", " + attributes.get(4) + ", " + Integer.parseInt(attributes.get(5)) 
						+ ", " + attributes.get(6) + ")";
				answer = stmt.executeQuery(query);
				break;
			case "interview":
				stmt = connection_.createStatement();
				query = "insert into " + tableName + " (" + interviewClientID +  " "
						+ interviewEmployeeID + " " + interviewDate + " " + interviewNeeds + " values" + " ("
						+ Integer.parseInt(attributes.get(0)) + ", "
						+ attributes.get(1) + ", " + attributes.get(2) + ", "
						+ attributes.get(3) + ", " + attributes.get(4) + ")";
				answer = stmt.executeQuery(query);
				break;
			case "lesson":
				stmt = connection_.createStatement();
				query = "insert into " + tableName + " (" + lessonNum +  " "
						+ lessonCarID + " " + lessonClientID + " " + lessonEmployeeID + " "
						+ lessonFee + " " + lessonDate + " " + lessonMilesDriven + ") " + " values" + " ("
						+ Integer.parseInt(attributes.get(0)) + ", "
						+ Integer.parseInt(attributes.get(1)) + ", " + Integer.parseInt(attributes.get(2)) + ", "
						+ Integer.parseInt(attributes.get(3)) + ", " + Integer.parseInt(attributes.get(4)) + ", " + Integer.parseInt(attributes.get(5)) 
						+ ", " + Integer.parseInt(attributes.get(6)) + ")";
				answer = stmt.executeQuery(query);
				break;
			case "employee":
				stmt = connection_.createStatement();
				query = "insert into " + tableName + " (" + employeeID +  " "
						+ employeeName + " " + employeeDOB + " " + employeePhoneNum + " "
						+ employeeGender + " " + employeeJobTitle + " " + employeeCarID + "," 
						+ employeeOfficeID + ") " + " values" + " ("
						+ Integer.parseInt(attributes.get(0)) + ", "
						+ attributes.get(1) + ", " + Integer.parseInt(attributes.get(2)) + ", "
						+ Integer.parseInt(attributes.get(3)) + ", " + attributes.get(4) + ", " + Integer.parseInt(attributes.get(5)) 
						+ ", " + Integer.parseInt(attributes.get(6)) + Integer.parseInt(attributes.get(7)) + ")";
				answer = stmt.executeQuery(query);
				break;
			case "car":
				stmt = connection_.createStatement();
				query = "insert into " + tableName + " (" + carID +  " "
						+ carMileage + " " + carFaults + " " + carEmpID + " values" + " ("
						+ Integer.parseInt(attributes.get(0)) + ", "
						+ Integer.parseInt(attributes.get(1)) + ", " + attributes.get(2) + ", "
						+ Integer.parseInt(attributes.get(3)) + ")";
				answer = stmt.executeQuery(query);
				break;
			case "office":
				stmt = connection_.createStatement();
				query = "insert into " + tableName + " (" + officeID +  " "
						+ officeName + " " + officeManagerID + " " + officePhoneNum + " "
						+ officeAddress + " " + officeCity + ", " + officeState + ") " + " values" + " ("
						+ Integer.parseInt(attributes.get(0)) + ", "
						+ attributes.get(1) + ", " + Integer.parseInt(attributes.get(2)) + ", "
						+ Integer.parseInt(attributes.get(3)) + ", " + attributes.get(4) + ", " + attributes.get(5) 
						+ ", " + attributes.get(6) + ")";
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

	/** update --	@param tablename - the name of the relation
	 *				@param attr - list of the attribute info
	 *	This method calls delete and then insert instead of actually
	 *	updating the table directly.
	 */
 	public boolean update(String tablename, ArrayList<String> attrs) {
		boolean returned = false;
		// set array for the delete for tables with compound PKs,
		// check if tablename == test
		String [] attrsArray = new String[3];
		if (tablename.equals("test")) {
			attrsArray[0] = attrs.get(0);
			attrsArray[1] = attrs.get(1);
			attrsArray[2] = attrs.get(4);
		} else{
			attrsArray[0] = attrs.get(0);
		}
		returned = delete(tablename, attrsArray);
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
 	} // update

 	/**
 	 *	delete - @param tablename - string that's passed in contains the name of the able to be deleted
 	 * 			 @param PKs - array of strings, typically one element, contains PK(s) to associate with the tuple to be deleted
 	 *	This method deletes the tuple from the relation passed in based on the PKs given along when it's called	
 	 */
 	public boolean delete(String tablename, String [] PKs) {
 		// check if tablename == "test" because is the only
 		// relation with a compound PK
 		String query = "DELETE FROM " + tablename + " WHERE ";
 		Statement stmt = null;
		ResultSet answer = null;

 		if (tablename.equals("test")) {
 			// delete with compound key
 			query += PKs[0] + "= clientID AND " + PKs[1] + "=testType AND " + PKs[2] + "=testDate";
 		} else {
 			// delete with only asingle pk
 			switch (tablename) {
 				case "client":
 					query += PKs[0] + "= clientID";
 					break;
 				case "interview":
 					query += PKs[0] + "= clientID";
 					break;
 				case "lesson":
 					query += PKs[0] + "= lessonNum";
 					break;
 				case "employee":
 					query += PKs[0] + "= empID";
 					break;
 				case "car":
 					query += PKs[0] + "= carID";
 					break;
 				case "office":
 					query += PKs[0] + "= officeID";
 					break;				
 			} // switch
 		} // if/else

 		// attempt to run query
 		try {
 			stmt = connection_.createStatement();
 			answer = stmt.executeQuery(query);
 		} catch(SQLException e) {
 			e.printStackTrace();
 			return false;
 		}
 		return true;

 	} // delete

 	
 	public ArrayList<ArrayList<String>> findAll(String tablename) {
 		String query = "SELECT * FROM bidunbar." + tablename;
 		try {
 			ResultSet rs = stmt.executeQuery(query);
 			List<ArrayList> tupleList = new ArrayList<ArrayList>();
 			// call method to get the column names of each table, add it to the arraylist
 			List<String> tuple = new ArrayList<String>();
 			tupleList.add(columnNames(tablename));
 			while(rs.next()) {
 				tuple = new ArrayList<String>();
 				// @TODO here will be the list of ifs or cases which ever bull shit i go with tomorrow
 				switch(tablename) {
 					case "test":
 						tuple.add(rs.getString("clientID"));
 						tuple.add(rs.getString("testType"));
 						tuple.add(rs.getString("passed"));
 						tuple.add(rs.getString("reason"));
 						tuple.add(rs.getString("testDate"));
 						break;
 					case "client":
 						tuple.add(rs.getString("clientID"));
 						tuple.add(rs.getString("name"));
 						tuple.add(rs.getString("gender"));
 						tuple.add(rs.getString("address"));
 						tuple.add(rs.getString("city"));
 						tuple.add(rs.getString("phoneNum"));
 						tuple.add(rs.getString("validLicense"));
 						break;
 					case "interview":
 						tuple.add(rs.getString("clientID"));
 						tuple.add(rs.getString("empID"));
 						tuple.add(rs.getString("interviewDate"));
 						tuple.add(rs.getString("needs"));
 						break;
 					case "lesson":
 						tuple.add(rs.getString("lessonNum"));
 						tuple.add(rs.getString("carID"));
 						tuple.add(rs.getString("clientID"));
 						tuple.add(rs.getString("empID"));
 						tuple.add(rs.getString("fee"));
 						tuple.add(rs.getString("lessonDate"));
 						tuple.add(rs.getString("milesDriven"));
 						break;
 					case "employee":
 						tuple.add(rs.getString("empID"));
 						tuple.add(rs.getString("name"));
 						tuple.add(rs.getString("DOB"));
 						tuple.add(rs.getString("phoneNum"));
 						tuple.add(rs.getString("gender"));
 						tuple.add(rs.getString("jobTitle"));
 						tuple.add(rs.getString("carID"));
 						tuple.add(rs.getString("officeID"));
 						break;
 					case "car":
 						tuple.add(rs.getString("carID"));
 						tuple.add(rs.getString("mileage"));
 						tuple.add(rs.getString("faults"));
 						tuple.add(rs.getString("empID"));
 						break;
 					case "office":
 						tuple.add(rs.getString("officeID"));
 						tuple.add(rs.getString("officeName"));
 						tuple.add(rs.getString("managerID"));
 						tuple.add(rs.getString("phoneNum"));
 						tuple.add(rs.getString("address"));
 						tuple.add(rs.getString("city"));
 						tuple.add(rs.getString("state"));
 						break;
 					default:
 						System.err.println("uhh, what? look at findAll()");
 						break;
 				}// switch
 				tupleList.add(tuple);
 			} // end while
 			return tupleList;
 		} catch (SQLException e) {
 			e.printStackTrace();
 		}
 		return null;
 	} // end findAll

 	public ArrayList<ArrayList<String>> query(int queryNum) {
 		// all the queries possible to be ran
 		String query1 = "select carID from car where carID not in (Select carID from car where faults='y')";
 		String query2 = "select distinct employee.name, employee.phoneNum from office, employee where jobTitle='Manager'";
 		String query3 = "select address, city, state from office where city='Tucson'";
 		String query4 = "select officeName, (select count(*) from employee where employee.officeID=office.officeID) as NumEmps from office";
 		String query5 = "select avg(milesDriven) as \"Miles Driven\" from lesson";
 		List<ArrayList> tupleList = new ArrayList<ArrayList>();
 		String runQuery = "";
 		switch (queryNum) {
 			case 1:
 				tupleList.add(addColumnNames("query1"));
 				runQuery = query1;
 				break;
 			case 2:
 				tupleList.add(addColumnNames("query2"));
 				runQuery = query2;
 				break;
 			case 3:
 				tupleList.add(addColumnNames("query3"));
 				runQuery = query3;
 				break;
 			case 4:
 				tupleList.add(addColumnNames("query4"));
 				runQuery = query4;
 				break;
 			case 5:
 				tupleList.add(addColumnNames("query5"));
 				runQuery = query5;
 				break;
 			default:
 				tupleList.add(addColumnNames("query1"));	
 				runQuery = query1;
 				break;	
 		}

 		try {
 			List<String> tuple = new ArrayList<String>();
 			ResultSet rs = statment_.executeQuery(runQuery);
 			
 			while(rs.next) {
 				switch (queryNum) {
 					case 1:
 						tuple.add(rs.getString("carID"));
 						break;
 					case 2:
 						tuple.add(rs.getString("name"));
 						tuple.add(rs.getString("phoneNum"));
 						break;
 					case 3:
 						tuple.add(rs.getString("address"));
 						tuple.add(rs.getString("city"));
 						tuple.add(rs.getString("state"));
 						break;
 					case 4:
 						tuple.add(rs.getString("officeName"));
 						tuple.add(rs.getString("numEmps"));
 						break;
 					case 5:
 						tuple.add(rs.getString("Miles Driven"));
 						break;
 					default:
 						tuple.add(rs.getString("carID"));
 						break;
 				}
 				tupleList.add(tuple);
 			} // while
 		} catch (SQLException e) {
 			e.printStackTrace();
 		}
 		return tupleList;
 	} // query()


 	// This method adds the column names of the table passed in and returns them as an AL of Strings
 	public Arraylist<String> addColumnNames(String tablename) {
 		ArrayList<String> columnNames = new Arraylist<String>();
 		switch(tablename) {
 			case "test":
 				columnNames.add("Client ID");
 				columnNames.add("Test Type");
 				columnNames.add("Passed?");
 				columnNames.add("Reason for Fail");
 				columnNames.add("Test Date");
 				break;
 			case "client":
 				columnNames.add("Client ID");
 				columnNames.add("Name");
 				columnNames.add("Gender");
 				columnNames.add("Address");
 				columnNames.add("City");
 				columnNames.add("Phone #");
 				columnNames.add("Valid License");
 				break;
 			case "interview":
 				columnNames.add("Client ID");
 				columnNames.add("Emp ID");
 				columnNames.add("Interview Date");
 				columnNames.add("Needs");
 				break;
 			case "lesson":
 				columnNames.add("Lesson #");
 				columnNames.add("Car ID");
 				columnNames.add("Client ID");
 				columnNames.add("Emp ID");
 				columnNames.add("Fee");
 				columnNames.add("Lesson Date");
 				columnNames.add("Miles Driven");
 				break;
 			case "employee":
 				columnNames.add("Emp ID");
 				columnNames.add("Name");
 				columnNames.add("DOB");
 				columnNames.add("Phone #");
 				columnNames.add("Gender");
 				columnNames.add("Job Title");
 				columnNames.add("Car ID");
 				columnNames.add("Office ID");
 				break;
 			case "car":
 				columnNames.add("Registration");
 				columnNames.add("Mileage");
 				columnNames.add("Faults");
 				columnNames.add("Emp ID");
 				break;
 			case "office":
 				columnNames.add("Office ID");
 				columnNames.add("Office Name");
 				columnNames.add("Manager ID");
 				columnNames.add("Phone #");
 				columnNames.add("Address");
 				columnNames.add("City");
 				columnNames.add("State");
 				break;
 			case "query1":
 				columnNames.add("Car ID");
 				break;
 			case "query2":
 				columnNames.add("Name");
 				columnNames.add("Phone #");
 				break;
 			case "query3":
 				columnNames.add("Office Name");
 				columnNames.add("City");
 				columnNames.add("State");
 				break;
 			case "query4":
 				columnNames.add("Office Names");
 				columnNames.add("Number of Employees");
 				break;
 			case "query5":
 				columnNames.add("Miles Driven");
 				break;
 			default:
 				System.err.println("Shouldn't be here");
 				break;
 		} // switch
 		return columnNames;
 	}

}
