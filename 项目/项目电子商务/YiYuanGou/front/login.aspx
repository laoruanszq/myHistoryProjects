<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login__new" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<link href="../Styles/css.css" rel="stylesheet" type="text/css" /></head>
<body>
    <form id="form1" runat="server">
        <div id="main">
            <div id="logindiv">
            <div id="loginboard">
            <div id="logintop"></div>
            <div id="loginid">
                <asp:TextBox ID="username" runat="server" BorderStyle="None" 
                    Height="35px" Width="123px"></asp:TextBox>
                <asp:Label ID="usercheck" runat="server"></asp:Label>
                </div>
            <div id="loginkey"> &nbsp;<asp:TextBox ID="password" runat="server" 
                    TextMode="Password" BorderStyle="None" Height="35px" Width="95px"></asp:TextBox>
                <asp:Label ID="pwdcheck" runat="server"></asp:Label>
                </div>
            <div id="loginselect"><asp:Label ID="erroMessage" runat="server" ForeColor="Red"></asp:Label>
                </div>
            <div id="loginbutton">
            <asp:ImageButton ID="login" runat="server" onclick="login_Click"
                    ImageUrl="~/images/login/Backloginbutton.png" />
                <asp:ImageButton ID="cancle" runat="server" onclick="cancle_Click"
                    ImageUrl="~/images/login/Bloginreset.jpg" />
            </div>
            <div id="loginreg"><a href="register/getPWD.aspx">忘记密码</a>｜<a href="register/register.aspx">注册新用户</a></div>
            </div>
            </div>
            <div id="rightbg"></div>
            </div>
        <div id="footer"></div>
    </form>
</body>
</html>
