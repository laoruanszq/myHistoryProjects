<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="front_index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script type="text/javascript">
        function sc() {
            //聊天室显示底部
            document.getElementById("chatform").scrollTop = document.getElementById("chatform").scrollHeight;
        }
    </script>
    <script type="text/javascript">
        function selectTag(showContent, selfObj) {
            // 操作标签
            var tag = document.getElementById("tags").getElementsByTagName("li");
            var taglength = tag.length;
            for (i = 0; i < taglength; i++) {
                tag[i].className = "";
            }
            selfObj.parentNode.className = "selectTag";
            // 操作内容
            for (i = 0; j = document.getElementById("tagContent" + i); i++) {
                j.style.display = "none";
            }
            document.getElementById(showContent).style.display = "block";

        }

        //function txtFocus()
        //{

        //    var exp = new Date();

        //    exp.setTime(exp.getTime() + 60 * 60 * 1000);

        //    document.cookie = "focusTextBox=" + event.srcElement.id + ";expires=" + exp.toGMTString();

        //}

    </script>
    <link href="../Styles/css.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style4
        {
            width: 193px;
        }
        .style5
        {
            width: 403px;
        }
        .style6
        {
            width: 29px;
        }
        .style7
        {
            width: 109px;
        }
        .style8
        {
            width: 200px;
            height: 26px;
        }
    </style>
</head>
<body style="margin: 0 auto;">
    <form id="form1" runat="server">

         <!-- 状态栏 用户名+站内信+订单信息 -->
        <div id="header">
        <div id="headertext">
            <div id="leftinfo">欢迎来到ok淘！</div>
            <div id="info">您好，<asp:Label ID="Label3" runat="server" Text="游客"></asp:Label>&nbsp;
                        <asp:HyperLink ID="HyperLink1" NavigateUrl="~/front/BuyerCenter/Message.aspx" target="_blank" runat="server" >站内信（<asp:Label ID="noreading" runat="server" Text="0"></asp:Label>
                            /<asp:Label ID="read" runat="server" Text="0"></asp:Label>
                        </asp:HyperLink>
                            ) | 
                        <asp:HyperLink ID="HyperLink2" NavigateUrl="ExpChangePro/ShowShoppingCar.aspx" runat="server" >购物车（<asp:Label ID="shoppingcarNum" runat="server" Text="0"></asp:Label>
                                        )
                        </asp:HyperLink>|
                        <asp:HyperLink ID="loginout" NavigateUrl="loginout.aspx" runat="server" >注销</asp:HyperLink>
                        <asp:HyperLink ID="login" NavigateUrl="login.aspx" runat="server" >登录</asp:HyperLink>
                        <asp:HyperLink ID="HyperLink3" NavigateUrl="register/register.aspx" runat="server" >注册新用户</asp:HyperLink>
                         
             </div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
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
                            Font-Size="Large" Font-Names="Arial"></asp:TextBox> 
                    </td>
                    <td class="style2">
                        <asp:ImageButton ID="doSearch" runat="server" 
                            onclick="doSearch_Click" ImageUrl="~/images/button/searchbutton.jpg" />   
                    </td>
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



<!--首页菜单部分+公告栏+聊天栏-->
<div id="indexmenu">
     <asp:TreeView ID="TreeView1" runat="server" Height="100%" Width="87%" 
            Font-Size="Medium">
         <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
         <NodeStyle Font-Names="Tahoma" Font-Size="Small" ForeColor="Black" 
             HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
         <ParentNodeStyle Font-Bold="False" />
         <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" 
             HorizontalPadding="0px" VerticalPadding="0px" />
            </asp:TreeView>
    </div>
<div id="indexmain">

<div id="indexmenuboard">
	
    <div id="indexboard">
  	 		 <!--第一广告栏-->
				<div id="ad1">
                    <asp:Image ID="img_AD1" runat="server" Width="100%" Height="100%" />
                </div>
				<!--结束--> 
                <div id="news">
                <asp:Repeater ID="Repeater1" runat="server">
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <td>
                                </td>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <img src="../images/index/newssign.png" alt="" width="15" height="15" /> <%# Eval( "content")%>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
                </div>

                <div id="indexchat">
                  <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:Timer ID="Timer1" runat="server" ontick="Timer1_Tick" Interval="3000">
                         </asp:Timer>
                        <div id="showchat" style="height:220px;  overflow:auto; border:medium;">
                            <asp:Repeater ID="chat" runat="server">
                                <HeaderTemplate>
                                    <table width="99%" height="100%" >
                                        <tr>
                                            <td >
                                            </td>
                                            <td >
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td width="10%">
                                            <%# Eval("Username")%>:
                                        </td>
                                        <td width="78%" style="word-break : break-all; overflow:hidden; ">
                                            <%# Eval( "Content")%>
                                        </td>
                                        <td width="10%">
                                            <%# Eval("DissTime","{0:T}")%>
                                        </td>
                                     </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>   
                        
                        
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                        <asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>



                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                     <ContentTemplate>
                           <table class="style1">
                            <tr>
                            <td>
                            <img src="../images/index/user.png" alt="" width="15" height="15" />
                            </td>
                                <td>
                                    <asp:Label ID="name" runat="server" Text="匿名用户"></asp:Label></td>
                                <td>
                                   <asp:TextBox ID="TextBox1" runat="server" Width="319px"></asp:TextBox></td>
                                <td>
                                     <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="发送" 
                                         BackColor="#FF6600" BorderStyle="None" ForeColor="White" Height="17px" Width="36px" /></td>
                            </tr>
                        </table>    
                     </ContentTemplate>
                     <Triggers>
                         <asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click" />
                     </Triggers>
                </asp:UpdatePanel>


                   
                                   
               </div>
              
    </div>

</div>
<!--部分结束-->

<!--第二广告栏-->
<div id="ad2">
    <asp:Image ID="img_AD2" runat="server" Width="100%" Height="100%" />
</div>
<!--结束-->

<div id="indexmid">
<!--特卖窗口-->
		<div id="onlyone">
        <div id="probar">
         <a href="ProductList.aspx?clear=clear&isbool=IsOnlyOne" 
                style="float: right; margin-right: 35px; margin-top: 10px;"><img src="../images/index/more.jpg" /></a>
        </div>
        <asp:ListView ID="ListViewonlyone" runat="server" GroupItemCount="3" 
                style="margin-right: 0px; margin-top: 0px">
                    <LayoutTemplate>
                        <table id="groupPlaceholderContainer" runat="server" width="100%">
                            <tr id="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <GroupTemplate>
                        <tr id="itemPlaceholderContainer" runat="server">
                            <td id="itemPlaceholder" runat="server" width="49%">
                            </td>
                        </tr>
                    </GroupTemplate>
                    <ItemTemplate>
                                        <td id="Td1" runat="server">
                                            <table width="120" id="speacialbg">
		          <tr>
		            <td height="88" colspan="2">
        <a href='ProductDetails.aspx?productID=<%# Eval("ProductID") %>'>
                                                    <!--显示产品缩略图--><div style=" width: 120px; height: 90px;">
                                                    <image src='../images/product/<%# Eval("Picture1") %>' width="120px" height="90px"
                                                        border="0"></div>
                                                </a></td>
		            </tr>
                    <tr>
                    <td>
                     <img src="../images/index/onesign.jpg" />
                    </td>
                    </tr>
		          <tr>
		            <td height="23" colspan="2"><a href='ProductDetails.aspx?productID=<%# Eval("ProductID") %>' style="text-decoration: none; font-size: 12px; color: #000000;">
                                                   <%# Eval("ProName") %></a></td>
		            </tr>
		          <tr>
		            <td width="120" height="30"><div id="line"><a style="text-decoration: none; color: #FF3300; font-size: 18px;  "><%# Eval("Price", "{0:c}")%></a></div>
                    </td>
		            <td width="120">    
                               
                    </td>
	              </tr>
                  <tr>
                  <td><a href='room/room.aspx?roomID=<%# Eval("roomID") %>' target="_blank"><img src="../images/button/enterbutton.png" /></a></td>
                  </tr>
		          <tr>
                  
		            <td width="120" colspan="2" height="60"><a style="font-size: 12px; vertical-align: middle;"><%# Eval("ProTitle") %></a></td>
                    
	              </tr>
  		        </table>
                                        </td>
                                    </ItemTemplate>
                    
                        </asp:ListView>
                </div>




		        <div id="onlyten">
                 <div id="probar">
                  <a href="ProductList.aspx?clear=clear&isbool=IsOnlyTen" 
                style="float: right; margin-right: 35px; margin-top: 10px;"><img src="../images/index/more.jpg" /></a>
        </div>
                <asp:ListView ID="ListViewonlyten" runat="server" GroupItemCount="3">
                            <LayoutTemplate>
                                <table id="groupPlaceholderContainer" runat="server" width="100%">
                                    <tr id="groupPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </LayoutTemplate>
                            <GroupTemplate>
                                <tr id="itemPlaceholderContainer" runat="server" width="49%">
                                    <td id="itemPlaceholder" runat="server">
                                    </td>
                                </tr>
                               
                            </GroupTemplate>
                            <ItemTemplate>
                                        <td id="Td1" runat="server">
                                            <table width="120" id="speacialbg">
		          <tr>
		            <td height="88" colspan="2">
        <a href='ProductDetails.aspx?productID=<%# Eval("ProductID") %>'>
                                                    <!--显示产品缩略图--><div style=" width: 120px; height: 90px;">
                                                    <image src='../images/product/<%# Eval("Picture1") %>' width="120px" height="90px"
                                                        border="0"></div>
                                                </a></td>
		            </tr>
                     <tr>
                    <td>
                     <img src="../images/index/tensign.jpg" />
                    </td>
                    </tr>
		          <tr>
		            <td height="23" colspan="2"><a href='ProductDetails.aspx?productID=<%# Eval("ProductID") %>' style="text-decoration: none; font-size: 12px; color: #000000;">
                                                    <%# Eval("ProName") %></a></td>
		            </tr>
		          <tr>
		            <td width="120" height="30"><div id="line"><a style="text-decoration: none; color: #FF3300; font-size: 18px;  "><%# Eval("Price", "{0:c}")%></a></div>
                    </td>
		            <td width="120">    
                               
                    </td>
	              </tr>
                  <tr>
                  <td><a href='room/room.aspx?roomID=<%# Eval("roomID") %>' target="_blank"><img src="../images/button/enterbutton.png" /></a></td>
                  </tr>
		          <tr>
                  
		            <td width="120" colspan="2" height="60"><a style="font-size: 12px; vertical-align: middle;"><%# Eval("ProTitle") %></a></td>
                    
	              </tr>
  		        </table>
                                        </td>
                                    </ItemTemplate>
                </asp:ListView>
        </div>
<!--结束-->

<!--换购窗口-->
<div id="changeproduct">
		<div id="probar">
         <a href="ProductListFree.aspx?clear=clear" 
                style="float: right; margin-right: 35px; margin-top: 10px;"><img src="../images/index/more.jpg" /></a>
        </div>
        <asp:ListView ID="ListView_Change" runat="server" GroupItemCount="3">
                <LayoutTemplate>
                    <!--指定分组容器-->
                    <table id="groupPlaceholderContainer" runat="server" width="100%">
                        <tr id="groupPlaceholder" runat="server">
                        </tr>
                    </table>
                </LayoutTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server" width="33%">
                        </td>
                    </tr>
                </GroupTemplate>
                <ItemTemplate>
                                        <td id="Td1" runat="server">
                                            <table width="120" id="exchangebg">
		          <tr>
		            <td height="88" colspan="2">
        <a href='ProductDetails.aspx?productID=<%# Eval("ProductID") %>'>
                                                    <!--显示产品缩略图--><div style=" width: 120px; height: 90px;">
                                                    <image src='../images/product/<%# Eval("Picture1") %>' width="120px" height="90px"
                                                        border="0"></div>
                                                </a></td>
		            </tr>
                     <tr>
                    <td>
                     <br />
                    </td>
                    </tr>
		          <tr>
		            <td height="23" colspan="2"><a href='ProductDetails.aspx?productID=<%# Eval("ProductID") %>' style="text-decoration: none; font-size: 12px; color: #000000;">
                                                    <%# Eval("ProName") %></a></td>
		            </tr>
		          <tr>
		            <td width="120" height="30"><div id="line"><a style="text-decoration: none; color: #FF3300; font-size: 18px;  "><%# Eval("Price", "{0:c}")%></a></div>
                    </td>
		            <td width="120">    
                                 
                    </td>
	              </tr>
		          <tr>
                  
		            <td width="120" colspan="2" height="60"><a style="font-size: 12px; vertical-align: middle;"><%# Eval("ProTitle") %></a></td>
                    
	              </tr>
  		        </table>
                                        </td>
                                    </ItemTemplate>
            </asp:ListView>
        </div>
<!--结束-->
       
  <!--特便宜窗口-->
<div id="newproduct">
		<div id="probar">
         <a href="ProductList.aspx?clear=clear&isbool=Ischeap" 
                style="float: right; margin-right: 35px; margin-top: 10px;"><img src="../images/index/more.jpg" /></a>              
        </div>
		<div id="Div123">
            <asp:ListView ID="ListViewonlyfive" runat="server" GroupItemCount="3" 
                style="margin-right: 0px; margin-top: 0px">
                    <LayoutTemplate>
                        <table id="groupPlaceholderContainer" runat="server" width="100%">
                            <tr id="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <GroupTemplate>
                        <tr id="itemPlaceholderContainer" runat="server">
                            <td id="itemPlaceholder" runat="server" width="49%">
                            </td>
                        </tr>
                    </GroupTemplate>
                    <ItemTemplate>
                        <td id="Td2" runat="server">
                            <table width="120" id="speacialbg0">
		          <tr>
		            <td height="88" colspan="2">
        <a href='ProductDetails.aspx?productID=<%# Eval("ProductID") %>'>
                                                    <!--显示产品缩略图--><div style=" width: 120px; height: 90px;">
                                                    <image src='../images/product/<%# Eval("Picture1") %>' width="120px" height="90px"
                                                        border="0"></div>
                                                </a></td>
		            </tr>
                    <tr>
                    <td>
                     <img src="../images/index/onesign.jpg" />
                    </td>
                    </tr>
		          <tr>
		            <td height="23" colspan="2"><a href='ProductDetails.aspx?productID=<%# Eval("ProductID") %>' style="text-decoration: none; font-size: 12px; color: #000000;">
                                                   <%# Eval("ProName") %></a></td>
		            </tr>
		          <tr>
		            <td width="120" height="30"><div id="line0"><a style="text-decoration: none; color: #FF3300; font-size: 18px;  "><%# Eval("Price", "{0:c}")%></a></div>
                    </td>
		            <td width="120">    
                               
                    </td>
	              </tr>
                  <tr>
                  <td><a href='room/room.aspx?roomID=<%# Eval("roomID") %>' target="_blank"><img src="../images/button/enterbutton.png" /></a></td>
                  </tr>
		          <tr>
                  
		            <td width="120" colspan="2" height="60"><a style="font-size: 12px; vertical-align: middle;"><%# Eval("ProTitle") %></a></td>
                    
	              </tr>
  		        </table>
                                        </td>
                                    </ItemTemplate>
                    
                        </asp:ListView>
        </div>
</div>
<!--结束-->  



<!--热销窗口-->
<div id="hotproduct">
		<div id="probar">
        <a href="ProductList.aspx?clear=clear&method=Sale_Num desc" 
                style="float: right; margin-right: 35px; margin-top: 10px;"><img src="../images/index/more.jpg" /></a>
        </div>
		<div id="Div2">
        <asp:ListView ID="ListView_hot" runat="server" GroupItemCount="7">
                <LayoutTemplate>
                    <!--指定分组容器-->
                    <table id="groupPlaceholderContainer" runat="server" width="100%">
                        <tr id="groupPlaceholder" runat="server">
                        </tr>
                    </table>
                </LayoutTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server">
                        </td>
                    </tr>
                </GroupTemplate>
                <ItemTemplate>
                                        <td id="Td1" runat="server">
                                            <table width="120" id="hotbg">
		          <tr>
		            <td height="88" colspan="2">
        <a href='ProductDetails.aspx?productID=<%# Eval("ProductID") %>'>
                                                    <!--显示产品缩略图--><div style=" width: 120px; height: 90px;">
                                                    <image src='../images/product/<%# Eval("Picture1") %>' width="120px" height="90px"
                                                        border="0"></div>
                                                </a></td>
		            </tr>
                     <tr>
                    <td>
                     <img src="../images/index/hotsign.jpg" />
                    </td>
                    </tr>
		          <tr>
		            <td height="23" colspan="2"><a href='ProductDetails.aspx?productID=<%# Eval("ProductID") %>' style="text-decoration: none; font-size: 12px; color: #000000;">
                                                    <%# Eval("ProName") %></a></td>
		            </tr>
		          <tr>
		            <td width="120" height="30"><div id="line"><a style="text-decoration: none; color: #FF3300; font-size: 18px;  "><%# Eval("Price", "{0:c}")%></a></div>
                    </td>
		            <td width="120">    
                                 
                    </td>
	              </tr>
		          <tr>
                  
		            <td width="120" colspan="2" height="60"><a style="font-size: 12px; vertical-align: middle;"><%# Eval("ProTitle") %></a></td>
                    
	              </tr>
  		        </table>
                                        </td>
                                    </ItemTemplate>
            </asp:ListView>
        </div>
</div>
<!--结束-->  

 
<!-- 新品窗口 --> 
<div id="newpro">
		<div id="probar">
         <a href="ProductList.aspx?clear=clear&method=Upload_Time desc" 
                style="float: right; margin-right: 35px; margin-top: 10px;"><img src="../images/index/more.jpg" /></a>
        </div>
		<div id="Div4">
        <asp:ListView ID="ListView_new" runat="server" GroupItemCount="7">
                <LayoutTemplate>
                    <!--指定分组容器-->
                    <table id="groupPlaceholderContainer" runat="server" width="1000px">
                        <tr id="groupPlaceholder" runat="server">
                        </tr>
                    </table>
                </LayoutTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server" width="33%">
                        </td>
                    </tr>
                </GroupTemplate>
                <ItemTemplate>
                                        <td id="Td1" runat="server">
                                            <table width="120" id="newbg">
		          <tr>
		            <td height="88" colspan="2">
        <a href='ProductDetails.aspx?productID=<%# Eval("ProductID") %>'>
                                                    <!--显示产品缩略图--><div style=" width: 120px; height: 90px;">
                                                    <image src='../images/product/<%# Eval("Picture1") %>' width="120px" height="90px"
                                                        border="0"></div>
                                                </a></td>
		            </tr>
                     <tr>
                    <td>
                     <img src="../images/index/newsign.jpg" />
                    </td>
                    </tr>
		          <tr>
		            <td height="23" colspan="2"><a href='ProductDetails.aspx?productID=<%# Eval("ProductID") %>' style="text-decoration: none; font-size: 12px; color: #000000;">
                                                    <%# Eval("ProName") %></a></td>
		            </tr>
		          <tr>
		            <td width="120" height="30"><div id="line"><a style="text-decoration: none; color: #FF3300; font-size: 18px;  "><%# Eval("Price", "{0:c}")%></a></div>
                    </td>
		            <td width="120">    
                                 
                    </td>
	              </tr>
		          <tr>
                  
		            <td width="120" colspan="2" height="60"><a style="font-size: 12px; vertical-align: middle;"><%# Eval("ProTitle") %></a></td>
                    
	              </tr>
  		        </table>
                                        </td>
                                    </ItemTemplate>
            </asp:ListView>
        </div>
</div>
<!--结束-->


</div>
      
<!--第三广告栏-->
<div id="ad3">
    <asp:Image ID="img_AD3" runat="server" Width="100%" Height="100%" />
</div>
<!--结束-->
     
<!-- 热门分类推荐区 -->
  
<!--tab窗口-->
		
     

<!--结束--> 
  
  
  
    <a name="tab"></a>
    <div id="tabproduct">
        <table border="0" cellpadding="0" cellspacing="0" width="98%">
            <tr>
                <td class="tabbernav" style="width: 98%; height: 50px;">
                 <div id="tabbar">   <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" OnMenuItemClick="Menu1_MenuItemClick"
                        MaximumDynamicDisplayLevels="4" BackColor="#FF6600" 
                         DynamicHorizontalOffset="2" Font-Names="Vivaldi" Font-Size="Small" 
                         ForeColor="White" StaticSubMenuIndent="10px">
                        <DynamicHoverStyle BackColor="#990000" ForeColor="White" />
                        <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                        <DynamicMenuStyle BackColor="#FFFBD6" />
                        <DynamicSelectedStyle BackColor="#FFCC66" />
                        <Items>
                            <asp:MenuItem Text="数码电子" Value="0" Selected="True" NavigateUrl="index.aspx?tabtag=0#tab"></asp:MenuItem>
                            <asp:MenuItem Text="生活电器" Value="1" NavigateUrl="index.aspx?tabtag=1#tab"></asp:MenuItem>
                            <asp:MenuItem Text="服装" Value="2" NavigateUrl="index.aspx?tabtag=2#tab"></asp:MenuItem>
                            <asp:MenuItem Text="图书音像" Value="3" NavigateUrl="index.aspx?tabtag=3#tab"></asp:MenuItem>
                        </Items>
                        <StaticMenuItemStyle CssClass="tabItem" BorderWidth="2px" 
                            HorizontalPadding="5px" VerticalPadding="2px" />
                        <StaticSelectedStyle CssClass="tabSelected" BackColor="#FFCC66" />
                        <StaticHoverStyle CssClass="tabHover" BackColor="#990000" ForeColor="White" />
                    </asp:Menu></div>
                </td>
            </tr>
            <tr>
                <td class="tabcontent">
                    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                        <asp:View ID="Tab1" runat="server">
                            <div id="tabshow">
                                <asp:ListView ID="ListView1" runat="server" GroupItemCount="7">
                                    <LayoutTemplate>
                                        <!--指定分组容器-->
                                        <table id="groupPlaceholderContainer" runat="server" width="99%">
                                            <tr id="groupPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </LayoutTemplate>
                                    <GroupTemplate>
                                        <tr id="itemPlaceholderContainer" runat="server">
                                            <td id="itemPlaceholder" runat="server" width="33%">
                                            </td>
                                        </tr>
                                    </GroupTemplate>
                                    <ItemTemplate>
                                        <td id="Td1" runat="server">
                                            <table width="120" id="tabbg">
		          <tr>
		            <td height="88" colspan="2">
        <a href='ProductDetails.aspx?productID=<%# Eval("ProductID") %>'>
                                                    <!--显示产品缩略图--><div style=" width: 120px; height: 90px;">
                                                    <image src='../images/product/<%# Eval("Picture1") %>' width="120px" height="90px"
                                                        border="0"></div>
                                                </a></td>
		            </tr>
		          <tr>
		            <td height="23" colspan="2"><a href='ProductDetails.aspx?productID=<%# Eval("ProductID") %>' style="text-decoration: none; font-size: 12px; color: #000000;">
                                                    <%# Eval("ProName") %></a></td>
		            </tr>
		          <tr>
		            <td width="120" height="30"><div id="line"><a style="text-decoration: none; color: #FF3300; font-size: 18px;  "><%# Eval("Price", "{0:c}")%></a></div>
                    </td>
		            <td width="120">    
                                 
                    </td>
	              </tr>
		          <tr>
                  
		            <td width="120" colspan="2" height="60"><a style="font-size: 12px; vertical-align: middle;"><%# Eval("ProTitle") %></a></td>
                    
	              </tr>
  		        </table>
                                        </td>
                                    </ItemTemplate>
                                </asp:ListView>
                            </div>
                        </asp:View>
                        <asp:View ID="Tab2" runat="server">
                            <div id="tabshow">
                                <asp:ListView ID="ListView2" runat="server" GroupItemCount="4">
                                    <LayoutTemplate>
                                        <!--指定分组容器-->
                                        <table id="groupPlaceholderContainer" runat="server" width="100%">
                                            <tr id="groupPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </LayoutTemplate>
                                    <GroupTemplate>
                                        <tr id="itemPlaceholderContainer" runat="server">
                                            <td id="itemPlaceholder" runat="server" width="33%">
                                            </td>
                                        </tr>
                                    </GroupTemplate>
                                    <ItemTemplate>
                                        <td id="Td1" runat="server">
                                            <table width="169">
		          <tr>
		            <td height="88" colspan="2">
        <a href='ProductDetails.aspx?productID=<%# Eval("ProductID") %>'>
                                                    <!--显示产品缩略图--><div style=" width: 120px; height: 90px;">
                                                    <image src='../images/product/<%# Eval("Picture1") %>' width="120px" height="90px"
                                                        border="0"></div>
                                                </a></td>
		            </tr>
		          <tr>
		            <td height="23" colspan="2"><a href='ProductDetails.aspx?productID=<%# Eval("ProductID") %>' style="text-decoration: none; font-size: 12px; color: #000000;">
                                                    <%# Eval("ProName") %></a></td>
		            </tr>
		          <tr>
		            <td width="120" height="30"><a style="text-decoration: none; color: #FF3300; font-size: 18px;  "><%# Eval("Price", "{0:c}")%></a></td>
		            <td width="127"></td>
	              </tr>
		          <tr>
		            <td width="120" colspan="2" height="60"><a style="font-size: 12px; vertical-align: middle;"><%# Eval("ProTitle") %></a></td>
	              </tr>
  		        </table>
                                        </td>
                                    </ItemTemplate>
                                </asp:ListView>
                            </div>
                        </asp:View>
                        <asp:View ID="Tab3" runat="server">
                            <div id="tabshow">
                                <asp:ListView ID="ListView3" runat="server" GroupItemCount="4">
                                    <LayoutTemplate>
                                        <!--指定分组容器-->
                                        <table id="groupPlaceholderContainer" runat="server" width="100%">
                                            <tr id="groupPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </LayoutTemplate>
                                    <GroupTemplate>
                                        <tr id="itemPlaceholderContainer" runat="server">
                                            <td id="itemPlaceholder" runat="server" width="33%">
                                            </td>
                                        </tr>
                                    </GroupTemplate>
                                    <ItemTemplate>
                                        <td id="Td1" runat="server">
                                            <table width="169">
		          <tr>
		            <td height="88" colspan="2">
        <a href='ProductDetails.aspx?productID=<%# Eval("ProductID") %>'>
                                                    <!--显示产品缩略图--><div style=" width: 120px; height: 90px;">
                                                    <image src='../images/product/<%# Eval("Picture1") %>' width="120px" height="90px"
                                                        border="0"></div>
                                                </a></td>
		            </tr>
		          <tr>
		            <td height="23" colspan="2"><a href='ProductDetails.aspx?productID=<%# Eval("ProductID") %>' style="text-decoration: none; font-size: 12px; color: #000000;">
                                                    <%# Eval("ProName") %></a></td>
		            </tr>
		          <tr>
		            <td width="120" height="30"><a style="text-decoration: none; color: #FF3300; font-size: 18px;  "><%# Eval("Price", "{0:c}")%></a></td>
		            <td width="127"></td>
	              </tr>
		          <tr>
		            <td width="120" colspan="2" height="60"><a style="font-size: 12px; vertical-align: middle;"><%# Eval("ProTitle") %></a></td>
	              </tr>
  		        </table>
                                        </td>
                                    </ItemTemplate>
                                </asp:ListView>
                            </div>
                        </asp:View>
                        <asp:View ID="Tab4" runat="server">
                            <div id="tabshow">
                                <asp:ListView ID="ListView4" runat="server" GroupItemCount="4">
                                    <LayoutTemplate>
                                        <!--指定分组容器-->
                                        <table id="groupPlaceholderContainer" runat="server" width="100%">
                                            <tr id="groupPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </LayoutTemplate>
                                    <GroupTemplate>
                                        <tr id="itemPlaceholderContainer" runat="server">
                                            <td id="itemPlaceholder" runat="server" width="33%">
                                            </td>
                                        </tr>
                                    </GroupTemplate>
                                    <ItemTemplate>
                                        <td id="Td1" runat="server">
                                            <table width="169">
		          <tr>
		            <td height="88" colspan="2">
        <a href='ProductDetails.aspx?productID=<%# Eval("ProductID") %>'>
                                                    <!--显示产品缩略图--><div style=" width: 120px; height: 90px;">
                                                    <image src='../images/product/<%# Eval("Picture1") %>' width="120px" height="90px"
                                                        border="0"></div>
                                                </a></td>
		            </tr>
		          <tr>
		            <td height="23" colspan="2"><a href='ProductDetails.aspx?productID=<%# Eval("ProductID") %>' style="text-decoration: none; font-size: 12px; color: #000000;">
                                                    <%# Eval("ProName") %></a></td>
		            </tr>
		          <tr>
		            <td width="120" height="30"><a style="text-decoration: none; color: #FF3300; font-size: 18px;  "><%# Eval("Price", "{0:c}")%></a></td>
		            <td width="127"></td>
	              </tr>
		          <tr>
		            <td width="120" colspan="2" height="60"><a style="font-size: 12px; vertical-align: middle;"><%# Eval("ProTitle") %></a></td>
	              </tr>
  		        </table>
                                        </td>
                                    </ItemTemplate>
                                </asp:ListView>
                            </div>
                        </asp:View>
                    </asp:MultiView>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <!-- 热门分类推荐区 end-->
    </div>

    <div id="footer">
         关于OK淘 合作伙伴 营销中心 联系客服 开放平台 诚征英才 联系我们 网站地图 法律声明 © 2012 okeytao.com 版权所有 </div>
    </form>
</body>
</html>
