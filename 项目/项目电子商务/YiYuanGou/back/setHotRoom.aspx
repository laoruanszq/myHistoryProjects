<%@ Page Language="C#" AutoEventWireup="true" CodeFile="setHotRoom.aspx.cs" Inherits="back_setHotRoom" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>设置房间</title>
    <script type="text/javascript" src="../Scripts/jquery.min.js"></script>
    <script type="text/javascript" src="../Scripts/ddaccordion.js"></script>
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
    <link href="../Styles/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="header">
<div id="headertext">
<div id="leftinfo">欢迎来到ok购！</div>
<div id="info">修改密码    |   <a href = "../loginout.aspx">注销</a></div>
</div>
</div>
<div id="headerpic">
  <div id="search"></div>
</div>
<div id="menubg">
<div id="menu">
<ul>
<li><a href="#">返回前台</a></li>
<li><a href="back_index.aspx">后台首页</a></li>
<li><a href="WebManage/ModifyAccount.aspx">充值中心</a></li>
<li><a href="WebManage/sendMail.aspx">站内信</a></li>
</ul>
</div>
</div>

  <div id="main">
    <div id="left">
      <div id="backmenu">
       <h3 class="menuheader expandable"><table width="132" border="0">
  <tr>
    <td width="57"><img src="images/contact_card.png" width="25" height="25" /></td>
    <td width="65"><a href="#">用户中心</a></td>
  </tr>
</table>
</h3>
  <ul class="categoryitems">
    <li><a href="Usermanage/userSearch.aspx">用户搜索</a></li>
    <li><a href="admin/adminManage.aspx">管理员授权</a></li>
  </ul>  
  <h3 class="menuheader expandable"><table width="132" border="0">
  <tr>
    <td width="57"><img src="images/cube.png" width="25" height="25" /></td>
    <td width="65"><a href="#">商品中心</a></td>
  </tr>
</table></h3>
  <ul class="categoryitems">
    <li><a href="productManage/productManage.aspx">商品管理</a></li>
    <li><a href="productManage/addProduct.aspx">添加商品</a></li>
    <li><a href="productManage/AlermStock.aspx">库存预警</a></li>
    <li><a href="productManage/productCataManage.aspx">商品分类管理</a></li>
  </ul>  
  <h3 class="menuheader expandable"><table width="132" border="0">
  <tr>
    <td width="57"><img src="images/doc_edit.png" width="25" height="25" /></td>
    <td width="65"><a href="#">订单中心</a></td>
  </tr>
</table></h3>
  <ul class="categoryitems">
    <li><a href="SendProduct/SendProduct.aspx">发货管理</a></li>
    <li><a href="sendConfirm/sendConfirm.aspx">订单确认</a></li>
    <li><a href="returnGoods/returnGoods.aspx">退货管理</a></li>
  </ul>
    <h3 class="menuheader expandable"><table width="132" border="0">
  <tr>
    <td width="57"><img src="images/cur_yen.png" width="25" height="25" /></td>
    <td width="65"><a href="#">销售中心</a></td>
  </tr>
</table></h3>
  <ul class="categoryitems">
    <li><a href="SaleTotal/SaleSearch1.aspx">商品销售</a></li>
    <li><a href="SaleTotal/SaleSearch2.aspx">购买记录</a></li>
    <li><a href="SaleTotal/saleTotal1.aspx">按类别统计</a></li>
    <li><a href="SaleTotal/saleTotal2.aspx">按商品统计</a></li>
    <li><a href="SaleTotal/saleTotal3.aspx">按用户统计</a></li>
    <li><a href="SaleTotal/saleTotal4.aspx">退货统计</a></li>
  </ul>
      <h3 class="menuheader expandable"><table width="132" border="0">
  <tr>
    <td width="57"><img src="../images/cog.png" width="25" height="25" /></td>
    <td width="65"><a href="#">系统设置</a></td>
  </tr>
</table></h3>
  <ul class="categoryitems">
    <li><a href="ADManage/AD_Manage.aspx">广告设置</a></li>
    <li><a href="offOnFaultUser.aspx">开启虚拟用户</a></li>
    <li><a href="onOffFaultUser.aspx">关闭虚拟用户</a></li>
    <li><a href="setFaultUser.aspx">设置比例</a></li>
    <li><a href="setHotRoom.aspx">房间开关</a></li>
  </ul>
      
     

</div>
    </div>
    
     <div id="right">
      <div id="position">所在位置：系统设置&gt;&gt;房间开关</div>
      <div id="list_a">
          房间列表<br />
     <br />
     <div id="listposition">
     <form id="form1" runat="server">


    <div>
        商品名称：&nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <br />
        商品类别：&nbsp; 
        <asp:DropDownList ID="DropDownList1" runat="server" Height="23px" AutoPostBack="True"
            onselectedindexchanged="DropDownList1_SelectedIndexChanged" Width="106px">
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;
         <asp:DropDownList ID="DropDownList2" runat="server" Height="23px" AutoPostBack="True"
            onselectedindexchanged="DropDownList2_SelectedIndexChanged" Width="126px">
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList3" runat="server" Height="23px" AutoPostBack="True"
            onselectedindexchanged="DropDownList3_SelectedIndexChanged" Width="126px">
        </asp:DropDownList>
        <br />
        <br />
        <br />
        <asp:RadioButton ID="rbOn" runat="server" GroupName="rb1" Text="开通" 
            Checked="True" />
&nbsp;&nbsp;
        <asp:RadioButton ID="rbOff" runat="server" GroupName="rb1" Text="关闭" />
        <br />
        <br />
        <br />
        <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="查找" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button4" runat="server" onclick="Button4_Click" Text="重置" />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <span class="style1"><strong>*房间类型，1---1元区；2--2元区；5--5元区；0--10元区</strong></span><br />
    </div>
    <div>
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  AllowPaging="True" 
            PageSize="20" OnPageIndexChanging="GridView1_PageIndexChanging" 
            CellPadding="4" onselectedindexchanged="GridView1_SelectedIndexChanged" 
            style="margin-left: 0px" >
            <Columns>
                <asp:TemplateField HeaderText="选择">
                   <HeaderTemplate> <asp:CheckBox ID="headselector" runat="server" Text="全选" OnCheckedChanged="cbSelect_CheckedChanged" AutoPostBack="True"/> </HeaderTemplate>
                  <ItemTemplate> <asp:CheckBox ID="CheckBox1" runat="server" /> </ItemTemplate>  
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="55px" /> 
                </asp:TemplateField>
                <asp:BoundField DataField="roomID" HeaderText="房间号" ReadOnly="True" />
                <asp:BoundField DataField="productID" HeaderText="产品编号" ReadOnly="True" />
                <asp:BoundField DataField="proName" HeaderText="产品名" ReadOnly="True" />
                <asp:BoundField DataField="prosize" HeaderText="尺寸" ReadOnly="True" />
                <asp:BoundField DataField="color" HeaderText="颜色" ReadOnly="True" />
                <asp:BoundField DataField="price" HeaderText="价格" ReadOnly="True" />
                <asp:BoundField DataField="roomType" HeaderText="房间类型" ReadOnly="True" />
                <asp:BoundField DataField="isopen" HeaderText="当前是否开启房间" ReadOnly="True" />
            </Columns>
            <HeaderStyle BackColor="#CCFF66" />
        </asp:GridView>    
    </div>
      <asp:Button ID="Button1" runat="server" Text="设定" onclick="Button1_Click" 
        onclientclick="return confirm('您确定要这样设置吗?')" />
    </form>
     </div>
      </div>

    </div>
  </div>
<div id="footer">
底部信息
</div>











    
</body>
</html>
