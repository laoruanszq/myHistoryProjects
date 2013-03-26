<%@ Page Language="C#" AutoEventWireup="true" CodeFile="room.aspx.cs" Inherits="front_room_room" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>房间</title>
    <script type="text/javascript" language="javascript">
        function copy() {
            clipboardData.setData('text', document.getElementById("roomid").innerHTML);
            alert("复制成功");
        }
    </script>
    <link href="../../Styles/css.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style2
        {
            width: 217px;
        }
        .style3
        {
            width: 122px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="margin: 0 auto; ">

        <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="3000">
        </asp:Timer>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
          <!-- 状态栏 用户名+站内信+订单信息 -->
        <div id="header">
        <div id="headertext">
            <div id="leftinfo">欢迎来到ok购！</div>
            <div id="info">您好，<asp:Label ID="Label1" runat="server" Text="游客"></asp:Label>&nbsp;
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
            <li><a href="../BuyerCenter/Message.aspx"target="_blank">站内信</a></li>
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



                        <div id="main">
                    <div id="ad2"></div>
                    <div id="roomleft">
                    <div id="sitlist">
                    
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <table style="width: 20px; height: 95%">
                                <tr style="height: 90%">
                                    <td colspan="2" style="overflow:auto;">
                                        <asp:Repeater ID="Seatman" runat="server">
                                            <HeaderTemplate>
                                                <table border="0" style="width: 200px; height: 99%">
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr align="center" height="8%">
                                                    <td>
                                                        <%# Eval( "rownum")%>
                                                    </td>
                                                    <td>
                                                        <%# Eval( "userName")%>
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
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        正襟危坐
                                    </td>
                                    <td>
                                        <asp:Label ID="sitdownrat" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick"></asp:AsyncPostBackTrigger>
                            <asp:AsyncPostBackTrigger ControlID="sit" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="stand" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                    
                    
                    </div>


                    <div id="watchlist">
                    
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <div style="overflow:auto;">
                                <asp:Repeater ID="EnterMan" runat="server">
                                    <HeaderTemplate>
                                        <table border="0">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr align="center" height="7%">
                                            <td>
                                                <%# Eval( "userName")%>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <tr>
                                            <td>
                                            </td>
                                        </tr>
                                        </table>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick"></asp:AsyncPostBackTrigger>
                            <asp:AsyncPostBackTrigger ControlID="sit" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="stand" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>

                    
                    </div>
                    </div>
                    <div id="roomright">
                   
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                             <div id="roominfo">
                                <table width="730" border="0">
                                    <tr>
                                        <td>
                                            房间号:<asp:Label ID="roomid" runat="server"></asp:Label>
                                            <input name="button2" onclick="copy()" type="button" value="复制" />
                                        </td>
                                        <td>
                                            用户:<asp:Label ID="name" runat="server"></asp:Label>
                                            <asp:Label ID="State" runat="server"></asp:Label>
                                            <asp:Label ID="erroMessage" runat="server" ForeColor="Red"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                           
                        </ContentTemplate>
                              
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick"></asp:AsyncPostBackTrigger>
                            <asp:AsyncPostBackTrigger ControlID="refresh" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="leave" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="sit" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="stand" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>



                         <div id="productinfo">
                                <table border="0" width="100%" height="100%">
                                    <tr>
                                        <td rowspan="5" style="vertical-align: middle;" class="style2">
                                            <asp:HyperLink ID="productdetail1" runat="server">
                                                <asp:Image ID="productimage" runat="server" Width="300px" Height="210px" />
                                            </asp:HyperLink>
                                        </td>
                                        <td class="style3">
                                            <asp:HyperLink ID="productdetail2" runat="server">
                                                <asp:Label ID="proName" runat="server" Text="" />
                                            </asp:HyperLink></td></tr><tr>
                                        <td class="style3"><asp:Label ID="ProTitle" runat="server" Text="" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style3">价格: <asp:Label ID="Price"  runat="server" Text=""></asp:Label></td></tr><tr>
                                        <td 
                                            class="style3">花费: <asp:Label ID="fee" runat="server" Text=""></asp:Label></td></tr><tr>
                                        <td class="style3">
                                            <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                                <ContentTemplate>
                                                       占座率: <asp:Label ID="sitrate" runat="server" Text=""></asp:Label><asp:Button ID="refresh" runat="server" Text="刷新" OnClick="refresh_Click" />            
                                                </ContentTemplate>
                                            </asp:UpdatePanel>  
                                        </td>
                                    </tr>
                                </table>   
                          </div>

                     <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                        <ContentTemplate>
                            <div id="sitbutton">
                                                
                               <asp:Button ID="sit" runat="server" OnClick="sit_Click" Text="占座" />
                               <br />
                               <asp:Button ID="stand" runat="server" OnClick="stand_Click" Text="让座" />
                               <br />
                                <asp:Button ID="leave" runat="server" Text="离开房间" onclick="leave_Click" />
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel> 
                           
                                 
             
                    

                    

                    <div id="roomchat">
                         <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                            <ContentTemplate>
                                <div id="showchat" style="height:250px;  overflow:auto; border:medium;"><asp:Repeater ID="chat" runat="server">
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
                                                    <%# Eval("Username")%>: </td><td width="78%" style="word-break : break-all; overflow:hidden; ">
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



                        <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Conditional">
                         <ContentTemplate>
                               <table class="style1">
                                <tr>
                                <td>
                                <img src="../../images/index/user.png" alt="" width="15" height="15" />
                                </td>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text="匿名用户"></asp:Label></td><td>
                                       <asp:TextBox ID="chatcontent" runat="server" Width="319px"></asp:TextBox></td><td>
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
              





                    <div id="roomnews">
                    
                    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                        
                            <ContentTemplate>
                                <asp:Repeater ID="inform" runat="server">
                                    <HeaderTemplate>
                                        <table border="0" width="99%" height="99%">
                                            <tr>
                                                <td></td>
                                            </tr>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <%# Eval( "content")%>
                                             </td>
                                        </tr>
                                     </ItemTemplate><FooterTemplate>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                        </table>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                            </Triggers>
                        </asp:UpdatePanel>

                    </div>
                    </div>
                    </div>

                     <div id="footer">
         关于OK淘 合作伙伴 营销中心 联系客服 开放平台 诚征英才 联系我们 网站地图 法律声明 © 2012 okeytao.com 版权所有                   </div>
                    </div>

                     <div id="footer">
         关于OK淘 合作伙伴 营销中心 联系客服 开放平台 诚征英才 联系我们 网站地图 法律声明 © 2012 okeytao.com 版权所有 </div>

    </form>
</body>
</html>
