CREATE DATABASE RAILWAYS;
 USE RAILWAYS;

CREATE TABLE USER(NAME VARCHAR(100) NOT NULL,
				  DOB DATE,
                  USER_ID INT NOT NULL,
                  AGE INT,
                  PRIMARY KEY(USER_ID));
                  
INSERT INTO USER(NAME, DOB, USER_ID, AGE)
				VALUES('AYUSH', "2003-07-22",101,21), ('ARNAV', "2004-02-02",102,20),
					   ('SHUBHANG', "2002-12-22",103,22);
                       
#NORMALISATION
                       
CREATE TABLE USER1(NAME VARCHAR(100) NOT NULL,
				   USER_ID INT NOT NULL,
                   PRIMARY KEY(USER_ID));
                   
CREATE TABLE DOB(USER_ID INT NOT NULL,
				 DOB DATE,
                 AGE INT);
                       
SELECT * FROM USER;
                  
CREATE TABLE PHONE_NO(PHONE VARCHAR(12) NOT NULL,
					  USER_ID INT NOT NULL,
					  U_ID INT REFERENCES USER(USER_ID));
                      
INSERT INTO PHONE_NO(PHONE, USER_ID, U_ID)
					VALUES(8986, 101, 101), (77177, 102, 101), (0007, 103, 101);
                    
SELECT * FROM PHONE_NO;

CREATE TABLE TRAIN(TRAIN_NO INT NOT NULL,
				   TRAIN_NAME VARCHAR(100),
                   DISTANCE DECIMAL(5,2),
                   NO_OF_SEATS INT,
                   DESTINATION VARCHAR(100),
                   DEP_TIME TIME,
                   PRIMARY KEY(TRAIN_NO));
                   
INSERT INTO TRAIN(TRAIN_NO, TRAIN_NAME, DISTANCE, NO_OF_SEATS, DESTINATION, DEP_TIME)
				VALUES(1, 'SHATABDI', 500.00, 100.00, 'DELHI', '2:22:00'),
					  (2, 'DOUBLE_DECKER', 150.00, 500.00, 'DELHI', '3:22:00'),
                      (3, 'VANDE_BHARAT', 250.00, 700.00, 'DELHI', '5:22:00');
					
SELECT * FROM TRAIN;
                   
CREATE TABLE TICKET(PNR_NO INT NOT NULL,
					TRAIN_NO INT NOT NULL,
                    T_NO INT REFERENCES TRAIN(TRAIN_NO),
                    DATE_TIME DATETIME,
                    PASSENGER_NAME VARCHAR(100),
                    SEAT_NO INT NOT NULL,
                    CLASS VARCHAR(5),
                    SOURCE_STATION VARCHAR(100) NOT NULL,
                    DESTINATION VARCHAR(100),
                    PRIMARY KEY(PNR_NO));
                    
INSERT INTO TICKET (PNR_NO, TRAIN_NO, T_NO, DATE_TIME, PASSENGER_NAME, SEAT_NO, CLASS, SOURCE_STATION, DESTINATION)
VALUES
    (1001, 1, 1, '2024-04-08 09:30:00', 'Alice', 10, '1A', 'City A', 'DELHI'),
    (1002, 2, 2, '2024-04-08 10:15:00', 'Bob', 20, '2A', 'City B', 'DELHI'),
    (1003, 3, 3, '2024-04-08 11:00:00', 'Carol', 30, '3A', 'City C', 'DELHI');
                    
CREATE TABLE PAYMENT(TRAN_ID INT NOT NULL,
					 PAY_METHOD VARCHAR(100),
                     AMOUNT DECIMAL(7,2),
                     PRIMARY KEY(TRAN_ID));
                     
INSERT INTO PAYMENT (TRAN_ID, PAY_METHOD, AMOUNT)
VALUES
    (1001, 'Credit Card', 150.75),
    (1002, 'Cash', 50.00),
    (1003, 'Online Transfer', 200.50);

CREATE TABLE ROUTE(STOP_CODE INT NOT NULL,
				   STOP_NAME VARCHAR(100),
                   PRIMARY KEY(STOP_CODE));
                   
INSERT INTO ROUTE (STOP_CODE, STOP_NAME)
VALUES
    (101, 'City A Station'),
    (102, 'City B Junction'),
    (103, 'City C Terminal');

CREATE TABLE CLASS(CLASS_TYPE VARCHAR(100),
				   FARE DECIMAL(5,2));
                   
INSERT INTO CLASS (CLASS_TYPE, FARE)
VALUES
    ('1A', 150.00),
    ('2A', 100.00),
    ('3A', 75.50);

DESCRIBE PAYMENT;

CREATE INDEX PASSENGER
ON USER(NAME);
                
SHOW INDEXES FROM USER;

CREATE VIEW PASS_DETAILS
AS 
SELECT NAME, PNR_NO, SEAT_NO
FROM USER, TICKET;

SELECT * FROM PASS_DETAILS;

DESCRIBE PAYMENT;

DESCRIBE USER;
SHOW TABLES;

DELIMITER //
CREATE TRIGGER BEFORE_AGE
BEFORE INSERT ON USER FOR EACH ROW
BEGIN
	DECLARE ERROR_MESSAGE VARCHAR(100);
    SET ERROR_MESSAGE = "AGE CANNOT BE NEGATIVE,";
    IF NEW.AGE<0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = ERROR_MESSAGE;
	END IF;
END //

INSERT INTO USER(NAME, DOB, USER_ID, AGE)
	VALUES("AYUSH", "2002-08-11", 109, -1);


            
                   
                   
                   

					  
                      
                      