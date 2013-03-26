<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangeUserInfo.aspx.cs" Inherits="front_BuyerCenter_ChangeUserInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Styles/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
      <!-- 状态栏 用户名+站内信+订单信息 -->
        <div id="header">
        <div id="headertext">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
            <div id="leftinfo">欢迎来到ok购！</div>
            <div id="info">您好，<asp:Label ID="name" runat="server" Text="游客"></asp:Label>&nbsp;
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
        <asp:Timer ID="Timer1" runat="server" Interval="10000">
        </asp:Timer>
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
<li><a id="current" href="BuyerCenter.aspx">买家中心</a>
  <ul>
<li><a href="BuyerCenter.aspx">个人资料</a></li>
<li><a href="Message.aspx"target="_blank">站内信</a></li>
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
    <div id="changeinfo">
    <table>
        <tr>
            <td align="right">
                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">用户名:</asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                    ControlToValidate="UserName" ErrorMessage="必须填写“用户名”。" ToolTip="必须填写“用户名”。" 
                    ValidationGroup="CreateUserWizard1" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">密码:</asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                    ControlToValidate="Password" ErrorMessage="必须填写“密码”。" ToolTip="必须填写“密码”。" 
                    ValidationGroup="CreateUserWizard1" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="ConfirmPasswordLabel" runat="server" 
                    AssociatedControlID="ConfirmPassword">确认密码:</asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                    ControlToValidate="ConfirmPassword" ErrorMessage="必须填写“确认密码”。" 
                    ToolTip="必须填写“确认密码”。" ValidationGroup="CreateUserWizard1" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">电子邮件:</asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                    ControlToValidate="Email" ErrorMessage="必须填写“电子邮件”。" ToolTip="必须填写“电子邮件”。" 
                    ValidationGroup="CreateUserWizard1" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="QuestionLabel" runat="server"  >安全提示问题:</asp:Label>
            </td>
            <td class="style1">
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>您的出生地？</asp:ListItem>
                    <asp:ListItem>您的生日？</asp:ListItem>
                    <asp:ListItem>父亲的名字？</asp:ListItem>
                    <asp:ListItem>父亲的生日？父亲的生日？</asp:ListItem>
                    <asp:ListItem>母亲的名字？</asp:ListItem>
                    <asp:ListItem>母亲的生日？母亲的生日？</asp:ListItem>
                    <asp:ListItem>初中班主任？</asp:ListItem>
                    <asp:ListItem>高中班主任？</asp:ListItem>
                    <asp:ListItem>小学班主任？</asp:ListItem>
                    <asp:ListItem>您的学号（或工号）是？</asp:ListItem>
                    <asp:ListItem>对您影响最大的人？</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">安全答案:</asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" 
                    ControlToValidate="Answer" ErrorMessage="必须填写“安全答案”。" ToolTip="必须填写“安全答案”。" 
                    ValidationGroup="CreateUserWizard1" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:CompareValidator ID="PasswordCompare" runat="server" 
                    ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                    Display="Dynamic" ErrorMessage="“密码”和“确认密码”必须匹配。" 
                    ValidationGroup="CreateUserWizard1" ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2" style="color: Red;">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="truename" runat="server" AssociatedControlID="truenamecheck">真实姓名:</asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="truenamecheck" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="UserNameRequired0" runat="server" 
                    ControlToValidate="truenamecheck" ErrorMessage="必须填写“真实姓名”。" 
                    ToolTip="必须填写“真实姓名”。" ValidationGroup="CreateUserWizard1" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="school" runat="server" AssociatedControlID="schoolcheck">学校:</asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="schoolcheck" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="schoolcheck" ErrorMessage="必须填写“真实学校”。" 
                    ToolTip="必须填写“真实学校”。" ValidationGroup="CreateUserWizard1" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="college" runat="server" AssociatedControlID="collegecheck">院系:</asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="collegecheck" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="collegecheck" ErrorMessage="必须填写“真实院系”。" 
                    ToolTip="必须填写“真实院系”。" ValidationGroup="CreateUserWizard1" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="num" runat="server" AssociatedControlID="numcheck">学号:</asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="numcheck" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="numcheck" ErrorMessage="必须填写“真实学号”。" ToolTip="必须填写“真实学号”。" 
                    ValidationGroup="CreateUserWizard1" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="address" runat="server" AssociatedControlID="addresscheck">地址:</asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="addresscheck" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="addresscheck" ErrorMessage="必须填写“真实地址”。" 
                    ToolTip="必须填写“真实地址”。" ValidationGroup="CreateUserWizard1" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="Label1" runat="server" AssociatedControlID="collegecheck">联系方式:</asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="collegecheck" ErrorMessage="必须填写“真实联系方式”。" 
                    ToolTip="必须填写“真实联系方式”。" ValidationGroup="CreateUserWizard1" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <font color="red">以上信息请务必填写真实信息(快递商品验证使用，网站中不显示)</font>
            </td>
        </tr>
        <tr>
            <td align="right">
                验证码：</td>
            <td class="style1">
                【暂缺】</td>
        </tr>
        <tr>
            <td></td>
        </tr>
        <tr>
            <td align="right"><asp:Button ID="Button2" runat="server" onclick="Button1_Click" Text="确认提交" /></td>
            <td>&nbsp;<input type="reset" id="reset" onclick="return reset_onclick()" /></td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
