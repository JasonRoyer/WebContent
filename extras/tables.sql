create table test (
	clientID number NOT NULL,
	testType varchar2(5) check(testType in ('drive', 'write')) NOT NULL,
	passed varchar2(1) check(passed in('y', 'n')) NOT NULL,
	reason varchar2(200), 
	testDate date NOT NULL,
	FOREIGN KEY(clientID) REFERENCES bidunbar.client(clientID),
	PRIMARY KEY(clientID)
);

create table client (
	clientID number NOT NULL,
	name varchar2(80) NOT NULL,
	gender varchar2(1) check(gender in ('m', 'f')) NOT NULL,
	address varchar2(80) NOT NULL,
	city varchar2(80) NOT NULL,
	phoneNum number check(phoneNum between 1111111111 and 9999999999) NOT NULL,
	validLicense varchar2(1) check(validLicense in ('y', 'n')) NOT NULL,
	PRIMARY KEY(clientID)
);

create table inteview (
	empID number  NOT NULL,
	clientID number  NOT NULL,
	interviewDate date  NOT NULL,
	needs varchar2(200)  NOT NULL,
	FOREIGN KEY(empID) REFERENCES bidunbar.employee(empID),
	FOREIGN KEY(clientID) REFERENCES bidunbar.client(clientID),
	PRIMARY KEY(empID, clientID)
);

create table lesson (
	lessonNum number NOT NULL,
	carID number NOT NULL,
	clientID number NOT NULL,
	officeID number NOT NULL,
	fee number check(fee > 0) NOT NULL,
	lessonDate date NOT NULL,
	milesDriven number check(milesDriven > 0) NOT NULL,
	FOREIGN KEY(carID) REFERENCES bidunbar.car(carID),
	FOREIGN KEY(clientID) REFERENCES bidunbar.client(clientID),
	FOREIGN KEY(officeID) REFERENCES bidunbar.office(officeID),
	PRIMARY KEY(lessonNum)
);

create table employee (
	empID number NOT NULL,
	name varchar2(80) NOT NULL,
	DOB date NOT NULL,
	phoneNum number check(phoneNum between 1111111111 and 9999999999),
	gender char NOT NULL,
	jobTitle varchar2(80) NOT NULL,
	carID number NOT NULL,
	officeID number NOT NULL,
	PRIMARY KEY(empID),
	FOREIGN KEY(carID) REFERENCES bidunbar.car(carID),
	FOREIGN KEY(officeID) REFERENCES bidunbar.office(officeID) 
);

create table car (
	carID number NOT NULL,
	milage number NOT NULL,
	faults varchar2(1) check(faults in ('y', 'n')) NOT NULL,
	empID number NOT NULL,
	PRIMARY KEY(carID)
);

create table office (
	officeID number NOT NULL,
	officeName varchar2(80) NOT NULL,
	managerID number NOT NULL,
	phoneNum number check(phoneNum between 1111111111 and 9999999999),
	address varchar2(80) NOT NULL,
	city varchar2(80) NOT NULL,
	state varchar2(80) NOT NULL,
	PRIMARY KEY(officeID)
	FOREIGN KEY(managerID) REFERENCES bidunbar.employee(empID)
);

