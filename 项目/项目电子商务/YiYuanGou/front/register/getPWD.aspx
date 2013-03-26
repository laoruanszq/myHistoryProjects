<%@ Page Language="C#" AutoEventWireup="true" CodeFile="getPWD.aspx.cs" Inherits="front_register_getPWD" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Styles/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="getpwd">
        <p>
            用户名：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="下一步" onclick="Button1_Click" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBox1" ErrorMessage="用户名不能为空" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <asp:panel ID="answerQuestion1"  runat="server" Visible="False">
            <p>
                密码问题：<asp:Label ID="Label_question1" runat="server"></asp:Label>
            </p>
            <p>
                答案：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBox2" ErrorMessage="答案不能为空" ForeColor="Red" Display="Dynamic" ValidationGroup="find"></asp:RequiredFieldValidator>
            </p>
         </asp:panel>
         <asp:panel ID="answerQuestion2"  runat="server" Visible="False">
            <p>
                密码问题：<asp:Label ID="Label_question2" runat="server"></asp:Label>
            </p>
            <p>
                答案：<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="TextBox3" ErrorMessage="答案不能为空" ForeColor="Red" Display="Dynamic" ValidationGroup="find"></asp:RequiredFieldValidator>
            </p>
         </asp:panel>
         <asp:panel ID="answerQuestion3"  runat="server" Visible="False">
            <p>
                密码问题：<asp:Label ID="Label_question3" runat="server"></asp:Label>
            </p>
            <p>
                答案：<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="TextBox4" ErrorMessage="答案不能为空" ForeColor="Red" Display="Dynamic" ValidationGroup="find"></asp:RequiredFieldValidator>
            </p>
         </asp:panel>
         <asp:panel ID="answerQuestionConfirm"  runat="server" Visible="False">
              <asp:Button ID="Button2" runat="server" Text="确定" onclick="Button2_Click" ValidationGroup="find" />
         </asp:panel>
     </div>
    </form>
    
</body>
</html>

