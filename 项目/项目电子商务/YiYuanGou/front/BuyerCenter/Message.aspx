<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Message.aspx.cs" Inherits="front_BuyerCenter_Message" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Styles/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">


    <div id="maillist">
    
        <asp:ListView ID="ListView1" runat="server" GroupItemCount="1">
             <LayoutTemplate>
                <table id="groupPlaceholderContainer" runat="server" width="90%">
                        <tr ><td>已读</td><td> 发信人 </td><td>邮件主题&nbsp;&nbsp;&nbsp; </td><td>发送时间</td><td> &nbsp;&nbsp; </td></tr>
                        <tr ID="groupPlaceholder" runat="server"></tr>
                </table>
            </LayoutTemplate>
            <GroupTemplate>
                <tr ID="itemPlaceholderContainer" runat="server">
                    <td ID="itemPlaceholder" runat="server" colspan="5"></td>
                </tr>
            </GroupTemplate>
            <ItemTemplate>
                <td id="Td1"  colspan="5" runat="server">
                    <table border="0" runat="server" width="100%" >
                        <tr >
                            <td width="17%"><%# Eval("IsOpen") %></td>
                            <td width="20%"><%# Eval("userName") %></td>
                            <td width="25%"> <a href='MailDetail.aspx?Email=<%# Eval("MailID") %>' target="_blank"><%# Eval("MTitle") %></a></td>
                            <td width="20%"><%# Eval("SendTime") %></td>
                            <td width="17%">
                                <a href='deleteMail.aspx?Email=<%# Eval("MailID") %>'>删除</a>
                            </td>
                        </tr>
                        </table>
                    </td>
            </ItemTemplate>
        </asp:ListView>
    
    </div>
    </form>
</body>
</html>
