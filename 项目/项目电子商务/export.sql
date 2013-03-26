--------------------------------------------------------
--  File created - ������-һ��-19-2013   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence S1
--------------------------------------------------------

   CREATE SEQUENCE  "S1"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 121 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence S_DissRoom
--------------------------------------------------------

   CREATE SEQUENCE  "S_DissRoom"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 341 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence S_GONGGAO
--------------------------------------------------------

   CREATE SEQUENCE  "S_GONGGAO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 50 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence S_InnerMail
--------------------------------------------------------

   CREATE SEQUENCE  "S_InnerMail"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence S_Orders
--------------------------------------------------------

   CREATE SEQUENCE  "S_Orders"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 141 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence S_PRODUCT
--------------------------------------------------------

   CREATE SEQUENCE  "S_PRODUCT"  MINVALUE 4 MAXVALUE 9999999999999999 INCREMENT BY 1 START WITH 84 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence S_Room
--------------------------------------------------------

   CREATE SEQUENCE  "S_Room"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 181 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence S_UUser
--------------------------------------------------------

   CREATE SEQUENCE  "S_UUser"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 121 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence S_cart
--------------------------------------------------------

   CREATE SEQUENCE  "S_cart"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 181 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table AD
--------------------------------------------------------

  CREATE TABLE "AD" 
   (	"AD1_PIC" VARCHAR2(50), 
	"AD1_DEF_PIC" VARCHAR2(50), 
	"AD1_BEGIN" DATE, 
	"AD1_END" DATE, 
	"AD2_PIC" VARCHAR2(50), 
	"AD2_DEF_PIC" VARCHAR2(50), 
	"AD2_BEGIN" DATE, 
	"AD2_END" DATE, 
	"AD3_PIC" VARCHAR2(50), 
	"AD3_DEF_PIC" VARCHAR2(50), 
	"AD3_BEGIN" DATE, 
	"AD3_END" DATE, 
	"AD1_URL" VARCHAR2(50), 
	"AD2_URL" VARCHAR2(50), 
	"AD3_URL" VARCHAR2(50)
   ) ;
 

   COMMENT ON TABLE "AD"  IS '���';
--------------------------------------------------------
--  DDL for Table ADMINUSER
--------------------------------------------------------

  CREATE TABLE "ADMINUSER" 
   (	"UNAME" VARCHAR2(50), 
	"PWD" VARCHAR2(20), 
	"UTYPE" CHAR(1) DEFAULT 4
   ) ;
 

   COMMENT ON TABLE "ADMINUSER"  IS '����Ա�û�
Type 0 : ��������Ա
         1��һ�����Ա';
--------------------------------------------------------
--  DDL for Table CART
--------------------------------------------------------

  CREATE TABLE "CART" 
   (	"PRODUCTID" NUMBER(6,0), 
	"AMOUNT" NUMBER(*,0), 
	"ORDERID" NUMBER(*,0), 
	"CARTID" NUMBER(6,0), 
	"USERID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table DISS
--------------------------------------------------------

  CREATE TABLE "DISS" 
   (	"DISSCUSSID" CHAR(10), 
	"CONTENT" VARCHAR2(400), 
	"DISSTIME" DATE, 
	"DISSTITLE" VARCHAR2(200), 
	"USERID" NUMBER, 
	"DISSTYPE" VARCHAR2(20)
   ) ;
--------------------------------------------------------
--  DDL for Table DISSROOM
--------------------------------------------------------

  CREATE TABLE "DISSROOM" 
   (	"DISSID" NUMBER(6,0), 
	"USERID" NUMBER, 
	"DISSTIME" DATE, 
	"CONTENT" VARCHAR2(400), 
	"DISS_ROOM" NUMBER(*,0)
   ) ;
 

   COMMENT ON TABLE "DISSROOM"  IS 'Diss_Room:  �������ڵķ����,0�ŷ�������ҳ��������.';
--------------------------------------------------------
--  DDL for Table ENTERROOM
--------------------------------------------------------

  CREATE TABLE "ENTERROOM" 
   (	"ROOMNO" VARCHAR2(50), 
	"USERID" NUMBER
   ) ;
 

   COMMENT ON TABLE "ENTERROOM"  IS '���佻��һ�������������';
--------------------------------------------------------
--  DDL for Table GONGGAO
--------------------------------------------------------

  CREATE TABLE "GONGGAO" 
   (	"GONGGAOTIME" DATE, 
	"CONTENT" VARCHAR2(300), 
	"CONTYPE" VARCHAR2(20), 
	"GONGGAOID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table INNERMAIL
--------------------------------------------------------

  CREATE TABLE "INNERMAIL" 
   (	"MAILID" NUMBER(6,0), 
	"MTITLE" VARCHAR2(200), 
	"SENDER" NUMBER, 
	"RECEIVER" NUMBER, 
	"CONTENT" VARCHAR2(400), 
	"ISOPEN" CHAR(2 CHAR) DEFAULT 0, 
	"SENDTIME" TIMESTAMP (6)
   ) ;
 

   COMMENT ON TABLE "INNERMAIL"  IS '����Ա���Ը��û����ʼ����û�֮����Է�վ����';
--------------------------------------------------------
--  DDL for Table ORDERS
--------------------------------------------------------

  CREATE TABLE "ORDERS" 
   (	"ORDERID" NUMBER(6,0), 
	"USERID" NUMBER, 
	"STATEMENT" CHAR(1) DEFAULT 0, 
	"ROOMID" NUMBER, 
	"ORDERTIME" DATE, 
	"SENDTIME" DATE, 
	"ACCEPTTIME" DATE, 
	"REJECTTIME" DATE, 
	"DESCRIPTION" VARCHAR2(50 CHAR)
   ) ;
 

   COMMENT ON COLUMN "ORDERS"."ORDERID" IS 'orderid=0Ϊ���й��ﳵ�еĻ�����Ʒ';
 
   COMMENT ON COLUMN "ORDERS"."STATEMENT" IS '0���������ɣ�1��������2���ʹ��ݣ���3��ȷ���ջ����û�����4���˻�';
 
   COMMENT ON COLUMN "ORDERS"."ORDERTIME" IS '�µ�ʱ��';
 
   COMMENT ON COLUMN "ORDERS"."SENDTIME" IS '��������';
 
   COMMENT ON COLUMN "ORDERS"."DESCRIPTION" IS '����ע��';
 
   COMMENT ON TABLE "ORDERS"  IS '���������������߲����Ժ��Զ�����һ��������Ϣ���ر��˹��ﳵ�н����Ҳ�Զ�����һ��������Ϣ��
RoomS: 0 Ϊ����������Ʒ������Ϊ������';
--------------------------------------------------------
--  DDL for Table PRODUCT
--------------------------------------------------------

  CREATE TABLE "PRODUCT" 
   (	"PRODUCTID" NUMBER(*,0), 
	"PRONAME" VARCHAR2(50), 
	"PROTITLE" VARCHAR2(100), 
	"PROSIZE" VARCHAR2(20), 
	"PRICE" NUMBER(10,2), 
	"COLOR" VARCHAR2(20), 
	"LEFT" NUMBER(*,0) DEFAULT 0, 
	"ALARM" NUMBER(*,0) DEFAULT 0, 
	"ISCHEAP" CHAR(1) DEFAULT 0, 
	"ISONLYONE" CHAR(1) DEFAULT 0, 
	"ISONLYTEN" CHAR(1) DEFAULT 0, 
	"ANNOTATION1" VARCHAR2(400), 
	"ANNOTATION2" VARCHAR2(400), 
	"ANNOTATION3" VARCHAR2(400), 
	"ANNOTATION4" VARCHAR2(400), 
	"ANNOTATION5" VARCHAR2(400), 
	"PCID" CHAR(6), 
	"PICTURE1" VARCHAR2(50), 
	"PICTURE2" VARCHAR2(50), 
	"PICTURE3" VARCHAR2(50), 
	"SALE_NUM" NUMBER(*,0) DEFAULT 0, 
	"UPLOAD_TIME" DATE, 
	"BRAND" VARCHAR2(20), 
	"ISJINGYANBI" CHAR(1) DEFAULT 0
   ) ;
--------------------------------------------------------
--  DDL for Table PRODUCT_CATA
--------------------------------------------------------

  CREATE TABLE "PRODUCT_CATA" 
   (	"PCID" CHAR(6), 
	"PCNAME" VARCHAR2(30), 
	"FATHER" VARCHAR2(30), 
	"GRANDFATHER" VARCHAR2(30)
   ) ;
 

   COMMENT ON TABLE "PRODUCT_CATA"  IS '��Ʒ���
  ���룺ǰ��λ��ʾһ�����࣬�м���λ��ʾ2�����࣬������λ��ʾ��������
';
--------------------------------------------------------
--  DDL for Table ROOM
--------------------------------------------------------

  CREATE TABLE "ROOM" 
   (	"ROOMID" NUMBER(6,0), 
	"PRODUCTID" NUMBER(*,0), 
	"STATEMENT" CHAR(1) DEFAULT 0, 
	"FALSEUSER" NUMBER(*,0), 
	"LIMITEDUSER" NUMBER(*,0), 
	"ROOMTYPE" VARCHAR2(2), 
	"NEWFAULTUSER" NUMBER DEFAULT 0, 
	"ISOPEN" CHAR(1) DEFAULT 0
   ) ;
 

   COMMENT ON COLUMN "ROOM"."STATEMENT" IS '0����ʹ��ˮ����1��ʹ��';
 
   COMMENT ON COLUMN "ROOM"."NEWFAULTUSER" IS '�µ�ˮ������';
--------------------------------------------------------
--  DDL for Table SITDOWN
--------------------------------------------------------

  CREATE TABLE "SITDOWN" 
   (	"USERID" NUMBER, 
	"ROOMID" NUMBER(*,0), 
	"SITTIME" DATE
   ) ;
 

   COMMENT ON TABLE "SITDOWN"  IS 'ռ�������佻��һ�������������';
--------------------------------------------------------
--  DDL for Table UUSER
--------------------------------------------------------

  CREATE TABLE "UUSER" 
   (	"USERID" NUMBER(6,0), 
	"USERNAME" VARCHAR2(50), 
	"PASSWORD" VARCHAR2(20), 
	"TRUENAME" VARCHAR2(20), 
	"EMAIL" VARCHAR2(50), 
	"COLLEGE_CITY" VARCHAR2(20), 
	"IDENTIFYNO" VARCHAR2(20), 
	"ADDRESS" VARCHAR2(100), 
	"ZIPCODE" CHAR(6), 
	"CELLPHONE" VARCHAR2(20), 
	"PHONE" VARCHAR2(20), 
	"USERTYPE" CHAR(1) DEFAULT 1, 
	"QUESTION1" VARCHAR2(100) DEFAULT 0, 
	"QUESTION2" VARCHAR2(100) DEFAULT 0, 
	"QUESTION3" VARCHAR2(100) DEFAULT 0, 
	"ANSWER1" VARCHAR2(100) DEFAULT 1, 
	"ANSWER2" VARCHAR2(100) DEFAULT 2, 
	"ANSWER3" VARCHAR2(100) DEFAULT 03, 
	"PICTURE_HEAD" VARCHAR2(100) DEFAULT 0, 
	"ACCOUNT" NUMBER(8,2) DEFAULT 0, 
	"JINYANBI" NUMBER(8,2) DEFAULT 0, 
	"UNIVERSITY_PROVINCE" VARCHAR2(20)
   ) ;
 

   COMMENT ON COLUMN "UUSER"."QUESTION1" IS 'question Ĭ��Ϊ0��ʾ������';
 
   COMMENT ON TABLE "UUSER"  IS 'һ���û���������վע���û���ˮ����������ɣ�����ˮ��Ϊǰ5000���û��������Ϊ�������û�
University_Province   Ŀǰ�׶�����ֶα�ʾ�û����ڵ�ѧУ����������ֶο��ܱ�ʾ�û����ڵ�ʡ
College_City  Ŀǰ�׶�����ֶα�ʾ�û����ڵ�ѧԺ����������ֶο��ܱ�ʾ�û����ڵ���
IdentifyNo Ŀǰ�׶�����ֶα�ʾ�û���ѧ�ţ���������ֶο��ܱ�ʾ�û����֤��
UserTypeΪ1��ʾһ���û���Ϊ0��ʾˮ����
UserID,�Զ����ɣ����Ϊ1-5000 ��Ϊˮ��������Ϊ��ͨ�û�';

---------------------------------------------------
--   DATA FOR TABLE ENTERROOM
--   FILTER = none used
---------------------------------------------------
REM INSERTING into ENTERROOM

---------------------------------------------------
--   END DATA FOR TABLE ENTERROOM
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE ADMINUSER
--   FILTER = none used
---------------------------------------------------
REM INSERTING into ADMINUSER
Insert into ADMINUSER (UNAME,PWD,UTYPE) values ('admin','123','0');
Insert into ADMINUSER (UNAME,PWD,UTYPE) values ('admin1','123','1');
Insert into ADMINUSER (UNAME,PWD,UTYPE) values ('admin2','123','2');
Insert into ADMINUSER (UNAME,PWD,UTYPE) values ('admin3','123','3');
Insert into ADMINUSER (UNAME,PWD,UTYPE) values ('admin4','123','4');
Insert into ADMINUSER (UNAME,PWD,UTYPE) values ('admin5','123','5');

---------------------------------------------------
--   END DATA FOR TABLE ADMINUSER
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE DISS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into DISS

---------------------------------------------------
--   END DATA FOR TABLE DISS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE SITDOWN
--   FILTER = none used
---------------------------------------------------
REM INSERTING into SITDOWN
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (23,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (30,160,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (27,160,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (52,160,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (34,160,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (44,160,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (37,160,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (2,160,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (25,160,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (47,160,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (14,160,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (59,160,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (32,160,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (3,160,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (51,160,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (39,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (25,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (57,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (32,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (5,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (18,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (49,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (46,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (38,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (42,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (37,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (13,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (45,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (30,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (16,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (27,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (50,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (26,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (22,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (47,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (33,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (23,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (7,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (29,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (14,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (40,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (36,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (52,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (31,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (60,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (43,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (21,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (17,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (34,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (3,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (54,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (55,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (53,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (2,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (41,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (6,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (10,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (59,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (15,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (24,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (11,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (28,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (19,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (4,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (1,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (44,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (20,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (58,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (9,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (48,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (35,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (12,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (8,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (56,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (51,162,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (12,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (13,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (41,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (19,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (60,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (16,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (28,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (7,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (14,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (55,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (22,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (48,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (23,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (5,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (58,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (30,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (34,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (49,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (20,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (46,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (47,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (43,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (21,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (44,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (38,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (35,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (37,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (24,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (51,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (33,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (39,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (9,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (36,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (56,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (53,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (1,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (27,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (18,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (3,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (57,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (42,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (50,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (2,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (8,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (32,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (15,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (6,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (11,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (31,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (10,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (17,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (54,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (4,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (45,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (40,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (29,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (52,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (59,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (26,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (25,163,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (43,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (1,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (4,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (22,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (48,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (28,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (45,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (25,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (59,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (47,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (5,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (52,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (6,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (56,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (27,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (10,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (36,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (13,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (16,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (53,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (3,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (46,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (33,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (20,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (42,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (30,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (49,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (24,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (40,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (8,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (14,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (32,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (55,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (7,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (17,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (58,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (18,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (21,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (9,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (29,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (31,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (41,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (44,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (19,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (60,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (50,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (15,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (12,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (57,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (37,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (34,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (2,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (51,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (39,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (35,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (26,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (54,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (38,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (11,164,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (3,165,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (15,165,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (31,165,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (7,165,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (38,165,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (8,165,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (5,165,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (30,165,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (41,165,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (50,165,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (33,165,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (22,165,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (49,165,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (59,165,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (26,165,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (2,165,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (28,165,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (18,165,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (12,165,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (37,165,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (43,165,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (23,165,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (57,165,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (25,165,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (44,165,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (35,165,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (29,165,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (17,165,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (32,165,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (9,165,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (45,165,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (54,165,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (60,165,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (52,165,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (19,165,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (15,166,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (1,166,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (58,166,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (45,166,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (17,166,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (2,166,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (59,166,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (37,166,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (13,166,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (24,166,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (6,166,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (33,166,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (16,166,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (40,166,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (35,166,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (53,166,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (8,166,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (27,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (47,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (26,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (59,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (5,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (28,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (51,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (14,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (23,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (52,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (31,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (9,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (35,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (40,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (2,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (56,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (21,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (57,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (42,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (8,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (54,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (34,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (55,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (46,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (16,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (17,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (29,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (30,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (7,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (44,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (60,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (20,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (11,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (41,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (25,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (49,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (33,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (18,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (39,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (43,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (3,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (58,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (13,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (48,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (6,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (45,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (10,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (50,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (1,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (12,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (36,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (38,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (15,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (32,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (24,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (22,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (37,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (4,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (19,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (53,168,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (41,169,to_timestamp('08-1�� -13 03.42.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (1,169,to_timestamp('08-1�� -13 03.42.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (3,169,to_timestamp('08-1�� -13 03.42.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (33,169,to_timestamp('08-1�� -13 03.42.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (27,169,to_timestamp('08-1�� -13 03.42.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (58,169,to_timestamp('08-1�� -13 03.42.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (34,169,to_timestamp('08-1�� -13 03.42.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (36,169,to_timestamp('08-1�� -13 03.42.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (57,169,to_timestamp('08-1�� -13 03.42.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (42,169,to_timestamp('08-1�� -13 03.42.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (14,170,to_timestamp('08-1�� -13 03.42.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (57,170,to_timestamp('08-1�� -13 03.42.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (27,170,to_timestamp('08-1�� -13 03.42.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (17,170,to_timestamp('08-1�� -13 03.42.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (40,170,to_timestamp('08-1�� -13 03.42.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (33,171,to_timestamp('08-1�� -13 03.42.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (57,171,to_timestamp('08-1�� -13 03.42.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (28,172,to_timestamp('08-1�� -13 03.42.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (7,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (3,127,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (9,127,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (5,127,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (2,127,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (4,127,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (10,127,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (7,127,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (6,127,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (1,127,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (8,127,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (5,128,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (6,128,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (7,128,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (8,128,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (1,128,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (3,128,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (10,128,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (2,128,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (9,128,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (4,128,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (6,129,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (8,129,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (4,129,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (7,129,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (1,129,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (5,129,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (2,129,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (3,129,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (10,129,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (9,129,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (2,130,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (5,130,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (8,130,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (6,130,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (4,130,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (3,130,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (7,130,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (10,130,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (1,130,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (9,130,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (38,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (25,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (29,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (22,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (20,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (48,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (28,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (47,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (40,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (12,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (18,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (57,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (42,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (53,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (26,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (10,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (23,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (41,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (3,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (54,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (11,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (49,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (21,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (17,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (39,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (7,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (9,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (30,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (4,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (6,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (44,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (55,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (16,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (33,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (52,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (27,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (24,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (59,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (15,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (31,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (51,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (5,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (8,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (13,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (1,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (35,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (56,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (60,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (36,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (37,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (45,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (14,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (43,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (34,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (32,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (2,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (50,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (19,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (46,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (58,145,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (56,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (60,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (17,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (1,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (55,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (6,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (4,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (5,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (41,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (10,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (34,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (39,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (2,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (21,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (33,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (51,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (35,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (26,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (24,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (48,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (16,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (53,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (22,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (50,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (37,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (46,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (58,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (52,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (18,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (13,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (54,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (20,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (36,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (30,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (57,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (8,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (31,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (3,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (15,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (27,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (11,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (23,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (40,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (19,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (49,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (12,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (45,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (28,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (14,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (29,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (44,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (42,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (38,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (25,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (9,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (43,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (47,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (32,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (59,146,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (16,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (32,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (6,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (42,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (45,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (11,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (48,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (44,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (4,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (49,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (38,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (52,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (24,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (54,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (12,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (23,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (7,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (55,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (30,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (13,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (41,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (15,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (5,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (53,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (47,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (57,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (31,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (33,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (56,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (40,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (36,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (43,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (58,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (3,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (29,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (46,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (1,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (19,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (2,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (20,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (21,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (14,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (51,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (18,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (39,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (9,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (28,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (17,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (50,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (26,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (34,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (8,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (59,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (10,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (35,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (25,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (37,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (27,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (22,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (60,147,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (55,148,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (47,148,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (42,148,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (24,148,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (6,148,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (36,148,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (10,148,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (37,148,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (60,148,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (12,148,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (20,148,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (43,148,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (14,148,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (53,148,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (8,148,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (32,148,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (59,148,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (4,148,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (19,148,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (1,148,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (38,148,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (29,148,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (39,148,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (58,148,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (25,148,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (46,148,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (31,148,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (21,148,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (27,148,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (11,148,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (57,148,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (34,148,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (49,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (25,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (21,133,to_timestamp('08-1�� -13 02.36.46.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (41,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (4,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (5,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (43,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (57,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (30,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (39,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (42,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (33,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (52,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (24,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (11,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (32,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (47,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (44,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (29,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (38,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (58,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (37,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (6,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (14,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (36,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (56,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (55,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (18,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (31,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (8,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (2,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (60,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (45,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (26,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (12,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (9,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (25,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (40,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (21,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (28,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (13,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (46,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (35,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (3,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (15,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (23,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (59,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (27,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (48,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (49,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (51,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (16,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (10,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (50,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (19,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (34,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (53,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (17,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (54,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (20,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (1,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (7,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (22,151,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (26,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (31,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (32,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (46,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (34,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (7,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (19,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (6,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (59,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (8,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (18,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (38,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (16,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (29,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (37,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (24,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (15,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (28,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (20,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (21,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (2,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (44,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (57,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (11,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (30,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (35,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (47,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (40,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (52,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (22,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (48,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (41,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (39,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (5,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (50,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (1,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (54,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (56,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (36,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (43,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (13,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (17,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (45,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (4,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (58,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (60,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (55,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (42,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (51,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (33,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (10,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (23,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (12,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (27,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (9,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (14,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (3,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (53,152,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (57,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (20,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (55,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (52,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (25,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (59,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (16,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (9,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (42,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (2,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (38,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (24,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (3,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (12,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (35,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (28,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (18,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (45,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (33,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (39,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (31,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (36,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (7,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (48,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (1,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (30,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (47,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (17,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (53,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (56,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (21,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (50,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (51,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (46,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (27,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (11,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (37,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (14,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (43,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (22,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (34,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (4,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (15,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (19,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (40,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (32,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (23,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (60,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (10,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (6,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (58,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (26,153,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (43,154,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (37,154,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (32,154,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (33,154,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (34,154,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (10,154,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (45,154,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (58,154,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (53,154,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (40,154,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (60,154,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (35,154,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (30,154,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (55,154,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (22,154,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (23,154,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (31,154,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (49,154,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (28,154,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (54,154,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (44,154,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (17,154,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (18,154,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (27,154,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (1,154,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (57,154,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (9,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (27,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (30,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (7,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (36,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (2,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (55,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (38,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (48,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (42,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (53,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (43,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (6,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (11,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (12,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (47,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (40,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (44,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (35,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (1,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (21,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (32,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (41,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (18,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (5,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (29,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (15,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (19,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (34,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (8,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (45,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (33,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (59,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (60,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (28,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (37,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (26,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (54,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (49,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (10,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (25,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (52,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (16,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (57,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (51,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (50,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (14,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (31,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (3,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (58,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (24,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (20,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (13,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (23,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (39,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (56,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (46,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (17,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (22,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (4,157,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (52,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (27,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (5,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (41,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (51,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (1,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (12,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (28,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (7,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (10,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (23,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (29,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (43,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (40,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (20,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (45,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (38,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (60,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (47,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (6,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (36,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (21,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (13,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (24,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (8,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (37,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (4,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (53,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (14,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (34,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (31,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (39,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (49,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (57,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (25,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (35,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (59,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (16,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (3,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (46,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (22,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (54,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (30,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (32,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (9,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (58,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (11,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (2,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (56,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (26,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (17,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (33,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (19,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (55,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (50,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (48,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (42,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (44,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (15,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (18,158,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (33,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (1,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (55,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (60,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (51,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (45,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (40,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (59,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (14,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (3,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (23,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (22,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (15,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (49,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (50,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (20,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (57,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (42,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (41,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (19,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (29,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (30,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (46,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (52,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (37,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (17,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (6,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (25,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (28,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (32,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (26,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (7,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (18,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (56,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (27,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (44,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (10,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (16,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (47,159,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (54,160,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (35,160,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (10,160,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (40,160,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (56,160,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));

---------------------------------------------------
--   END DATA FOR TABLE SITDOWN
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE UUSER
--   FILTER = none used
---------------------------------------------------
REM INSERTING into UUSER
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (62,'����','123','�Ķɳ�ˮ','2454@sdfsfs.com','����˿','111111111111111','���͵�',null,'32345464',null,'1','���ĳ����أ�','�������գ�','�������գ�','�յ�','��С��','˭˵��','0',0,0,'������͵�');
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (21,'Sandy','ss123','sdf','dfadf','sdf','sdf','sdf',null,'sdf',null,null,'�������գ�',null,null,'sadf',null,null,null,90,0,'sdf');
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (22,'Cindy','cc123','sdf','dfadf','sdf','sdf','sdf',null,'sdf',null,null,'�������գ�',null,null,'sadf',null,null,null,89,0,'sdf');
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (28,'Tina','tt123','����','tina@sina.com.cn','��е����','01202301','������绰��',null,'1234',null,null,'Сѧ�����Σ�',null,null,'Tina',null,null,null,90,0,'�Ϻ����ѧԺ');
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (23,'sdfasdf','123','sdf','dfadf','sdf','sdf','sdf',null,'sdf',null,null,'�������գ�',null,null,'sadf',null,null,null,100,0,'sdf');
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (25,'yunyun','yy123','��ܿ','mengyun@sina.com.cn','��Ϣ����ѧԺ','06129082','�Ϻ����´�ѧ33������',null,'1391765234',null,null,'���ĳ����أ�',null,null,'����',null,null,null,89,0,'�Ϻ����´�ѧ');
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (27,'Mark','mm123','Mark Bush','mark@126.com','�����ѧԺ','10121302','�Ϻ�������ѧ������8��1001��',null,'a1d2e5',null,null,'ĸ�׵����֣�',null,null,'Kelly',null,null,null,90,0,'�Ϻ������ѧ');
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (6,'szq','123','���˶�����','2454@sfs.com','��Ϣ����','12131','�ķ���','235   ','123456','654321','1','�����أ�','���գ�','��ʦ��','��','��������','ĳĳ��ʦ','001.jpg',1058.2,486262.36,'SMU');
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (2,'22','22',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,90,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (3,'wesd','23',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1090,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (0,'�����û�',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,100,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (4,'wah','123','��ͩ��',null,'����','20120732','��ɣ�ķ���','201306','13087905678','312156789','1',null,null,null,null,null,null,null,168,1746,'�����ѧ');
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (5,'zq','123',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,90,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (1,'ϵͳ',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,100,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (26,'Danniel','dd123','������','dan_CA@yahoo.com','���󹤳�','09102201','�Ϻ������ѧ45��203��',null,'1234',null,null,'���׵����֣�',null,null,'David',null,null,null,90,0,'�Ϻ������ѧ');
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (41,'leoShi','123','С��',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (61,'szqq','123','szq','dasd@qq.com','565','123456789987654321','fdhg',null,'38281230',null,'1','�������գ�','���ĳ����أ�','���׵����֣�','1221','nmg','123456','0',0,0,'454');
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (7,'С����ˮ','xq123','����','zhangyun321@sina.com.cn',null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (8,'ӣ��С���� ','yt123','����','lilin2123@sohu.com',null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (9,'blueSky','bs123','��ٻ','wangqian@hotmail.com',null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (10,'blueBerry','bb123','����','liuli@gmail.com',null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (11,'freeman1203','ff123','������','dayanwang@126.com',null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (12,'����','lc123','����','lancheng223@hotmail.com',null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (13,'YY','yy123','֣����','DanhuiZheng@gmail.com',null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (14,'����','ww123','���',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (15,'��Ҫ����','jy123','֣��޼',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (16,'���˼��','sc123','����',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (17,'�󰶻���','za123','������',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (18,'��ʱ����','bs123','�ŷ�',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (19,'�λ��Ƴ�','mh123','���Ӱ�',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (20,'�̼�','lj123','������',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (29,'oldFriend','of123','������',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (30,'hotDog','hd123','����',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (31,'zero','zz123','����',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (32,'sunShine','ss123','����',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (33,'flyingHigh','fh123','��ά',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (34,'californiaHotel','ch123','������',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (35,'yesterdayOnceMore','yo123','������',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (36,'Tiger','tt123','����',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (37,'Cake','cc123','������',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (38,'cookie','cc123','���',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (39,'GodSaveMe','gs123','������',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (40,'happy_every_day','he123','������',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (42,'ILoveShopping','il123','�η�',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (43,'FollowMe','fm123','κ����',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (44,'Gesus','gg123','κ��Ϫ',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (45,'IPhone','ip123','�³�',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (46,'emerengcy','ee123','Ella Stephen',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (47,'chedaralla','cc123','John Bush',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (48,'Ocean','oo123','Michell Kelly',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (49,'lucas_J','lj123','Lucas Jeff',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (50,'RobertM','rm123','Robert Mart',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (51,'StephenVJ','sv123','StephenVJ',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (52,'skySKYsky','ss123','��Ұ',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (53,'��Įɳ��ѩ','dm123','����ѩ',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (54,'�ƹ���','sg123','��h',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (55,'�̲�����','lc123','������',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (56,'�����ˮ','qq123','л���',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (57,'��ˮһ��','zs123','��һ��',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (58,'����С��','lb123','������',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (59,'����ȡ˭','sw123','����ͬ',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (60,'�������','qw123','��ͩҹ��',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (24,'��������','kw123','ͯ��',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);

---------------------------------------------------
--   END DATA FOR TABLE UUSER
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE INNERMAIL
--   FILTER = none used
---------------------------------------------------
REM INSERTING into INNERMAIL

---------------------------------------------------
--   END DATA FOR TABLE INNERMAIL
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE PRODUCT
--   FILTER = none used
---------------------------------------------------
REM INSERTING into PRODUCT
Insert into PRODUCT (PRODUCTID,PRONAME,PROTITLE,PROSIZE,PRICE,COLOR,LEFT,ALARM,ISCHEAP,ISONLYONE,ISONLYTEN,ANNOTATION1,ANNOTATION2,ANNOTATION3,ANNOTATION4,ANNOTATION5,PCID,PICTURE1,PICTURE2,PICTURE3,SALE_NUM,UPLOAD_TIME,BRAND,ISJINGYANBI) values (74,'Iphone4','�������¿�������ֻ�','��׼',3500,'��',1,5,'0','0','0','�ڴ�8GB������ʱ��75Сʱ','˫800������','��Ԥװ���������ʮ����Ϸ','����','������ۣ��ʺ�Ů��','010106','iphone.jpg',null,null,0,to_timestamp('08-1�� -13 03.36.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'Apple','0');
Insert into PRODUCT (PRODUCTID,PRONAME,PROTITLE,PROSIZE,PRICE,COLOR,LEFT,ALARM,ISCHEAP,ISONLYONE,ISONLYTEN,ANNOTATION1,ANNOTATION2,ANNOTATION3,ANNOTATION4,ANNOTATION5,PCID,PICTURE1,PICTURE2,PICTURE3,SALE_NUM,UPLOAD_TIME,BRAND,ISJINGYANBI) values (68,'����I9300','GALAXY SIII����ͨ�棩','4Ӣ��',4200,'��',3,5,'0','0','0','�������䣬����ʱ�䳤��3��','�ڴ�8G��800������',null,null,null,'010102','����I9300.jpg',null,null,0,to_timestamp('07-1�� -13 10.15.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'����','0');
Insert into PRODUCT (PRODUCTID,PRONAME,PROTITLE,PROSIZE,PRICE,COLOR,LEFT,ALARM,ISCHEAP,ISONLYONE,ISONLYTEN,ANNOTATION1,ANNOTATION2,ANNOTATION3,ANNOTATION4,ANNOTATION5,PCID,PICTURE1,PICTURE2,PICTURE3,SALE_NUM,UPLOAD_TIME,BRAND,ISJINGYANBI) values (71,'Dell4100̨ʽ��','�����ȶ���ʵ��̨ʽ��','15��',3200,'��',1,5,'0','0','0','�ڴ�3Gb��DDR','2.3��CPU',null,null,null,'010101','dell.jpg',null,null,0,to_timestamp('08-1�� -13 03.01.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'Dell ','1');
Insert into PRODUCT (PRODUCTID,PRONAME,PROTITLE,PROSIZE,PRICE,COLOR,LEFT,ALARM,ISCHEAP,ISONLYONE,ISONLYTEN,ANNOTATION1,ANNOTATION2,ANNOTATION3,ANNOTATION4,ANNOTATION5,PCID,PICTURE1,PICTURE2,PICTURE3,SALE_NUM,UPLOAD_TIME,BRAND,ISJINGYANBI) values (69,'�ֻ���Ĥ','�ζ� ����͸����ĥ�ֻ���Ĥ ��Ϊ P1','20*20',10,'͸��',1,5,'0','0','0','2���ʱ���',null,null,null,null,'010308','tiemo.jpg',null,null,0,to_timestamp('08-1�� -13 02.36.46.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'��Ϊ','0');
Insert into PRODUCT (PRODUCTID,PRONAME,PROTITLE,PROSIZE,PRICE,COLOR,LEFT,ALARM,ISCHEAP,ISONLYONE,ISONLYTEN,ANNOTATION1,ANNOTATION2,ANNOTATION3,ANNOTATION4,ANNOTATION5,PCID,PICTURE1,PICTURE2,PICTURE3,SALE_NUM,UPLOAD_TIME,BRAND,ISJINGYANBI) values (70,'NikonD7000','��ȫ��δ���⣩�῵�������D5100/18-105�׻� �῵D5100','3�缰����',3688,'��',5,3,'0','0','1',null,null,null,null,null,'010103','NikonD7000.jpg',null,null,0,to_timestamp('08-1�� -13 02.42.19.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'Nikon','0');
Insert into PRODUCT (PRODUCTID,PRONAME,PROTITLE,PROSIZE,PRICE,COLOR,LEFT,ALARM,ISCHEAP,ISONLYONE,ISONLYTEN,ANNOTATION1,ANNOTATION2,ANNOTATION3,ANNOTATION4,ANNOTATION5,PCID,PICTURE1,PICTURE2,PICTURE3,SALE_NUM,UPLOAD_TIME,BRAND,ISJINGYANBI) values (72,'probook4436s','����ռ������˿���HP�ʼǱ�','15��',5200,'��',1,5,'0','0','0','Ӳ��500GB;�ڴ�3GB','�Կ�64GB','��ǿ�ѹ40����','һ�γ������4Сʱ',null,'010102','probook.jpg','probook.jpg','probook.jpg',0,to_timestamp('08-1�� -13 03.15.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'Hp ','0');
Insert into PRODUCT (PRODUCTID,PRONAME,PROTITLE,PROSIZE,PRICE,COLOR,LEFT,ALARM,ISCHEAP,ISONLYONE,ISONLYTEN,ANNOTATION1,ANNOTATION2,ANNOTATION3,ANNOTATION4,ANNOTATION5,PCID,PICTURE1,PICTURE2,PICTURE3,SALE_NUM,UPLOAD_TIME,BRAND,ISJINGYANBI) values (73,'pLSQL5679s','�������¿��Ů�ö�֥�ʼǱ�','13��',3900,'õ��',1,5,'0','0','0',',Ӳ��500GB;�ڴ�3GB','�Կ�64Gb ','��ǿ�ѹ40����','һ�γ�����󣬵�ؿ�ʹ��4Сʱ','������ۣ��ʺ�Ů��','010102','tochiba.jpg',null,null,0,to_timestamp('08-1�� -13 03.31.24.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'Tochiba','0');
Insert into PRODUCT (PRODUCTID,PRONAME,PROTITLE,PROSIZE,PRICE,COLOR,LEFT,ALARM,ISCHEAP,ISONLYONE,ISONLYTEN,ANNOTATION1,ANNOTATION2,ANNOTATION3,ANNOTATION4,ANNOTATION5,PCID,PICTURE1,PICTURE2,PICTURE3,SALE_NUM,UPLOAD_TIME,BRAND,ISJINGYANBI) values (75,'�����','�������¿����ü��޼Ӻ��ͳ����','S M L XL XXL XXXL',218,'��',1,5,'1','0','0','�������ɹ�ѡ��','�������ϣ��������ܼ�','�Ӻ����','��ˮ','���̳Ǳ���200Ԫ','010109','p002.jpg',null,null,0,to_timestamp('08-1�� -13 03.42.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'Apple','0');

---------------------------------------------------
--   END DATA FOR TABLE PRODUCT
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE DISSROOM
--   FILTER = none used
---------------------------------------------------
REM INSERTING into DISSROOM

---------------------------------------------------
--   END DATA FOR TABLE DISSROOM
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE GONGGAO
--   FILTER = none used
---------------------------------------------------
REM INSERTING into GONGGAO

---------------------------------------------------
--   END DATA FOR TABLE GONGGAO
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE PRODUCT_CATA
--   FILTER = none used
---------------------------------------------------
REM INSERTING into PRODUCT_CATA
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010108','��Ϸ��','ʱ������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010109','���Ӵʵ�','ʱ������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010110','�������','ʱ������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010111','ʱ�����룭����','ʱ������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010201','����','�������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010202','���','�������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010203','����','�������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010204','������','�������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010205','����ͷ','�������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010206','�ƶ�U��','�������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010207','�ƶ�Ӳ��','�������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010208','���߶���','�������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010209','USB������','�������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010210','��Яʽ����','�������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010211','�ʼǱ�֧��','�������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010212','�ʼǱ�ɢ����','�������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010213','�ʼǱ��ڵ���','�������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010214','�������������','�������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010301','���','�ֻ����','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010302','�����','�ֻ����','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010303','���濨','�ֻ����','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010304','�ֻ���','�ֻ����','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010305','�ֻ���','�ֻ����','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010306','��������','�ֻ����','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010307','�ֻ�����','�ֻ����','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010308','�ֻ�������','�ֻ����','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010309','�ֻ����߶���','�ֻ����','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010310','�ֻ���Яʽ����','�ֻ����','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010311','������','�ֻ����','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010312','�ֻ����������','�ֻ����','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020101','��ˮ��','��������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020102','������','��������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020103','����','��������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020104','���¯','��������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020105','�����','��������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020106','������','��������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020107','�翾��','��������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020203','��ʪ��','���õ���','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020108','���ȹ�','��������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020109','�忾��','��������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020110','�����','��������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020111','�緹��','��������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020112','����','��������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020113','������','��������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020114','������','��������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020115','���̻�','��������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020116','΢��¯','��������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020117','��ѹ����','��������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020118','ե֭��','��������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020119','ʳ�������','��������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020120','��������������','��������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020201','̨��','���õ���','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020202','������','���õ���','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010105','MP3/MP4','ʱ������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010106','������','ʱ������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010102','�ֻ�','ʱ������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010101','����','ʱ������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010103','���','ʱ������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010104','�����','ʱ������','�������');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010107','¼����','ʱ������','�������');

---------------------------------------------------
--   END DATA FOR TABLE PRODUCT_CATA
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE AD
--   FILTER = none used
---------------------------------------------------
REM INSERTING into AD
Insert into AD (AD1_PIC,AD1_DEF_PIC,AD1_BEGIN,AD1_END,AD2_PIC,AD2_DEF_PIC,AD2_BEGIN,AD2_END,AD3_PIC,AD3_DEF_PIC,AD3_BEGIN,AD3_END,AD1_URL,AD2_URL,AD3_URL) values ('../../Images/AD/jerryfish.jpg','../../Images/AD/jerryfish.jpg',to_timestamp('18-9�� -12 12.00.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('18-12��-12 12.00.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'H:\YiYuanGou\Images\AD\p1.jpg','../../Images/AD/jerryfish.jpg',to_timestamp('08-9�� -12 12.00.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('31-12��-12 12.00.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),null,'H:\YiYuanGou\Images\AD\p1.jpg',null,null,null,null,null);

---------------------------------------------------
--   END DATA FOR TABLE AD
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE ORDERS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into ORDERS

---------------------------------------------------
--   END DATA FOR TABLE ORDERS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE CART
--   FILTER = none used
---------------------------------------------------
REM INSERTING into CART

---------------------------------------------------
--   END DATA FOR TABLE CART
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE ROOM
--   FILTER = none used
---------------------------------------------------
REM INSERTING into ROOM
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (163,74,'1',175,3500,'1',5,'1');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (164,74,'1',87,1750,'2',5,'1');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (165,74,'1',35,700,'5 ',5,'1');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (166,74,'1',17,350,'0',5,'1');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (167,74,'0',0,10,'3',0,'4');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (168,74,'1',350,7000,'4',5,'4');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (0,0,'0',0,10,'0',0,'0');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (127,68,'1',840,4200,'1',20,'1');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (128,68,'1',420,2100,'2',20,'1');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (129,68,'1',168,840,'5 ',20,'1');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (130,68,'1',84,420,'0',20,'1');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (131,68,'0',0,10,'3',0,'4');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (132,68,'0',0,8400,'4',0,'4');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (145,71,'1',480,3200,'1',15,'4');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (146,71,'1',240,1600,'2',15,'4');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (147,71,'1',76,640,'5 ',12,'4');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (148,71,'1',32,320,'0',10,'4');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (149,71,'0',0,10,'3',0,'4');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (150,71,'0',0,6400,'4',0,'4');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (133,69,'1',1,10,'1',10,'1');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (134,69,'0',0,5,'2',0,'1');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (135,69,'0',0,2,'5 ',0,'1');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (136,69,'0',0,1,'0',0,'1');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (137,69,'0',0,10,'3',0,'4');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (138,69,'0',0,20,'4',0,'4');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (139,70,'0',0,3688,'1',0,'4');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (140,70,'0',0,1844,'2',0,'4');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (141,70,'0',0,737,'5 ',0,'4');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (142,70,'0',0,368,'0',0,'4');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (143,70,'0',0,10,'3',0,'1');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (144,70,'0',0,7376,'4',0,'4');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (151,72,'1',260,5200,'1',5,'1');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (152,72,'1',130,2600,'2',5,'1');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (153,72,'1',52,1040,'5 ',5,'1');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (154,72,'1',26,520,'0',5,'1');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (155,72,'0',0,10,'3',0,'4');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (156,72,'0',0,10400,'4',0,'4');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (157,73,'1',195,3900,'1',5,'1');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (158,73,'1',97,1950,'2',5,'1');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (159,73,'1',39,780,'5 ',5,'1');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (160,73,'1',19,390,'0',5,'1');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (161,73,'0',0,10,'3',0,'4');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (162,73,'1',390,7800,'4',5,'4');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (169,75,'1',10,218,'1',5,'4');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (170,75,'1',5,109,'2',5,'4');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (171,75,'1',2,43,'5 ',5,'4');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (172,75,'1',1,21,'0',5,'4');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (173,75,'0',0,10,'3',0,'4');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (174,75,'0',0,436,'4',0,'1');

---------------------------------------------------
--   END DATA FOR TABLE ROOM
---------------------------------------------------
--------------------------------------------------------
--  Constraints for Table PRODUCT
--------------------------------------------------------

  ALTER TABLE "PRODUCT" MODIFY ("PRODUCTID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SITDOWN
--------------------------------------------------------

  ALTER TABLE "SITDOWN" ADD CONSTRAINT "PK_SITDOWN" PRIMARY KEY ("USERID", "ROOMID") ENABLE;
 
  ALTER TABLE "SITDOWN" MODIFY ("USERID" NOT NULL ENABLE);
 
  ALTER TABLE "SITDOWN" MODIFY ("ROOMID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table UUSER
--------------------------------------------------------

  ALTER TABLE "UUSER" ADD CONSTRAINT "PK_UUSER" PRIMARY KEY ("USERID") ENABLE;
 
  ALTER TABLE "UUSER" MODIFY ("USERID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ENTERROOM
--------------------------------------------------------

  ALTER TABLE "ENTERROOM" ADD CONSTRAINT "PK_ENTERROOM" PRIMARY KEY ("ROOMNO", "USERID") ENABLE;
 
  ALTER TABLE "ENTERROOM" MODIFY ("ROOMNO" NOT NULL ENABLE);
 
  ALTER TABLE "ENTERROOM" MODIFY ("USERID" NOT NULL ENABLE);

--------------------------------------------------------
--  Constraints for Table ADMINUSER
--------------------------------------------------------

  ALTER TABLE "ADMINUSER" ADD CONSTRAINT "PK_ADMINUSER" PRIMARY KEY ("UNAME") ENABLE;
 
  ALTER TABLE "ADMINUSER" MODIFY ("UNAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CART
--------------------------------------------------------

  ALTER TABLE "CART" MODIFY ("CARTID" NOT NULL ENABLE);
 
  ALTER TABLE "CART" ADD CONSTRAINT "cart_PK" PRIMARY KEY ("CARTID") ENABLE;
--------------------------------------------------------
--  Constraints for Table ROOM
--------------------------------------------------------

  ALTER TABLE "ROOM" ADD CONSTRAINT "PK_ROOM" PRIMARY KEY ("ROOMID") ENABLE;
 
  ALTER TABLE "ROOM" MODIFY ("ROOMID" NOT NULL ENABLE);
 
  ALTER TABLE "ROOM" MODIFY ("NEWFAULTUSER" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DISSROOM
--------------------------------------------------------

  ALTER TABLE "DISSROOM" ADD CONSTRAINT "PK_DISSROOM" PRIMARY KEY ("DISSID") ENABLE;
 
  ALTER TABLE "DISSROOM" MODIFY ("DISSID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table GONGGAO
--------------------------------------------------------

  ALTER TABLE "GONGGAO" ADD CONSTRAINT "GONGGAO_PK" PRIMARY KEY ("GONGGAOID") ENABLE;
 
  ALTER TABLE "GONGGAO" MODIFY ("GONGGAOTIME" NOT NULL ENABLE);
 
  ALTER TABLE "GONGGAO" MODIFY ("CONTENT" NOT NULL ENABLE);
 
  ALTER TABLE "GONGGAO" MODIFY ("GONGGAOID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PRODUCT_CATA
--------------------------------------------------------

  ALTER TABLE "PRODUCT_CATA" ADD CONSTRAINT "PK_PRODUCT_CATA" PRIMARY KEY ("PCID") ENABLE;
 
  ALTER TABLE "PRODUCT_CATA" MODIFY ("PCID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "ORDERS" ADD CONSTRAINT "PK_ORDERS" PRIMARY KEY ("ORDERID") ENABLE;
 
  ALTER TABLE "ORDERS" MODIFY ("ORDERID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table INNERMAIL
--------------------------------------------------------

  ALTER TABLE "INNERMAIL" ADD CONSTRAINT "PK_INNERMAIL" PRIMARY KEY ("MAILID") ENABLE;
 
  ALTER TABLE "INNERMAIL" MODIFY ("MAILID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DISS
--------------------------------------------------------

  ALTER TABLE "DISS" ADD CONSTRAINT "PK_DISS" PRIMARY KEY ("DISSCUSSID") ENABLE;
 
  ALTER TABLE "DISS" MODIFY ("DISSCUSSID" NOT NULL ENABLE);
--------------------------------------------------------
--  DDL for Index PK_DISS
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_DISS" ON "DISS" ("DISSCUSSID") 
  ;
--------------------------------------------------------
--  DDL for Index cart_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "cart_PK" ON "CART" ("CARTID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_ADMINUSER
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_ADMINUSER" ON "ADMINUSER" ("UNAME") 
  ;
--------------------------------------------------------
--  DDL for Index PK_PRODUCT_CATA
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_PRODUCT_CATA" ON "PRODUCT_CATA" ("PCID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_ROOM
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_ROOM" ON "ROOM" ("ROOMID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_INNERMAIL
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_INNERMAIL" ON "INNERMAIL" ("MAILID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_UUSER
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_UUSER" ON "UUSER" ("USERID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_SITDOWN
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_SITDOWN" ON "SITDOWN" ("USERID", "ROOMID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_DISSROOM
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_DISSROOM" ON "DISSROOM" ("DISSID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_ENTERROOM
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_ENTERROOM" ON "ENTERROOM" ("ROOMNO", "USERID") 
  ;
--------------------------------------------------------
--  DDL for Index GONGGAO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "GONGGAO_PK" ON "GONGGAO" ("GONGGAOID") 
  ;
--------------------------------------------------------
--  DDL for Index PK_ORDERS
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_ORDERS" ON "ORDERS" ("ORDERID") 
  ;














--------------------------------------------------------
--  DDL for Trigger DRT1
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "DRT1" 
before insert on "DISSROOM" 
for each row 
begin
if inserting then 
if :NEW."DISSID" is null then 
select "S_DissRoom".nextval into :NEW."DISSID" from dual;
end if; 
end if;
end;
/
ALTER TRIGGER "DRT1" ENABLE;
--------------------------------------------------------
--  DDL for Trigger INITFALSEUSER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "INITFALSEUSER" 
after insert on room
referencing old as o new as n 
for each row
begin
  if (:n.roomType!='9' and :n.roomType!='3') then
    BEGIN  
      insert into sitdown select * from (select rownum rn , :n.roomid,sysdate from dual connect by rownum <= 60 order by dbms_random.value) where rownum <=:n.falseuser;
      --update sitdown set roomid=:n.roomid where roomid=-1;
    END ; 
  end if;
end;


/
ALTER TRIGGER "INITFALSEUSER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger INNERMAIL_T1
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "INNERMAIL_T1" 
before insert on innermail
for each row 
begin 
select SZQ.S1.nextval into:new.MAILID from sys.dual ; 
end;
/
ALTER TRIGGER "INNERMAIL_T1" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ROOM_T1
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ROOM_T1" 
before insert on room
for each row 
begin 
select SZQ."S_Room".nextval into:new.RoomID from sys.dual ; 
end;
/
ALTER TRIGGER "ROOM_T1" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SEQ_USERID
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SEQ_USERID" before insert on "UUSER"    for each row begin     if inserting then       if :NEW."USERID" is null then          select "S_UUser".nextval into :NEW."USERID" from dual;       end if;    end if; end;
/
ALTER TRIGGER "SEQ_USERID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger T_GONGGAO
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "T_GONGGAO" before insert on "GONGGAO"    for each row begin     if inserting then       if :NEW."GONGGAOID" is null then          select S_GONGGAO.nextval into :NEW."GONGGAOID" from dual;       end if;    end if; end;
/
ALTER TRIGGER "T_GONGGAO" ENABLE;
--------------------------------------------------------
--  DDL for Trigger UPDATECheap
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "UPDATECheap" 
before update of isonlyten on product
referencing old as o new as n 
for each row 
begin
if :n.ischeap='1' then
   BEGIN
    update room set isopen=4 where productid=:n.productID and roomtype!='4';
    update room set isopen=1 where productid=:n.productID and roomtype='4';   
   end;
 
else
   BEGIN
    update room set isopen=4 where productid=:n.productID and roomtype!='4';
    update room set isopen=1 where productid=:n.productID and roomtype='4';   
   end;
end if;
end;
/
ALTER TRIGGER "UPDATECheap" ENABLE;
--------------------------------------------------------
--  DDL for Trigger UPDATEONLYONE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "UPDATEONLYONE" 
before update of isonlyone on product
referencing old as o new as n
for each row
begin
if :n.isOnlyOne='1' then
   BEGIN
    update room set isopen=4 where productid=:n.productID and roomtype!='1';
    update room set isopen=1 where productid=:n.productID and roomtype='1';   
   end;
else
   BEGIN
    update room set isopen=1 where productid=:n.productID and roomtype!='1';
    update room set isopen=4 where productid=:n.productID and roomtype='1';   
   end;
end if;
end;

/
ALTER TRIGGER "UPDATEONLYONE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger UPDATEONLYTEN
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "UPDATEONLYTEN" 
before update of isonlyten on product
referencing old as o new as n 
for each row 
begin
if :n.isOnlyTen='1' then
   BEGIN
    update room set isopen=4 where productid=:n.productID and roomtype!='3';
    update room set isopen=1 where productid=:n.productID and roomtype='3';   
   end;
 
else
   BEGIN
    update room set isopen=4 where productid=:n.productID and roomtype!='3';
    update room set isopen=1 where productid=:n.productID and roomtype='3';   
   end;
end if;
end;

/
ALTER TRIGGER "UPDATEONLYTEN" ENABLE;
--------------------------------------------------------
--  DDL for View SITRATEVIEW
--------------------------------------------------------

  CREATE OR REPLACE VIEW "SITRATEVIEW" ("SITNUM", "ROOMID", "SITRATE") AS 
  select count(*) as sitnum,Room.RoomID,round(count(*)/limiteduser, 5) as sitrate from Room , SitDown where  Room.RoomID=SitDown.RoomID group by Room.RoomID,limiteduser,falseuser;
--------------------------------------------------------
--  DDL for Procedure BEGINORDER1P
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "BEGINORDER1P" 
( uuid IN NUMBER
, rid IN NUMBER
,returnval OUT NUMBER
) IS
pid number;
ooid number;
rtype number;
fuser number;
ptitle varchar(200);
uname varchar(50);
pprice number;
BEGIN
select proname into ptitle from product where productid=pid;
select price into pprice from product where productid=pid;
select trunc(to_number(roomtype)) into rtype from room where roomid=rid;
if rtype=0 then rtype:=10; end if;
if rtype=9 then rtype:=0; end if;
if rtype=4 then rtype:=0.5; end if;
if rtype=3 then rtype:=trunc(pprice/10); end if; --����ȡ��
insert into orders (orderID,userID,Statement,RoomID) values("S_Orders".nextval,uuid,0,rid);
update uuser set jinyanbi= jinyanbi+ rtype where userid in (select userid from sitdown where roomid=rid and userid<2000);
select max(orderID) into ooid from Orders where userid=uuid;
select productID into pid from room where roomid=rid;
insert into cart values(pid,1,ooid,"S_cart".nextval,uuid);
delete sitdown where roomid=rid;
delete dissroom where diss_room=rid;
insert into dissroom(userid,disstime,content,diss_room) values(1,sysdate,'��ӭ����'||to_char(rid)||'�ŷ���',rid);
select username into uname from uuser where userid=uuid; 
insert into gonggao(gonggaotime,content,contype) values(sysdate,'�û�'||uname||' ��'||to_char(rid)||'�ŷ���ɹ������ '||ptitle||' һ��','0');
--delete enterroom where roomno=to_char(rid);
--���¼���limiteduser���Է�����Ա�޸�����Ʒ�ļ۸�
UPDATE room set limiteduser=trunc(pprice/to_number(roomtype)),falseuser=trunc(limiteduser*newfaultuser/100) WHERE roomid=rid and roomtype!='0' and roomtype!='9' and roomtype!='3' ;
UPDATE room set limiteduser=trunc(pprice/10) WHERE roomid=rid and roomtype='0';
--��ʼ��ˮ������

select falseuser into fuser from room where roomid=rid;
insert into sitdown select * from (select rownum rn , -1,sysdate from dual connect by rownum <= 5000 order by dbms_random.value) where rownum <=fuser;
update sitdown set roomid=rid where roomid=-1;
--���رյķ����
update room set isopen=to_char(to_number(isopen)-3) where roomid=rid;
returnval:=1; 
commit;
return;
END beginOrder1P;

/

--------------------------------------------------------
--  DDL for Procedure BEGINORDER2P
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "BEGINORDER2P" 
( uuid IN NUMBER
, returnval OUT NUMBER
) IS
JYB number;
ptotal number; 
BEGIN
select trunc(sum(price*amount)) into ptotal from product,cart where cart.productID=product.productID and orderID=0 and userid=uuid;
select jinyanbi into JYB from uuser where userid=uuid;
if ptotal<=JYB then
begin
insert into orders (orderID,userID,Statement,RoomID) values("S_Orders".nextval,uuid,0,0);
update cart set orderID=(select max(orderID) from Orders where userid=uuid) where userid=uuid and orderID=0;
update uuser set jinyanbi=jinyanbi-ptotal where userid=uuid; 
returnval:=1; 
end;
else
returnval:=0;
end if; 
commit;
return;
END beginOrder2P;

/

--------------------------------------------------------
--  DDL for Procedure ENDTRADEP
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ENDTRADEP" 
( rid IN NUMBER
) AS
BEGIN
  delete from sitdown where roomid= rid; 
  update room set falseuser= newfaultuser where statement=1 and roomid=rid;
END ENDTRADEP;

/

--------------------------------------------------------
--  DDL for Procedure RETURNGOODSP
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "RETURNGOODSP" 
( pid IN NUMBER
, ooid IN NUMBER
, shuliang IN NUMBER DEFAULT 1
, uuid IN NUMBER
,rid IN NUMBER
, returnval OUT NUMBER
) IS
pshu number;
strSQL VARCHAR2 (2000);
BEGIN
strSQL:='select amount from cart where productID=' || to_char(pid) || ' and orderID=' || to_char(ooid);
EXECUTE IMMEDIATE strSQL into pshu ;
if pshu< shuliang THEN
begin
returnval:= 0;
return; 
END;
else
begin
UPDATE orders set statement='4',rejecttime=sysdate where orderid=ooid;
UPDATE cart set amount= amount- shuliang where orderid= ooid and productid= pid;
UPDATE product set left=left+ shuliang,sale_num=sale_num-shuliang where productid=pid;
select to_number(roomtype) into pshu from room where roomid= rid;
if pshu=0 then pshu:=10; end if;
if pshu!=3 and pshu!=9 THEN
update uuser set account= account+ pshu*shuliang where userid= uuid;
else 
begin 
SELECT trunc(price) into pshu from product where productid= pid; 
if pshu=3 then
UPDATE uuser set jinyanbi= jinyanbi+ pshu*shuliang where userid= uuid;
else
UPDATE uuser set jinyanbi= jinyanbi+ pshu*shuliang/10 where userid= uuid;
end if;
end;
end if;
delete from cart where amount=0;
returnval:=1; 
end;
end if;
commit;
return;
END RETURNGOODSP;

/

--------------------------------------------------------
--  DDL for Procedure USERSITDOWN
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "USERSITDOWN" 
( uuid in number --userid
, rrid in number --roomid
, returnresult out number --result: 0����ر�  1ûǮ   2����   3����ʧ��   4һ��ɹ�  5���һ���û��ɹ�
) as 
leftseat NUMBER;
moneyenough NUMBER;
roomopen NUMBER;
pprice NUMBER;
ppid NUMBER;
roomtypeprice NUMBER;  
roomprice NUMBER;   --ÿ����Ӧ�ÿ۵���Ǯ
rsitnum NUMBER;


begin

returnresult:=3;
SELECT Count(*) into rsitnum from sitdown where roomid= rrid;
--ʣ����λ��
select limiteduser-rsitnum into leftseat from  room where roomid= rrid;

select trunc(to_number(roomtype)) into roomtypeprice from room where roomid= rrid;
select productid into ppid from room where roomid= rrid;
SELECT price into pprice from product where productid= ppid;

-- Ǯ������
if roomtypeprice=1 or roomtypeprice=2 or roomtypeprice=5 then
  begin
    roomprice:= roomtypeprice;
  end;
ELSE if roomtypeprice=0 then
        begin 
          roomprice:= 10;
        end;
    else if roomtypeprice=3 then
            begin 
              roomprice:= pprice/10;
            end;
        else
            begin 
              roomprice:= 0;
              returnresult:=3;
               RETURN;
            end;
        end if;
      end if;
end if;
select count(*) into moneyenough from uuser where userid= uuid and  account>= roomprice;


-- �����Ƿ񿪷�
SELECT trunc(to_number(isopen)) into roomopen from room WHERE roomid= rrid;

if moneyenough!=0  then
  begin
    if leftseat=1 and roomopen=1 then
        -- �رշ���, ��Ǯ, Ȼ��ռ�������һ����¼�� 
        begin
          update room set isopen=isopen+3 where roomid= rrid;
          update uuser set account= account- roomprice where userid= uuid;
          insert into sitdown values(uuid, rrid,sysdate);
          returnresult:=5;
        end;
        
    else if leftseat>1  and roomopen=1 then
        --��Ǯ��Ȼ��ռ�������һ����¼
        begin
          update uuser set account= account- roomprice where userid= uuid;
          insert into sitdown values(uuid, rrid,sysdate);
          if leftseat<7 then
            INSERT into gonggao(gonggaotime,content,contype) values(sysdate, rrid||'�ŷ��ۻ���'|| (leftseat��1)||'��',1);
          end if;
          returnresult:=4;
        end;
        
        else if  roomopen!=1 then
                returnresult:=0;
        
              else if  leftseat<1 then
                  returnresult:=2; 
                  else
                    null;
                  end if;
              end if;
        end if;
    end if;
  end;
  
else
  returnresult:=1;
end if;


COMMIT;
RETURN;
end usersitdown;

/

--------------------------------------------------------
--  DDL for Procedure USERSTAND
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "USERSTAND" 
( uuid in number  --userid
, rrid in number --roomid
, limittime in number --������೤ʱ�������������λ����
, returnresult out number --result: 0����ر�  1û��ռ��   2ռ��ʱ��û��   3����ʧ��   4�ɹ�
) as
sitdown NUMBER; --�Ƿ�ռ��
sittime NUMBER; --ռ��ʱ��
roomopen NUMBER; --�����Ƿ񿪷�
pprice NUMBER;
roomtypeprice NUMBER;  
roomprice NUMBER;   --ÿ����Ӧ�ÿ۵���Ǯ

begin

    select trunc(to_number(roomtype)) into roomtypeprice from room where roomid= rrid;
    SELECT price into pprice from product,room where room.productid=product.productid and  roomid=rrid;
    
    if roomtypeprice=1 or roomtypeprice=2 or roomtypeprice=5 then
      begin
        roomprice:= roomtypeprice;
      end;
    ELSE if roomtypeprice=0 then
            begin 
              roomprice:= 10;
            end;
        else if roomtypeprice=3 then
                begin 
                  roomprice:= pprice/10;
                end;
            else
                begin 
                  roomprice:= 0;
                  returnresult:=3;
                   RETURN;
                end;
            end if;
          end if;
    end if;
    
    
    
    returnresult:=3;
  --��������������������������ռ����û�У����ռ��ʱ�䲻���������˳�
  select count(*) into sitdown from sitdown where userid= uuid and roomid= rrid;
 
  if sitdown=1 then
    begin
      select round(to_number(sysdate-sittime)*24*60) as minute into sittime from sitdown where userid= uuid and roomid= rrid; 
      if sittime>= limittime then
        begin 
           select trunc(to_number(isopen)) into roomopen FROM room where roomid= rrid;
           if roomopen=1 then 
            begin 
              --Ȼ��Ǯ��ɾ��sitroom  
              update uuser set account= account + roomprice where userid= uuid;
              delete  sitdown where userid= uuid and roomid= rrid;
              returnresult:=4;
            end;
          else
            returnresult:=0;
          end if;
        end;
      else 
        returnresult:=2;
      end if;
    end;
  else
    returnresult:=1;
  end if; 
  
end userstand;

/

