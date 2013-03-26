<%@ Page Language="C#" AutoEventWireup="true" CodeFile="selectUser.aspx.cs" Inherits="back_WebManage_Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Styles/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div id="main">
    <form id="form1" runat="server">

    
        <br />
        用户名：&nbsp;<asp:TextBox ID="TextBox1" runat="server" 
            Width="166px"></asp:TextBox>
        <br />
        <br />
        真实姓名：<asp:TextBox ID="TextBox2" runat="server" Width="169px"></asp:TextBox>
        <br />
        <br />
        学校/省： 
        <asp:DropDownList ID="DropDownList1"  runat="server" 
            Height="22px" Width="165px" 
            onselectedindexchanged="DropDownList1_SelectedIndexChanged" 
            AutoPostBack="True">
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        学院/市： 
        <asp:DropDownList ID="DropDownList2" runat="server" Height="22px" Width="164px">
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="查询" onclick="Button1_Click" />
&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="重设" onclick="Button2_Click" />
        <br />
        ------------------------------------------------------------<br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  AllowPaging="True" 
            PageSize="50" OnPageIndexChanging="GridView1_PageIndexChanging"  >
            <Columns>
                <asp:TemplateField HeaderText="选择">
                  <ItemTemplate> <asp:CheckBox ID="CheckBox1" runat="server" /> </ItemTemplate>  <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="40px" /> 
                </asp:TemplateField>
                <asp:BoundField DataField="userID" HeaderText="用户编号" ReadOnly="True" />
                <asp:BoundField DataField="userName" HeaderText="用户名" ReadOnly="True" />
                <asp:BoundField DataField="trueName" HeaderText="真实姓名" ReadOnly="True" />
                <asp:BoundField DataField="university_Province" HeaderText="学校/省" 
                    ReadOnly="True" />
                <asp:BoundField DataField="college_City" HeaderText="学院/市" ReadOnly="True" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:Button ID="Button3" runat="server" Text="添加" onclick="Button3_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="sendMail.aspx">返回</a>
        <br />
        <br />

    </form>
        
    </div>
</body>
</html>
