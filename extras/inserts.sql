select carID from car where carID not in (Select carID from car where faults='y');
select distinct employee.name, employee.phoneNum from office, employee where jobTitle='Manager';
select address, city, state from office where city='Tucson';
select officeName, (select count(*) from employee where employee.officeID=office.officeID) as NumEmps from office;
select avg(milesDriven) as "Miles Driven" from lesson;


INSERT INTO car values (3333, 55, 'n', 9876);
INSERT INTO car values (3332, 431, 'y', 9877);
INSERT INTO car values (3331, 23423, 'n', 9875);
INSERT INTO car values (3330, 211, 'n', 9879);
INSERT INTO car values (3334, 91879, 'n', 91879);
INSERT INTO car values (3335, 191879, 'y', 191879);
INSERT INTO car values (3336, 200002, 'y', 200002);
INSERT INTO car values (3337, 2302, 'y', 2302);



INSERT INTO client values (5555, 'Billy Bob', 'm', '123 notFake st.', 'Tucson', 5207777777, 'y');
INSERT INTO client values (5551, 'Joan Ells', 'f', '122 under bridge', 'Seattle', 5206205500, 'n');
INSERT INTO client values (5550, 'Janet Renos', 'f', '4562 E Nowhere', 'Lansing', 5206205500, 'y');
INSERT INTO client values (5553, 'Jim Morrison', 'm', '234 N Cali', 'Phoenix', 5206665500, 'n');

INSERT INTO test values (5555, 'drive', 'y', NULL, TO_DATE('12/03/15 12:30:00','mm/dd/yy hh24:mi:ss'));
INSERT INTO test values (5555, 'write', 'n', 'Only half question correct', TO_DATE('12/03/15 13:30:00','mm/dd/yy hh24:mi:ss'));
INSERT INTO test values (5551, 'write', 'y', NULL, TO_DATE('12/05/15 14:30:00','mm/dd/yy hh24:mi:ss'));
INSERT INTO test values (5551, 'drive', 'y', NULL, TO_DATE('12/05/15 12:30:00','mm/dd/yy hh24:mi:ss'));
INSERT INTO test values (5550, 'write', 'n', 'too dumb', TO_DATE('12/25/15 09:30:00','mm/dd/yy hh24:mi:ss'));
INSERT INTO test values (5550, 'drive', 'n', 'wrong turn', TO_DATE('12/25/15 07:30:00','mm/dd/yy hh24:mi:ss'));

INSERT INTO office values (1234, 'UASOUTH', 6662, 5204567899, '123 fake st.', 'Tucson', 'AZ' );
INSERT INTO office values (1235, 'FakeOffice', 6669, 6204337811, '1111 4th st.', 'Tempe', 'AZ' );
INSERT INTO office values (1236, 'JOE-MAMA', 6663, 5573542323, '23424 112 st.', 'Hillsboro', 'OR' );
INSERT INTO office values (1237, 'lalilulelo', 6664, 5209090909, '12333 lane st.', 'Oro Valley', 'AZ' );

INSERT INTO employee values (6651, 'Like Whoa', TO_DATE('11/30/1989', 'mm/dd/yyyy'), 5203431231, 'm', 'Instructor', 3333, 1234);
INSERT INTO employee values (6652, 'Jane Janeson', TO_DATE('03/30/1979', 'mm/dd/yyyy'), 5203443242, 'f', 'Instructor', 3332, 1235);
INSERT INTO employee values (6653, 'Linda Melinda', TO_DATE('01/23/1969', 'mm/dd/yyyy'), 5203452343, 'f', 'Instructor', 3331, 1236);
INSERT INTO employee values (6654, 'Not Like Whoa', TO_DATE('11/30/1989', 'mm/dd/yyyy'), 5203452343, 'm', 'Instructor', 3330, 1237);
INSERT INTO employee values (6662, 'Bill Billman', TO_DATE('09/12/1986', 'mm/dd/yyyy'), 5201231234, 'm', 'Manager', 3334, 1234);
INSERT INTO employee values (6669, 'Carla Carlson', TO_DATE('11/03/1989', 'mm/dd/yyyy'), 5203456309, 'f', 'Manager', 3335, 1235);
INSERT INTO employee values (6663, 'John Johnson', TO_DATE('10/30/1979', 'mm/dd/yyyy'), 5203456309, 'm', 'Manager', 3336, 1236);
INSERT INTO employee values (6664, 'Edd E Eddieson', TO_DATE('05/30/1973', 'mm/dd/yyyy'), 5203456309, 'm', 'Manager', 3337, 1237);

INSERT INTO interview values (5555,1234, TO_DATE('09/25/2015', 'mm/dd/yyyy'), 'To Pass tests');
INSERT INTO interview values (5551,1236, TO_DATE('08/17/2015', 'mm/dd/yyyy'), 'to pass tests');
INSERT INTO interview values (5550,1235, TO_DATE('09/15/2015', 'mm/dd/yyyy'), 'To not be dumb');
INSERT INTO interview values (5553,1237, TO_DATE('08/13/2015', 'mm/dd/yyyy'), 'to get valid license');

INSERT INTO lesson values (1111, 3333, 5555, 6651, 10, TO_DATE('11/15/15 09:30:00','mm/dd/yy hh24:mi:ss'), 25);
INSERT INTO lesson values (1112, 3332, 5551, 6652, 15, TO_DATE('11/25/15 10:30:00','mm/dd/yy hh24:mi:ss'), 15);
INSERT INTO lesson values (1113, 3331, 5550, 6653, 20, TO_DATE('09/05/15 09:00:00','mm/dd/yy hh24:mi:ss'), 10);
INSERT INTO lesson values (1114, 3330, 5553, 6654, 10, TO_DATE('11/30/15 09:30:00','mm/dd/yy hh24:mi:ss'), 5);

'mm-dd-yyyy HH24:mi:ss'





