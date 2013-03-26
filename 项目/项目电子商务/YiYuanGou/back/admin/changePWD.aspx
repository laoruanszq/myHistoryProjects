<%@ Page Language="C#" AutoEventWireup="true" CodeFile="changePWD.aspx.cs" Inherits="admin_changePWD" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>修改密码</title>
    <script type="text/javascript" src="../../Scripts/jquery.min.js"></script>
    <script type="text/javascript" src="../../Scripts/ddaccordion.js"></script>
    <script type="text/javascript">
        ddaccordion.init({
            headerclass: "expandable", //Shared CSS class name of headers group that are expandable
            contentclass: "categoryitems", //Shared CSS class name of contents group
            revealtype: "click", //Reveal content when user clicks or onmouseover the header? Valid value: "click", "clickgo", or "mouseover"
            mouseoverdelay: 200, //if revealtype="mouseover", set delay in milliseconds before header expands onMouseover
            collapseprev: true, //Collapse previous content (so only one open at any time)? true/false 
            defaultexpanded: [0], //index of content(s) open by default [index1, index2, etc]. [] denotes no content
            onemustopen: false, //Specify whether at least one header should be open always (so never all headers closed)
            animatedefault: false, //Should contents open by default be animated into view?
            persiststate: true, //persist state of opened contents within browser session?
            toggleclass: ["", "openheader"], //Two CSS classes to be applied to the header when it's collapsed and expanded, respectively ["class1", "class2"]
            togglehtml: ["prefix", "", ""], //Additional HTML added to the header when it's collapsed and expanded, respectively  ["position", "html1", "html2"] (see docs)
            animatespeed: "fast", //speed of animation: integer in milliseconds (ie: 200), or keywords "fast", "normal", or "slow"
            oninit: function (headers, expandedindices) { //custom code to run when headers have initalized
                //do nothing
            },
            onopenclose: function (header, index, state, isuseractivated) { //custom code to run whenever a header is opened or closed
                //do nothing
            }
        })
    </script>
     <link href="../../Styles/css.css" rel="stylesheet" type="text/css" />
    <style type="text/css">

        .style1
        {
            width: 201px;
            height: 50px;
            text-align: right;
        }
        .style2
        {
            width: 635px;
        }
    </style>
</head>
<body>

<div id="header">
<div id="headertext">
<div id="leftinfo">欢迎来到ok购！</div>
<div id="info">修改密码    |   注销</div>
</div>
</div>
<div id="headerpic">
  <div id="search"></div>
</div>
<div id="menubg">
<div id="menu">
<ul>
<li><a href="#">返回前台</a></li>
<li><a href="../back_index.aspx">后台首页</a></li>
<li><a href="../WebManage/ModifyAccount.aspx">充值中心</a></li>
<li><a href="../WebManage/sendMail.aspx">站内信</a></li>
</ul>
</div>
</div>

  <div id="main">
    <div id="left">
      <div id="backmenu">
       <h3 class="menuheader expandable"><table width="132" border="0">
  <tr>
    <td width="57"><img src="../images/contact_card.png" width="25" height="25" /></td>
    <td width="65"><a href="#">用户中心</a></td>
  </tr>
</table>
</h3>
  <ul class="categoryitems">
    <li><a href="#">用户搜索</a></li>
    <li><a href="../admin/adminManage.aspx">管理员授权</a></li>
  </ul>  
  <h3 class="menuheader expandable"><table width="132" border="0">
  <tr>
    <td width="57"><img src="../images/cube.png" width="25" height="25" /></td>
    <td width="65"><a href="#">商品中心</a></td>
  </tr>
</table></h3>
  <ul class="categoryitems">
    <li><a href="../productManage/productManage.aspx">商品管理</a></li>
    <li><a href="../productManage/addProduct.aspx">添加商品</a></li>
    <li><a href="../productManage/AlermStock.aspx">库存预警</a></li>
    <li><a href="../productManage/productCataManage.aspx">商品分类管理</a></li>
  </ul>  
  <h3 class="menuheader expandable"><table width="132" border="0">
  <tr>
    <td width="57"><img src="../images/doc_edit.png" width="25" height="25" /></td>
    <td width="65"><a href="#">订单中心</a></td>
  </tr>
</table></h3>
  <ul class="categoryitems">
    <li><a href="../SendProduct/SendProduct.aspx">发货管理</a></li>
    <li><a href="../sendConfirm/sendConfirm.aspx">订单确认</a></li>
    <li><a href="../returnGoods/returnGoods.aspx">退货管理</a></li>
  </ul>
    <h3 class="menuheader expandable"><table width="132" border="0">
  <tr>
    <td width="57"><img src="../images/cur_yen.png" width="25" height="25" /></td>
    <td width="65"><a href="#">销售中心</a></td>
  </tr>
</table></h3>
  <ul class="categoryitems">
    <li><a href="../SaleTotal/SaleSearch1.aspx">商品销售</a></li>
    <li><a href="../SaleTotal/SaleSearch2.aspx">购买记录</a></li>
    <li><a href="../SaleTotal/saleTotal1.aspx">按类别统计</a></li>
    <li><a href="../SaleTotal/saleTotal2.aspx">按商品统计</a></li>
    <li><a href="../SaleTotal/saleTotal3.aspx">按用户统计</a></li>
    <li><a href="../SaleTotal/saleTotal4.aspx">退货统计</a></li>
  </ul>
      <h3 class="menuheader expandable"><table width="132" border="0">
  <tr>
    <td width="57"><img src="../images/cog.png" width="25" height="25" /></td>
    <td width="65"><a href="#">系统设置</a></td>
  </tr>
</table></h3>
  <ul class="categoryitems">
    <li><a href="../ADManage/AD_Manage.aspx">广告设置</a></li>
    <li><a href="../offOnFaultUser.aspx">开启虚拟用户</a></li>
    <li><a href="../onOffFaultUser.aspx">关闭虚拟用户</a></li>
    <li><a href="../setFaultUser.aspx">设置比例</a></li>
    <li><a href="../setHotRoom.aspx">房间开关</a></li>
  </ul>
      
     

</div>
    </div>
    
    <div id="right">
    <form id="form1" runat="server">
    <br />
    <br />
    <table style="width: 100%; height: 150px;">
        <tr>
            <td class="style1">
                <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Names="微软雅黑" 
                    Font-Size="Large" Text="旧密码："></asp:Label>
            </td>
            <td class="style2">
                <asp:TextBox ID="old" runat="server" Height="31px" TextMode="Password" 
                    Width="150px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="old" ErrorMessage="RequiredFieldValidator" ForeColor="Red">密码不能为空</asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label3" runat="server" Font-Names="微软雅黑" Font-Size="Large" 
                    Text="新密码："></asp:Label>
            </td>
            <td class="style2">
                <asp:TextBox ID="new1" runat="server" Height="30px" TextMode="Password" 
                    Width="150px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="new1" ErrorMessage="RequiredFieldValidator" 
                    ForeColor="#FF3300">密码不能为空</asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label4" runat="server" Font-Names="微软雅黑" Font-Size="Large" 
                    style="text-align: center" Text="确认新密码："></asp:Label>
            </td>
            <td class="style2">
                <asp:TextBox ID="new2" runat="server" Height="30px" TextMode="Password" 
                    Width="150px"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ClientIDMode="Static" ControlToCompare="new1" ControlToValidate="new2" 
                    ErrorMessage="CompareValidator" ForeColor="#FF3300">俩次密码不一样</asp:CompareValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Button ID="Button1" runat="server" Font-Names="微软雅黑" 
                    onclick="Button1_Click" Text="修改" Width="83px" />
            </td>
            <td class="style2">
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                <asp:Button ID="Button2" runat="server" Font-Names="微软雅黑" 
                    onclick="Button2_Click" Text="重置" Width="66px" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    </form>
    </div>
  </div>















    
</body>
</html>
