CREATE TABLE MANUFACTURER ( 
Manufacturer_Id CHAR (7) NOT NULL, 
Manufacturer_name VARCHAR (10) NOT NULL, 
Manufactured_place VARCHAR (9) NOT NULL, 
Manufacture_date DATE NOT NULL,  
Manufacturer_tel NUMBER (10) NOT NULL, 
constraints Manufacturer_Id_pk PRIMARY KEY(Manufacturer_Id));

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD';

INSERT INTO Manufacturer VALUES('C20211','FERRARI', 'Italy', '2015-12-13', 9612233);

INSERT INTO Manufacturer VALUES('C20212','SUPERRMTRS','USA', '2016-01-20', 1123321);

INSERT INTO Manufacturer VALUES('C21023','TOYOTA','Japan', '2012-06-03', 2011111);

INSERT INTO Manufacturer VALUES('C20214','ACURA','Japan', '2018-08-30', 2123344);

INSERT INTO Manufacturer VALUES('C20215','FIAT','Italy', '2019-04-17',  9711111);

CREATE TABLE MAINTENANCE( 
Event_id NUMBER (5) NOT NULL, 
Maint_type VARCHAR (10) NOT NULL, 
Start_time CHAR(5) NOT NULL, 
End_time CHAR (5) NOT NULL, 
Num_repairs NUMBER (3) NOT NULL, 
Maint_date DATE NOT NULL,  
constraints event_Id_pk PRIMARY KEY(Event_Id));

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD';

INSERT INTO Maintenance  VALUES(12345,'tune up','03:05','04:05',2,'2018-06-23');

INSERT INTO Maintenance  VALUES(67890,'wheeldmg','03:06','04:06',3,'2016-12-03');

INSERT INTO Maintenance  VALUES(54321,'inspectdmg', '03:07', '04:07',4,'2012-04-30');

INSERT INTO Maintenance  VALUES(09876, 'tune up','03:08','04:08',5,'2019-08-17');

INSERT INTO Maintenance  VALUES(22334, 'tune up','03:09','04:09',6,'2019-08-25');

CREATE TABLE CAR ( 
Car_Id CHAR (5) NOT NULL, 
Car_VINnum CHAR (5) NOT NULL, 
Licence_Plt CHAR (8) NOT NULL, 
car_type VARCHAR (10) NOT NULL , 
car_cost NUMBER (20,5) NOT NULL, 
car_brand VARCHAR(10) NOT NULL, 
car_model CHAR(15) NOT NULL, 
car_mileage CHAR(20) NOT NULL, 
Manufacturer_Id CHAR (7) NOT NULL, 
Event_id NUMBER (5) NOT NULL, 
constraints Car_Id_pk PRIMARY KEY(Car_Id), 
constraints Manufacturer_id_fk FOREIGN KEY(manufacturer_id)REFERENCES MANUFACTURER(manufacturer_id), 
constraintS event_Id_fk FOREIGN KEY(Event_id) REFERENCES MAINTENANCE(Event_id) 
);

INSERT INTO Car VALUES ('A800', '1HG41','B0852422','SEDAN',2000000000,'TOYOTA','RAV4','160km','C20211',12345);

INSERT INTO Car VALUES('A802','MN109','SHJ54578','COUPE',3000000000,'SUZUKI','4runner','200km','C20212',67890);

INSERT INTO Car VALUES('B907', 'BH410', 'A3333','PICKUP',4000000000,'JAGUAR','CHRYSLER','300km','C21023',54321);

INSERT INTO Car VALUES('B905','GBH22','AD346','MICRO',5000000000,'DODGE','R8','700km','C20214',09876);

INSERT INTO Car VALUES('A809','XM11', 'ER1234','TRUCK',6000000000,'HONDA','AUDI', '1000km','C20215',22334);

CREATE TABLE CUSTOMER ( 
Customer_id CHAR (7) NOT NULL, 
Customer_FstNamae CHAR(10) NOT NULL, 
Customer_LstNamae CHAR(10) NOT NULL, 
Customer_age NUMBER (2) NOT NULL, 
Customer_address CHAR(10) NOT NULL, 
constraints Customer_Id_pk PRIMARY KEY(customer_Id));

INSERT INTO Customer VALUES('T20111','ALI','NASSAR',22,'E6DUBAI');

INSERT INTO Customer VALUES('T20222','AHMED','YOUSEF',24,'E7DUBAI');

INSERT INTO Customer VALUES('T20333','SALEM','SAIF',21,'E8DUBAI');

INSERT INTO Customer VALUES('T20444','HAMAD','ABDULAZIZ',39, 'E2DUBAI');

INSERT INTO Customer VALUES('T20555','FAHD','MUSABBEH',27,'E1DUBAI');

CREATE TABLE RENTAL( 
Rental_date DATE NOT NULL, 
Return_date DATE NOT NULL, 
Total_cost NUMBER(6) NOT NULL, 
Car_Id CHAR(5) NOT NULL, 
Customer_id CHAR (7) NOT NULL, 
constraints car_Id_customer_id_pk PRIMARY KEY(Car_Id,customer_Id), 
constraints car_Id_fk FOREIGN KEY(car_Id)REFERENCES CAR (car_Id), 
constraints customer_Id_fk FOREIGN KEY(customer_Id)REFERENCES Customer(customer_Id));

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD';

INSERT INTO Rental VALUES('2020/10/01','2020/11/02',50000,'A802','T20555');

INSERT INTO Rental VALUES('2020/07/18','2020/08/19',60000,'A800','T20444');

INSERT INTO Rental VALUES('2020/06/03','2020/08/01',40000,'B905','T20333');

INSERT INTO Rental VALUES('2019/11/04','2020/01/16',70000,'B907','T20222');

INSERT INTO Rental VALUES('2020/12/05','2020/1/05', 80000,'A809','T20111');

SELECT* FROM MANUFACTURER;

SELECT* FROM MAINTENANCE;

SELECT* FROM CAR;

SELECT* FROM CUSTOMER;

SELECT* FROM RENTAL;

