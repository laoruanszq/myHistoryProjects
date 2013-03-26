--------------------------------------------------------
--  File created - ������-ʮ��-07-2012   
--------------------------------------------------------
  DROP TABLE "SZQ"."AD" cascade constraints;
  DROP TABLE "SZQ"."ADMINUSER" cascade constraints;
  DROP TABLE "SZQ"."CART" cascade constraints;
  DROP TABLE "SZQ"."DISS" cascade constraints;
  DROP TABLE "SZQ"."DISSROOM" cascade constraints;
  DROP TABLE "SZQ"."ENTERROOM" cascade constraints;
  DROP TABLE "SZQ"."INNERMAIL" cascade constraints;
  DROP TABLE "SZQ"."ORDERS" cascade constraints;
  DROP TABLE "SZQ"."PRODUCT" cascade constraints;
  DROP TABLE "SZQ"."PRODUCT_CATA" cascade constraints;
  DROP TABLE "SZQ"."ROOM" cascade constraints;
  DROP TABLE "SZQ"."SITDOWN" cascade constraints;
  DROP TABLE "SZQ"."UUSER" cascade constraints;
  DROP SEQUENCE "SZQ"."S1";
  DROP SEQUENCE "SZQ"."S_DissRoom";
  DROP SEQUENCE "SZQ"."S_InnerMail";
  DROP SEQUENCE "SZQ"."S_Orders";
  DROP SEQUENCE "SZQ"."S_PRODUCT";
  DROP SEQUENCE "SZQ"."S_Room";
  DROP SEQUENCE "SZQ"."S_UUser";
  DROP SEQUENCE "SZQ"."S_cart";
  DROP VIEW "SZQ"."SITRATEVIEW";
  DROP PROCEDURE "SZQ"."BEGINORDER1P";
  DROP PROCEDURE "SZQ"."BEGINORDER2P";
  DROP PROCEDURE "SZQ"."RETURNGOODSP";
--------------------------------------------------------
--  DDL for Sequence S1
--------------------------------------------------------

   CREATE SEQUENCE  "SZQ"."S1"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 101 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence S_DissRoom
--------------------------------------------------------

   CREATE SEQUENCE  "SZQ"."S_DissRoom"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 101 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence S_InnerMail
--------------------------------------------------------

   CREATE SEQUENCE  "SZQ"."S_InnerMail"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence S_Orders
--------------------------------------------------------

   CREATE SEQUENCE  "SZQ"."S_Orders"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence S_PRODUCT
--------------------------------------------------------

   CREATE SEQUENCE  "SZQ"."S_PRODUCT"  MINVALUE 4 MAXVALUE 9999999999999999 INCREMENT BY 1 START WITH 44 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence S_Room
--------------------------------------------------------

   CREATE SEQUENCE  "SZQ"."S_Room"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence S_UUser
--------------------------------------------------------

   CREATE SEQUENCE  "SZQ"."S_UUser"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence S_cart
--------------------------------------------------------

   CREATE SEQUENCE  "SZQ"."S_cart"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table AD
--------------------------------------------------------

  CREATE TABLE "SZQ"."AD" 
   (	"AD1_PIC" VARCHAR2(50 BYTE), 
	"AD1_DEF_PIC" VARCHAR2(50 BYTE), 
	"AD1_BEGIN" DATE, 
	"AD1_END" DATE, 
	"AD2_PIC" VARCHAR2(50 BYTE), 
	"AD2_DEF_PIC" VARCHAR2(50 BYTE), 
	"AD2_BEGIN" DATE, 
	"AD2_END" DATE, 
	"AD3_PIC" VARCHAR2(50 BYTE), 
	"AD3_DEF_PIC" VARCHAR2(50 BYTE), 
	"AD3_BEGIN" DATE, 
	"AD3_END" DATE, 
	"AD1_URL" VARCHAR2(50 BYTE), 
	"AD2_URL" VARCHAR2(50 BYTE), 
	"AD3_URL" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON TABLE "SZQ"."AD"  IS '���';
--------------------------------------------------------
--  DDL for Table ADMINUSER
--------------------------------------------------------

  CREATE TABLE "SZQ"."ADMINUSER" 
   (	"UNAME" VARCHAR2(50 BYTE), 
	"PWD" VARCHAR2(20 BYTE), 
	"UTYPE" CHAR(1 BYTE) DEFAULT 4
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON TABLE "SZQ"."ADMINUSER"  IS '����Ա�û�
Type 0 : ��������Ա
         1��һ�����Ա';
--------------------------------------------------------
--  DDL for Table CART
--------------------------------------------------------

  CREATE TABLE "SZQ"."CART" 
   (	"PRODUCTID" NUMBER(6,0), 
	"AMOUNT" NUMBER(*,0), 
	"ORDERID" NUMBER(*,0), 
	"CARTID" NUMBER(6,0), 
	"USERID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table DISS
--------------------------------------------------------

  CREATE TABLE "SZQ"."DISS" 
   (	"DISSCUSSID" CHAR(10 BYTE), 
	"CONTENT" VARCHAR2(400 BYTE), 
	"DISSTIME" DATE, 
	"DISSTITLE" VARCHAR2(200 BYTE), 
	"USERID" NUMBER, 
	"DISSTYPE" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table DISSROOM
--------------------------------------------------------

  CREATE TABLE "SZQ"."DISSROOM" 
   (	"DISSID" NUMBER(6,0), 
	"USERID" NUMBER, 
	"DISSTIME" DATE, 
	"CONTENT" VARCHAR2(400 BYTE), 
	"DISS_ROOM" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON TABLE "SZQ"."DISSROOM"  IS 'Diss_Room:  �������ڵķ����,0�ŷ�������ҳ��������.';
--------------------------------------------------------
--  DDL for Table ENTERROOM
--------------------------------------------------------

  CREATE TABLE "SZQ"."ENTERROOM" 
   (	"ROOMNO" VARCHAR2(50 BYTE), 
	"USERID" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
 

   COMMENT ON TABLE "SZQ"."ENTERROOM"  IS '���佻��һ�������������';
--------------------------------------------------------
--  DDL for Table INNERMAIL
--------------------------------------------------------

  CREATE TABLE "SZQ"."INNERMAIL" 
   (	"MAILID" NUMBER(6,0), 
	"MTITLE" VARCHAR2(200 BYTE), 
	"SENDER" NUMBER, 
	"RECEIVER" NUMBER, 
	"CONTENT" VARCHAR2(400 BYTE), 
	"ISOPEN" CHAR(2 CHAR) DEFAULT 0, 
	"SENDTIME" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON TABLE "SZQ"."INNERMAIL"  IS '����Ա���Ը��û����ʼ����û�֮����Է�վ����';
--------------------------------------------------------
--  DDL for Table ORDERS
--------------------------------------------------------

  CREATE TABLE "SZQ"."ORDERS" 
   (	"ORDERID" NUMBER(6,0), 
	"USERID" NUMBER, 
	"STATEMENT" CHAR(1 BYTE) DEFAULT 0, 
	"ROOMID" NUMBER, 
	"ORDERTIME" DATE, 
	"SENDTIME" DATE, 
	"ACCEPTTIME" DATE, 
	"REJECTTIME" DATE, 
	"DESCRIPTION" VARCHAR2(50 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "SZQ"."ORDERS"."ORDERID" IS 'orderid=0Ϊ���й��ﳵ�еĻ�����Ʒ';
 
   COMMENT ON COLUMN "SZQ"."ORDERS"."STATEMENT" IS '0���������ɣ�1��������2���ʹ��ݣ���3��ȷ���ջ����û�����4���˻�';
 
   COMMENT ON COLUMN "SZQ"."ORDERS"."ORDERTIME" IS '�µ�ʱ��';
 
   COMMENT ON COLUMN "SZQ"."ORDERS"."SENDTIME" IS '��������';
 
   COMMENT ON COLUMN "SZQ"."ORDERS"."DESCRIPTION" IS '����ע��';
 
   COMMENT ON TABLE "SZQ"."ORDERS"  IS '���������������߲����Ժ��Զ�����һ��������Ϣ���ر��˹��ﳵ�н����Ҳ�Զ�����һ��������Ϣ��
RoomS: 0 Ϊ����������Ʒ������Ϊ������';
--------------------------------------------------------
--  DDL for Table PRODUCT
--------------------------------------------------------

  CREATE TABLE "SZQ"."PRODUCT" 
   (	"PRODUCTID" NUMBER(*,0), 
	"PRONAME" VARCHAR2(50 BYTE), 
	"PROTITLE" VARCHAR2(100 BYTE), 
	"PROSIZE" VARCHAR2(20 BYTE), 
	"PRICE" NUMBER(10,2), 
	"COLOR" VARCHAR2(20 BYTE), 
	"LEFT" NUMBER(*,0) DEFAULT 0, 
	"ALARM" NUMBER(*,0) DEFAULT 0, 
	"ISCHEAP" CHAR(1 BYTE) DEFAULT 0, 
	"ISONLYONE" CHAR(1 BYTE) DEFAULT 0, 
	"ISONLYTEN" CHAR(1 BYTE) DEFAULT 0, 
	"ANNOTATION1" VARCHAR2(400 BYTE), 
	"ANNOTATION2" VARCHAR2(400 BYTE), 
	"ANNOTATION3" VARCHAR2(400 BYTE), 
	"ANNOTATION4" VARCHAR2(400 BYTE), 
	"ANNOTATION5" VARCHAR2(400 BYTE), 
	"PCID" CHAR(6 BYTE), 
	"PICTURE1" VARCHAR2(50 BYTE), 
	"PICTURE2" VARCHAR2(50 BYTE), 
	"PICTURE3" VARCHAR2(50 BYTE), 
	"SALE_NUM" NUMBER(*,0) DEFAULT 0, 
	"UPLOAD_TIME" DATE, 
	"BRAND" VARCHAR2(20 BYTE), 
	"ISJINGYANBI" CHAR(1 BYTE) DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PRODUCT_CATA
--------------------------------------------------------

  CREATE TABLE "SZQ"."PRODUCT_CATA" 
   (	"PCID" CHAR(6 BYTE), 
	"PCNAME" VARCHAR2(30 BYTE), 
	"FATHER" VARCHAR2(30 BYTE), 
	"GRANDFATHER" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON TABLE "SZQ"."PRODUCT_CATA"  IS '��Ʒ���
  ���룺ǰ��λ��ʾһ�����࣬�м���λ��ʾ2�����࣬������λ��ʾ��������
';
--------------------------------------------------------
--  DDL for Table ROOM
--------------------------------------------------------

  CREATE TABLE "SZQ"."ROOM" 
   (	"ROOMID" NUMBER(6,0), 
	"PRODUCTID" NUMBER(*,0), 
	"STATEMENT" CHAR(1 BYTE) DEFAULT 0, 
	"FALSEUSER" NUMBER(*,0), 
	"LIMITEDUSER" NUMBER(*,0), 
	"ROOMTYPE" CHAR(20 CHAR), 
	"NEWFAULTUSER" NUMBER DEFAULT 0, 
	"ISOPEN" CHAR(1 BYTE) DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON COLUMN "SZQ"."ROOM"."STATEMENT" IS '0����ʹ��ˮ����1��ʹ��';
 
   COMMENT ON COLUMN "SZQ"."ROOM"."NEWFAULTUSER" IS '�µ�ˮ������';
--------------------------------------------------------
--  DDL for Table SITDOWN
--------------------------------------------------------

  CREATE TABLE "SZQ"."SITDOWN" 
   (	"USERID" NUMBER, 
	"ROOMID" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON TABLE "SZQ"."SITDOWN"  IS 'ռ�������佻��һ�������������';
--------------------------------------------------------
--  DDL for Table UUSER
--------------------------------------------------------

  CREATE TABLE "SZQ"."UUSER" 
   (	"USERID" NUMBER(6,0), 
	"USERNAME" VARCHAR2(50 BYTE), 
	"PASSWORD" VARCHAR2(20 BYTE), 
	"TRUENAME" VARCHAR2(20 BYTE), 
	"EMAIL" VARCHAR2(50 BYTE), 
	"COLLEGE_CITY" VARCHAR2(20 BYTE), 
	"IDENTIFYNO" VARCHAR2(20 BYTE), 
	"ADDRESS" VARCHAR2(100 BYTE), 
	"ZIPCODE" CHAR(6 BYTE), 
	"CELLPHONE" VARCHAR2(20 BYTE), 
	"PHONE" VARCHAR2(20 BYTE), 
	"USERTYPE" CHAR(1 BYTE), 
	"QUESTION1" VARCHAR2(100 BYTE), 
	"QUESTION2" VARCHAR2(100 BYTE), 
	"QUESTION3" VARCHAR2(100 BYTE), 
	"ANSWER1" VARCHAR2(100 BYTE), 
	"ANSWER2" VARCHAR2(100 BYTE), 
	"ANSWER3" VARCHAR2(100 BYTE), 
	"PICTURE_HEAD" VARCHAR2(100 BYTE), 
	"ACCOUNT" NUMBER(8,2) DEFAULT 0, 
	"JINYANBI" NUMBER(8,2), 
	"UNIVERSITY_PROVINCE" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

   COMMENT ON TABLE "SZQ"."UUSER"  IS 'һ���û���������վע���û���ˮ����������ɣ�����ˮ��Ϊǰ5000���û��������Ϊ�������û�
University_Province   Ŀǰ�׶�����ֶα�ʾ�û����ڵ�ѧУ����������ֶο��ܱ�ʾ�û����ڵ�ʡ
College_City  Ŀǰ�׶�����ֶα�ʾ�û����ڵ�ѧԺ����������ֶο��ܱ�ʾ�û����ڵ���
IdentifyNo Ŀǰ�׶�����ֶα�ʾ�û���ѧ�ţ���������ֶο��ܱ�ʾ�û����֤��
UserTypeΪ1��ʾһ���û���Ϊ0��ʾˮ����
UserID,�Զ����ɣ����Ϊ1-5000 ��Ϊˮ��������Ϊ��ͨ�û�';

---------------------------------------------------
--   DATA FOR TABLE AD
--   FILTER = none used
---------------------------------------------------
REM INSERTING into SZQ.AD
Insert into SZQ.AD (AD1_PIC,AD1_DEF_PIC,AD1_BEGIN,AD1_END,AD2_PIC,AD2_DEF_PIC,AD2_BEGIN,AD2_END,AD3_PIC,AD3_DEF_PIC,AD3_BEGIN,AD3_END,AD1_URL,AD2_URL,AD3_URL) values ('../../Images/AD/jerryfish.jpg','../../Images/AD/jerryfish.jpg',to_timestamp('18-9�� -12 12.00.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('18-12��-12 12.00.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'H:\YiYuanGou\Images\AD\p1.jpg','../../Images/AD/jerryfish.jpg',to_timestamp('08-9�� -12 12.00.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('31-12��-12 12.00.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),null,'H:\YiYuanGou\Images\AD\p1.jpg',null,null,null,null,null);

---------------------------------------------------
--   END DATA FOR TABLE AD
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE ADMINUSER
--   FILTER = none used
---------------------------------------------------
REM INSERTING into SZQ.ADMINUSER
Insert into SZQ.ADMINUSER (UNAME,PWD,UTYPE) values ('admin','123','0');
Insert into SZQ.ADMINUSER (UNAME,PWD,UTYPE) values ('admin1','123','1');
Insert into SZQ.ADMINUSER (UNAME,PWD,UTYPE) values ('admin2','123','2');
Insert into SZQ.ADMINUSER (UNAME,PWD,UTYPE) values ('admin3','123','3');
Insert into SZQ.ADMINUSER (UNAME,PWD,UTYPE) values ('admin4','123','4');
Insert into SZQ.ADMINUSER (UNAME,PWD,UTYPE) values ('admin5','123','5');

---------------------------------------------------
--   END DATA FOR TABLE ADMINUSER
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE CART
--   FILTER = none used
---------------------------------------------------
REM INSERTING into SZQ.CART
Insert into SZQ.CART (PRODUCTID,AMOUNT,ORDERID,CARTID,USERID) values (2,1,8,11,1);
Insert into SZQ.CART (PRODUCTID,AMOUNT,ORDERID,CARTID,USERID) values (1,13,1,1,1);
Insert into SZQ.CART (PRODUCTID,AMOUNT,ORDERID,CARTID,USERID) values (2,5,1,5,1);
Insert into SZQ.CART (PRODUCTID,AMOUNT,ORDERID,CARTID,USERID) values (2,1,5,10,1);
Insert into SZQ.CART (PRODUCTID,AMOUNT,ORDERID,CARTID,USERID) values (2,8,27,27,1);
Insert into SZQ.CART (PRODUCTID,AMOUNT,ORDERID,CARTID,USERID) values (2,1,28,28,1);
Insert into SZQ.CART (PRODUCTID,AMOUNT,ORDERID,CARTID,USERID) values (2,1,21,22,1);

---------------------------------------------------
--   END DATA FOR TABLE CART
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE DISS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into SZQ.DISS

---------------------------------------------------
--   END DATA FOR TABLE DISS
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE DISSROOM
--   FILTER = none used
---------------------------------------------------
REM INSERTING into SZQ.DISSROOM
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (17,0,to_timestamp('15-9�� -12 09.30.58.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'sss',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (18,0,to_timestamp('15-9�� -12 09.31.33.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'������',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (19,0,to_timestamp('15-9�� -12 09.31.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'��Ե�',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (20,0,to_timestamp('15-9�� -12 09.31.44.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'��Ե�',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (21,0,to_timestamp('15-9�� -12 09.31.48.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'dsd��',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (22,0,to_timestamp('15-9�� -12 09.31.54.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'1231231231',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (23,0,to_timestamp('15-9�� -12 09.32.39.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'23132',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (24,0,to_timestamp('15-9�� -12 09.34.18.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'ΪǮ��ȥ',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (25,0,to_timestamp('15-9�� -12 09.34.20.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'ΪǮ��ȥ',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (26,0,to_timestamp('15-9�� -12 09.34.25.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'12312',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (27,0,to_timestamp('15-9�� -12 09.34.27.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'12312',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (28,0,to_timestamp('15-9�� -12 09.35.59.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'��˹��',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (29,0,to_timestamp('15-9�� -12 09.36.03.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'�������',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (30,0,to_timestamp('15-9�� -12 09.36.07.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'����',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (31,0,to_timestamp('15-9�� -12 09.36.23.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'33333',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (32,0,to_timestamp('15-9�� -12 09.36.27.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'111',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (33,0,to_timestamp('15-9�� -12 09.36.31.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'11110',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (34,0,to_timestamp('15-9�� -12 09.36.36.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'000',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (35,0,to_timestamp('15-9�� -12 09.36.51.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'00',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (36,0,to_timestamp('15-9�� -12 09.36.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'0',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (37,0,to_timestamp('15-9�� -12 09.36.56.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'0',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (38,0,to_timestamp('15-9�� -12 09.36.58.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'0',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (39,0,to_timestamp('15-9�� -12 09.37.01.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),' ',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (40,0,to_timestamp('15-9�� -12 09.37.06.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),null,0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (41,0,to_timestamp('15-9�� -12 09.37.08.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),' ',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (42,0,to_timestamp('15-9�� -12 09.37.10.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),' ',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (43,0,to_timestamp('15-9�� -12 09.37.11.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),' ',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (44,0,to_timestamp('15-9�� -12 09.37.12.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),' ',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (46,1,to_timestamp('15-9�� -12 09.40.47.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'321',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (47,1,to_timestamp('15-9�� -12 09.40.48.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'32',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (50,1,to_timestamp('15-9�� -12 09.40.53.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'123',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (53,1,to_timestamp('15-9�� -12 09.41.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'12312',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (56,1,to_timestamp('15-9�� -12 09.41.46.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'sdfs',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (60,1,to_timestamp('15-9�� -12 11.06.04.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'asd',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (62,1,to_timestamp('15-9�� -12 11.06.47.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'123 ',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (57,0,to_timestamp('15-9�� -12 11.05.13.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'aaa',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (59,1,to_timestamp('15-9�� -12 11.06.02.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'asda',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (61,0,to_timestamp('15-9�� -12 11.06.37.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'aaa',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (1,1,to_timestamp('14-12��-07 02.10.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'���˵����',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (2,1,to_timestamp('14-12��-07 02.10.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'���˵����',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (3,1,to_timestamp('14-12��-07 02.10.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'���˵����',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (4,1,to_timestamp('15-12��-07 02.10.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'���˵����',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (5,1,to_timestamp('15-12��-08 02.10.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'���˵����',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (15,0,to_timestamp('15-9�� -12 09.25.07.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'˵��',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (16,0,to_timestamp('15-9�� -12 09.25.07.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'˵��',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (45,1,to_timestamp('15-9�� -12 09.40.42.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'123',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (48,1,to_timestamp('15-9�� -12 09.40.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'231',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (51,1,to_timestamp('15-9�� -12 09.40.54.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'123',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (54,1,to_timestamp('15-9�� -12 09.41.42.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'4342',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (58,1,to_timestamp('15-9�� -12 11.05.30.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'111',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (49,1,to_timestamp('15-9�� -12 09.40.51.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'1231',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (52,1,to_timestamp('15-9�� -12 09.41.39.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'123',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (55,1,to_timestamp('15-9�� -12 09.41.45.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'dasda',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (81,0,to_timestamp('29-9�� -12 11.17.27.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'312',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (82,0,to_timestamp('30-9�� -12 09.53.27.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'hello',0);
Insert into SZQ.DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (83,0,to_timestamp('30-9�� -12 09.54.09.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'welcome',0);

---------------------------------------------------
--   END DATA FOR TABLE DISSROOM
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE ENTERROOM
--   FILTER = none used
---------------------------------------------------
REM INSERTING into SZQ.ENTERROOM

---------------------------------------------------
--   END DATA FOR TABLE ENTERROOM
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE INNERMAIL
--   FILTER = none used
---------------------------------------------------
REM INSERTING into SZQ.INNERMAIL
Insert into SZQ.INNERMAIL (MAILID,MTITLE,SENDER,RECEIVER,CONTENT,ISOPEN,SENDTIME) values (61,'again',0,1,'I am your friend','1 ',to_timestamp('29-8�� -12 01.49.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SZQ.INNERMAIL (MAILID,MTITLE,SENDER,RECEIVER,CONTENT,ISOPEN,SENDTIME) values (62,'again',0,2,'I am your friend','0 ',to_timestamp('29-8�� -12 01.49.56.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SZQ.INNERMAIL (MAILID,MTITLE,SENDER,RECEIVER,CONTENT,ISOPEN,SENDTIME) values (63,'yet',0,1,'sorry','0 ',to_timestamp('29-8�� -12 01.53.27.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SZQ.INNERMAIL (MAILID,MTITLE,SENDER,RECEIVER,CONTENT,ISOPEN,SENDTIME) values (64,'thank you',0,2,'from wah','0 ',to_timestamp('29-8�� -12 01.54.13.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SZQ.INNERMAIL (MAILID,MTITLE,SENDER,RECEIVER,CONTENT,ISOPEN,SENDTIME) values (65,'from wah',0,1,'test mail','0 ',to_timestamp('29-8�� -12 01.58.02.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SZQ.INNERMAIL (MAILID,MTITLE,SENDER,RECEIVER,CONTENT,ISOPEN,SENDTIME) values (66,'from wah',0,2,'test mail','0 ',to_timestamp('29-8�� -12 01.58.04.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SZQ.INNERMAIL (MAILID,MTITLE,SENDER,RECEIVER,CONTENT,ISOPEN,SENDTIME) values (67,'apple',0,1,'a red apple','0 ',to_timestamp('29-8�� -12 01.58.40.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SZQ.INNERMAIL (MAILID,MTITLE,SENDER,RECEIVER,CONTENT,ISOPEN,SENDTIME) values (68,'hello',0,1,'this a hello email for you','1 ',to_timestamp('29-8�� -12 01.45.29.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SZQ.INNERMAIL (MAILID,MTITLE,SENDER,RECEIVER,CONTENT,ISOPEN,SENDTIME) values (69,'hello',0,2,'this a hello email for you','0 ',to_timestamp('29-8�� -12 01.45.29.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SZQ.INNERMAIL (MAILID,MTITLE,SENDER,RECEIVER,CONTENT,ISOPEN,SENDTIME) values (70,'һԪ����վ��Ʒ�ѷ�������ע�����!',0,1,'�𾴵Ŀͻ�������һԪ����վ����Ͷ�����õ���Ʒ��sas  ;  ;  ����2012/8/30 16:09:50���ͣ���ע����գ�','0 ',to_timestamp('30-8�� -12 04.09.51.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SZQ.INNERMAIL (MAILID,MTITLE,SENDER,RECEIVER,CONTENT,ISOPEN,SENDTIME) values (71,'һԪ����վ��Ʒ�ѷ�������ע�����!',0,1,'�𾴵Ŀͻ�������һԪ����վ����Ͷ�����õ���Ʒ��sas  ;  ;  ����2012/8/30 16:09:51���ͣ���ע����գ�','0 ',to_timestamp('30-8�� -12 04.09.51.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SZQ.INNERMAIL (MAILID,MTITLE,SENDER,RECEIVER,CONTENT,ISOPEN,SENDTIME) values (72,'һԪ����վ��Ʒ�ѷ�������ע�����!',0,1,'�𾴵Ŀͻ�������һԪ����վ����Ͷ�����õ���Ʒ��sas  ;  ;  ����2012/8/30 16:35:18���ͣ���ע����գ�','0 ',to_timestamp('30-8�� -12 04.35.18.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SZQ.INNERMAIL (MAILID,MTITLE,SENDER,RECEIVER,CONTENT,ISOPEN,SENDTIME) values (73,'һԪ����վ��Ʒ�ѷ�������ע�����!',0,1,'�𾴵Ŀͻ�������һԪ����վ����Ͷ�����õ���Ʒ��sas  ;  ;  ����2012/8/30 16:35:18���ͣ���ע����գ�','0 ',to_timestamp('30-8�� -12 04.35.18.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SZQ.INNERMAIL (MAILID,MTITLE,SENDER,RECEIVER,CONTENT,ISOPEN,SENDTIME) values (2,'asdas',1,1,'asdas','0 ',to_timestamp('26-7�� -14 12.00.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SZQ.INNERMAIL (MAILID,MTITLE,SENDER,RECEIVER,CONTENT,ISOPEN,SENDTIME) values (3,'ew',3,1,'sda','0 ',to_timestamp('26-7�� -20 12.00.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SZQ.INNERMAIL (MAILID,MTITLE,SENDER,RECEIVER,CONTENT,ISOPEN,SENDTIME) values (81,'һԪ����վ��Ʒ�ѷ�������ע�����!',0,1,'�𾴵Ŀͻ�������һԪ����վ����Ͷ�����õ���Ʒ������I9300  4.8Ӣ��  ��  ����2012/9/30 11:11:37���ͣ���ע����գ�','1 ',to_timestamp('30-9�� -12 11.11.37.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SZQ.INNERMAIL (MAILID,MTITLE,SENDER,RECEIVER,CONTENT,ISOPEN,SENDTIME) values (82,'�����͵�һԪ����վ�˻���Ʒ���յ�!',0,1,'�𾴵Ŀͻ�������һԪ����վ����ֵ�������õ���Ʒ������I9300  4.8Ӣ��  ��  �˻��Ѿ���2012/9/30 11:33:26�յ����õ���ȷ�ϣ�','1 ',to_timestamp('30-9�� -12 11.33.26.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SZQ.INNERMAIL (MAILID,MTITLE,SENDER,RECEIVER,CONTENT,ISOPEN,SENDTIME) values (83,'from admin',0,4,'hello','0 ',to_timestamp('30-9�� -12 01.02.45.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'));

---------------------------------------------------
--   END DATA FOR TABLE INNERMAIL
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE ORDERS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into SZQ.ORDERS
Insert into SZQ.ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (6,1,'0',1,null,null,null,null,null);
Insert into SZQ.ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (1,1,'2',1,to_timestamp('18-8�� -12 12.00.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),null,to_timestamp('30-9�� -12 11.26.35.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),null,null);
Insert into SZQ.ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (2,1,'3',1,to_timestamp('18-8�� -16 12.00.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),null,null,null,null);
Insert into SZQ.ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (5,1,'4',0,null,to_timestamp('30-9�� -12 11.11.20.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('30-9�� -12 05.57.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('30-9�� -12 05.59.14.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),null);
Insert into SZQ.ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (0,0,'4',0,to_timestamp('23-9�� -12 12.00.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('30-9�� -12 05.57.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('30-9�� -12 05.57.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('30-9�� -12 05.59.14.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),null);
Insert into SZQ.ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (7,1,'0',0,null,null,null,null,null);
Insert into SZQ.ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (8,1,'4',0,null,to_timestamp('30-9�� -12 11.11.45.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('30-9�� -12 05.57.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('30-9�� -12 05.59.14.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),null);
Insert into SZQ.ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (9,1,'0',1,null,null,null,null,null);
Insert into SZQ.ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (23,1,'2',0,null,to_timestamp('30-9�� -12 11.31.49.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('30-9�� -12 11.32.33.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('30-9�� -12 11.33.32.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),null);
Insert into SZQ.ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (24,1,'2',0,null,to_timestamp('30-9�� -12 05.57.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('30-9�� -12 05.57.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('30-9�� -12 05.59.14.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),null);
Insert into SZQ.ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (25,1,'2',0,null,to_timestamp('30-9�� -12 05.57.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('30-9�� -12 05.57.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('30-9�� -12 05.59.14.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),null);
Insert into SZQ.ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (26,1,'3',0,null,to_timestamp('30-9�� -12 05.57.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('30-9�� -12 05.57.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('30-9�� -12 05.59.14.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),null);
Insert into SZQ.ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (27,1,'4',0,null,to_timestamp('30-9�� -12 05.57.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('30-9�� -12 05.57.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('06-10��-12 03.59.34.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),null);
Insert into SZQ.ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (21,1,'3',0,null,null,to_timestamp('30-9�� -12 11.11.58.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),null,null);
Insert into SZQ.ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (22,1,'0',0,null,null,null,null,null);
Insert into SZQ.ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (28,1,'2',0,null,to_timestamp('30-9�� -12 05.57.28.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('30-9�� -12 05.57.50.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('30-9�� -12 05.59.14.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),null);

---------------------------------------------------
--   END DATA FOR TABLE ORDERS
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE PRODUCT
--   FILTER = none used
---------------------------------------------------
REM INSERTING into SZQ.PRODUCT
Insert into SZQ.PRODUCT (PRODUCTID,PRONAME,PROTITLE,PROSIZE,PRICE,COLOR,LEFT,ALARM,ISCHEAP,ISONLYONE,ISONLYTEN,ANNOTATION1,ANNOTATION2,ANNOTATION3,ANNOTATION4,ANNOTATION5,PCID,PICTURE1,PICTURE2,PICTURE3,SALE_NUM,UPLOAD_TIME,BRAND,ISJINGYANBI) values (2,'����I9300','GALAXY SIII����ͨ�棩','4.8Ӣ��',4200,'��',2432,10,'1','1','0',null,null,null,null,null,'010102','����I9300.jpg',null,null,2,to_timestamp('17-8�� -12 12.00.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'����','0');
Insert into SZQ.PRODUCT (PRODUCTID,PRONAME,PROTITLE,PROSIZE,PRICE,COLOR,LEFT,ALARM,ISCHEAP,ISONLYONE,ISONLYTEN,ANNOTATION1,ANNOTATION2,ANNOTATION3,ANNOTATION4,ANNOTATION5,PCID,PICTURE1,PICTURE2,PICTURE3,SALE_NUM,UPLOAD_TIME,BRAND,ISJINGYANBI) values (3,'�����','fgd ','322',242,'dfd',354,2,'0','0','1',null,null,null,null,null,'010101','p002.jpg',null,null,1231,to_timestamp('17-8�� -16 12.00.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'��ţ','0');
Insert into SZQ.PRODUCT (PRODUCTID,PRONAME,PROTITLE,PROSIZE,PRICE,COLOR,LEFT,ALARM,ISCHEAP,ISONLYONE,ISONLYTEN,ANNOTATION1,ANNOTATION2,ANNOTATION3,ANNOTATION4,ANNOTATION5,PCID,PICTURE1,PICTURE2,PICTURE3,SALE_NUM,UPLOAD_TIME,BRAND,ISJINGYANBI) values (1,'dsd','�Ǵ�˹�ٷ��㷨','asd',213,'sd',1,12,'0','1','1',null,null,null,null,null,'020101','p001.jpg',null,null,1,to_timestamp('17-8�� -17 12.00.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'12312','0');
Insert into SZQ.PRODUCT (PRODUCTID,PRONAME,PROTITLE,PROSIZE,PRICE,COLOR,LEFT,ALARM,ISCHEAP,ISONLYONE,ISONLYTEN,ANNOTATION1,ANNOTATION2,ANNOTATION3,ANNOTATION4,ANNOTATION5,PCID,PICTURE1,PICTURE2,PICTURE3,SALE_NUM,UPLOAD_TIME,BRAND,ISJINGYANBI) values (4,'sas','sfds','��',76.8,'�ٻ�',12,15,'1','1','1','���ο���','����ʡ��','��ǿ�ѹ40����','һ�γ�����󣬵�ؿ�ʹ��4Сʱ',null,'020102','test2.jpg',null,null,null,to_timestamp('18-8�� -12 12.00.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),null,'0');
Insert into SZQ.PRODUCT (PRODUCTID,PRONAME,PROTITLE,PROSIZE,PRICE,COLOR,LEFT,ALARM,ISCHEAP,ISONLYONE,ISONLYTEN,ANNOTATION1,ANNOTATION2,ANNOTATION3,ANNOTATION4,ANNOTATION5,PCID,PICTURE1,PICTURE2,PICTURE3,SALE_NUM,UPLOAD_TIME,BRAND,ISJINGYANBI) values (5,'iphone4','vfdsgdgd',null,1536,null,18,null,'0','0','0','Ӳ��500GB;�ڴ�3GB','�Կ�64Gb ','��ǿ�ѹ40����','һ�γ�����󣬵�ؿ�ʹ��4Сʱ',null,'010102','test2.jpg',null,null,null,to_timestamp('23-9�� -12 12.00.00.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),null,'1');
Insert into SZQ.PRODUCT (PRODUCTID,PRONAME,PROTITLE,PROSIZE,PRICE,COLOR,LEFT,ALARM,ISCHEAP,ISONLYONE,ISONLYTEN,ANNOTATION1,ANNOTATION2,ANNOTATION3,ANNOTATION4,ANNOTATION5,PCID,PICTURE1,PICTURE2,PICTURE3,SALE_NUM,UPLOAD_TIME,BRAND,ISJINGYANBI) values (6,'pLSQL5679s','�������¿��Ů�ö�֥�ʼǱ�','С',7800,'õ��',3,5,'0','0','0','Ӳ��500GB;�ڴ�3GB','�Կ�64Gb ','��ǿ�ѹ40����','һ�γ�����󣬵�ؿ�ʹ��4Сʱ',null,'010101','test2.jpg',null,null,0,to_timestamp('22-9�� -12 08.00.23.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'Tochiba','0');
Insert into SZQ.PRODUCT (PRODUCTID,PRONAME,PROTITLE,PROSIZE,PRICE,COLOR,LEFT,ALARM,ISCHEAP,ISONLYONE,ISONLYTEN,ANNOTATION1,ANNOTATION2,ANNOTATION3,ANNOTATION4,ANNOTATION5,PCID,PICTURE1,PICTURE2,PICTURE3,SALE_NUM,UPLOAD_TIME,BRAND,ISJINGYANBI) values (7,'probook4436s','����ռ������˿���HP�ʼǱ�','��',6500,'��',10,5,'0','0','0','Ӳ��500GB;�ڴ�3GB','�Կ�64Gb ','��ǿ�ѹ40����','һ�γ�����󣬵�ؿ�ʹ��4Сʱ',null,'010101',null,null,null,0,to_timestamp('22-9�� -12 07.50.36.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'HP','0');
Insert into SZQ.PRODUCT (PRODUCTID,PRONAME,PROTITLE,PROSIZE,PRICE,COLOR,LEFT,ALARM,ISCHEAP,ISONLYONE,ISONLYTEN,ANNOTATION1,ANNOTATION2,ANNOTATION3,ANNOTATION4,ANNOTATION5,PCID,PICTURE1,PICTURE2,PICTURE3,SALE_NUM,UPLOAD_TIME,BRAND,ISJINGYANBI) values (24,'Dell̨ʽ��','�����ȶ���ʵ��̨ʽ��','15��',3500,'��',1,5,'0','0','0','�ڴ�3Gb��DDR','cpu intel',null,null,null,'010101','p1.jpg',null,null,0,to_timestamp('30-9�� -12 10.55.32.000000000 ����','DD-MON-RR HH.MI.SS.FF AM'),'DELL','1');

---------------------------------------------------
--   END DATA FOR TABLE PRODUCT
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE PRODUCT_CATA
--   FILTER = none used
---------------------------------------------------
REM INSERTING into SZQ.PRODUCT_CATA
Insert into SZQ.PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020103','�緹��','��������','�������');
Insert into SZQ.PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020201','���ӻ�','�Ӽҵ���','�������');
Insert into SZQ.PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010102','�ֻ�','ʱ������','�������');
Insert into SZQ.PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010101','����','ʱ������','�������');
Insert into SZQ.PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020101','��ˮ��','��������','�������');
Insert into SZQ.PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020102','������','��������','�������');
Insert into SZQ.PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020202','�����','�Ӽҵ���','�������');

---------------------------------------------------
--   END DATA FOR TABLE PRODUCT_CATA
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE ROOM
--   FILTER = none used
---------------------------------------------------
REM INSERTING into SZQ.ROOM
Insert into SZQ.ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (2,1,'1',3,50,'����                  ',15,'1');
Insert into SZQ.ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (6,3,'0',10,200,'1                   ',0,'1');
Insert into SZQ.ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (7,3,'0',5,40,'5                   ',0,'1');
Insert into SZQ.ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (8,7,'1',1,1,'1                   ',0,'1');
Insert into SZQ.ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (9,6,'1',1560,7800,'1                   ',20,'1');
Insert into SZQ.ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (10,6,'1',585,3900,'2                   ',15,'0');
Insert into SZQ.ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (11,6,'0',156,1560,'5                   ',10,'0');
Insert into SZQ.ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (12,6,'1',78,780,'0                   ',10,'0');
Insert into SZQ.ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (13,2,'0',0,0,'0                   ',0,'0');
Insert into SZQ.ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (14,1,'0',0,0,'0                   ',0,null);
Insert into SZQ.ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (15,5,'1',1300,6500,'1                   ',20,null);
Insert into SZQ.ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (16,5,'1',487,3250,'2                   ',15,null);
Insert into SZQ.ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (17,5,'0',0,1300,'5                   ',0,null);
Insert into SZQ.ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (18,4,'0',0,650,'0                   ',0,null);
Insert into SZQ.ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (1,2,'1',12,12,'����                  ',10,null);
Insert into SZQ.ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (0,0,'0',0,0,'����                  ',0,null);
Insert into SZQ.ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (21,24,'1',700,3500,'1                   ',20,null);
Insert into SZQ.ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (22,24,'1',245,1750,'2                   ',14,null);
Insert into SZQ.ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (23,24,'1',105,700,'5                   ',15,null);
Insert into SZQ.ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (24,24,'1',35,350,'0                   ',10,null);

---------------------------------------------------
--   END DATA FOR TABLE ROOM
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE SITDOWN
--   FILTER = none used
---------------------------------------------------
REM INSERTING into SZQ.SITDOWN
Insert into SZQ.SITDOWN (USERID,ROOMID) values (1,1);
Insert into SZQ.SITDOWN (USERID,ROOMID) values (1,2);
Insert into SZQ.SITDOWN (USERID,ROOMID) values (2,1);

---------------------------------------------------
--   END DATA FOR TABLE SITDOWN
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE UUSER
--   FILTER = none used
---------------------------------------------------
REM INSERTING into SZQ.UUSER
Insert into SZQ.UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (1,'szq','123','���˶�����','2454@sfs.com','��Ϣ����','12131','�ķ���','235   ','123456','654321','1','�����أ�','���գ�','��ʦ��','��','��������','ĳĳ��ʦ','001.jpg',1556.2,524808.36,'SMU');
Insert into SZQ.UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (2,'22','22',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,0,null,null);
Insert into SZQ.UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (3,'wesd','23',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1100,null,null);
Insert into SZQ.UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (0,'�����û�',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,0,null,null);
Insert into SZQ.UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (4,'wah','123','��ͩ��',null,'����','20120732','��ɣ�ķ���','201306','13087905678','312156789','1',null,null,null,null,null,null,null,169,1746,'�����ѧ');

---------------------------------------------------
--   END DATA FOR TABLE UUSER
---------------------------------------------------

--------------------------------------------------------
--  Constraints for Table INNERMAIL
--------------------------------------------------------

  ALTER TABLE "SZQ"."INNERMAIL" ADD CONSTRAINT "PK_INNERMAIL" PRIMARY KEY ("MAILID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "SZQ"."INNERMAIL" MODIFY ("MAILID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table UUSER
--------------------------------------------------------

  ALTER TABLE "SZQ"."UUSER" ADD CONSTRAINT "PK_UUSER" PRIMARY KEY ("USERID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "SZQ"."UUSER" MODIFY ("USERID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CART
--------------------------------------------------------

  ALTER TABLE "SZQ"."CART" MODIFY ("CARTID" NOT NULL ENABLE);
 
  ALTER TABLE "SZQ"."CART" ADD CONSTRAINT "cart_PK" PRIMARY KEY ("CARTID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PRODUCT
--------------------------------------------------------

  ALTER TABLE "SZQ"."PRODUCT" MODIFY ("PRODUCTID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PRODUCT_CATA
--------------------------------------------------------

  ALTER TABLE "SZQ"."PRODUCT_CATA" ADD CONSTRAINT "PK_PRODUCT_CATA" PRIMARY KEY ("PCID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "SZQ"."PRODUCT_CATA" MODIFY ("PCID" NOT NULL ENABLE);

--------------------------------------------------------
--  Constraints for Table DISSROOM
--------------------------------------------------------

  ALTER TABLE "SZQ"."DISSROOM" ADD CONSTRAINT "PK_DISSROOM" PRIMARY KEY ("DISSID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "SZQ"."DISSROOM" MODIFY ("DISSID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SITDOWN
--------------------------------------------------------

  ALTER TABLE "SZQ"."SITDOWN" ADD CONSTRAINT "PK_SITDOWN" PRIMARY KEY ("USERID", "ROOMID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "SZQ"."SITDOWN" MODIFY ("USERID" NOT NULL ENABLE);
 
  ALTER TABLE "SZQ"."SITDOWN" MODIFY ("ROOMID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ADMINUSER
--------------------------------------------------------

  ALTER TABLE "SZQ"."ADMINUSER" ADD CONSTRAINT "PK_ADMINUSER" PRIMARY KEY ("UNAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "SZQ"."ADMINUSER" MODIFY ("UNAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DISS
--------------------------------------------------------

  ALTER TABLE "SZQ"."DISS" ADD CONSTRAINT "PK_DISS" PRIMARY KEY ("DISSCUSSID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "SZQ"."DISS" MODIFY ("DISSCUSSID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ROOM
--------------------------------------------------------

  ALTER TABLE "SZQ"."ROOM" ADD CONSTRAINT "PK_ROOM" PRIMARY KEY ("ROOMID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "SZQ"."ROOM" MODIFY ("ROOMID" NOT NULL ENABLE);
 
  ALTER TABLE "SZQ"."ROOM" MODIFY ("NEWFAULTUSER" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ENTERROOM
--------------------------------------------------------

  ALTER TABLE "SZQ"."ENTERROOM" ADD CONSTRAINT "PK_ENTERROOM" PRIMARY KEY ("ROOMNO", "USERID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "SZQ"."ENTERROOM" MODIFY ("ROOMNO" NOT NULL ENABLE);
 
  ALTER TABLE "SZQ"."ENTERROOM" MODIFY ("USERID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "SZQ"."ORDERS" ADD CONSTRAINT "PK_ORDERS" PRIMARY KEY ("ORDERID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "SZQ"."ORDERS" MODIFY ("ORDERID" NOT NULL ENABLE);
--------------------------------------------------------
--  DDL for Index PK_DISS
--------------------------------------------------------

  CREATE UNIQUE INDEX "SZQ"."PK_DISS" ON "SZQ"."DISS" ("DISSCUSSID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index cart_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SZQ"."cart_PK" ON "SZQ"."CART" ("CARTID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_ADMINUSER
--------------------------------------------------------

  CREATE UNIQUE INDEX "SZQ"."PK_ADMINUSER" ON "SZQ"."ADMINUSER" ("UNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_PRODUCT_CATA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SZQ"."PK_PRODUCT_CATA" ON "SZQ"."PRODUCT_CATA" ("PCID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_ROOM
--------------------------------------------------------

  CREATE UNIQUE INDEX "SZQ"."PK_ROOM" ON "SZQ"."ROOM" ("ROOMID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_INNERMAIL
--------------------------------------------------------

  CREATE UNIQUE INDEX "SZQ"."PK_INNERMAIL" ON "SZQ"."INNERMAIL" ("MAILID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_UUSER
--------------------------------------------------------

  CREATE UNIQUE INDEX "SZQ"."PK_UUSER" ON "SZQ"."UUSER" ("USERID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_SITDOWN
--------------------------------------------------------

  CREATE UNIQUE INDEX "SZQ"."PK_SITDOWN" ON "SZQ"."SITDOWN" ("USERID", "ROOMID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_DISSROOM
--------------------------------------------------------

  CREATE UNIQUE INDEX "SZQ"."PK_DISSROOM" ON "SZQ"."DISSROOM" ("DISSID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_ENTERROOM
--------------------------------------------------------

  CREATE UNIQUE INDEX "SZQ"."PK_ENTERROOM" ON "SZQ"."ENTERROOM" ("ROOMNO", "USERID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_ORDERS
--------------------------------------------------------

  CREATE UNIQUE INDEX "SZQ"."PK_ORDERS" ON "SZQ"."ORDERS" ("ORDERID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;













--------------------------------------------------------
--  DDL for Trigger INNERMAIL_T1
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SZQ"."INNERMAIL_T1" 
before insert on innermail
for each row 
begin 
      select   SZQ.S1.nextval   into:new.MAILID from sys.dual ; 
end;
/
ALTER TRIGGER "SZQ"."INNERMAIL_T1" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ROOM_T1
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SZQ"."ROOM_T1" 
before insert on room
for each row 
begin 
      select   SZQ."S_Room".nextval   into:new.RoomID from sys.dual ; 
end;
/
ALTER TRIGGER "SZQ"."ROOM_T1" ENABLE;
--------------------------------------------------------
--  DDL for View SITRATEVIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SZQ"."SITRATEVIEW" ("ROOMID", "SITRATE") AS 
  select Room.RoomID,round(count(*)/limiteduser, 5) as sitrate from Room,SitDown  where Room.RoomID=SitDown.RoomID group by Room.RoomID,limiteduser;
--------------------------------------------------------
--  DDL for Procedure BEGINORDER1P
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "SZQ"."BEGINORDER1P" 
( uuid IN NUMBER
, rid IN NUMBER
,returnval OUT NUMBER
) IS
 pid number;
 ooid number;
 rtype number;
BEGIN
   select trunc(to_number(roomtype)) into rtype from room where roomid=rid;
   insert into orders (orderID,userID,Statement,RoomID) values("S_Orders".nextval,uuid,0,rid);
   update uuser set jinyanbi= jinyanbi+ rtype where userid in (select userid from sitdown where roomid=rid);
   select max(orderID) into ooid from Orders where userid=uuid;
   select productID into pid from room where roomid=rid;
   insert into cart values(pid,1,ooid,"S_cart".nextval,uuid);
   delete sitdown where roomid=rid;
   delete enterroom where roomno=to_char(rid);
   update room set falseuser=trunc(limiteduser*newfaultuser/100) where roomid=rid;
   returnval:=1;     
   commit;
   return;
END beginOrder1P;

/

--------------------------------------------------------
--  DDL for Procedure BEGINORDER2P
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "SZQ"."BEGINORDER2P" 
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
--  DDL for Procedure RETURNGOODSP
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "SZQ"."RETURNGOODSP" 
( pid IN NUMBER
, ooid IN NUMBER
, shuliang IN NUMBER DEFAULT 1
, uuid IN NUMBER
,rid IN NUMBER
, returnval OUT NUMBER
) IS
 pshu number;
 strSQL   VARCHAR2 (2000);
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
      UPDATE product set left=left+ shuliang where productid=pid;
      if rid>0 THEN
        begin 
            select  to_number(roomtype) into pshu from room where roomid= rid;
            if pshu=0 then  pshu:=10; end if;
            update uuser set account= account+ pshu*shuliang where userid= uuid;
        end;
      else 
        begin 
            SELECT trunc(price) into pshu from product where productid= pid; 
            UPDATE uuser set jinyanbi= jinyanbi+ pshu*shuliang where userid= uuid;
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

