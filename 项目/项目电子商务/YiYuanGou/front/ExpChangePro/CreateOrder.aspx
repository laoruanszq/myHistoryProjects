<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateOrder.aspx.cs" Inherits="front_ExpChangePro_CreateOder" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>生成订单</title>
    <style type="text/css">
        #TextArea1
        {
            height: 81px;
            width: 641px;
        }
    </style>
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
                <li><a id="current" href="../BuyerCenter/BuyerCenter.aspx">买家中心</a>
                  <ul>
                <li><a href="../BuyerCenter/BuyerCenter.aspx">个人资料</a></li>
                <li><a href="../BuyerCenterMessage.aspx"target="_blank">站内信</a></li>
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



    <!--显示订单信息-->
 
  
     <div style="margin:0 auto;width:80%;">
        <p align="center" 
             style="font-family: 楷体; font-size: large; color: #FF0000; text-decoration: blink"><asp:Label ID="showOrderid" runat="server" Visible="false" Text="恭喜！您的订单已经生成！ 订单号：" ForeColor="Red"></asp:Label></p>
         
         <br />
         
        收货地址：<br />
         <asp:TextBox ID="showaddress" runat="server" Height="25px" Width="635px"></asp:TextBox><br />
        给店家的备注（发票，大小，收件地址等要求):<br />
         <asp:TextBox ID="showdescription" runat="server" Height="88px" TextMode="MultiLine" 
             Width="637px"></asp:TextBox>
         <br />
         <br />
        <br />订单详情
        <table border="0">
            <tr>
                <td> 
                    订单编号：
                    <asp:Label ID="showorder" runat="server" Text=""></asp:Label>
                </td>
                <td>
					房间类型：
				    <asp:Label ID="showroomtype" runat="server" Text=""></asp:Label>
				</td>
                <td> 
                    订单状态：<asp:Label ID="showstate" runat="server" Text=""></asp:Label>
&nbsp;</td>
                <td align="right">购买时间
                   
                    <asp:Label ID="showtime" runat="server" Text=""></asp:Label>
                </td>
                <td align="right"> 
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="5" >
                    <asp:ListView ID="showproduct" runat="server" GroupItemCount="1">
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
                                <table border="0" width="800px">
                                    <tr>
                                        <td style="vertical-align: middle; width: 260px;">
                                            <a href='../ProductDetails.aspx?productID=<%# Eval("ProductID") %>'>
                                                <!--显示产品缩略图-->
                                                <image src='../../images/product/<%# Eval("Picture1") %>' 
                                                width="250px" height="150px" border="0">
                                            </a>&nbsp;
                                        </td>
                                        <td  style="vertical-align: middle; width: 260px;">
                                            <a href='../ProductDetails.aspx?productID=<%# Eval("ProductID") %>'>
                                                <b><%# Eval("ProName")%> </b><%# Eval("ProTitle")%> 
                                            </a>     
                                        </td>
                                        <td style="vertical-align: middle; width: 260px;">价格：<%# Eval("Price")%>(经验币)</td>
                                        <td style="vertical-align: middle; width: 260px;">   
                                                数量:<asp:Label ID="pronum" runat="server" Text='<%# Eval("amount") %>' Width="25"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </ItemTemplate>
                    </asp:ListView>	
                </td>
            </tr>
            <tr>
                <td  colspan="5" width="33%" align="right">
                    <asp:Label ID="Label1" runat="server" Text="总价："></asp:Label>&nbsp;&nbsp;
                     <asp:Button ID="Button4" runat="server" Text="确认" onclick="Button1_Click" />
                </td>
            </tr>
        </table>

     
     </div>
    
    </form>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
        
</body>
</html>
