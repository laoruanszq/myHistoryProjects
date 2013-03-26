create or replace
PROCEDURE RETURNGOODSP
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
      UPDATE product set left=left+ shuliang,sale_num=sale_num-shuliang where productid=pid;
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
