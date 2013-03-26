<%@ Page Language="C#" AutoEventWireup="true" CodeFile="room_backup.aspx.cs" Inherits="front_room_room_backup" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>房间</title>
    <script type="text/javascript" language="javascript">
        function copy() {
            clipboardData.setData('text', document.getElementById("roomid").innerHTML);
            alert("复制成功");
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" style="margin: 0 auto; width: 80%;">
    <!-- 网站头部+菜单 -->
    <div style="height: 100px">
        <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="20000">
        </asp:Timer>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <anothermenu:anotherTabMenu ID="mymenu" runat="server" />
    </div>
    <!-- 网站头部+菜单  end-->

    <!-- 网站内容 -->
    <div style="height: 800px">
        <div id="ad" style="height: 8%">
            广告
        </div>

        <div id="Content" style="height: 89%">

            <!-- 左边 占座和旁观列表  -->
            <div style="float: left; width: 23%; height: 100%">
                <!-- 占座列表  -->
                <div id="ditdown" style="height: 50%; width: 100%">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <table style="width: 99%; height: 95%">
                                <tr style="height: 90%">
                                    <td colspan="2" style="overflow: auto;">
                                        <asp:Repeater ID="Seatman" runat="server">
                                            <HeaderTemplate>
                                                <table border="1" style="width: 99%; height: 99%">
                                                    <tr align="center" height="10%">
                                                        <td>
                                                            座号
                                                        </td>
                                                        <td>
                                                            用户
                                                        </td>
                                                    </tr>
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
                                    <td align="center">
                                        正襟危坐
                                    </td>
                                    <td align="right">
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
                <!-- 占座列表  end-->

                <!-- 旁观  -->
                <div id="enterRoom" style="height: 49%; width: 100%">
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <div style="overflow: auto;">
                                <asp:Repeater ID="EnterMan" runat="server">
                                    <HeaderTemplate>
                                        <table border="1" style="width: 99%; height: 99%">
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
                <!-- 旁观  end-->
            </div>
            <!-- 左边 占座和旁观列表  end-->

            <!-- 右边 房间信息聊天公告  -->
            <div style="float: right; width: 75%; height: 100%">
                <div id="Div1" style="height: 20%; width: 100%">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <div id="roominfo" style="width: 99%; height: 18%">
                                <table width="90%">
                                    <tr>
                                        <td>
                                            房间号:<asp:Label ID="roomid" runat="server"></asp:Label>
                                            <input name="button2" onclick="copy()" type="button" value="复制" />
                                        </td>
                                        <td>
                                            用户:<asp:Label ID="name" runat="server"></asp:Label>
                                            <asp:Label ID="State" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div style="float: left; width: 56%; height: 80%">
                                <table border="0" width="100%" height="100%">
                                    <tr>
                                        <td rowspan="5" style="vertical-align: middle;">
                                            <asp:HyperLink ID="productdetail1" runat="server">
                                                <asp:Image ID="productimage" runat="server" Width="90px" Height="110px" />
                                            </asp:HyperLink>
                                        </td>
                                        <td style="width: 100px; vertical-align: middle;">
                                            <asp:HyperLink ID="productdetail2" runat="server">
                                                <asp:Label ID="proName" runat="server" Text="" />
                                            </asp:HyperLink></td></tr><tr>
                                        <td>
                                            <asp:Label ID="ProTitle" runat="server" Text="" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            价格: <asp:Label ID="Price"  runat="server" Text=""></asp:Label></td></tr><tr>
                                        <td>
                                            花费: <asp:Label ID="fee" runat="server" Text=""></asp:Label></td></tr><tr>
                                        <td> 
                                            占座率: <asp:Label ID="sitrate" runat="server" Text=""></asp:Label><asp:Button ID="refresh" runat="server" Text="刷新" OnClick="refresh_Click" />     
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div style="float: right; width: 41%; height: 80%">
                               &nbsp;&nbsp; <br />
                               <asp:Button ID="sit" runat="server" OnClick="sit_Click" Text="占座" />
                               &nbsp;&nbsp; <asp:Button ID="stand" runat="server" OnClick="stand_Click" Text="让座" />
                                &nbsp;&nbsp; <asp:Button ID="leave" runat="server" Text="离开房间" />
                                 &nbsp;&nbsp; <br />
                                  <br />
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
                </div>

                <div id="chat" style="height: 44%; width: 100%">
                
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                            <ContentTemplate>
                                <asp:TextBox ID="chatform" runat="server" MaxLength="17" Rows="17" TextMode="MultiLine" Width="98%"></asp:TextBox><asp:Label ID="name1" runat="server" Text=""></asp:Label><asp:TextBox 
                                    ID="chatcontent" runat="server" Height="23px" Width="485px"></asp:TextBox>&nbsp; <asp:Button ID="sendChat" runat="server" OnClick="sendChat_Click" Text="发送" />
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                                <asp:AsyncPostBackTrigger ControlID="sendChat" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>

                </div>

                <div id="Announcement" style="height: 34%; width: 100%">
                   <div style=" overflow:auto">
                        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                        
                            <ContentTemplate>
                                <asp:Repeater ID="inform" runat="server">
                                    <HeaderTemplate>
                                        <table border="1" width="99%" height="99%">
                                            <tr>
                                                <td></td>
                                            </tr>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                用户 <%# Eval( "UserName")%>在 <%# Eval( "ProName")%>的 <%# Eval( "RoomType")%>号房间中成功拍中商品！！！ </td></tr></ItemTemplate><FooterTemplate>
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
            <!-- 右边 房间信息聊天公告 end -->
        </div>

    </div>
    <!-- 网站内容  end-->
    </form>
</body>
</html>
