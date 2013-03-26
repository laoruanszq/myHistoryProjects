<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProductListFree.aspx.cs" Inherits="front_ProductListFree" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>换购商品</title>
 
    <style type="text/css">
        .logo
        {
            height: 48px;
            font-size: x-large;
            color: #808000;
            text-align: center;
            margin: 0 auto;
        }
        dd div 
        {
            float: left;
            height: 25px;
            margin-right: 15px;
            white-space: nowrap;
        }
        dl
        {
	        overflow:hidden;
        }
        dl dt
        {
	        float:left; 
        }
        table
        {
            font-size:small;
        }
    </style>
     <link href="../Styles/css.css" rel="stylesheet" type="text/css" />
</head>
<body>




    <form id="form1" runat="server">

        <!-- 状态栏 用户名+站内信+订单信息 -->
        <div id="header">
        <div id="headertext">
            <div id="leftinfo">欢迎来到ok购！</div>
            <div id="info">您好，<asp:Label ID="Label3" runat="server" Text="游客"></asp:Label>&nbsp;
                        <asp:HyperLink ID="HyperLink1" NavigateUrl="~/front/BuyerCenter/Message.aspx" target="_blank" runat="server" >站内信（<asp:Label ID="noreading" runat="server" Text="0"></asp:Label>
                            /<asp:Label ID="read" runat="server" Text="0"></asp:Label>
                        </asp:HyperLink>
                            ) | 
                        <asp:HyperLink ID="HyperLink2" NavigateUrl="ExpChangePro/ShowShoppingCar.aspx" runat="server" >购物车（<asp:Label ID="shoppingcarNum" runat="server" Text="0"></asp:Label>
                                        )
                        </asp:HyperLink>
                  <asp:HyperLink ID="loginout" NavigateUrl="loginout.aspx" runat="server" >注销</asp:HyperLink>
                         <asp:HyperLink ID="login" NavigateUrl="login.aspx" runat="server" >登录</asp:HyperLink>
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
            <img alt="topright" class="style8" src="../images/index/topright.png" /></td>
        </tr>
        </table>

      
 
                </div>
           <div id="menubg">
            <div id="menu">
            <ul>
            <li><a href="index.aspx">首页</a></li>
            <li><a id="current" href="BuyerCenter/BuyerCenter.aspx">买家中心</a>
              <ul>
            <li><a href="BuyerCenter/BuyerCenter.aspx">个人资料</a></li>
            <li><a href="BuyerCenter/Message.aspx" target="_blank" >站内信</a></li>
            </ul>
            </li>
            <li><a href="ProductList.aspx?clear=clear">所有商品</a>
            <ul>
            <li><a href="ProductList.aspx?clear=clear">商品检索</a></li>
            <li><a href="ProductListFree.aspx?clear=clear">免费商品</a></li>
            </ul>
            </li>
            <li><a href="#">论坛</a></li>
            <li><a href="#">用户帮助</a></li>
            </ul>
            </div>
            </div>
        <!-- 网站头部+菜单  end-->
        <div id="listmenu">
            <asp:TreeView ID="TreeView1" runat="server" Height="100%" Width="100%" Font-Size="12px">
                <Nodes>
                    <asp:TreeNode NavigateUrl="ProductListFree.aspx?clear=clear" Text="全部商品" 
                        Value="全部商品"></asp:TreeNode>
                </Nodes>
            </asp:TreeView>
             </div>

        <div id="listmain">
        
        
                    <div id="selected">			
                                <div><a href="ProductListFree.aspx?brand=non">不限</a></div>
                    <div style="overflow:hidden">
                        <asp:ListView ID="ListView_Brand" runat="server" GroupItemCount="8" >
                            <LayoutTemplate>
                                <table id="Table1" runat="server">
                                    <tr id="Tr1" runat="server">
                                        <td id="Td2" runat="server">
                                            <!--指定分组容器-->
                                            <table ID="groupPlaceholderContainer" runat="server">
                                                <tr ID="groupPlaceholder" runat="server"></tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </LayoutTemplate>
                             <GroupTemplate>
                                <tr ID="itemPlaceholderContainer" runat="server">
                                    <td ID="itemPlaceholder" runat="server"></td>
                                </tr>
                            </GroupTemplate>
                            <ItemTemplate>
                                <td id="Td1" runat="server" >
                                    <a href='ProductListFree.aspx?brand=<%# Eval("Brand") %>'>
                                    <span class="ProductListItem"><b><%# Eval("Brand") %><b></span></a>
                                </td>
                                <td></td>
                            </ItemTemplate>
                        </asp:ListView>
               </div>
               </div>
              <div id="rankbar">
                        <table width="730" border="0">
                            <tr>
                                <td>商品排列方式：
                                </td>
                                <td>
                                <a href="ProductListFree.aspx?method=non">默认</a></td>
                                <td>
                                    <a href="ProductListFree.aspx?method=Sale_Num desc"><img src="../images/down.png" alt="down"/></a>
                                    <a href="ProductListFree.aspx?method=Sale_Num asc"><img src="../images/up.png" alt="up"/></a>
                                </td>
                                <td>价格
                                </td>
                                <td>
                            <a href="ProductListFree.aspx?method=Price desc"><img src="../images/down.png" alt="down"/></a>
                            <a href="ProductListFree.aspx?method=Price asc"><img src="../images/up.png" alt="up"/></a>
                                        </td>
                                      <td><asp:TextBox ID="TextBox1" runat="server" Width="32px"></asp:TextBox>
                        -<asp:TextBox ID="TextBox2" runat="server" Width="32px"></asp:TextBox>
                        元
                        </td>
                                      <td>
                        <asp:Button ID="Price" runat="server" onclick="Price_Click" Text="确定" />
		            &nbsp;<asp:Button ID="ResetPrice" runat="server" onclick="ResetPrice_Click" 
                            Text="清除价格" Visible="False" Width="65px" /></td>
                                      <td>上架时间</td>
                                      <td>
                            <a href="ProductListFree.aspx?method=Upload_Time desc"><img src="../images/down.png" alt="down"/></a>
                            <a href="ProductListFree.aspx?method=Upload_Time asc"><img src="../images/up.png" alt="up"/></a></td>
                                    </tr>
                                  </table>			
		               
                </div>

                   <div id="listproduct">
                         <!-- 商品列表 -->
        <asp:ListView ID="ListView_Product" runat="server" 
            onpagepropertieschanged="ListView_Product_PagePropertiesChanged">
            <LayoutTemplate>
                <table id="Table1" runat="server">
                    <tr id="Tr1" runat="server">
                        <td id="Td2" runat="server">
                            <!--指定分组容器-->
                            <table ID="groupPlaceholderContainer" runat="server">
                                <tr ID="groupPlaceholder" runat="server"></tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <asp:DataPager ID="dpProduct" runat="server" PageSize="20">
                    <Fields>
                        <asp:NextPreviousPagerField FirstPageText="首页" PreviousPageText="上一页" ButtonType="Link" ShowFirstPageButton="true" ShowPreviousPageButton="true" ShowNextPageButton="false" />
                        <asp:NumericPagerField ButtonCount="5" />
                        <asp:NextPreviousPagerField LastPageText="尾页" NextPageText="下一页" ButtonType="Link" ShowLastPageButton="true" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                    </Fields>
                </asp:DataPager>
            </LayoutTemplate>
            <GroupTemplate>
                <tr ID="itemPlaceholderContainer" runat="server">
                    <td ID="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <ItemTemplate>
                <td id="Td1" runat="server">
                    <table border="0" width="900px" style="border: 1px solid #C0C0C0">
                        <tr>
                            <td style="width: 5px; height:200px;">&nbsp</td>
                            <td style="vertical-align: middle; text-align: right;width: 125px;">
                                <a href='ProductDetails.aspx?productID=<%# Eval("ProductID") %>'>
                                    <!--显示产品缩略图-->
                                    <image src='../images/product/<%# Eval("Picture1") %>' 
                                    width="160px" height="120px" border="0">
                                </a>&nbsp;&nbsp;
                            </td>
                            <td style="width:250px;">
                                <a href='ProductDetails.aspx?productID=<%# Eval("ProductID") %>' style="font-size: 14px; text-decoration: none;"><%# Eval("ProName") %></a>&nbsp;&nbsp;
                                <a style="color: #999999"  ><%# Eval("ProTitle") %></a>
                                <!--为价格指定显示格式-->
                                </td>
                                <td style="width:250px;">
                                <a style="font-size: 18px; color: #FF3300; text-decoration: none"><%# Eval("Price", "{0:c}")%></a>   
                            </td>
                        </tr>
                        </table>
                    </td>
            </ItemTemplate>
        </asp:ListView>

                                
                            
                             <!-- 商品列表 end -->

                        </div>
</div>
 <div id="footer">
         关于OK淘 合作伙伴 营销中心 联系客服 开放平台 诚征英才 联系我们 网站地图 法律声明 © 2012 okeytao.com 版权所有 </div>

    </form>
</body>
</html>