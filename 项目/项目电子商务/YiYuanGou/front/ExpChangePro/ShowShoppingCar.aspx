<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowShoppingCar.aspx.cs" Inherits="front_ExpChangePro_ShowShoppingCar" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>显示购物车</title>
    <link href="../../Styles/css.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #Table1
        {
            width: 91%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

          <!-- 状态栏 用户名+站内信+订单信息 -->
        <div id="header">
        <div id="headertext">
            <div id="leftinfo">欢迎来到ok购！</div>
            <div id="info">您好，<asp:Label ID="name" runat="server" Text="游客"></asp:Label>&nbsp;
                        <asp:HyperLink ID="HyperLink1" NavigateUrl="~/front/BuyerCenter/Message.aspx" runat="server" >站内信（<asp:Label ID="noreading" runat="server" Text="0"></asp:Label>
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
            <li><a href="../BuyerCenter/Message.aspx">站内信</a></li>
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


     <div style="margin:0 auto;width:80%; text-align:center">
         <asp:Label ID="shownone" runat="server" Text=""></asp:Label>
     </div>
    <div style="width:80%; margin:0 auto; overflow:hidden">
                    
        <asp:ListView ID="ListViewUserCar" runat="server" GroupItemCount="1">
            <LayoutTemplate>
                <table id="Table1" runat="server" width="100%">
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
                    <table border="0" width="90%">
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
                                 数量: <a href="updateShoppingCar.aspx?mode=sub&ProductID=<%# Eval("ProductID") %>">-</a>
                                 <asp:TextBox ID="pronum" runat="server" Text='<%# Eval("amount") %>' Width="25"></asp:TextBox>
                                 <a href="updateShoppingCar.aspx?mode=add&ProductID=<%# Eval("ProductID") %>">+</a>
                                </td>
                           
                            <td colspan="2" align="right">
                                <a href="deleteShoppingCar.aspx?ProductID=<%# Eval("ProductID") %>">
                                    从购物车中删除
                                </a>
                            </td>
                        </tr>
                    </table>
                </td>
            </ItemTemplate>
        </asp:ListView>
        <table id="Table1" runat="server" width="90%">
            <tr>
                <td width="33%" align="left">
                   <a href='#'><asp:Button ID="clear" runat="server" onclick="clear_Click" Text="清空购物车" /></a>
                </td>
                <td  width="33%" align="center">
                    <asp:Label ID="totalPrice" runat="server" Text="总价："></asp:Label>
                </td>
                <td  width="33%" align="right">
                     <a href='../ProductListFree.aspx'>继续购物</a>&nbsp;&nbsp;
                     <a href="CreateOrder.aspx?mode=change">生成订单</a>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
