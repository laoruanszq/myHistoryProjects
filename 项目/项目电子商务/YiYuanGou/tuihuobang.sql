select orders.orderID,product.productID,proName,prosize,price,color,uuser.userID,trueName,address,zipcode,cellphone,phone,roomID 
from Product,orders,uuser,cart 
where cart.orderID=orders.orderID 
      and orders.userID=UUser.userID 
      and product.productID=cart.productID 
      and (orders.statement=2 or orders.statement=3) 
      and sysdate-sendtime<=16 
order by orders.orderID


select to_number(roomtype) from room

�߰�·һС
����Сѧ
�̿�Ժ��С
����Сѧ
���һ����



��������
����·��С�� �������������֣������ġ��Ƽ�լ����һ�������������ġ����塢������ ׯ��լ�� �к��塢���ݡ����Է��������Է

��ʦ���Ķ�����վ�� �˼�լ ���¼�լ

�Ϻ�Сѧ������һ�� ���

�Ϻ�ʦ��Сѧ����Сѧ����������
