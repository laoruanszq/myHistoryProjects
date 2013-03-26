--------------------------------------------------------
--  File created - 星期三-十二月-26-2012   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence S1
--------------------------------------------------------

   CREATE SEQUENCE  "S1"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 121 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence S_DissRoom
--------------------------------------------------------

   CREATE SEQUENCE  "S_DissRoom"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 321 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence S_GONGGAO
--------------------------------------------------------

   CREATE SEQUENCE  "S_GONGGAO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 30 CACHE 20 NOORDER  NOCYCLE ;
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

   CREATE SEQUENCE  "S_PRODUCT"  MINVALUE 4 MAXVALUE 9999999999999999 INCREMENT BY 1 START WITH 64 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence S_Room
--------------------------------------------------------

   CREATE SEQUENCE  "S_Room"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 121 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence S_UUser
--------------------------------------------------------

   CREATE SEQUENCE  "S_UUser"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 101 CACHE 20 NOORDER  NOCYCLE ;
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
 

   COMMENT ON TABLE "AD"  IS '广告';
--------------------------------------------------------
--  DDL for Table ADMINUSER
--------------------------------------------------------

  CREATE TABLE "ADMINUSER" 
   (	"UNAME" VARCHAR2(50), 
	"PWD" VARCHAR2(20), 
	"UTYPE" CHAR(1) DEFAULT 4
   ) ;
 

   COMMENT ON TABLE "ADMINUSER"  IS '管理员用户
Type 0 : 超级管理员
         1：一般管理员';
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
 

   COMMENT ON TABLE "DISSROOM"  IS 'Diss_Room:  帖子所在的房间号,0号房间是首页的聊天室.';
--------------------------------------------------------
--  DDL for Table ENTERROOM
--------------------------------------------------------

  CREATE TABLE "ENTERROOM" 
   (	"ROOMNO" VARCHAR2(50), 
	"USERID" NUMBER
   ) ;
 

   COMMENT ON TABLE "ENTERROOM"  IS '房间交易一结束，立刻清空';
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
 

   COMMENT ON TABLE "INNERMAIL"  IS '管理员可以给用户发邮件，用户之间可以发站内信';
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
 

   COMMENT ON COLUMN "ORDERS"."ORDERID" IS 'orderid=0为所有购物车中的换购商品';
 
   COMMENT ON COLUMN "ORDERS"."STATEMENT" IS '0：订单生成，1：发货，2：送达（快递），3：确认收货（用户），4：退货';
 
   COMMENT ON COLUMN "ORDERS"."ORDERTIME" IS '下单时间';
 
   COMMENT ON COLUMN "ORDERS"."SENDTIME" IS '发货日期';
 
   COMMENT ON COLUMN "ORDERS"."DESCRIPTION" IS '订单注释';
 
   COMMENT ON TABLE "ORDERS"  IS '订单，房间幸运者产生以后，自动产生一条订单信息，特便宜购物车中结算后也自动产生一条订单信息。
RoomS: 0 为换购来的商品，否则为房间编号';
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
 

   COMMENT ON TABLE "PRODUCT_CATA"  IS '商品类别：
  编码：前两位表示一级分类，中间两位表示2级分类，后面两位表示三级分类
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
 

   COMMENT ON COLUMN "ROOM"."STATEMENT" IS '0：不使用水军，1：使用';
 
   COMMENT ON COLUMN "ROOM"."NEWFAULTUSER" IS '新的水军人数';
--------------------------------------------------------
--  DDL for Table SITDOWN
--------------------------------------------------------

  CREATE TABLE "SITDOWN" 
   (	"USERID" NUMBER, 
	"ROOMID" NUMBER(*,0), 
	"SITTIME" DATE
   ) ;
 

   COMMENT ON TABLE "SITDOWN"  IS '占座，房间交易一结束，立刻清空';
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
 

   COMMENT ON COLUMN "UUSER"."QUESTION1" IS 'question 默认为0表示无问题';
 
   COMMENT ON TABLE "UUSER"  IS '一般用户，包括网站注册用户和水军两部分组成，其中水军为前5000个用户，后面的为真正的用户
University_Province   目前阶段这个字段表示用户所在的学校，将来这个字段可能表示用户所在的省
College_City  目前阶段这个字段表示用户所在的学院，将来这个字段可能表示用户所在的市
IdentifyNo 目前阶段这个字段表示用户的学号，将来这个字段可能表示用户身份证号
UserType为1表示一般用户，为0表示水军。
UserID,自动生成，如果为1-5000 则为水军，其他为普通用户';

---------------------------------------------------
--   DATA FOR TABLE AD
--   FILTER = none used
---------------------------------------------------
REM INSERTING into AD
Insert into AD (AD1_PIC,AD1_DEF_PIC,AD1_BEGIN,AD1_END,AD2_PIC,AD2_DEF_PIC,AD2_BEGIN,AD2_END,AD3_PIC,AD3_DEF_PIC,AD3_BEGIN,AD3_END,AD1_URL,AD2_URL,AD3_URL) values ('../../Images/AD/jerryfish.jpg','../../Images/AD/jerryfish.jpg',to_timestamp('18-9月 -12 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('18-12月-12 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'H:\YiYuanGou\Images\AD\p1.jpg','../../Images/AD/jerryfish.jpg',to_timestamp('08-9月 -12 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('31-12月-12 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),null,'H:\YiYuanGou\Images\AD\p1.jpg',null,null,null,null,null);

---------------------------------------------------
--   END DATA FOR TABLE AD
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
--   DATA FOR TABLE CART
--   FILTER = none used
---------------------------------------------------
REM INSERTING into CART
Insert into CART (PRODUCTID,AMOUNT,ORDERID,CARTID,USERID) values (1,1,122,161,6);
Insert into CART (PRODUCTID,AMOUNT,ORDERID,CARTID,USERID) values (4,2,101,143,6);
Insert into CART (PRODUCTID,AMOUNT,ORDERID,CARTID,USERID) values (2,1,81,101,6);
Insert into CART (PRODUCTID,AMOUNT,ORDERID,CARTID,USERID) values (2,1,82,102,6);
Insert into CART (PRODUCTID,AMOUNT,ORDERID,CARTID,USERID) values (4,1,121,142,6);
Insert into CART (PRODUCTID,AMOUNT,ORDERID,CARTID,USERID) values (2,1,63,82,6);
Insert into CART (PRODUCTID,AMOUNT,ORDERID,CARTID,USERID) values (2,2,101,141,6);
Insert into CART (PRODUCTID,AMOUNT,ORDERID,CARTID,USERID) values (2,1,62,81,6);
Insert into CART (PRODUCTID,AMOUNT,ORDERID,CARTID,USERID) values (2,2,41,41,6);
Insert into CART (PRODUCTID,AMOUNT,ORDERID,CARTID,USERID) values (2,1,8,11,6);
Insert into CART (PRODUCTID,AMOUNT,ORDERID,CARTID,USERID) values (1,13,1,1,6);
Insert into CART (PRODUCTID,AMOUNT,ORDERID,CARTID,USERID) values (2,5,1,5,6);
Insert into CART (PRODUCTID,AMOUNT,ORDERID,CARTID,USERID) values (2,1,5,10,6);
Insert into CART (PRODUCTID,AMOUNT,ORDERID,CARTID,USERID) values (2,8,27,27,6);
Insert into CART (PRODUCTID,AMOUNT,ORDERID,CARTID,USERID) values (2,1,28,28,6);
Insert into CART (PRODUCTID,AMOUNT,ORDERID,CARTID,USERID) values (2,1,21,22,6);
Insert into CART (PRODUCTID,AMOUNT,ORDERID,CARTID,USERID) values (4,1,41,61,6);
Insert into CART (PRODUCTID,AMOUNT,ORDERID,CARTID,USERID) values (3,2,6,2,6);
Insert into CART (PRODUCTID,AMOUNT,ORDERID,CARTID,USERID) values (1,1,7,3,6);
Insert into CART (PRODUCTID,AMOUNT,ORDERID,CARTID,USERID) values (4,3,9,4,6);
Insert into CART (PRODUCTID,AMOUNT,ORDERID,CARTID,USERID) values (4,1,61,62,6);
Insert into CART (PRODUCTID,AMOUNT,ORDERID,CARTID,USERID) values (4,1,83,103,6);
Insert into CART (PRODUCTID,AMOUNT,ORDERID,CARTID,USERID) values (2,1,121,123,6);
Insert into CART (PRODUCTID,AMOUNT,ORDERID,CARTID,USERID) values (4,1,123,162,6);

---------------------------------------------------
--   END DATA FOR TABLE CART
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
--   DATA FOR TABLE DISSROOM
--   FILTER = none used
---------------------------------------------------
REM INSERTING into DISSROOM
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (302,0,to_timestamp('26-12月-12 12.21.31.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'123',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (244,6,to_timestamp('21-12月-12 10.02.30.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'这个网站真牛啊',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (245,6,to_timestamp('21-12月-12 10.05.55.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'发生地方',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (246,6,to_timestamp('21-12月-12 10.06.42.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'试试',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (249,6,to_timestamp('21-12月-12 10.06.49.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'21',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (262,0,to_timestamp('22-12月-12 03.06.26.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),null,0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (264,6,to_timestamp('22-12月-12 03.33.50.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'234234234',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (281,6,to_timestamp('23-12月-12 01.46.18.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'dfsfs',14);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (182,6,to_timestamp('13-12月-12 10.21.30.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'12432141',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (184,6,to_timestamp('13-12月-12 10.21.36.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'24321412',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (187,6,to_timestamp('13-12月-12 10.21.59.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'测试2',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (190,6,to_timestamp('13-12月-12 10.22.07.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),null,0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (192,0,to_timestamp('14-12月-12 10.53.24.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'welcome',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (193,0,to_timestamp('15-12月-12 08.01.17.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),null,0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (194,0,to_timestamp('15-12月-12 08.01.40.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'kdhfkashfkahsdkfhskjdhfkdshfkdshfkshkfhdskfhskdhfkdhfksjdhfkjsdhfkjdhskfjhdkjfhkdjhfkjdhfkjdhfkjdjhdks',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (199,0,to_timestamp('15-12月-12 08.22.53.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'welcome',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (210,0,to_timestamp('15-12月-12 08.45.42.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'hi',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (161,6,to_timestamp('13-12月-12 12.34.20.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'szq',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (191,6,to_timestamp('13-12月-12 10.22.12.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'6',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (195,0,to_timestamp('15-12月-12 08.02.18.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'kdhfkashfkahsdkfhskjdhfkdshfkdshfkshkfhdskfhskdhfkdhfksjdhfkjsdhfkjdhskfjhdkjfhkdjhfkjdhfkjdhfkjdjhdksdkjshksdhgkdfhgkjdfhgkjdfhkjhjkhkjhkjhkjhkjhkhkjhkhkhjkhkjhkjhkjhkjhkjhkhkjhkjhkjhkjhkhkjhkjhkhkjhkjhkjhkjhk',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (196,0,to_timestamp('15-12月-12 08.05.40.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'hello',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (197,0,to_timestamp('15-12月-12 08.08.27.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'hi',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (198,0,to_timestamp('15-12月-12 08.18.26.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'#%$#%$#%$#%$#%@#$@',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (205,0,to_timestamp('15-12月-12 08.31.43.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'kdhfkashfkahsdkfhskjdhfkdshfkdshfkshkfhdskfhskdhfkdhfksjdhfkjsdhfkjdhskfjhdkjfhkdjhfkjdhfkjdhfkjdjhdksdkjshksdhgkdfhgkjdfhgkjdfhkjhjkhkjhkjhkjhkjhkhkjhkhkhjkhkjhkjhkjhkjhkjhkhkjhkjhkjhkjhkhkjhkjhkhkjhkjhkjhkjhkasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqdddddddddddddddddddddddddddddddddddddddddddddd',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (211,6,to_timestamp('15-12月-12 08.47.02.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'It is funny',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (214,6,to_timestamp('15-12月-12 08.48.51.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),null,0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (181,6,to_timestamp('13-12月-12 10.21.28.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'31241243214',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (183,6,to_timestamp('13-12月-12 10.21.33.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'143214',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (185,6,to_timestamp('13-12月-12 10.21.39.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'134141',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (186,6,to_timestamp('13-12月-12 10.21.54.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'测试1',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (188,6,to_timestamp('13-12月-12 10.22.02.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'3',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (189,6,to_timestamp('13-12月-12 10.22.04.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'4',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (200,0,to_timestamp('15-12月-12 08.26.38.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'kdhfkashfkahsdkfhskjdhfkdshfkdshfkshkfhdskfhskdhfkdhfksjdhfkjsdhfkjdhskfjhdkjfhkdjhfkjdhfkjdhfkjdjhdksdkjshksdhgkdfhgkjdfhgkjdfhkjhjkhkjhkjhkjhkjhkhkjhkhkhjkhkjhkjhkjhkjhkjhkhkjhkjhkjhkjhkhkjhkjhkhkjhkjhkjhkjhk',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (202,0,to_timestamp('15-12月-12 08.29.03.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'kdhfkashfkahsdkfhskjdhfkdshfkdshfkshkfhdskfhskdhfkdhfksjdhfkjsdhfkjdhskfjhdkjfhkdjhfkjdhfkjdhfkjdjhdksdkjshksdhgkdfhgkjdfhgkjdfhkjhjkhkjhkjhkjhkjhkhkjhkhkhjkhkjhkjhkjhkjhkjhkhkjhkjhkjhkjhkhkjhkjhkhkjhkjhkjhkjhkasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (204,0,to_timestamp('15-12月-12 08.30.18.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'kdhfkashfkahsdkfhskjdhfkdshfkdshfkshkfhdskfhskdhfkdhfksjdhfkjsdhfkjdhskfjhdkjfhkdjhfkjdhfkjdhfkjdjhdksdkjshksdhgkdfhgkjdfhgkjdfhkjhjkhkjhkjhkjhkjhkhkjhkhkhjkhkjhkjhkjhkjhkjhkhkjhkjhkjhkjhkhkjhkjhkhkjhkjhkjhkjhkasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (207,0,to_timestamp('15-12月-12 08.33.17.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),null,0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (208,0,to_timestamp('15-12月-12 08.34.07.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'kdhfkashfkahsdkfhskjdhfkdshfkdshfkshkfhdskfhskdhfkdhfksjdhfkjsdhfkjdhskfjhdkjfhkdjhfkjdhfkjdhfkjdjhdksdkjshksdhgkdfhgkjdfhgkjdfhkjhjkhkjhkjhkjhkjhkhkjhkhkhjkhkjhkjhkjhkjhkjhkhkjhkjhkjhkjhkhkjhkjhkhkjhkjhkjhkjhkasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqddddddddddddddddddddddddddddddddddddddddddddddkdhfkashfkahsdkfhskjdhfkdshfkdsssssss',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (209,26,to_timestamp('15-12月-12 08.45.18.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'hello',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (212,26,to_timestamp('15-12月-12 08.47.22.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'No',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (213,6,to_timestamp('15-12月-12 08.48.50.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),null,0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (215,6,to_timestamp('15-12月-12 08.49.11.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'it is good',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (216,26,to_timestamp('15-12月-12 08.49.33.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'yes',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (217,0,to_timestamp('15-12月-12 10.30.29.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'Welcome',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (218,26,to_timestamp('15-12月-12 10.34.52.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'merry chrismas',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (221,0,to_timestamp('17-12月-12 01.32.14.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'It is funny',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (222,0,to_timestamp('17-12月-12 01.32.25.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'ok',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (223,0,to_timestamp('17-12月-12 01.32.42.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'OK',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (102,1,to_timestamp('21-10月-12 09.49.37.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'sd',21);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (104,1,to_timestamp('21-10月-12 09.55.56.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),null,21);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (108,1,to_timestamp('21-10月-12 09.57.06.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'dfasdfsdfsdfsdf',21);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (121,1,to_timestamp('03-11月-12 10.26.42.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'  ',21);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (17,0,to_timestamp('15-9月 -12 09.30.58.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'sss',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (18,0,to_timestamp('15-9月 -12 09.31.33.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'啊啊啊',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (19,0,to_timestamp('15-9月 -12 09.31.40.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'点对点',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (20,0,to_timestamp('15-9月 -12 09.31.44.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'点对点',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (21,0,to_timestamp('15-9月 -12 09.31.48.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'dsd酸',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (22,0,to_timestamp('15-9月 -12 09.31.54.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'1231231231',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (23,0,to_timestamp('15-9月 -12 09.32.39.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'23132',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (24,0,to_timestamp('15-9月 -12 09.34.18.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'为钱而去',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (25,0,to_timestamp('15-9月 -12 09.34.20.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'为钱而去',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (26,0,to_timestamp('15-9月 -12 09.34.25.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'12312',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (27,0,to_timestamp('15-9月 -12 09.34.27.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'12312',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (28,0,to_timestamp('15-9月 -12 09.35.59.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'阿斯达',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (29,0,to_timestamp('15-9月 -12 09.36.03.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'打算打算',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (30,0,to_timestamp('15-9月 -12 09.36.07.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'三大',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (31,0,to_timestamp('15-9月 -12 09.36.23.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'33333',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (32,0,to_timestamp('15-9月 -12 09.36.27.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'111',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (33,0,to_timestamp('15-9月 -12 09.36.31.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'11110',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (34,0,to_timestamp('15-9月 -12 09.36.36.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'000',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (35,0,to_timestamp('15-9月 -12 09.36.51.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'00',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (36,0,to_timestamp('15-9月 -12 09.36.53.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'0',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (37,0,to_timestamp('15-9月 -12 09.36.56.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'0',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (38,0,to_timestamp('15-9月 -12 09.36.58.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'0',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (39,0,to_timestamp('15-9月 -12 09.37.01.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),' ',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (40,0,to_timestamp('15-9月 -12 09.37.06.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),null,0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (41,0,to_timestamp('15-9月 -12 09.37.08.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),' ',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (42,0,to_timestamp('15-9月 -12 09.37.10.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),' ',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (43,0,to_timestamp('15-9月 -12 09.37.11.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),' ',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (44,0,to_timestamp('15-9月 -12 09.37.12.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),' ',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (46,1,to_timestamp('15-9月 -12 09.40.47.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'321',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (47,1,to_timestamp('15-9月 -12 09.40.48.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'32',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (50,1,to_timestamp('15-9月 -12 09.40.53.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'123',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (53,1,to_timestamp('15-9月 -12 09.41.40.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'12312',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (56,1,to_timestamp('15-9月 -12 09.41.46.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'sdfs',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (60,1,to_timestamp('15-9月 -12 11.06.04.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'asd',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (62,1,to_timestamp('15-9月 -12 11.06.47.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'123 ',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (57,0,to_timestamp('15-9月 -12 11.05.13.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'aaa',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (59,1,to_timestamp('15-9月 -12 11.06.02.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'asda',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (61,0,to_timestamp('15-9月 -12 11.06.37.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'aaa',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (1,1,to_timestamp('14-12月-07 02.10.00.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'随便说俩句',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (2,1,to_timestamp('14-12月-07 02.10.00.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'随便说俩句',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (3,1,to_timestamp('14-12月-07 02.10.00.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'随便说俩句',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (4,1,to_timestamp('15-12月-07 02.10.00.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'随便说俩句',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (5,1,to_timestamp('15-12月-08 02.10.00.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'随便说俩句',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (15,0,to_timestamp('15-9月 -12 09.25.07.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'说的',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (16,0,to_timestamp('15-9月 -12 09.25.07.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'说的',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (45,1,to_timestamp('15-9月 -12 09.40.42.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'123',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (48,1,to_timestamp('15-9月 -12 09.40.50.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'231',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (51,1,to_timestamp('15-9月 -12 09.40.54.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'123',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (54,1,to_timestamp('15-9月 -12 09.41.42.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'4342',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (58,1,to_timestamp('15-9月 -12 11.05.30.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'111',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (49,1,to_timestamp('15-9月 -12 09.40.51.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'1231',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (52,1,to_timestamp('15-9月 -12 09.41.39.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'123',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (55,1,to_timestamp('15-9月 -12 09.41.45.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'dasda',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (81,0,to_timestamp('29-9月 -12 11.17.27.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'312',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (82,0,to_timestamp('30-9月 -12 09.53.27.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'hello',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (83,0,to_timestamp('30-9月 -12 09.54.09.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'welcome',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (101,1,to_timestamp('21-10月-12 09.49.34.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'cz',21);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (105,1,to_timestamp('21-10月-12 09.56.25.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'dssdfs',21);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (107,1,to_timestamp('21-10月-12 09.56.27.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),null,21);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (103,1,to_timestamp('21-10月-12 09.49.40.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'sdfs',21);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (110,1,to_timestamp('21-10月-12 10.12.01.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'sss',21);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (106,1,to_timestamp('21-10月-12 09.56.26.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),null,21);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (109,1,to_timestamp('21-10月-12 09.57.10.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'sdfsdff',21);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (141,0,to_timestamp('04-12月-12 03.25.47.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'123',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (142,0,to_timestamp('04-12月-12 03.25.49.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'123',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (143,0,to_timestamp('04-12月-12 03.25.53.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'12313123',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (144,0,to_timestamp('04-12月-12 03.25.58.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'weishenme',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (145,0,to_timestamp('04-12月-12 03.26.13.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'怎么',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (147,0,to_timestamp('04-12月-12 09.45.12.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'ghfh',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (148,0,to_timestamp('04-12月-12 09.54.00.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'fuck',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (146,0,to_timestamp('04-12月-12 04.54.44.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),null,0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (162,0,to_timestamp('13-12月-12 02.09.49.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'sdsdf',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (219,28,to_timestamp('15-12月-12 10.49.10.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'z',6);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (241,6,to_timestamp('21-12月-12 09.54.51.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'死死死死死死',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (242,6,to_timestamp('21-12月-12 10.01.54.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'更好',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (243,6,to_timestamp('21-12月-12 10.02.05.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'szq',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (247,6,to_timestamp('21-12月-12 10.06.44.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'第三代',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (248,6,to_timestamp('21-12月-12 10.06.47.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'123',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (250,0,to_timestamp('21-12月-12 10.06.53.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'无所谓',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (251,0,to_timestamp('21-12月-12 10.07.04.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'是打发打发打发了沙发上课放假啊神九发射离开积分昆仑山的房间发生率口技刷卡两地分居阿萨健康旅社就',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (261,0,to_timestamp('22-12月-12 03.06.24.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),null,0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (263,0,to_timestamp('22-12月-12 03.32.09.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'我是小石',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (265,6,to_timestamp('22-12月-12 03.33.59.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'das',0);
Insert into DISSROOM (DISSID,USERID,DISSTIME,CONTENT,DISS_ROOM) values (301,6,to_timestamp('25-12月-12 04.01.13.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'23424',6);

---------------------------------------------------
--   END DATA FOR TABLE DISSROOM
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE ENTERROOM
--   FILTER = none used
---------------------------------------------------
REM INSERTING into ENTERROOM
Insert into ENTERROOM (ROOMNO,USERID) values ('14',6);
Insert into ENTERROOM (ROOMNO,USERID) values ('14',25);
Insert into ENTERROOM (ROOMNO,USERID) values ('21',1);
Insert into ENTERROOM (ROOMNO,USERID) values ('21',5);
Insert into ENTERROOM (ROOMNO,USERID) values ('24',1);
Insert into ENTERROOM (ROOMNO,USERID) values ('24',6);
Insert into ENTERROOM (ROOMNO,USERID) values ('6',4);
Insert into ENTERROOM (ROOMNO,USERID) values ('6',6);
Insert into ENTERROOM (ROOMNO,USERID) values ('6',28);
Insert into ENTERROOM (ROOMNO,USERID) values ('7',6);
Insert into ENTERROOM (ROOMNO,USERID) values ('7',28);
Insert into ENTERROOM (ROOMNO,USERID) values ('84',6);
Insert into ENTERROOM (ROOMNO,USERID) values ('9',6);

---------------------------------------------------
--   END DATA FOR TABLE ENTERROOM
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE GONGGAO
--   FILTER = none used
---------------------------------------------------
REM INSERTING into GONGGAO
Insert into GONGGAO (GONGGAOTIME,CONTENT,CONTYPE,GONGGAOID) values (to_timestamp('04-12月-12 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'第一条公告','0',1);
Insert into GONGGAO (GONGGAOTIME,CONTENT,CONTYPE,GONGGAOID) values (to_timestamp('04-12月-12 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'第二条公告','0',2);
Insert into GONGGAO (GONGGAOTIME,CONTENT,CONTYPE,GONGGAOID) values (to_timestamp('13-12月-12 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'用户szq在房间21成功拍的商品','0',3);
Insert into GONGGAO (GONGGAOTIME,CONTENT,CONTYPE,GONGGAOID) values (to_timestamp('13-12月-12 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'房间15号还差3人','1',4);
Insert into GONGGAO (GONGGAOTIME,CONTENT,CONTYPE,GONGGAOID) values (to_timestamp('23-12月-12 01.32.25.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'test号房价还差5人','1',6);
Insert into GONGGAO (GONGGAOTIME,CONTENT,CONTYPE,GONGGAOID) values (to_timestamp('23-12月-12 01.43.21.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'test号房价还差5人','1',10);
Insert into GONGGAO (GONGGAOTIME,CONTENT,CONTYPE,GONGGAOID) values (to_timestamp('23-12月-12 01.43.24.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'test号房价还差5人','1',11);
Insert into GONGGAO (GONGGAOTIME,CONTENT,CONTYPE,GONGGAOID) values (to_timestamp('23-12月-12 01.43.24.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'test号房价还差5人','1',12);
Insert into GONGGAO (GONGGAOTIME,CONTENT,CONTYPE,GONGGAOID) values (to_timestamp('23-12月-12 01.43.25.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'test号房价还差5人','1',13);
Insert into GONGGAO (GONGGAOTIME,CONTENT,CONTYPE,GONGGAOID) values (to_timestamp('23-12月-12 01.43.25.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'test号房价还差5人','1',14);
Insert into GONGGAO (GONGGAOTIME,CONTENT,CONTYPE,GONGGAOID) values (to_timestamp('23-12月-12 01.43.25.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'test号房价还差5人','1',15);
Insert into GONGGAO (GONGGAOTIME,CONTENT,CONTYPE,GONGGAOID) values (to_timestamp('23-12月-12 01.43.25.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'test号房价还差5人','1',16);
Insert into GONGGAO (GONGGAOTIME,CONTENT,CONTYPE,GONGGAOID) values (to_timestamp('23-12月-12 01.43.26.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'test号房价还差5人','1',17);
Insert into GONGGAO (GONGGAOTIME,CONTENT,CONTYPE,GONGGAOID) values (to_timestamp('23-12月-12 01.43.26.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'test号房价还差5人','1',18);
Insert into GONGGAO (GONGGAOTIME,CONTENT,CONTYPE,GONGGAOID) values (to_timestamp('23-12月-12 01.43.26.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'test号房价还差5人','1',19);
Insert into GONGGAO (GONGGAOTIME,CONTENT,CONTYPE,GONGGAOID) values (to_timestamp('23-12月-12 01.43.27.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'test号房价还差5人','1',20);
Insert into GONGGAO (GONGGAOTIME,CONTENT,CONTYPE,GONGGAOID) values (to_timestamp('23-12月-12 01.45.51.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'14号房价还差5人','1',21);

---------------------------------------------------
--   END DATA FOR TABLE GONGGAO
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE INNERMAIL
--   FILTER = none used
---------------------------------------------------
REM INSERTING into INNERMAIL
Insert into INNERMAIL (MAILID,MTITLE,SENDER,RECEIVER,CONTENT,ISOPEN,SENDTIME) values (101,'asa',1,6,'adas','0 ',to_timestamp('06-12月-12 11.04.20.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into INNERMAIL (MAILID,MTITLE,SENDER,RECEIVER,CONTENT,ISOPEN,SENDTIME) values (102,'asa',1,6,'adas','0 ',to_timestamp('06-12月-12 11.04.34.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into INNERMAIL (MAILID,MTITLE,SENDER,RECEIVER,CONTENT,ISOPEN,SENDTIME) values (61,'again',1,6,'I am your friend','1 ',to_timestamp('29-8月 -12 01.49.50.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into INNERMAIL (MAILID,MTITLE,SENDER,RECEIVER,CONTENT,ISOPEN,SENDTIME) values (62,'again',1,2,'I am your friend','0 ',to_timestamp('29-8月 -12 01.49.56.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into INNERMAIL (MAILID,MTITLE,SENDER,RECEIVER,CONTENT,ISOPEN,SENDTIME) values (63,'yet',1,6,'sorry','1 ',to_timestamp('29-8月 -12 01.53.27.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into INNERMAIL (MAILID,MTITLE,SENDER,RECEIVER,CONTENT,ISOPEN,SENDTIME) values (64,'thank you',1,2,'from wah','0 ',to_timestamp('29-8月 -12 01.54.13.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into INNERMAIL (MAILID,MTITLE,SENDER,RECEIVER,CONTENT,ISOPEN,SENDTIME) values (65,'from wah',1,6,'test mail','0 ',to_timestamp('29-8月 -12 01.58.02.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into INNERMAIL (MAILID,MTITLE,SENDER,RECEIVER,CONTENT,ISOPEN,SENDTIME) values (66,'from wah',1,2,'test mail','0 ',to_timestamp('29-8月 -12 01.58.04.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into INNERMAIL (MAILID,MTITLE,SENDER,RECEIVER,CONTENT,ISOPEN,SENDTIME) values (67,'apple',1,6,'a red apple','1 ',to_timestamp('29-8月 -12 01.58.40.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into INNERMAIL (MAILID,MTITLE,SENDER,RECEIVER,CONTENT,ISOPEN,SENDTIME) values (68,'hello',1,6,'this a hello email for you','1 ',to_timestamp('29-8月 -12 01.45.29.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into INNERMAIL (MAILID,MTITLE,SENDER,RECEIVER,CONTENT,ISOPEN,SENDTIME) values (69,'hello',1,2,'this a hello email for you','0 ',to_timestamp('29-8月 -12 01.45.29.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into INNERMAIL (MAILID,MTITLE,SENDER,RECEIVER,CONTENT,ISOPEN,SENDTIME) values (70,'一元购网站商品已发货，请注意查收!',1,6,'尊敬的客户，您在一元购网站房间投币所得的商品：sas  ;  ;  已于2012/8/30 16:09:50发送，请注意查收！','1 ',to_timestamp('30-8月 -12 04.09.51.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into INNERMAIL (MAILID,MTITLE,SENDER,RECEIVER,CONTENT,ISOPEN,SENDTIME) values (71,'一元购网站商品已发货，请注意查收!',1,6,'尊敬的客户，您在一元购网站房间投币所得的商品：sas  ;  ;  已于2012/8/30 16:09:51发送，请注意查收！','1 ',to_timestamp('30-8月 -12 04.09.51.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into INNERMAIL (MAILID,MTITLE,SENDER,RECEIVER,CONTENT,ISOPEN,SENDTIME) values (72,'一元购网站商品已发货，请注意查收!',1,6,'尊敬的客户，您在一元购网站房间投币所得的商品：sas  ;  ;  已于2012/8/30 16:35:18发送，请注意查收！','0 ',to_timestamp('30-8月 -12 04.35.18.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into INNERMAIL (MAILID,MTITLE,SENDER,RECEIVER,CONTENT,ISOPEN,SENDTIME) values (73,'一元购网站商品已发货，请注意查收!',1,6,'尊敬的客户，您在一元购网站房间投币所得的商品：sas  ;  ;  已于2012/8/30 16:35:18发送，请注意查收！','0 ',to_timestamp('30-8月 -12 04.35.18.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into INNERMAIL (MAILID,MTITLE,SENDER,RECEIVER,CONTENT,ISOPEN,SENDTIME) values (2,'asdas',1,6,'asdas','0 ',to_timestamp('26-7月 -14 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into INNERMAIL (MAILID,MTITLE,SENDER,RECEIVER,CONTENT,ISOPEN,SENDTIME) values (3,'ew',3,6,'sda','0 ',to_timestamp('26-7月 -20 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into INNERMAIL (MAILID,MTITLE,SENDER,RECEIVER,CONTENT,ISOPEN,SENDTIME) values (81,'一元购网站商品已发货，请注意查收!',1,6,'尊敬的客户，您在一元购网站房间投币所得的商品：三星I9300  4.8英寸  黑  已于2012/9/30 11:11:37发送，请注意查收！','1 ',to_timestamp('30-9月 -12 11.11.37.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into INNERMAIL (MAILID,MTITLE,SENDER,RECEIVER,CONTENT,ISOPEN,SENDTIME) values (82,'您发送的一元购网站退货商品已收到!',1,6,'尊敬的客户，您在一元购网站经验值换购所得的商品：三星I9300  4.8英寸  黑  退货已经于2012/9/30 11:33:26收到，得到了确认！','1 ',to_timestamp('30-9月 -12 11.33.26.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into INNERMAIL (MAILID,MTITLE,SENDER,RECEIVER,CONTENT,ISOPEN,SENDTIME) values (83,'from admin',1,4,'hello','0 ',to_timestamp('30-9月 -12 01.02.45.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'));

---------------------------------------------------
--   END DATA FOR TABLE INNERMAIL
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE ORDERS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into ORDERS
Insert into ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (81,6,'0',0,null,null,null,null,null);
Insert into ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (82,6,'0',0,null,null,null,null,null);
Insert into ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (101,6,'0',0,null,null,null,null,null);
Insert into ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (63,6,'0',0,null,null,null,null,null);
Insert into ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (83,6,'0',0,null,null,null,null,null);
Insert into ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (61,6,'0',0,null,null,null,null,null);
Insert into ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (6,6,'2',1,null,to_timestamp('27-11月-12 10.29.11.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('27-11月-12 10.29.39.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),null,null);
Insert into ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (1,6,'3',1,to_timestamp('18-8月 -12 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),null,to_timestamp('30-9月 -12 11.26.35.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),null,null);
Insert into ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (2,6,'3',1,to_timestamp('18-8月 -16 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),null,null,null,null);
Insert into ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (5,6,'4',0,null,to_timestamp('30-9月 -12 11.11.20.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('30-9月 -12 05.57.50.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('30-9月 -12 05.59.14.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),null);
Insert into ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (0,6,'4',0,to_timestamp('23-9月 -12 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('30-9月 -12 05.57.28.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('30-9月 -12 05.57.50.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('30-9月 -12 05.59.14.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),null);
Insert into ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (7,6,'0',0,null,null,null,null,null);
Insert into ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (8,6,'4',0,null,to_timestamp('30-9月 -12 11.11.45.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('30-9月 -12 05.57.50.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('30-9月 -12 05.59.14.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),null);
Insert into ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (9,6,'0',1,null,null,null,null,null);
Insert into ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (23,6,'2',0,null,to_timestamp('30-9月 -12 11.31.49.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('30-9月 -12 11.32.33.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('30-9月 -12 11.33.32.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),null);
Insert into ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (24,6,'2',0,null,to_timestamp('30-9月 -12 05.57.28.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('30-9月 -12 05.57.50.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('30-9月 -12 05.59.14.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),null);
Insert into ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (25,6,'2',0,null,to_timestamp('30-9月 -12 05.57.28.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('30-9月 -12 05.57.50.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('30-9月 -12 05.59.14.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),null);
Insert into ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (26,6,'3',0,null,to_timestamp('30-9月 -12 05.57.28.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('30-9月 -12 05.57.50.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('30-9月 -12 05.59.14.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),null);
Insert into ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (27,6,'4',0,null,to_timestamp('30-9月 -12 05.57.28.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('30-9月 -12 05.57.50.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('06-10月-12 03.59.34.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),null);
Insert into ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (21,6,'3',0,null,null,to_timestamp('30-9月 -12 11.11.58.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),null,null);
Insert into ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (22,6,'0',0,null,null,null,null,null);
Insert into ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (28,6,'3',0,null,to_timestamp('30-9月 -12 05.57.28.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('30-9月 -12 05.57.50.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('30-9月 -12 05.59.14.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),null);
Insert into ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (41,6,'0',0,null,null,null,null,null);
Insert into ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (62,6,'0',0,null,null,null,null,null);
Insert into ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (121,6,'0',0,null,null,null,null,null);
Insert into ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (122,6,'0',0,null,null,null,null,null);
Insert into ORDERS (ORDERID,USERID,STATEMENT,ROOMID,ORDERTIME,SENDTIME,ACCEPTTIME,REJECTTIME,DESCRIPTION) values (123,6,'0',0,null,null,null,null,null);

---------------------------------------------------
--   END DATA FOR TABLE ORDERS
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE PRODUCT
--   FILTER = none used
---------------------------------------------------
REM INSERTING into PRODUCT
Insert into PRODUCT (PRODUCTID,PRONAME,PROTITLE,PROSIZE,PRICE,COLOR,LEFT,ALARM,ISCHEAP,ISONLYONE,ISONLYTEN,ANNOTATION1,ANNOTATION2,ANNOTATION3,ANNOTATION4,ANNOTATION5,PCID,PICTURE1,PICTURE2,PICTURE3,SALE_NUM,UPLOAD_TIME,BRAND,ISJINGYANBI) values (8,'只一元test01','这个是只一元上屏噢噢',null,100,null,300,4,'0','1','0',null,null,null,null,null,'010102','p002.jpg',null,null,0,to_timestamp('26-12月-12 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'士大夫','0');
Insert into PRODUCT (PRODUCTID,PRONAME,PROTITLE,PROSIZE,PRICE,COLOR,LEFT,ALARM,ISCHEAP,ISONLYONE,ISONLYTEN,ANNOTATION1,ANNOTATION2,ANNOTATION3,ANNOTATION4,ANNOTATION5,PCID,PICTURE1,PICTURE2,PICTURE3,SALE_NUM,UPLOAD_TIME,BRAND,ISJINGYANBI) values (44,'手机贴膜','鑫盾 高清透超耐磨手机贴膜 华为 P1','20*20',10,'透明',1,5,'0','0','1',null,null,null,null,null,'010308','tiemo.jpg',null,null,0,to_timestamp('16-12月-12 10.52.58.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'),'鑫盾','0');
Insert into PRODUCT (PRODUCTID,PRONAME,PROTITLE,PROSIZE,PRICE,COLOR,LEFT,ALARM,ISCHEAP,ISONLYONE,ISONLYTEN,ANNOTATION1,ANNOTATION2,ANNOTATION3,ANNOTATION4,ANNOTATION5,PCID,PICTURE1,PICTURE2,PICTURE3,SALE_NUM,UPLOAD_TIME,BRAND,ISJINGYANBI) values (2,'三星I9300','GALAXY SIII（联通版）','4.8英寸',4200,'黑',2432,10,'1','1','1',null,null,null,null,null,'010102','三星I9300.jpg',null,null,2,to_timestamp('17-8月 -12 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'三星','0');
Insert into PRODUCT (PRODUCTID,PRONAME,PROTITLE,PROSIZE,PRICE,COLOR,LEFT,ALARM,ISCHEAP,ISONLYONE,ISONLYTEN,ANNOTATION1,ANNOTATION2,ANNOTATION3,ANNOTATION4,ANNOTATION5,PCID,PICTURE1,PICTURE2,PICTURE3,SALE_NUM,UPLOAD_TIME,BRAND,ISJINGYANBI) values (3,'NikonD7000','（全新未开封）尼康单反相机D5100/18-105套机','3寸及以上',4688,'黑',354,2,'0','1','1','防抖性能: 机身不防抖 ;  屏幕尺寸: 3寸及以上;  像素: 1600万及以上 ;  储存介质: SD卡; 单反画幅: 全画幅; 可外接闪光灯','电池类型: 专用锂电;机身除尘: 支持 ; 机身马达: 不支持;','成色: 全新 ;  售后服务: 全国联保 ;  上市时间: 2011年 ','产品重量: 601-700g ','传感器尺寸: 23.6*15.6mm','010103','NikonD7000.jpg',null,null,1231,to_timestamp('17-8月 -16 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'尼康','0');
Insert into PRODUCT (PRODUCTID,PRONAME,PROTITLE,PROSIZE,PRICE,COLOR,LEFT,ALARM,ISCHEAP,ISONLYONE,ISONLYTEN,ANNOTATION1,ANNOTATION2,ANNOTATION3,ANNOTATION4,ANNOTATION5,PCID,PICTURE1,PICTURE2,PICTURE3,SALE_NUM,UPLOAD_TIME,BRAND,ISJINGYANBI) values (1,'dsd','是打发斯蒂芬算法','asd',213,'sd',1,12,'1','1','1',null,null,null,null,null,'020101','p002.jpg',null,null,1,to_timestamp('17-8月 -17 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'12312','0');
Insert into PRODUCT (PRODUCTID,PRONAME,PROTITLE,PROSIZE,PRICE,COLOR,LEFT,ALARM,ISCHEAP,ISONLYONE,ISONLYTEN,ANNOTATION1,ANNOTATION2,ANNOTATION3,ANNOTATION4,ANNOTATION5,PCID,PICTURE1,PICTURE2,PICTURE3,SALE_NUM,UPLOAD_TIME,BRAND,ISJINGYANBI) values (4,'sas','sfds','大',76.8,'橘黄',12,15,'1','1','1','外形俊美','节能省电','外壳抗压40公斤','一次充满电后，电池可使用4小时',null,'020102','meidi.jpg',null,null,null,to_timestamp('18-8月 -12 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),null,'0');
Insert into PRODUCT (PRODUCTID,PRONAME,PROTITLE,PROSIZE,PRICE,COLOR,LEFT,ALARM,ISCHEAP,ISONLYONE,ISONLYTEN,ANNOTATION1,ANNOTATION2,ANNOTATION3,ANNOTATION4,ANNOTATION5,PCID,PICTURE1,PICTURE2,PICTURE3,SALE_NUM,UPLOAD_TIME,BRAND,ISJINGYANBI) values (5,'iphone4','vfdsgdgd',null,1536,null,18,null,'0','0','0','硬盘500GB;内存3GB','显卡64Gb ','外壳抗压40公斤','一次充满电后，电池可使用4小时',null,'010102','iphone.jpg',null,null,null,to_timestamp('23-9月 -12 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),null,'1');
Insert into PRODUCT (PRODUCTID,PRONAME,PROTITLE,PROSIZE,PRICE,COLOR,LEFT,ALARM,ISCHEAP,ISONLYONE,ISONLYTEN,ANNOTATION1,ANNOTATION2,ANNOTATION3,ANNOTATION4,ANNOTATION5,PCID,PICTURE1,PICTURE2,PICTURE3,SALE_NUM,UPLOAD_TIME,BRAND,ISJINGYANBI) values (6,'pLSQL5679s','今年最新款超炫女用东芝笔记本','小',7800,'玫红',3,5,'0','0','0','硬盘500GB;内存3GB','显卡64Gb ','外壳抗压40公斤','一次充满电后，电池可使用4小时',null,'010101','tochiba.jpg',null,null,0,to_timestamp('22-9月 -12 08.00.23.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'Tochiba','0');
Insert into PRODUCT (PRODUCTID,PRONAME,PROTITLE,PROSIZE,PRICE,COLOR,LEFT,ALARM,ISCHEAP,ISONLYONE,ISONLYTEN,ANNOTATION1,ANNOTATION2,ANNOTATION3,ANNOTATION4,ANNOTATION5,PCID,PICTURE1,PICTURE2,PICTURE3,SALE_NUM,UPLOAD_TIME,BRAND,ISJINGYANBI) values (7,'probook4436s','超大空间金属拉丝外壳HP笔记本','中',6500,'灰',1,5,'0','0','0','硬盘500GB;内存3GB','显卡64Gb ','外壳抗压40公斤','一次充满电后，电池可使用4小时',null,'010101','probook.jpg',null,null,0,to_timestamp('22-9月 -12 07.50.36.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'HP','0');
Insert into PRODUCT (PRODUCTID,PRONAME,PROTITLE,PROSIZE,PRICE,COLOR,LEFT,ALARM,ISCHEAP,ISONLYONE,ISONLYTEN,ANNOTATION1,ANNOTATION2,ANNOTATION3,ANNOTATION4,ANNOTATION5,PCID,PICTURE1,PICTURE2,PICTURE3,SALE_NUM,UPLOAD_TIME,BRAND,ISJINGYANBI) values (24,'Dell台式机','性能稳定超实用台式机','15寸',3500,'黑',1,5,'0','0','0','内存3Gb；DDR','cpu intel',null,null,null,'010101','dell.jpg',null,null,0,to_timestamp('30-9月 -12 10.55.32.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'),'DELL','1');

---------------------------------------------------
--   END DATA FOR TABLE PRODUCT
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE PRODUCT_CATA
--   FILTER = none used
---------------------------------------------------
REM INSERTING into PRODUCT_CATA
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010108','游戏机','时尚数码','数码电子');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010109','电子词典','时尚数码','数码电子');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010110','数码相框','时尚数码','数码电子');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010111','时尚数码－其他','时尚数码','数码电子');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010201','键盘','电脑配件','数码电子');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010202','鼠标','电脑配件','数码电子');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010203','鼠标垫','电脑配件','数码电子');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010204','读卡器','电脑配件','数码电子');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010205','摄像头','电脑配件','数码电子');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010206','移动U盘','电脑配件','数码电子');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010207','移动硬盘','电脑配件','数码电子');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010208','有线耳机','电脑配件','数码电子');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010209','USB分线器','电脑配件','数码电子');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010210','便携式音箱','电脑配件','数码电子');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010211','笔记本支架','电脑配件','数码电子');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010212','笔记本散热器','电脑配件','数码电子');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010213','笔记本内胆包','电脑配件','数码电子');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010214','电脑配件－其他','电脑配件','数码电子');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010301','电池','手机配件','数码电子');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010302','充电器','手机配件','数码电子');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010303','闪存卡','手机配件','数码电子');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010304','手机座','手机配件','数码电子');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010305','手机链','手机配件','数码电子');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010306','蓝牙耳机','手机配件','数码电子');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010307','手机配饰','手机配件','数码电子');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010308','手机保护套','手机配件','数码电子');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010309','手机有线耳机','手机配件','数码电子');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010310','手机便携式音箱','手机配件','数码电子');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010311','数据线','手机配件','数码电子');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010312','手机配件－其他','手机配件','数码电子');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020101','电水壶','厨房电器','生活电器');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020102','豆浆机','厨房电器','生活电器');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020103','煮蛋器','厨房电器','生活电器');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020104','电磁炉','厨房电器','生活电器');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020105','电饼铛','厨房电器','生活电器');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020106','电炖盅','厨房电器','生活电器');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020107','电烤箱','厨房电器','生活电器');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020203','加湿器','日用电器','生活电器');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020108','电热锅','厨房电器','生活电器');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020109','煎烤机','厨房电器','生活电器');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020110','面包机','厨房电器','生活电器');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020111','电饭煲','厨房电器','生活电器');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020112','电火锅','厨房电器','生活电器');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020113','电蒸锅','厨房电器','生活电器');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020114','冷热箱','厨房电器','生活电器');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020115','酸奶机','厨房电器','生活电器');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020116','微波炉','厨房电器','生活电器');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020117','电压力锅','厨房电器','生活电器');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020118','榨汁机','厨房电器','生活电器');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020119','食物料理机','厨房电器','生活电器');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020120','厨房电器－其他','厨房电器','生活电器');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020201','台灯','日用电器','生活电器');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('020202','吸尘器','日用电器','生活电器');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010105','MP3/MP4','时尚数码','数码电子');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010106','收音机','时尚数码','数码电子');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010102','手机','时尚数码','数码电子');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010101','电脑','时尚数码','数码电子');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010103','相机','时尚数码','数码电子');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010104','摄像机','时尚数码','数码电子');
Insert into PRODUCT_CATA (PCID,PCNAME,FATHER,GRANDFATHER) values ('010107','录音笔','时尚数码','数码电子');

---------------------------------------------------
--   END DATA FOR TABLE PRODUCT_CATA
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE ROOM
--   FILTER = none used
---------------------------------------------------
REM INSERTING into ROOM
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (101,8,'1',0,100,'1',0,'1');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (81,44,'1',1,10,'1',15,'4');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (82,44,'1',0,5,'2',10,'4');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (83,44,'1',0,2,'5 ',20,'4');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (84,44,'1',0,1,'0',10,'4');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (2,1,'1',0,50,'3',15,'1');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (6,3,'0',10,200,'1',0,'1');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (7,3,'0',5,40,'5',0,'4');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (8,7,'1',1,1,'1',0,'1');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (9,6,'1',1560,7800,'1',20,'1');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (10,6,'1',585,3900,'2',15,'0');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (11,6,'0',156,1560,'5',10,'0');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (12,6,'1',78,780,'0',10,'0');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (13,2,'0',0,10,'3',0,'4');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (14,1,'0',0,10,'0',0,'1');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (15,5,'1',1300,6500,'1',20,'1');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (16,5,'1',487,3250,'2',15,'1');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (17,5,'0',0,1300,'5',0,'0');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (18,4,'0',0,7,'0',0,'4');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (1,2,'1',12,12,'0',10,'4');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (0,0,'0',0,10,'0',0,'0');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (21,24,'1',500,3500,'1',20,'1');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (22,24,'1',245,1750,'2',14,'1');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (23,24,'1',105,700,'5',15,'1');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (24,24,'1',35,350,'0',10,'1');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (19,4,'1',0,78,'1',0,'4');
Insert into ROOM (ROOMID,PRODUCTID,STATEMENT,FALSEUSER,LIMITEDUSER,ROOMTYPE,NEWFAULTUSER,ISOPEN) values (61,3,'0',0,10,'3',0,'4');

---------------------------------------------------
--   END DATA FOR TABLE ROOM
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE SITDOWN
--   FILTER = none used
---------------------------------------------------
REM INSERTING into SITDOWN
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (6,84,to_timestamp('22-12月-12 04.42.09.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (28,14,to_timestamp('16-12月-12 09.53.18.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (26,14,to_timestamp('16-12月-12 10.14.27.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (27,14,to_timestamp('16-12月-12 10.26.14.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (4,6,to_timestamp('15-12月-12 10.52.22.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (6,14,to_timestamp('16-12月-12 09.40.48.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (6,6,to_timestamp('13-12月-12 03.24.08.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (6,18,to_timestamp('18-11月-12 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (6,19,to_timestamp('18-11月-12 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (2,18,to_timestamp('18-11月-12 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (2,19,to_timestamp('18-11月-12 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (2,21,to_timestamp('11-11月-12 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (3,21,to_timestamp('11-11月-12 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (4,21,to_timestamp('11-11月-12 12.00.00.000000000 上午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (2,14,to_timestamp('23-12月-12 01.45.51.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'));
Insert into SITDOWN (USERID,ROOMID,SITTIME) values (6,7,to_timestamp('25-12月-12 04.02.03.000000000 下午','DD-MON-RR HH.MI.SS.FF AM'));

---------------------------------------------------
--   END DATA FOR TABLE SITDOWN
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE UUSER
--   FILTER = none used
---------------------------------------------------
REM INSERTING into UUSER
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (62,'爱的','123','四渡赤水','2454@sdfsfs.com','三屌丝','111111111111111','发送到',null,'32345464',null,'1','您的出生地？','您的生日？','您的生日？','收到','陈小春','谁说的','0',0,0,'随碟附送的');
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (21,'Sandy','ss123','sdf','dfadf','sdf','sdf','sdf',null,'sdf',null,null,'您的生日？',null,null,'sadf',null,null,null,100,0,'sdf');
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (22,'Cindy','cc123','sdf','dfadf','sdf','sdf','sdf',null,'sdf',null,null,'您的生日？',null,null,'sadf',null,null,null,100,0,'sdf');
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (28,'Tina','tt123','田妮','tina@sina.com.cn','机械工程','01202301','金属矿电话费',null,'1234',null,null,'小学班主任？',null,null,'Tina',null,null,null,90,0,'上海电机学院');
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (23,'sdfasdf','123','sdf','dfadf','sdf','sdf','sdf',null,'sdf',null,null,'您的生日？',null,null,'sadf',null,null,null,100,0,'sdf');
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (25,'yunyun','yy123','孟芸','mengyun@sina.com.cn','信息工程学院','06129082','上海海事大学33号信箱',null,'1391765234',null,null,'您的出生地？',null,null,'江西',null,null,null,100,0,'上海海事大学');
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (27,'Mark','mm123','Mark Bush','mark@126.com','外国语学院','10121302','上海海洋留学生中心8号1001室',null,'a1d2e5',null,null,'母亲的名字？',null,null,'Kelly',null,null,null,90,0,'上海海洋大学');
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (6,'szq','123','迈克尔闰土','2454@sfs.com','信息工程','12131','的发生','235   ','123456','654321','1','出生地？','生日？','老师？','家','出生那天','某某老师','001.jpg',1058.2,486262.36,'SMU');
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (2,'22','22',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,90,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (3,'wesd','23',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1100,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (0,'匿名用户',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,100,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (4,'wah','123','梧桐树',null,'外语','20120732','阿桑的发生','201306','13087905678','312156789','1',null,null,null,null,null,null,null,168,1746,'海洋大学');
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (5,'zq','123',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,100,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (1,'系统',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,100,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (26,'Danniel','dd123','陈紫星','dan_CA@yahoo.com','海洋工程','09102201','上海海洋大学45号203室',null,'1234',null,null,'父亲的名字？',null,null,'David',null,null,null,90,0,'上海海洋大学');
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (41,'leoShi','123','小李',null,null,null,null,null,null,null,'1','0','0','0','1','2','3','0',0,0,null);
Insert into UUSER (USERID,USERNAME,PASSWORD,TRUENAME,EMAIL,COLLEGE_CITY,IDENTIFYNO,ADDRESS,ZIPCODE,CELLPHONE,PHONE,USERTYPE,QUESTION1,QUESTION2,QUESTION3,ANSWER1,ANSWER2,ANSWER3,PICTURE_HEAD,ACCOUNT,JINYANBI,UNIVERSITY_PROVINCE) values (61,'szqq','123','szq','dasd@qq.com','565','123456789987654321','fdhg',null,'38281230',null,'1','您的生日？','您的出生地？','父亲的名字？','1221','nmg','123456','0',0,0,'454');

---------------------------------------------------
--   END DATA FOR TABLE UUSER
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
before insert on room
referencing old as o new as n 
for each row
begin
  if (:n.roomType!='9' and :n.roomType!='3') then
    BEGIN  
      insert into sitdown select * from (select rownum rn , -1,sysdate from dual connect by rownum <= 5000 order by dbms_random.value) where rownum <=:n.falseuser;
      update sitdown set roomid=:n.roomid where roomid=-1;
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
if rtype=3 then rtype:=trunc(pprice/10); end if; --向下取整
insert into orders (orderID,userID,Statement,RoomID) values("S_Orders".nextval,uuid,0,rid);
update uuser set jinyanbi= jinyanbi+ rtype where userid in (select userid from sitdown where roomid=rid and userid<5000);
select max(orderID) into ooid from Orders where userid=uuid;
select productID into pid from room where roomid=rid;
insert into cart values(pid,1,ooid,"S_cart".nextval,uuid);
delete sitdown where roomid=rid;
delete dissroom where diss_room=rid;
insert into dissroom(userid,disstime,content,diss_room) values(1,sysdate,'欢迎进入'||to_char(rid)||'号房间',rid);
select username into uname from uuser where userid=uuid; 
insert into gonggao(gonggaotime,content,contype) values(sysdate,'用户'||uname||' 在'||to_char(rid)||'号房间成功标得了 '||ptitle||' 一件','0');
--delete enterroom where roomno=to_char(rid);
--重新计算limiteduser，以防管理员修改了商品的价格
UPDATE room set limiteduser=trunc(pprice/to_number(roomtype)),falseuser=trunc(limiteduser*newfaultuser/100) WHERE roomid=rid and roomtype!='0' and roomtype!='9' and roomtype!='3' ;
UPDATE room set limiteduser=trunc(pprice/10) WHERE roomid=rid and roomtype='0';
--初始化水军人数

select falseuser into fuser from room where roomid=rid;
insert into sitdown select * from (select rownum rn , -1,sysdate from dual connect by rownum <= 5000 order by dbms_random.value) where rownum <=fuser;
update sitdown set roomid=rid where roomid=-1;
--将关闭的房间打开
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
, returnresult out number --result: 0房间关闭  1没钱   2人满   3操作失败   4一般成功  5最后一个用户成功
) as 
leftseat NUMBER;
moneyenough NUMBER;
roomopen NUMBER;
pprice NUMBER;
ppid NUMBER;
roomtypeprice NUMBER;  
roomprice NUMBER;   --每个人应该扣掉的钱
rsitnum NUMBER;


begin

returnresult:=3;
SELECT Count(*) into rsitnum from sitdown where roomid= rrid;
--剩余座位数
select limiteduser-rsitnum into leftseat from  room where roomid= rrid;

select trunc(to_number(roomtype)) into roomtypeprice from room where roomid= rrid;
select productid into ppid from room where roomid= rrid;
SELECT price into pprice from product where productid= ppid;

-- 钱够不够
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


-- 房间是否开放
SELECT trunc(to_number(isopen)) into roomopen from room WHERE roomid= rrid;

if moneyenough!=0  then
  begin
    if leftseat=1 and roomopen=1 then
        -- 关闭房间, 扣钱, 然后占座表插入一条记录。 
        begin
          update room set isopen=isopen+3 where roomid= rrid;
          update uuser set account= account- roomprice where userid= uuid;
          insert into sitdown values(uuid, rrid,sysdate);
          returnresult:=5;
        end;
        
    else if leftseat>1  and roomopen=1 then
        --扣钱，然后占座表插入一条记录
        begin
          update uuser set account= account- roomprice where userid= uuid;
          insert into sitdown values(uuid, rrid,sysdate);
          if leftseat<7 then
            INSERT into gonggao(gonggaotime,content,contype) values(sysdate, rrid||'号房价还差'|| (leftseat－1)||'人',1);
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
, limittime in number --传入过多长时间可以让座，单位分钟
, returnresult out number --result: 0房间关闭  1没有占座   2占座时间没到   3操作失败   4成功
) as
sitdown NUMBER; --是否占座
sittime NUMBER; --占座时间
roomopen NUMBER; --房间是否开放
pprice NUMBER;
roomtypeprice NUMBER;  
roomprice NUMBER;   --每个人应该扣掉的钱

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
  --如果房间锁定则不能让座，这个人占座了没有，如果占座时间不到，则不能退出
  select count(*) into sitdown from sitdown where userid= uuid and roomid= rrid;
 
  if sitdown=1 then
    begin
      select round(to_number(sysdate-sittime)*24*60) as minute into sittime from sitdown where userid= uuid and roomid= rrid; 
      if sittime>= limittime then
        begin 
           select trunc(to_number(isopen)) into roomopen FROM room where roomid= rrid;
           if roomopen=1 then 
            begin 
              --然后反钱，删除sitroom  
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

