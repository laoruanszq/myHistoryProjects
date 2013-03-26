<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProductDetails.aspx.cs" Inherits="front_ProductDetail" %>
<%@ Import Namespace="System.Data" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    	<script type="text/javascript" src="../Scripts/jquery-1.7.2.min.js"></script> 
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
	 //   $(document).ready(function () {
	        //doProgress(100);
	  //  }); 
	</script> 
    <style type="text/css">
		#center
		{ 
			margin:26px auto; 
			width:202px; 
		} 
		#loading
		{ 
			width:200px; 
			height:25px; 
			background:url(../images/bac.png) no-repeat; 
		} 
		#loading div
		{ 
			width:0px; 
			height:24px; 
			background:url(../images/pro.png) no-repeat; 
			color:#fff; 
			text-align:center; 
			font-family:Tahoma; 
			font-size:12px; 
			line-height:24px; 
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
            <li><a href="#">用户帮助</a><asp:Label ID="result" runat="server" ForeColor="Red"></asp:Label>
                </li>
            </ul>
            </div>
            </div>
        <!-- 网站头部+菜单  end-->

     <div id="showproduct">
         <div id="selectnumber" runat="server">
            <asp:Label ID="Label2" runat="server" Text="经验币换购商品" ForeColor="Red"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" Width="25px">1</asp:TextBox>
            <asp:Label ID="Label1" runat="server" Text="件" ></asp:Label>
             <br />
             <br />

             <asp:ImageButton ID="Exchange" runat="server" 
                 ImageUrl="~/images/button/shopcart.jpg" onclick="Exchange_Click"/>

          </div>
        <div>
            <asp:ListView ID="ProductDetail" runat="server" GroupItemCount="1" >
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
                  
  <table width="921" height="520" border="0">
    <tr>
      <td width="400" rowspan="4"><image src='../images/product/<%# Eval("Picture1") %>'  width="400px" height="250px" border="0" /></td>
      <td width="184" height="61">&nbsp;</td>
      <td width="181">&nbsp;</td>
    </tr>
    <tr>
      <td height="59" colspan="2" style="font-size: 36px; font-family: 黑体"><%# Eval("ProName")%></td>
    </tr>
    <tr>
      <td colspan="2" style="font-size: 24px; font-family: 黑体; color: #999999;"> <%# Eval("ProTitle")%></td>
    </tr>
    <tr>
      <td height="53" style="font-family: 'Arial Black'; font-size: 24px; color: #FF0000"><%# Eval("Price", "{0:c}")%></td>
            <td>
 
            </td>
    </tr>
    <tr>
      <td>
      <div style="background-color: #F6F6F6; width: 300px; height: 200px; padding-left: 10px; padding-right: 10px;">
      <table width="300" height="201">
        <tr>
          <td width="90">商品编号：</td>
          <td width="60"><%# Eval("ProductID") %></td>
          <td width="60">颜色：</td>
          <td width="90"><%# Eval("Color") %></td>
          </tr>
        <tr>
          <td>商品名称：</td>
          <td><%# Eval("ProName") %></td>
          <td>大小：</td>
          <td><%# Eval("ProSize") %></td>
          </tr>
        <tr>
          <td>商品类别：</td>
          <td> <%# Eval("PCName") %></td>
          <td>商标：</td>
          <td><%# Eval("brand") %></td>
          </tr>
        <tr>
          <td colspan="4"><%# Eval("Annotation1")%>,<%# Eval("Annotation2")%>,<%# Eval("Annotation3")%>,<%# Eval("Annotation4")%></td>
          </tr>
      </table>
      </div>
      </td>
      <td height="43" colspan="2">
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
                                    <a href='room/room.aspx?roomID=<%# Eval("[\"RoomID\"]") %>' target="_blank"> 进入</a>
                                    <a  href='room/sitdown.aspx?roomID=<%# Eval("[\"RoomID\"]") %>'>占座</a>
                                </td>
                            </tr>
                        </table>
                    </td>
                </ItemTemplate>
            </asp:ListView>
      </td>
    </tr>
    <tr>
      <td></td>
      <td colspan="2"></td>
    </tr>
  </table>                         
                    </td>    
                </ItemTemplate>        
            </asp:ListView>
        </div>  
            
        </div>
    </form>
 <div id="footer">
         关于OK淘 合作伙伴 营销中心 联系客服 开放平台 诚征英才 联系我们 网站地图 法律声明 © 2012 okeytao.com 版权所有 </div>
</body>
</html>
