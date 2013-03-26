<%@ Page Language="C#" AutoEventWireup="true" CodeFile="userSearch.aspx.cs" Inherits="back_Usermanage_userSearch" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>用户搜索</title>
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
    <link href="../../Styles/css.css" rel="stylesheet" type="text/css" /></head>

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
      <div id="position">所在位置：用户中心&gt;&gt;用户搜索</div>
      <div id="list_a">
          <br />
          <br />
          <div id="listposition">
      <form id="form1" runat="server">
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="查询" />
    <br />
    <br />
        <asp:Label ID="Name" runat="server"></asp:Label>
    <br />
    <asp:Label ID="truename" runat="server"></asp:Label>
    <br />
    <asp:Label ID="Email" runat="server"></asp:Label>
    <br />
    <asp:Label ID="CollageCity" runat="server"></asp:Label>
    <br />
    <asp:Label ID="IdentifyNo" runat="server"></asp:Label>
    <br />
    <asp:Label ID="Address" runat="server"></asp:Label>
    <br />
    <asp:Label ID="Account" runat="server"></asp:Label>
    <br />
    <asp:Label ID="JinYanBi" runat="server"></asp:Label>
    <br />
    选择时间
    <asp:DropDownList ID="DropDownList1" runat="server" 
        onselectedindexchanged="DropDownList1_SelectedIndexChanged">
        <asp:ListItem Value="10000">全部</asp:ListItem>
        <asp:ListItem Value="3">3天内</asp:ListItem>
        <asp:ListItem Value="7">7天内</asp:ListItem>
        <asp:ListItem Value="15">15天内</asp:ListItem>
        <asp:ListItem Value="30">30天内</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />


    <div class="top">
        <a href="#">一元购物商品</a>
        <a href="#">经验值换购商品</a>
    </div>

    <div id="Div1" class="tab" runat="server">
                <asp:GridView ID="GridView1" class="tabGV" runat="server" Width="614px" 
                    AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="orderID" HeaderText="订单号" >
                        <ItemStyle Width="60px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="STATEMENT" HeaderText="状态" >
                        <ItemStyle Width="40px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ROOMID" HeaderText="房间号" >
                        <ItemStyle Width="60px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ORDERTIME" HeaderText="下单时间" >
                        <ItemStyle Width="160px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="AMOUNT" HeaderText="数量" >
                        <ItemStyle Width="40px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PRONAME" HeaderText="商品名" >
                        <ItemStyle Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PROTITLE" HeaderText="简述" >
                        <ItemStyle Width="120px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PRICE" HeaderText="价格" >
                        <ItemStyle Width="60px" />
                        </asp:BoundField>

                    </Columns>
                         <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#FF9900" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                </asp:GridView>

                <asp:GridView ID="GridView2" class="tabGV" runat="server" 
                    AutoGenerateColumns="False" Width="613px">
               <Columns>
                        <asp:BoundField DataField="orderID" HeaderText="订单号" >
                        <ItemStyle Width="60px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="STATEMENT" HeaderText="状态" >
                        <ItemStyle Width="40px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ROOMID" HeaderText="房间号" >
                        <ItemStyle Width="60px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ORDERTIME" HeaderText="下单时间" >
                        <ItemStyle Width="160px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="AMOUNT" HeaderText="数量" >
                        <ItemStyle Width="40px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PRONAME" HeaderText="商品名" >
                        <ItemStyle Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PROTITLE" HeaderText="简述" >
                        <ItemStyle Width="120px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PRICE" HeaderText="价格" >
                        <ItemStyle Width="60px" />
                        </asp:BoundField>
                    </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#FF9900" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                </asp:GridView>
                <br />
                <br />
                <br />
                <br />
                <br />
    </div>


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
