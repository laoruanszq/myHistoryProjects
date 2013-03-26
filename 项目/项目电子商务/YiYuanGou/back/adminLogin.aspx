<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminLogin.aspx.cs" Inherits="back_adminLogin_new" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>后台登录</title>
    <link href="../Styles/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
<div id="blogin"></div>
<div id="blogintop"></div>
<div id="bloginboard">
<div id="bloginid"> 用户名:<asp:TextBox ID="username" runat="server" Height="19px" 
        Width="125px"></asp:TextBox><asp:Label ID="usercheck" runat="server" Text="*"></asp:Label></div>
<div id="bloginkey">密&nbsp;&nbsp; 码:<asp:TextBox ID="password" runat="server" 
        TextMode="Password" Height="19px" Width="125px"></asp:TextBox> <asp:Label ID="pwdcheck" runat="server" Text="*"></asp:Label></div>
<div id="bloginselect"><asp:Label ID="erroMessage" runat="server" ForeColor="Red"></asp:Label></div>
<div id="bloginbutton">
                <asp:ImageButton ID="login" runat="server" onclick="login_Click"
                    ImageUrl="~/images/login/Backloginbutton.png" />
                <asp:ImageButton ID="cancle" runat="server" onclick="cancle_Click"
                    ImageUrl="~/images/login/Bloginreset.jpg" /></div>
</div>
</div>
<div id="bloginbottom"></div>
    </form>
</body>
</html>
