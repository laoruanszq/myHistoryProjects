<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BuyerCenter.aspx.cs" Inherits="front_BuyerCenter_BuyerCenter" %>
<%@ Import Namespace="System.Data" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>买家中心</title>
    <link href="../../Styles/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- 状态栏 用户名+站内信+订单信息 -->
        <div id="header">
        <div id="headertext">
            <div id="leftinfo">欢迎来到ok购！</div>
            <div id="info">您好，<asp:Label ID="name" runat="server" Text="游客"></asp:Label>&nbsp;
                        <asp:HyperLink ID="HyperLink1" NavigateUrl="~/front/BuyerCenter/Message.aspx" target="_blank" runat="server" >站内信（<asp:Label ID="noreading" runat="server" Text="0"></asp:Label>
                            /<asp:Label ID="read" runat="server" Text="0"></asp:Label>
                        </asp:HyperLink>
                            ) | 
                        <asp:HyperLink ID="HyperLink2" NavigateUrl="../ExpChangePro/ShowShoppingCar.aspx" runat="server" >购物车（<asp:Label ID="shoppingcarNum" runat="server" Text="0"></asp:Label>
                                        )
                        </asp:HyperLink>|
                        <asp:HyperLink ID="loginout" NavigateUrl="../loginout.aspx" runat="server" >注销</asp:HyperLink>
             </div>
        </div>
        </div>

            
         &nbsp;&nbsp;

         <!-- 状态栏 用户名+站内信+订单信息 end-->

        <!-- 网站头部+菜单 -->
        <div id="headerpic" runat="server">
        <table>
        <tr>
        <td id="tablelogo" class="style4"></td>
        <td id="tablesearch" class="style5">
        <table id="searchbar">
                            <tr>
                           
                                <td class="style3">
                                   <asp:TextBox ID="searchKeyWord" runat="server" BorderStyle="None" Height="44px" 
                        style="margin-top: 0px; margin-left: 0px;" Width="294px" 
                        Font-Size="Large" Font-Names="Arial"></asp:TextBox> </td>
                                <td class="style2">
                                <asp:ImageButton ID="doSearch" runat="server" 
                        onclick="doSearch_Click" ImageUrl="~/images/button/searchbutton.jpg" />   </td>
                    
                            </tr>
                        </table>
        
        </td>
        <td id="tablead1" class="style6">&nbsp;</td>
        <td id="tablead2" class="style7">
            <img alt="topright" class="style8" src="../../images/index/topright.png" /></td>
        </tr>
        </table>

      
 
                </div>
           <div id="menubg">
<div id="menu">
<ul>
<li><a href="../index.aspx">首页</a></li>
<li><a id="current" href="BuyerCenter.aspx">买家中心</a>
  <ul>
<li><a href="BuyerCenter.aspx">个人资料</a></li>
<li><a href="Message.aspx"target="_blank">站内信</a></li>
</ul>
</li>
<li><a href="../ProductList.aspx?clear=clear">所有商品</a>
<ul>
<li><a href="../ProductList.aspx?clear=clear">商品检索</a></li>
<li><a href="../ProductListFree.aspx?clear=clear">免费商品</a></li>
</ul>
</li>
<li><a href="#">论坛</a></li>
<li><a href="#">用户帮助</a></li>
</ul>
</div>
</div>
        <!-- 网站头部+菜单  end-->


        <!-- 网站主要内容区-->
        <div id="main">
    <div id="left">
       <div id="user" 
            style="width:250px; height: 400px; overflow:hidden; float: right;">                  

      <asp:ListView ID="ListViewUserInfo" runat="server" 
           >
                            <LayoutTemplate>
                                <table id="Table1" runat="server">
                                    <tr ID="itemPlaceholderContainer" runat="server">
                                        <td ID="itemPlaceholder" runat="server"></td>
                                    </tr>
                                </table>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <td id="Td1" runat="server">
                                    <table border="0" width="200px">
                                        <tr>
                                            <td style="vertical-align: middle;">
                                                    <image src='../images/user/<%# Eval("Picture_Head") %>' 
                                                    width="80px" height="100px" border="0">
                                            </td>
                                        </tr>
                                        <tr><td></td></tr>
                                        <tr>
                                            <td style="width: 200px; vertical-align: middle;">
                                                <span><%# Eval("UserName") %></span><br>
                                                <a href='ChangeUserInfo.aspx'>
                                                <span><b>修改个人资料<b></span></a>
                                            </td>
                                        </tr>
                                        </table>
                                    </td>
                            </ItemTemplate>
                        </asp:ListView>
           <asp:Label ID="result" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </div>
    
    <div id="right">
      <div id="position">所在位置：买家中心      </div>
      <div id="list_a"><br/>
      <div id="Div1" style="width:100%; height: 10%; overflow:hidden;">
                        
                        <asp:ListView ID="ListViewUserAcount" runat="server" GroupItemCount="1">
                            <LayoutTemplate>
                                <table id="Table1" runat="server" width="100%">
                                    <tr ID="groupPlaceholderContainer" runat="server">
                                        <td ID="groupPlaceholder" runat="server"></td>
                                    </tr>
                                </table>
                            </LayoutTemplate>
                            <GroupTemplate>
                                <tr ID="itemPlaceholderContainer" runat="server">
                                    <td ID="itemPlaceholder" runat="server" width="100%"></td>
                                </tr>
                            </GroupTemplate>
                            <ItemTemplate>
                                <td id="Td1" runat="server">
                                    <table border="0" width="600px" width="100%">
                                        <tr>
                                            <td style="width: 200px; vertical-align: middle;">
                                                <span><b>账户余额：<%# Eval("Account") %><b></span><br /><span><b>经验币余额：<%# Eval("JinYanBi") %><b></span></td>
                                        </tr>
                                        </table>
                                    </td>
                            </ItemTemplate>
                        </asp:ListView>

                    </div>
      </div>
      <div id="mycollection">
       <br />
      <br />
      <div id="myroom" style="width:100%; height: 83%; overflow:scroll;">

                         <asp:ListView ID="ListViewBuyUserRoom" runat="server" GroupItemCount="1">
                            <LayoutTemplate>
                                <table id="Table1" runat="server" width="100%">
                                    <tr ID="groupPlaceholderContainer" runat="server">
                                        <td ID="groupPlaceholder" runat="server"></td>
                                    </tr>
                                </table>
                            </LayoutTemplate>
                             <GroupTemplate>
                                <tr ID="itemPlaceholderContainer" runat="server">
                                    <td ID="itemPlaceholder" runat="server"></td>
                                </tr>
                            </GroupTemplate>
                            <ItemTemplate>
                                <td id="Td1" runat="server">
                                    <div id="collect">
      <table width="92%" height="74" border="0">
        <tbody>
          <tr>
            <td width="23%" 
            rowspan="2" style="text-align: right; vertical-align: middle;">
              <a href='../ProductDetails.aspx?productID=<%# Eval("ProductID") %>'>
              <!--显示产品缩略图-->
              <image src='../../images/product/<%# Eval("Picture1") %>' width="120px" height="85px" border="0">
              </a>&nbsp; </td>
            <td width="38%" height="36" style="vertical-align: middle;">
            <a href='../ProductDetails.aspx?productID=<%# Eval("ProductID") %>'><b><%# Eval("ProName") %> </b><%# Eval("ProTitle") %></a></td>
            <td width="15%"><span style="vertical-align: middle;">价格：<%# Eval("Price") %>0</span></td>
          </tr>
          <tr>
            <td height="20"> <%# Eval("RoomType") %>房间 房间号：<%# Eval("RoomID") %></td>
            <td></td>
            <td  align="right">
                                                <a href='../room/Stand.aspx?roomid=<%# Eval("RoomID") %>'>让座</a>
                                                <a href='../room/room.aspx?roomid=<%# Eval("RoomID") %>'>进入房间</a>
             </td>
          </tr>
        </tbody>
      </table>
     </div>
                                    </td>
                            </ItemTemplate>
                        </asp:ListView>

                    </div>
      </div>
      
      
      <div id="mycart">
   
         <br /> <br />
         
                    <div id="Div6" style="width:100%; height: 83%; overflow:scroll;">
                          
                       <asp:ListView ID="ListViewUserCar" runat="server" GroupItemCount="1">
			                <LayoutTemplate>
                                <table id="Table1" runat="server" width="99%">
                                    <tr ID="groupPlaceholderContainer" runat="server">
                                        <td ID="groupPlaceholder" runat="server"></td>
                                    </tr>
                                    <tr><td height="30px"></td></tr>
                                </table>
                            </LayoutTemplate>
                            <GroupTemplate>
                                <tr ID="itemPlaceholderContainer" runat="server">
                                    <td ID="itemPlaceholder" runat="server"></td>
                                </tr>
                            </GroupTemplate>
                            <ItemTemplate>
                                <td id="Td1" runat="server">
                                    <table border="0" width="97%">
                                        <tr>
                                            <td style="vertical-align: middle;">
                                                <a href='../ProductDetails.aspx?productID=<%# Eval("ProductID") %>'>
                                                    <!--显示产品缩略图-->
                                                    <image src='../../images/product/<%# Eval("Picture1") %>' 
                                                    width="50px" height="50px" border="0">
                                                </a>&nbsp;
                                            </td>
                                            <td  style="vertical-align: middle;">
                                                <a href='../ProductDetails.aspx?productID=<%# Eval("ProductID") %>'>
                                                    <b><%# Eval("ProName") %> </b><%# Eval("ProTitle") %> 
                                                </a>     
                                            </td>
                                            <td style="vertical-align: middle;">经验币：<%# Eval("Price") %></td>
                                            <td style="vertical-align: middle;">   
                                                 数量:<asp:Label ID="pronum" runat="server" Text='<%# Eval("amount") %>' Width="25"></asp:Label>  
                                            </td>
                           
                                            <td colspan="2" align="right">
                                                   <a href="../ExpChangePro/deleteShoppingCar.aspx?ProductID=<%# Eval("ProductID") %>">
                                                        从购物车中删除
                                                   </a>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </ItemTemplate>
                        </asp:ListView>

                    </div>
        
      
      <br />
      </div>
      <div id="myproducts">
      <br />
      <div id="myStoreHouse" style="overflow:scroll; width: 700px; height: 250px;">
                        
                         <asp:ListView ID="ListViewUserStore" runat="server" GroupItemCount="1">
                            <LayoutTemplate>
                                <table id="Table1" runat="server" border="0" width="600px">
                                    <tr ID="groupPlaceholderContainer" runat="server">
                                        <td ID="groupPlaceholder" runat="server"></td>
                                    </tr>
                                </table>
                            </LayoutTemplate>
                            <GroupTemplate>
                                <tr ID="itemPlaceholderContainer" runat="server">
                                    <td ID="itemPlaceholder" runat="server"></td>
                                </tr>
                            </GroupTemplate>
                            <ItemTemplate>
                                <td id="Td1" runat="server">
                                   <table border="0" width="650px">
                                        <tr>
                                            <td> 
                                               订单编号：<a href='../ExpChangePro/showorder.aspx?OrderID=<%# Eval("OrderID") %>'><%# Eval("OrderID") %></a></td>
                                            <td>
							                   <%# Eval("RoomType") %>房间  房间号：<%# Eval("RoomID") %></td>
                                            <td>
							                    订单时间：<%# Eval("ordertime") %></td>
                                            <td> 
                                               订单状态：<%# Eval("Statement") %></td>
                                            <td> 
                                               金额：<%# Eval("TotalPrice") %></td>
                                            <td align="right"></td>
                                            <td align="right">
                                                
                                                    <a  href='../ExpChangePro/salesReturn.aspx'>退货</a> 
                                                    <br />
                                                    <a href='../ExpChangePro/confirmReceiving.aspx?OrderID=<%# Eval("OrderID") %>'>确认收货</a>
                                               
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="5" >
                                                	<asp:ListView ID="ListViewUserCar" runat="server" GroupItemCount="1" datasource='<%# ((DataRowView)Container.DataItem).Row.GetChildRows("myrelation") %>'>
                                                        <LayoutTemplate>
                                                            <table id="Table1" runat="server">
                                                                <tr ID="groupPlaceholderContainer" runat="server">
                                                                    <td ID="groupPlaceholder" runat="server"></td>
                                                                </tr>
                                                            </table>
                                                        </LayoutTemplate>
                                                        <GroupTemplate>
                                                            <tr ID="itemPlaceholderContainer" runat="server">
                                                                <td ID="itemPlaceholder" runat="server"></td>
                                                            </tr>
                                                        </GroupTemplate>
                                                        <ItemTemplate>
                                                             <td id="Td1" runat="server">
                                                                <table border="0" width="580px">
                                                                    <tr>
                                                                        <td style="vertical-align: middle;">
                                                                            <a href='../ProductDetails.aspx?productID=<%# Eval("[\"ProductID\"]") %>'>
                                                                                <!--显示产品缩略图-->
                                                                                <image src='../../images/product/<%# Eval("[\"Picture1\"]") %>' 
                                                                                width="50px" height="50px" border="0">
                                                                            </a>&nbsp;
                                                                        </td>
                                                                        <td  style="vertical-align: middle;">
                                                                            <a href='../ProductDetails.aspx?productID=<%# Eval("[\"ProductID\"]") %>'>
                                                                                <b><%# Eval("[\"ProName\"]")%> </b><%# Eval("[\"ProTitle\"]")%> 
                                                                            </a>     
                                                                        </td>
                                                                        <td style="vertical-align: middle;">价格：<%# Eval("[\"Price\"]")%></td>
                                                                        <td style="vertical-align: middle;">   
                                                                             数量:<asp:Label ID="pronum" runat="server" Text='<%# Eval("[\"amount\"]") %>' Width="25"></asp:Label>
                                                                        </td>
                           
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </ItemTemplate>
                                                    </asp:ListView>	
                                            </td>
                                        </tr>
                                   </table>
                                </td>
                            </ItemTemplate>
                        </asp:ListView>

                    </div>
      
      
      </div>
    </div>
  </div>


             


        <!-- 网站主要内容区  end-->


     

      

    </form>
 <div id="footer">
         关于OK淘 合作伙伴 营销中心 联系客服 开放平台 诚征英才 联系我们 网站地图 法律声明 © 2012 okeytao.com 版权所有 </div>
</body>
</html>
