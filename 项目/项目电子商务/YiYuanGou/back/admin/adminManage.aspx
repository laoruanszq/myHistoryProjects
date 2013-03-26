<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminManage.aspx.cs" Inherits="admin_adminadd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <title>管理员维护</title>
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
               width: 398px;
           }
           .style2
           {
               width: 70px;
           }
           .style3
           {
               width: 67px;
           }
           #form1
           {
               margin-top: 0px;
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
      <div id="position">所在位置：用户中心&gt;&gt;管理员授权</div>
      <div id="list_c">管理员列表
      <br>
          <br />
          <div id="adminmanage">
          <form id="form1" runat="server">
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" ForeColor="#333333" GridLines="None" 
        onrowdeleting="GridView1_RowDeleting"  OnRowDataBound="GridView1_RowDataBound" 
              Width="489px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="UName" HeaderText="管理员名" ReadOnly="True" />
            <asp:BoundField DataField="UType" HeaderText="管理员权限" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
        <FooterStyle BackColor="#FF6600" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#FF6600" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFF99" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>
    <br />
    <br />
          <br />
          <br />
    <br />
    <table align="center" style="width: 79%; ">
        <tr>
            <td align="justify" class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Labe2" runat="server" Text="管理员名"></asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="RequiredFieldValidator" Font-Overline="False" ForeColor="Red" 
                    ControlToValidate="TextBox2" Display="Dynamic" SetFocusOnError="True">管理员名不能为空</asp:RequiredFieldValidator>
            </td>
            <td align="justify" class="style3">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label3" runat="server" Text="密码"></asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBox3" 
                    ForeColor="#FF3300">密码不能为空</asp:RequiredFieldValidator>
            </td>
            <td align="justify" class="style3">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                确认密码</td>
            <td class="style1">
                <asp:TextBox ID="TextBox4" runat="server" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="TextBox3" ControlToValidate="TextBox4" ForeColor="#FF3300">密码不相同</asp:CompareValidator>
            </td>
            <td align="justify" class="style3">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                权限</td>
            <td class="style1">
                <asp:DropDownList ID="DropDownList1" runat="server" Height="24px" Width="99px">
                    <asp:ListItem Value="1">商品管理员</asp:ListItem>
                    <asp:ListItem Value="2">物流管理员</asp:ListItem>
                    <asp:ListItem Value="3">财务管理员</asp:ListItem>
                    <asp:ListItem Value="4">用户管理员</asp:ListItem>
                    <asp:ListItem Value="5">客服管理员</asp:ListItem>
                    <asp:ListItem Value="6">论坛管理员</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td align="justify" class="style3">
                &nbsp;</td>
        </tr>
    </table>
    <br />
    &nbsp;<asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
              Text="确认提交" style="margin-left: 352px" Width="88px" />
    &nbsp;<asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="重置" 
              Width="64px" />
   </form>
   </div>
      </div>
      <div id="list_c">添加管理员</div>
    </div>
  </div>
<div id="footer">
底部信息
</div>


    
</body>
</html>
