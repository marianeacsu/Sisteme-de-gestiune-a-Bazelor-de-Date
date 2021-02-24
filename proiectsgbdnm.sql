
---4

CREATE TABLE LOCATIONN(
locationID NUMBER,
streetname VARCHAR2(50 CHAR) NOT NULL,
streetnumber NUMBER NOT NULL,
city VARCHAR2(50 CHAR) NOT NULL,
CONSTRAINT location_pk PRIMARY KEY(locationID)
);

CREATE TABLE CUSTOMER(
personID NUMBER,
customerID NUMBER,
CONSTRAINT customer_pk PRIMARY KEY(customerID)
);

CREATE TABLE PEOPLE(
personID NUMBER,
lastname VARCHAR2(50 CHAR) NOT NULL,
firstname VARCHAR2(50 CHAR) NOT NULL,
phone VARCHAR2(50 CHAR) NOT NULL,
locationID NUMBER,
CONSTRAINT people_pk PRIMARY KEY(personID)
);

CREATE TABLE EMPLOYEE(
employeeID NUMBER,
personID NUMBER,
hotelID NUMBER,
CONSTRAINT employee_pk PRIMARY KEY(employeeID)
);

CREATE TABLE PAYMENT(
paymentID NUMBER,
nocreditcard NUMBER NOT NULL,
expirydate DATE NOT NULL,
reservationID NUMBER,
CONSTRAINT payment_pk PRIMARY KEY(paymentID)
);

CREATE TABLE RESERVATION(
reservationID NUMBER,
bookingdate DATE NOT NULL,
checkindate DATE NOT NULL,
checkoutdate DATE NOT NULL,
customerID NUMBER,
roomID NUMBER,
CONSTRAINT reservation_pk PRIMARY KEY(reservationID)
);


CREATE TABLE HOTEL(
hotelID NUMBER,
stars NUMBER NOT NULL,
locationID NUMBER,
CONSTRAINT hotel_pk PRIMARY KEY(hotelID)
);

CREATE TABLE ROOM(
roomID NUMBER,
hotelID NUMBER,
CONSTRAINT room_pk PRIMARY KEY(roomID)
);

CREATE TABLE CLEANS(
employeeID NUMBER REFERENCES EMPLOYEE(employeeID),
roomID NUMBER REFERENCES ROOM(roomID),
startdate DATE NOT NULL,
enddate DATE NOT NULL,
PRIMARY KEY(employeeID, roomID)
);


-----FOREIGN KEYS-----

ALTER TABLE PEOPLE ADD CONSTRAINT people_location_fk FOREIGN KEY (locationID) REFERENCES LOCATIONN (locationID);
ALTER TABLE CUSTOMER ADD CONSTRAINT customer_people_fk FOREIGN KEY (personID) REFERENCES PEOPLE (personID);
ALTER TABLE EMPLOYEE ADD CONSTRAINT employee_people_fk FOREIGN KEY (personID) REFERENCES PEOPLE (personID);
ALTER TABLE EMPLOYEE ADD CONSTRAINT employee_hotel_fk FOREIGN KEY (hotelID) REFERENCES HOTEL (hotelID);
ALTER TABLE PAYMENT ADD CONSTRAINT payment_reservation_fk FOREIGN KEY (reservationID) REFERENCES RESERVATION (reservationID);
ALTER TABLE RESERVATION ADD CONSTRAINT reservation_customer_fk FOREIGN KEY (customerID) REFERENCES CUSTOMER (customerID);
ALTER TABLE RESERVATION ADD CONSTRAINT reservation_room_fk FOREIGN KEY (roomID) REFERENCES ROOM (roomID);
ALTER TABLE HOTEL ADD CONSTRAINT hotel_location_fk FOREIGN KEY (locationID) REFERENCES LOCATIONN (locationID);
ALTER TABLE "PEOPLE" MODIFY "LASTNAME" VARCHAR2(50)  NULL ;

---5

INSERT INTO LOCATIONN VALUES(
1,
'STEFAN CEL MARE',
50,
'BUCURESTI'
);

INSERT INTO LOCATIONN VALUES(
2,
'MIHAI VITEAZUL',
20,
'BUCURESTI'
);

INSERT INTO LOCATIONN VALUES(
3,
'ANA IPATESCU',
56,
'BUCURESTI'
);

INSERT INTO LOCATIONN VALUES(
4,
'IANCULUI',
50,
'BUCURESTI'
);

INSERT INTO LOCATIONN VALUES(
5,
'POLONA',
106,
'BUCURESTI'
);

INSERT INTO LOCATIONN VALUES(
6,
'NORDULUI',
96,
'BUCURESTI'
);

INSERT INTO LOCATIONN VALUES(
7,
'BARAJUL ARGES',
98,
'BUCURESTI'
);

INSERT INTO LOCATIONN VALUES(
8,
'LASCAR CATARGIU',
67,
'BUCURESTI'
);

INSERT INTO LOCATIONN VALUES(
9,
'FRUMOASA',
234,
'BUCURESTI'
);

INSERT INTO LOCATIONN VALUES(
10,
'NICOLAE BALCESCU',
34,
'BUCURESTI'
);

INSERT INTO LOCATIONN VALUES(
11,
'ROSETTI',
37,
'BUCURESTI'
);

INSERT INTO PEOPLE VALUES(
1,
'Popovici',
'Ioana',
'0756345567',
9
);

INSERT INTO PEOPLE VALUES(
2,
'Neacsu',
'Ion',
'0756345587',
8
);

INSERT INTO PEOPLE VALUES(
3,
'Dexamir',
'Vlad',
'0766345567',
7
);

INSERT INTO PEOPLE VALUES(
4,
'Dumitrescu',
'Malina',
'0756340567',
6
);

INSERT INTO PEOPLE VALUES(
5,
'Epure',
'Codrin',
'0778345567',
5
);

INSERT INTO PEOPLE VALUES(
6,
'Mindrescu',
'Andu',
'0756349967',
4
);

INSERT INTO PEOPLE VALUES(
7,
'Mindrescu',
'Albert',
'0756349910',
10
);

INSERT INTO PEOPLE VALUES(
8,
'Roman',
'Alex',
'0756349111',
11
);

INSERT INTO HOTEL VALUES(
9999,
5,
3
);

INSERT INTO HOTEL VALUES(
9998,
4,
2
);

INSERT INTO HOTEL VALUES(
9997,
3,
1
);

INSERT INTO CUSTOMER VALUES(
6,
1
);

INSERT INTO CUSTOMER VALUES(
5,
2
);

INSERT INTO CUSTOMER VALUES(
4,
3
);

INSERT INTO EMPLOYEE VALUES(
1000,
3,
9999
);

INSERT INTO EMPLOYEE VALUES(
1001,
2,
9999
);

INSERT INTO EMPLOYEE VALUES(
1002,
1,
9998
);

INSERT INTO EMPLOYEE VALUES(
1003,
7,
9998
);

INSERT INTO ROOM VALUES(
10000,
9999
);

INSERT INTO ROOM VALUES(
10002,
9999
);

INSERT INTO ROOM VALUES(
10001,
9999
);

INSERT INTO ROOM VALUES(
20000,
9998
);

INSERT INTO ROOM VALUES(
20001,
9998
);


INSERT INTO RESERVATION VALUES(
1,
TO_DATE('25/10/2021' , 'DD/MM/YYYY'),
TO_DATE('10/11/2021' , 'DD/MM/YYYY'),
TO_DATE('15/11/2021' , 'DD/MM/YYYY'),
3,
10000
);

INSERT INTO RESERVATION VALUES(
4,
TO_DATE('10/10/2021' , 'DD/MM/YYYY'),
TO_DATE('19/12/2021' , 'DD/MM/YYYY'),
TO_DATE('27/12/2021' , 'DD/MM/YYYY'),
3,
10000
);

INSERT INTO RESERVATION VALUES(
2,
TO_DATE('12/10/2021' , 'DD/MM/YYYY'),
TO_DATE('15/10/2021' , 'DD/MM/YYYY'),
TO_DATE('20/10/2021' , 'DD/MM/YYYY'),
2,
10001
);

INSERT INTO RESERVATION VALUES(
3,
TO_DATE('14/10/2021' , 'DD/MM/YYYY'),
TO_DATE('15/12/2021' , 'DD/MM/YYYY'),
TO_DATE('20/12/2021' , 'DD/MM/YYYY'),
1,
20000
);

INSERT INTO PAYMENT VALUES(
8000,
5567778990004567,
TO_DATE('20/12/2030' , 'DD/MM/YYYY'),
1
);

INSERT INTO PAYMENT VALUES(
8001,
5565778990004567,
TO_DATE('20/12/2040' , 'DD/MM/YYYY'),
2
);

INSERT INTO PAYMENT VALUES(
8002,
5568778990004567,
TO_DATE('20/12/2035' , 'DD/MM/YYYY'),
3
);

INSERT INTO CLEANS VALUES(
1000,
10000,
TO_DATE('20/12/2020' , 'DD/MM/YYYY'),
TO_DATE('21/12/2020' , 'DD/MM/YYYY')
);

INSERT INTO CLEANS VALUES(
1000,
10001,
TO_DATE('20/12/2020' , 'DD/MM/YYYY'),
TO_DATE('21/12/2020' , 'DD/MM/YYYY')
);

INSERT INTO CLEANS VALUES(
1001,
10000,
TO_DATE('25/12/2020' , 'DD/MM/YYYY'),
TO_DATE('26/12/2020' , 'DD/MM/YYYY')
);

INSERT INTO CLEANS VALUES(
1001,
10001,
TO_DATE('27/12/2020' , 'DD/MM/YYYY'),
TO_DATE('28/12/2020' , 'DD/MM/YYYY')
);

INSERT INTO CLEANS VALUES(
1002,
20000,
TO_DATE('20/12/2020' , 'DD/MM/YYYY'),
TO_DATE('21/12/2020' , 'DD/MM/YYYY')
);

INSERT INTO CLEANS VALUES(
1003,
20000,
TO_DATE('15/12/2020' , 'DD/MM/YYYY'),
TO_DATE('16/12/2020' , 'DD/MM/YYYY')
);

INSERT INTO CLEANS VALUES(
1002,
20001,
TO_DATE('20/12/2020' , 'DD/MM/YYYY'),
TO_DATE('21/12/2020' , 'DD/MM/YYYY')
);

INSERT INTO CLEANS VALUES(
1003,
20001,
TO_DATE('20/12/2020' , 'DD/MM/YYYY'),
TO_DATE('21/12/2020' , 'DD/MM/YYYY')
);

INSERT INTO CLEANS VALUES(
1000,
10002,
TO_DATE('15/10/2020' , 'DD/MM/YYYY'),
TO_DATE('15/10/2020' , 'DD/MM/YYYY')
);

INSERT INTO CLEANS VALUES(
1001,
10002,
TO_DATE('15/10/2020' , 'DD/MM/YYYY'),
TO_DATE('16/10/2020' , 'DD/MM/YYYY')
);

INSERT INTO CLEANS VALUES(
1002,
10002,
TO_DATE('15/10/2020' , 'DD/MM/YYYY'),
TO_DATE('15/10/2020' , 'DD/MM/YYYY')
);


----6
CREATE OR REPLACE PACKAGE types_package
AS
  TYPE list_of_employees
    IS TABLE OF EMPLOYEE.employeeID%type;
END;
/
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE get_employees_from_hotel (employee_indexes OUT types_package.list_of_employees, hotel_id_check IN HOTEL.hotelID%type)
IS
BEGIN
   SELECT employeeID
       BULK COLLECT INTO employee_indexes
       FROM EMPLOYEE
     WHERE hotelID = hotel_id_check;
END;
/
DECLARE 
  list_employee_indexes types_package.list_of_employees;
BEGIN
  get_employees_from_hotel(list_employee_indexes, 9999);
  DBMS_OUTPUT.put_line('Id-urile angajatilor din hotelul cu id-ul 9999 sunt:');
    FOR indx IN list_employee_indexes.FIRST .. list_employee_indexes.LAST
    LOOP
       DBMS_OUTPUT.put_line(list_employee_indexes (indx));
    END LOOP;
END;
/
  
----7
SET SERVEROUTPUT ON SIZE 10000;
CREATE OR REPLACE PROCEDURE print_rr_from_hotel IS
    CURSOR c IS
       SELECT ROOM.roomID as identificator, ROOM.hotelID as hotelul_camerei,
       RESERVATION.roomID,count(*) numar_rezervari, CUSTOMER.customerID id_turist
           FROM ROOM
           JOIN RESERVATION
           on ROOM.roomID = RESERVATION.roomID
           JOIN CUSTOMER
           on RESERVATION.customerID = CUSTOMER.customerID
           group by ROOM.roomID, ROOM.hotelID, RESERVATION.roomID, CUSTOMER.customerID;
BEGIN
    FOR i in c LOOP
        DBMS_OUTPUT.put_line('Camera ' || i.identificator || ' din hotelul ' || i.hotelul_camerei || ' a fost rezervat de ' || i.numar_rezervari || ' ori de catre turistul ' || i.id_turist);
    END LOOP;
END;
/
BEGIN
   print_rr_from_hotel;
END;
/
 
----8
SET SERVEROUTPUT ON;
CREATE OR REPLACE FUNCTION print_employee_cleans_room RETURN NUMBER IS
   exceptie_element_null EXCEPTION;
   max_rooms NUMBER;
   counter integer :=0; 
   CURSOR c IS 
           SELECT count(ROOM.roomID) numar_curatari, EMPLOYEE.employeeID id_angajat, PEOPLE.lastname nume_angajat
           FROM PEOPLE
           JOIN EMPLOYEE ON EMPLOYEE.personID = PEOPLE.personID
           JOIN CLEANS ON CLEANS.employeeID = EMPLOYEE.employeeID
           JOIN ROOM ON ROOM.roomID = CLEANS.roomID
           group by EMPLOYEE.employeeID, PEOPLE.lastname
           order by numar_curatari DESC;
     nr_randuri NUMBER;
BEGIN
    max_rooms :=0;
    select count(*) into nr_randuri from PEOPLE;
    FOR i in c LOOP
        IF i.numar_curatari is null or i.id_angajat is null or i.nume_angajat is null then
             RAISE exceptie_element_null;
        END IF;
        DBMS_OUTPUT.PUT_LINE('Angajatul cu id-ul ' || i.id_angajat || ' si numele ' || i.nume_angajat || ' a facut curat in ' || i.numar_curatari || ' camere');
        IF max_rooms < i.numar_curatari THEN
             max_rooms :=i.numar_curatari;
        END IF;
    END LOOP;
    FOR i in c LOOP
          counter := counter + 1; 
    END LOOP;
    IF counter=0 THEN
       RAISE NO_DATA_FOUND;
    END IF;
      ---dbms_output.put_line (counter);
    RETURN(max_rooms);
    EXCEPTION
    WHEN exceptie_element_null THEN
        DBMS_OUTPUT.PUT_LINE('Null found');
        RAISE_APPLICATION_ERROR(-20001,' Table row has null attribute');
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('NO DATA FOR THE SELECTED VALUES');
        RAISE_APPLICATION_ERROR(-20003,'NO DATA FOR THE SELECTED VALUES');
END;
/
  
  
DECLARE
max_cleans NUMBER;
BEGIN
  DBMS_OUTPUT.PUT_LINE('FIRST RUN');
  max_cleans := print_employee_cleans_room;

  DBMS_OUTPUT.PUT_LINE('(1)Maximum rooms cleaned by an employee is ' || max_cleans);

  DBMS_OUTPUT.PUT_LINE('SECOND RUN WITH NULL EXCEPTION');
  --inserts
    INSERT INTO PEOPLE VALUES(
    9,
    NULL,
    'test_Exceptie',
    '0758289316',
    3
    );
    INSERT INTO EMPLOYEE VALUES(
    1008,
    9,
    9999
    );
    INSERT INTO ROOM VALUES(
    20009,
    9999
    );
    INSERT INTO CLEANS VALUES(
    1008,
    20000,
    TO_DATE('25/12/2020' , 'DD/MM/YYYY'),
    TO_DATE('26/12/2020' , 'DD/MM/YYYY')
    );
    INSERT INTO CLEANS VALUES(
    1008,
    20002,
    TO_DATE('27/12/2020' , 'DD/MM/YYYY'),
    TO_DATE('28/12/2020' , 'DD/MM/YYYY')
    );
    INSERT INTO CLEANS VALUES(
    1008,
    10000,
    TO_DATE('22/12/2020' , 'DD/MM/YYYY'),
    TO_DATE('23/12/2020' , 'DD/MM/YYYY')
    );
   max_cleans := print_employee_cleans_room;

   DBMS_OUTPUT.PUT_LINE('(2)Maximum rooms cleaned by an employee is ' || max_cleans);
   DELETE FROM CLEANS
      WHERE EMPLOYEEID=1008;
   DELETE FROM ROOM
      WHERE roomID = 20009;
   DELETE FROM EMPLOYEE
      WHERE employeeid = 1008;
   DELETE  FROM PEOPLE
      WHERE personID = 9;

END;
/


----9
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE location_info(id LOCATIONN.locationID%type) IS
    exceptie_element_null EXCEPTION;
    nr_locatie_poz EXCEPTION;
    --idd LOCATIONN.locationID%type;
    counter integer :=0; 
    CURSOR c (id LOCATIONN.locationID%type ) IS
        SELECT LOCATIONN.locationId id1 , LOCATIONN.streetname nume_strada, LOCATIONN.streetnumber nr_strada, PEOPLE.personID id2 ,PEOPLE.lastname nume, CUSTOMER.customerID id3 , RESERVATION.reservationID id4, PAYMENT.nocreditcard id6
        FROM LOCATIONN
        JOIN PEOPLE ON PEOPLE.locationID = id
        JOIN CUSTOMER ON CUSTOMER.personID = PEOPLE.personID
        JOIN RESERVATION ON RESERVATION.customerID = CUSTOMER.customerID
        JOIN PAYMENT ON PAYMENT.reservationID = RESERVATION.reservationID
        WHERE LOCATIONN.locationID = id;
BEGIN
    --SELECT locationID INTO idd FROM LOCATIONN
      --WHERE locationID = idd;
    FOR i IN c(id) LOOP
      IF i.nume IS NULL OR i.nume_strada IS NULL THEN 
         RAISE exceptie_element_null;
      END IF;
      IF i.nr_strada <= 0 THEN 
         RAISE nr_locatie_poz;
      END IF;
      DBMS_OUTPUT.PUT_LINE( 'Pe strada ' || i.nume_strada || ' cu nr. ' || i.nr_strada || ' sta turistul '|| i.id3 ||' si numele '|| i.nume || ' care a facut rezervarea cu id-ul ' || i.id4 || ' cu cardul cu numarul ' || i.id6 );
    END LOOP;
    FOR i IN c(id) LOOP
       counter := counter + 1; 
    END LOOP;
    IF counter=0 THEN
       RAISE NO_DATA_FOUND;
    END IF;
    EXCEPTION 
    WHEN exceptie_element_null THEN
        DBMS_OUTPUT.PUT_LINE('Null found');
        RAISE_APPLICATION_ERROR(-20001,' Table row has null attribute');
    WHEN no_data_found THEN 
        DBMS_OUTPUT.PUT_LINE('Locatia nu este in baza de date');
        RAISE_APPLICATION_ERROR(-20003, 'Nu avem id-ul locatiei.');
    WHEN nr_locatie_poz THEN
        DBMS_OUTPUT.PUT_LINE('LOCATIE INVALIDA');
        RAISE_APPLICATION_ERROR(-20005,'LOCATIA NU EXISTA');
    WHEN OTHERS THEN
        raise_application_error(-20004, 'Alta eroare.');
END;
/
 
BEGIN
  DBMS_OUTPUT.PUT_LINE('FIRST RUN');
  location_info(6);
END;
/

BEGIN
  DBMS_OUTPUT.PUT_LINE('SECOND RUN WITH NULL EXCEPTION');
  ---inserts
   INSERT INTO LOCATIONN VALUES(
    12,
    'TEST',
    1,
    'BUCURESTI'
    );
   INSERT INTO PEOPLE VALUES(
   20,
   NULL,
   'TEST1',
   '0777777777',
   12
   );
   INSERT INTO CUSTOMER VALUES(
   20,
   10
   );
   INSERT INTO RESERVATION VALUES(
   10,
   TO_DATE('26/12/2020' , 'DD/MM/YYYY'),
   TO_DATE('26/12/2020' , 'DD/MM/YYYY'),
   TO_DATE('26/12/2020' , 'DD/MM/YYYY'),
   10,
   20000
   );
   INSERT INTO PAYMENT VALUES(
   6,
   1111111111111111,
   TO_DATE('12/12/2022', 'DD/MM/YYYY'),
   10
   );
   location_info(12);
   DELETE FROM LOCATIONN
     WHERE locationID =12;
   DELETE FROM PEOPLE 
     WHERE personID=20;
   DELETE FROM CUSTOMER
     WHERE customerID=10;
   DELETE FROM RESERVATION
     WHERE reservationID=10;
   DELETE FROM PAYMENT 
     WHERE paymentID=6;
END;
/

BEGIN
   DBMS_OUTPUT.PUT_LINE('FOURTH RUN WITH NO DATA FOUND');
   location_info(100);
END;
/

BEGIN
   DBMS_OUTPUT.PUT_LINE('THIRD RUN WITH NEGATIVE OR 0 STREET NUMBER');
    INSERT INTO LOCATIONN VALUES(
    12,
    'TEST',
    0,
    'BUCURESTI'
    );
   INSERT INTO PEOPLE VALUES(
   20,
   'TEST',
   'TEST1',
   '0777777777',
   12
   );
   INSERT INTO CUSTOMER VALUES(
   20,
   10
   );
   INSERT INTO RESERVATION VALUES(
   10,
   TO_DATE('26/12/2020' , 'DD/MM/YYYY'),
   TO_DATE('26/12/2020' , 'DD/MM/YYYY'),
   TO_DATE('26/12/2020' , 'DD/MM/YYYY'),
   10,
   20000
   );
   INSERT INTO PAYMENT VALUES(
   6,
   1111111111111111,
   TO_DATE('12/12/2022', 'DD/MM/YYYY'),
   10
   );
   
   location_info(12);
   DELETE FROM LOCATIONN
     WHERE locationID =12;
   DELETE FROM PEOPLE 
     WHERE personID=20;
   DELETE FROM CUSTOMER
     WHERE customerID=10;
   DELETE FROM RESERVATION
     WHERE reservationID=10;
   DELETE FROM PAYMENT 
     WHERE paymentID=6;
END;
/


----10
SET SERVEROUTPUT ON;
CREATE OR REPLACE PACKAGE room_reservation
AS
    TYPE status_room_reservation IS RECORD (id RESERVATION.customerID%type, nr NUMBER);
    TYPE status is TABLE of status_room_reservation;
    st status;
END;
/
CREATE OR REPLACE TRIGGER get_room_reservations_count
   AFTER INSERT OR UPDATE ON RESERVATION
BEGIN
   SELECT nvl(customerID,0) , count(*)
   BULK COLLECT INTO room_reservation.st FROM RESERVATION GROUP BY customerID ORDER BY 1;
   FOR i IN 1..room_reservation.st.LAST LOOP
       DBMS_OUTPUT.PUT_LINE('Turistul cu id-ul '||room_reservation.st(i).id || ' a facut ' || room_reservation.st(i).nr || ' rezervari');
       END LOOP;
END;
/
BEGIN 
 INSERT INTO RESERVATION VALUES(
 5,
 TO_DATE('15/10/2021' , 'DD/MM/YYYY'),
 TO_DATE('29/12/2021' , 'DD/MM/YYYY'),
 TO_DATE('31/12/2021' , 'DD/MM/YYYY'),
 1,
 10000
 );      
 DELETE FROM RESERVATION
WHERE reservationID = 5; 
END;
/
DROP TRIGGER get_room_reservations_count;

---11
CREATE OR REPLACE TRIGGER trg
BEFORE INSERT OR UPDATE ON RESERVATION
    FOR EACH ROW
    BEGIN
        IF to_number(to_char(:NEW.checkindate , 'YYYY')) >  to_number(to_char(sysdate , 'YYYY')) THEN
           DBMS_OUTPUT.PUT_LINE('Anul pentru care se doreste rezervarea '|| to_char(:NEW.checkindate , 'YYYY') || ' nu coincide cu anul in curs ' || to_char(sysdate , 'YYYY'));
           RAISE_APPLICATION_ERROR(-20001,'POLITICA HOTELULUI PERMITE REALIZAREA UNEI REZERVERI DOAR PENTRU ANUL CURENT');
        END IF;
END;
/
SET SERVEROUTPUT ON;
BEGIN
 INSERT INTO RESERVATION VALUES(
 5,
 TO_DATE('27/10/2021' , 'DD/MM/YYYY'),
 TO_DATE('12/11/2022' , 'DD/MM/YYYY'),
 TO_DATE('14/11/2022' , 'DD/MM/YYYY'),
 1,
 10000
 );
 DELETE FROM RESERVATION
    WHERE reservationID = 5;
END;
/
DROP TRIGGER trg;

----12

CREATE OR REPLACE TRIGGER trg1
BEFORE ALTER ON DATABASE
DECLARE
   alter_exception EXCEPTION;
BEGIN
   RAISE alter_exception;
EXCEPTION
   WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR(-20005, 'ERROR!');
END;
/

CREATE TABLE TEST(
x NUMBER,
y NUMBER
);

ALTER TABLE TEST MODIFY( x NOT NULL);

DROP TABLE TEST;
DROP TRIGGER trg1;

----13

CREATE OR REPLACE PACKAGE  PROIECT AS
    PROCEDURE location_info(id LOCATIONN.locationID%type);
    FUNCTION print_employee_cleans_room RETURN NUMBER;
    PROCEDURE print_rr_from_hotel;    
    PROCEDURE get_employees_from_hotel (employee_indexes OUT types_package.list_of_employees, hotel_id_check IN HOTEL.hotelID%type);
END PROIECT;
/

CREATE OR REPLACE PACKAGE BODY PROIECT AS

    PROCEDURE location_info(id LOCATIONN.locationID%type) IS
    exceptie_element_null EXCEPTION;
    nr_locatie_poz EXCEPTION;
    --idd LOCATIONN.locationID%type;
    counter integer :=0; 
    CURSOR c (id LOCATIONN.locationID%type ) IS
        SELECT LOCATIONN.locationId id1 , LOCATIONN.streetname nume_strada, LOCATIONN.streetnumber nr_strada, PEOPLE.personID id2 ,PEOPLE.lastname nume, CUSTOMER.customerID id3 , RESERVATION.reservationID id4, PAYMENT.nocreditcard id6
        FROM LOCATIONN
        JOIN PEOPLE ON PEOPLE.locationID = id
        JOIN CUSTOMER ON CUSTOMER.personID = PEOPLE.personID
        JOIN RESERVATION ON RESERVATION.customerID = CUSTOMER.customerID
        JOIN PAYMENT ON PAYMENT.reservationID = RESERVATION.reservationID
        WHERE LOCATIONN.locationID = id;
    BEGIN
    --SELECT locationID INTO idd FROM LOCATIONN
      --WHERE locationID = idd;
      FOR i IN c(id) LOOP
         IF i.nume IS NULL OR i.nume_strada IS NULL THEN 
           RAISE exceptie_element_null;
         END IF;
         IF i.nr_strada <= 0 THEN 
            RAISE nr_locatie_poz;
         END IF;
         DBMS_OUTPUT.PUT_LINE( 'Pe strada ' || i.nume_strada || ' cu nr. ' || i.nr_strada || ' sta turistul '|| i.id3 ||' si numele '|| i.nume || ' care a facut rezervarea cu id-ul ' || i.id4 || ' cu cardul cu numarul ' || i.id6 );
      END LOOP;
      FOR i IN c(id) LOOP
         counter := counter + 1; 
      END LOOP;
      IF counter=0 THEN
         RAISE NO_DATA_FOUND;
      END IF;
      EXCEPTION 
      WHEN exceptie_element_null THEN
          DBMS_OUTPUT.PUT_LINE('Null found');
          RAISE_APPLICATION_ERROR(-20001,' Table row has null attribute');
      WHEN no_data_found THEN 
          DBMS_OUTPUT.PUT_LINE('Locatia nu este in baza de date');
          RAISE_APPLICATION_ERROR(-20003, 'Nu avem id-ul locatiei.');
      WHEN nr_locatie_poz THEN
          DBMS_OUTPUT.PUT_LINE('LOCATIE INVALIDA');
          RAISE_APPLICATION_ERROR(-20005,'LOCATIA NU EXISTA');
      WHEN OTHERS THEN
          raise_application_error(-20004, 'Alta eroare.');
    END;
    
    FUNCTION print_employee_cleans_room RETURN NUMBER IS
    exceptie_element_null EXCEPTION;
    max_rooms NUMBER;
    counter integer :=0; 
    CURSOR c IS 
           SELECT count(ROOM.roomID) numar_curatari, EMPLOYEE.employeeID id_angajat, PEOPLE.lastname nume_angajat
           FROM PEOPLE
           JOIN EMPLOYEE ON EMPLOYEE.personID = PEOPLE.personID
           JOIN CLEANS ON CLEANS.employeeID = EMPLOYEE.employeeID
           JOIN ROOM ON ROOM.roomID = CLEANS.roomID
           group by EMPLOYEE.employeeID, PEOPLE.lastname
           order by numar_curatari DESC;
     nr_randuri NUMBER;
  BEGIN
      max_rooms :=0;
      select count(*) into nr_randuri from PEOPLE;
      FOR i in c LOOP
          IF i.numar_curatari is null or i.id_angajat is null or i.nume_angajat is null then
               RAISE exceptie_element_null;
          END IF;
          DBMS_OUTPUT.PUT_LINE('Angajatul cu id-ul ' || i.id_angajat || ' si numele ' || i.nume_angajat || ' a facut curat in ' || i.numar_curatari || ' camere');
          IF max_rooms < i.numar_curatari THEN
               max_rooms :=i.numar_curatari;
          END IF;
      END LOOP;
      FOR i in c LOOP
          counter := counter + 1; 
      END LOOP;
      IF counter=0 THEN
         RAISE NO_DATA_FOUND;
      END IF;
      ---dbms_output.put_line (counter);
      RETURN(max_rooms);
      EXCEPTION
      WHEN exceptie_element_null THEN
          DBMS_OUTPUT.PUT_LINE('Null found');
          RAISE_APPLICATION_ERROR(-20001,' Table row has null attribute');
      WHEN NO_DATA_FOUND THEN
          DBMS_OUTPUT.PUT_LINE('NO DATA FOR THE SELECTED VALUES');
          RAISE_APPLICATION_ERROR(-20003,'NO DATA FOR THE SELECTED VALUES');
   END;

   PROCEDURE print_rr_from_hotel IS
      CURSOR c IS
         SELECT ROOM.roomID as identificator, ROOM.hotelID as hotelul_camerei,
         RESERVATION.roomID,count(*) numar_rezervari, CUSTOMER.customerID id_turist
             FROM ROOM
             JOIN RESERVATION
             on ROOM.roomID = RESERVATION.roomID
             JOIN CUSTOMER
             on RESERVATION.customerID = CUSTOMER.customerID
             group by ROOM.roomID, ROOM.hotelID, RESERVATION.roomID, CUSTOMER.customerID;
   BEGIN
      FOR i in c LOOP
          DBMS_OUTPUT.put_line('Camera ' || i.identificator || ' din hotelul ' || i.hotelul_camerei || ' a fost rezervat de ' || i.numar_rezervari || ' ori de catre turistul ' || i.id_turist);
      END LOOP;
   END;
   
   PROCEDURE get_employees_from_hotel (employee_indexes OUT types_package.list_of_employees, hotel_id_check IN HOTEL.hotelID%type)
   IS
   BEGIN
     SELECT employeeID
         BULK COLLECT INTO employee_indexes
         FROM EMPLOYEE
       WHERE hotelID = hotel_id_check;
   END;
   
END PROIECT;
/
   
SELECT * FROM CLEANS; --tabela asociativa 
SELECT * FROM CUSTOMER;
SELECT * FROM EMPLOYEE;
SELECT * FROM HOTEL;
SELECT * FROM LOCATIONN;
SELECT * FROM PAYMENT;
SELECT * FROM PEOPLE;
SELECT * FROM RESERVATION;
SELECT * FROM ROOM;

    

    

