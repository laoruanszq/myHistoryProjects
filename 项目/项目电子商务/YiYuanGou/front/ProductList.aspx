<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProductList.aspx.cs" Inherits="front_ProductList" %>
<%@ Import Namespace="System.Data" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        var progress_id = "loading";
        function SetProgress(progress) {
            if (progress) {
                $("#" + progress_id + " > div").css("width", String(progress) + "%"); //控制#loading div宽度 
                $("#" + progress_id + " > div").html(String(progress) + "%"); //显示百分比 
            }
        }
        var i = 0;
        function doProgress(limited) {
            if (i <= limited) {
                setTimeout("doProgress(limited)", 100);
                SetProgress(i);
                i++;
            }
        }
      //  $(document).ready(function () {
            //doProgress(100);
        //}); 
    </script> 
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
        #loading
        { 
            width:100px; 
            height:13px; 
            background:url(../images/bac_s.png) no-repeat; 
        } 
        #loading div
        { 
            width:0px; 
            height:13px; 
            background:url(../images/pro_s.png) no-repeat; 
            color:#fff; 
            text-align:center; 
            font-family:Tahoma; 
            font-size:8px; 
            line-height:13px; 
        } 		
        .style1
        {
            width: 94px;
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
                        <asp:HyperLink ID="HyperLink1" NavigateUrl="~/front/BuyerCenter/Message.aspx" runat="server" target="_blank" >站内信（<asp:Label ID="noreading" runat="server" Text="0"></asp:Label>
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
            <li style="height: 16px"><a href="#">用户帮助</a></li>
            </ul>
            </div>
            </div>
        <!-- 网站头部+菜单  end-->


            <div id="listmenu">
            <asp:TreeView ID="TreeView1" runat="server" Height="100%" Width="100%" 
                    Font-Size="12px">
                <Nodes>
                    <asp:TreeNode NavigateUrl="ProductList.aspx?clear=clear" Text="全部商品" 
                        Value="全部商品"></asp:TreeNode>
                </Nodes>
            </asp:TreeView>
             </div>
        
    <div id="listmain">

                    <div id="selected">			
                                <div><a href="ProductList.aspx?brand=non">不限</a></div>
                    <div style="overflow:hidden">
                        <asp:ListView ID="ListView_Brand" runat="server" GroupItemCount="10" >
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
                                
                                <td  runat="server" >
                                <div id="brand">
                                    <a href='ProductList.aspx?brand=<%# Eval("Brand") %>'>
                                    <%# Eval("Brand") %></a>
                                    </div>
                                </td>
                                 <td>&nbsp;&nbsp;</td>
                                 
                            </ItemTemplate>
                        </asp:ListView>
                        <asp:Label ID="result" runat="server" ForeColor="Red"></asp:Label>
               </div>
               </div>
              <div id="rankbar">
                        <table width="730" border="0">
                                    <tr>
                                      <td class="style1">商品排列方式：
                                      </td>
                                      <td>
                                      <a href="ProductList.aspx?method=non">默认</a></td>
                                      <td>占座率</td>
                                      <td>
                            <a href="ProductList.aspx?method=sitrate desc"><img src="../images/down.png" alt="down" /></a>
                            <a href="ProductList.aspx?method=sitrate asc"><img src="../images/up.png" alt="up"/></a></td>
                                      <td >销量
                                      </td>
                                      <td>
                            <a href="ProductList.aspx?method=Sale_Num desc"><img src="../images/down.png" alt="down"/></a>
                            <a href="ProductList.aspx?method=Sale_Num asc"><img src="../images/up.png" alt="up"/></a>
                                        </td>
                                      <td>价格
                                      </td>
                                      <td>
                            <a href="ProductList.aspx?method=Price desc"><img src="../images/down.png" alt="down"/></a>
                            <a href="ProductList.aspx?method=Price asc"><img src="../images/up.png" alt="up"/></a>
                                        </td>
                                      <td><asp:TextBox ID="TextBox1" runat="server" Width="39px"></asp:TextBox>
                        -<asp:TextBox ID="TextBox2" runat="server" Width="39px"></asp:TextBox>
                        元
                        </td>
                                      <td>
                        <asp:Button ID="Price" runat="server" onclick="Price_Click" Text="确定" ValidationGroup="price" />
		            &nbsp;<asp:Button ID="ResetPrice" runat="server" onclick="ResetPrice_Click" 
                            Text="清除价格" Visible="False" Width="74px" Height="19px" /></td>
                                      <td>上架时间</td>
                                      <td>
                            <a href="ProductList.aspx?method=Upload_Time desc"><img src="../images/down.png" alt="down"/></a>
                            <a href="ProductList.aspx?method=Upload_Time asc"><img src="../images/up.png" alt="up"/></a></td>
                                    </tr>
                                  </table>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" SetFocusOnError="True" ValidationExpression="^\\d+$" ValidationGroup="price"></asp:RegularExpressionValidator>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" Display="Dynamic" SetFocusOnError="True" ValidationExpression="^\\d+$" ValidationGroup="price"></asp:RegularExpressionValidator>
		               
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
                                               <div style="border: 1px solid #C0C0C0; padding-top: 5px; padding-bottom: 5px; padding-left: 5px;">
                                              <table width="900" border="0">
                                                <tr>
                                                  <td rowspan="2" width="210">
                                                  <a href='ProductDetails.aspx?productID=<%# Eval("ProductID") %>'>
                                                            <!--显示产品缩略图-->
                                                            <image src='../images/product/<%# Eval("Picture1") %>' 
                                                            width="160px" height="120px" border="0">
                                                        </a>
                                                  </td>
                                                  <td width="200"> <a href='ProductDetails.aspx?productID=<%# Eval("ProductID") %>' style="font-size: 14px; text-decoration: none; font-family: Arial;"><%# Eval("ProName") %></a></td>
                                                  <td width="350"> <a style="color: #999999"  ><%# Eval("ProTitle") %></a></td>
                                                  <td><a style="font-size: 18px; color: #FF3300; text-decoration: none"><%# Eval("Price", "{0:c}")%></a></td>
                                                  <td>&nbsp;</td>
                                                  </tr>
                                                 <tr>
                                                  <td colspan="4">
                                                 <asp:ListView ID="ListViewRoom" runat="server" GroupItemCount="1" datasource='<%# ((DataRowView)Container.DataItem).Row.GetChildRows("myrelation") %>'>
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
                                                                    <table border="0">
                                                                        <tr>
                                                                            <td>
                                                                                <%# Eval("[\"RoomType\"]") %>:
                                                                            </td>
                                                                            <td style="vertical-align: middle;">
                                                                                <!--显示占座进度条图-->
                                                                                <div id="center">  
                                                                                    <div id="loading">
                               
                                                                                        <div style=' width:<%# Eval("[\"sitrate\"]") %>%;'><%# Eval("[\"sitrate\"]") %>%</div>
                                                                                    </div>
                                                                                </div>   
                                                                            </td>
                                                                            <td>
                                                                                (<%# Eval("[\"sitnum\"]") %>/<%# Eval("[\"limiteduser\"]") %>)
                                                                            </td>
                                                                            <td>
                                                                                <a href='room/room.aspx?roomID=<%# Eval("[\"RoomID\"]") %>' target="_blank">
                                                                                    <img src="../images/button/room.jpg" alt="room" />
                                                                                </a>
                                                                                <a  href='room/sitdown.aspx?roomID=<%# Eval("[\"RoomID\"]") %>'>
                                                                                    <img src="../images/button/sitdown.jpg" alt="sitdown" />
                                                                                </a>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </ItemTemplate>
                                                        </asp:ListView>	 
                                                  
                                                  </td>
                                                  </tr>
                                              </table>
                                              </div>
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
