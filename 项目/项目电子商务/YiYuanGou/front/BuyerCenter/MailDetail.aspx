<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MailDetail.aspx.cs" Inherits="front_BuyerCenter_MailDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #TextArea1
        {
            height: 381px;
            width: 652px;
        }
    </style>
    <link href="../../Styles/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
     <div id="mail">
            <p>
                主题:<asp:Label ID="title" runat="server"></asp:Label>
            </p>
            <p>
                发件人:<asp:Label ID="whosender" runat="server"></asp:Label>
            </p>
            <p>
                发件时间:<asp:Label ID="time" runat="server"></asp:Label>
            </p>
   
            <p>
                <asp:TextBox id="MailContent" runat="server" name="S1" Height="453px" 
                    ReadOnly="True" Rows="10" TextMode="MultiLine" Width="685px" ></asp:TextBox></p>
            <p>
                &nbsp;</p>
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="删除" />
                &nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="返回" />
    </div>
    </form>
    </body>
</html>
