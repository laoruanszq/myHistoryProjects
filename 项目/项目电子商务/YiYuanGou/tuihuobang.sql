select orders.orderID,product.productID,proName,prosize,price,color,uuser.userID,trueName,address,zipcode,cellphone,phone,roomID 
from Product,orders,uuser,cart 
where cart.orderID=orders.orderID 
      and orders.userID=UUser.userID 
      and product.productID=cart.productID 
      and (orders.statement=2 or orders.statement=3) 
      and sysdate-sendtime<=16 
order by orders.orderID


select to_number(roomtype) from room

高安路一小
向阳小学
教科院附小
建襄小学
徐汇一中心



＝＝＝＝
东安路二小： 东二、沈家里（部分）、东四、黄家宅、宛一二、宛三、宛四、宛五、宛六、 庄家宅、 尚海湾、华容、徐汇苑、东安花苑

汇师：文定、汇站、 潘家宅 、陈家宅

上海小学：长桥一村 五村

上海师范小学附属小学：桂林西街
