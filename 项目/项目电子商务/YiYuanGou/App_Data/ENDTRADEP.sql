/*房间占座结束以后调用，应该完成的工作包括：
   1.将商品购买信息添加到cart表和orders表
   2.将sitdown表该房间的占座信息清空
   3.将room表中该房间的信息初始化，修改水军人数等*/
CREATE OR REPLACE
PROCEDURE ENDTRADEP
( rid IN NUMBER
) AS
BEGIN
  delete from sitdown where roomid= rid; 
  update room set falseuser= trunc(limiteduser*newfaultuser/100) where statement=1 and roomid=rid;
  
END ENDTRADEP;