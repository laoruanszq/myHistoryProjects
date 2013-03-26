<%@ Page Language="C#" AutoEventWireup="true" CodeFile="productManage.aspx.cs" Inherits="back_productManage_productManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>商品管理</title>
    <script type="text/javascript" src="../../Scripts/jquery.min.js"></script>
    <script type="text/javascript" src="../../Scripts/ddaccordion.js"></script>
    <link href="../../Styles/css.css" rel="stylesheet" type="text/css" />
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
    <style type="text/css">
        .style4
        {
            color: #000000;
        }
        .style5
        {
            color: #FF0000;
        }
        .style6
        {
            color: #FF3300;
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
  <div id="Div1"></div>
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



    <form id="form1" runat="server">

<div id="mainbig">
    <div id="leftbig">
      <div id="backmenu">
       <h3 class="menuheader expandable"><table width="132" border="0">
  <tr>
    <td width="57"><img src="../images/contact_card.png" width="25" height="25" /></td>
    <td width="65"><a href="#">用户中心</a></td>
  </tr>
</table>
</h3>
  <ul class="categoryitems">
    <li><a href="../Usermanage/userSearch.aspx">用户搜索</a></li>
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
    
    <div>

    <div id="position">所在位置：商品中心&gt;&gt;商品管理</div>
    <!-- <div id="sort">分类搜索辅助<br />
        <br />
        <br />
                <asp:TreeView ID="TreeView1" runat="server" ShowCheckBoxes="All" >
                </asp:TreeView>
         <br />
        <br />
         </div>-->
            
    <div id="managebig">商品列表
            
             
        <br />
        <br />
         <div id="pmsearch">
                <span class="style4">商品类别：</span>
                <asp:DropDownList ID="DropDownList5" runat="server" Height="21px" 
                    AutoPostBack="True" onselectedindexchanged="DropDownList5_SelectedIndexChanged" 
                    Width="93px">     </asp:DropDownList>
                 <asp:DropDownList ID="DropDownList6" runat="server" Height="23px" 
                    AutoPostBack="True"  
                    onselectedindexchanged="DropDownList6_SelectedIndexChanged" Width="89px">     </asp:DropDownList>
                <asp:DropDownList ID="DropDownList7" runat="server" Height="20px" 
                    AutoPostBack="True"  Width="96px" 
                    onselectedindexchanged="DropDownList7_SelectedIndexChanged">    </asp:DropDownList>
        
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox1" runat="server" Height="20px"></asp:TextBox>
                <asp:Button ID="Search" runat="server" Text="搜索商品" onclick="Search_Click" 
                    Width="66px" />
                &nbsp; <strong>(商品名、简述和商标的模糊查询)</strong><br />
        </div>
        <div id="plist">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="0" ForeColor="#333333" GridLines="Vertical" AllowPaging="True" 
            PageSize="8" OnPageIndexChanging="GridView1_PageIndexChanging" 
            onrowcancelingedit="GridView1_RowCancelingEdit" 
            onrowdeleting="GridView1_RowDeleting" onrowediting="GridView1_RowEditing" 
            onrowupdating="GridView1_RowUpdating" Width="1096px" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" 
            OnRowDataBound="GridView1_RowDataBound" 
            AutoGenerateSelectButton="True" 
            
            DataKeyNames="pcid,annotation1,annotation2,annotation3,annotation4,annotation5,picture1,picture2,picture3" 
            Font-Size="12px" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="ProductID" HeaderText="商品号" ReadOnly="True" />
                <asp:BoundField DataField="ProName" HeaderText="商品名称" >
                <ControlStyle Width="100px" />
                
                </asp:BoundField>
                <asp:BoundField DataField="ProTitle" HeaderText="简述" />
                <asp:BoundField DataField="proSize" HeaderText="尺寸大小" >
                <ControlStyle Width="50px" />
                
                </asp:BoundField>
                <asp:BoundField DataField="Price" HeaderText="价格" >
                <ControlStyle Width="50px" />
                
                </asp:BoundField>
                <asp:BoundField DataField="Color" HeaderText="颜色" >
                <ControlStyle Width="50px" />
               
                </asp:BoundField>
                <asp:BoundField DataField="Brand" HeaderText="商标" >
                <ControlStyle Width="60px" />
                
                </asp:BoundField>
                <asp:BoundField DataField="Left" HeaderText="库存" >
                <ControlStyle Width="30px" />
                
                </asp:BoundField>
                <asp:BoundField DataField="Alarm" HeaderText="预警数量" >
                <ControlStyle Width="40px" />
                
                </asp:BoundField>
                <asp:BoundField DataField="IsJingyanbi" HeaderText="经验值换购" >
                <ControlStyle Width="40px" />
                
                </asp:BoundField>
                <asp:BoundField DataField="IsCheap" HeaderText="特惠商品" >
                <ControlStyle Width="40px" />
               
                </asp:BoundField>
                <asp:BoundField DataField="IsOnlyOne" HeaderText="只一元" >
                <ControlStyle Width="20px" />
                
                </asp:BoundField>
                <asp:BoundField DataField="IsOnlyTen" HeaderText="只十人">
                <ControlStyle Width="20px" />
               
                </asp:BoundField>
                <asp:BoundField DataField="Annotation1" HeaderText="描述1" Visible="False" />
                <asp:BoundField DataField="Annotation2" HeaderText="描述2" Visible="False" />
                <asp:BoundField DataField="Annotation3" HeaderText="描述3" Visible="False" />
                <asp:BoundField DataField="Annotation4" HeaderText="描述4" Visible="False" />
                <asp:BoundField DataField="Annotation5" HeaderText="描述5" Visible="False" />
                <asp:BoundField DataField="picture1" HeaderText="图片1" Visible="False" />
                <asp:BoundField DataField="picture2" HeaderText="图片2" Visible="False" />
                <asp:BoundField DataField="picture3" HeaderText="图片3" Visible="False" />
                <asp:BoundField DataField="pcid" HeaderText="商品类别" Visible="False" />
                <asp:CommandField SelectText="编辑" ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#FF9900" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>

    <div id="pchange">

        <span class="style6"><strong>**注：上表中经验币换购、特惠商品、只一元、只十人四列中，1表示是，0表示否。**</strong></span><br />

        <br />
        商品描述和图片修改<br />
        <br />
    <table class="style24">
      <tr>
            <td class="style8">
                <asp:Label ID="Label10" runat="server" Text="类型"></asp:Label>
            </td>
            <td class="style2">
                <asp:Label ID="Label1" runat="server" Text="请选择商品"></asp:Label> &nbsp;&nbsp;&nbsp;修改为：
                <asp:DropDownList ID="DropDownList1" runat="server" Height="21px" 
                    AutoPostBack="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged" 
                    Width="93px">     </asp:DropDownList>
                 &nbsp;&nbsp;<asp:DropDownList ID="DropDownList2" runat="server" Height="23px" 
                    AutoPostBack="True"  
                    onselectedindexchanged="DropDownList2_SelectedIndexChanged" Width="89px">     </asp:DropDownList>
                &nbsp;&nbsp;<asp:DropDownList ID="DropDownList3" runat="server" Height="20px" 
                    AutoPostBack="True"  Width="96px" 
                    onselectedindexchanged="DropDownList3_SelectedIndexChanged">    </asp:DropDownList>
        
                &nbsp;&nbsp;<asp:DropDownList ID="DropDownList4" runat="server" Visible="False">
                </asp:DropDownList>
        
            </td>
            <td align="justify" class="style26">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style9">
                <asp:Label ID="Label11" runat="server" Text="描述1"></asp:Label>
            </td>
            <td class="style10">
                <asp:TextBox ID="tbAnnotation1" runat="server" Width="477px" 
                    TextMode="MultiLine" Height="40px"></asp:TextBox>
            </td>
            <td align="justify" class="style27">  </td>
        </tr>
                <tr>
            <td class="style9">
                <asp:Label ID="Label20" runat="server" Text="描述2"></asp:Label>
            </td>
            <td class="style10">
                <asp:TextBox ID="tbAnnotation2" runat="server" Width="478px" TextMode="MultiLine" 
                    Height="40px"></asp:TextBox>
            </td>
            <td align="justify" class="style27">
                    </td>
        </tr>
                <tr>
            <td class="style15">
                <asp:Label ID="Label21" runat="server" Text="描述3"></asp:Label>
            </td>
            <td class="style16">
                <asp:TextBox ID="tbAnnotation3" runat="server" Width="478px" TextMode="MultiLine" 
                    Height="42px"></asp:TextBox>
            </td>
            <td align="justify" class="style17">
                    </td>
        </tr>
                <tr>
            <td class="style18">
                <asp:Label ID="Label22" runat="server" Text="描述4"></asp:Label>
            </td>
            <td class="style2">
                <asp:TextBox ID="tbAnnotation4" runat="server" Width="478px" TextMode="MultiLine" 
                    Height="43px"></asp:TextBox>
            </td>
            <td align="justify" class="style26">
                &nbsp;</td>
        </tr>
                <tr>
            <td class="style19">
                <asp:Label ID="Label23" runat="server" Text="描述5"></asp:Label>
            </td>
            <td class="style2">
                <asp:TextBox ID="tbAnnotation5" runat="server" Width="477px" TextMode="MultiLine" 
                    Height="47px"></asp:TextBox>
            </td>
            <td align="justify" class="style26">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style20">
                <asp:Label ID="Label12" runat="server" Text="图片1"></asp:Label>
            </td>
            <td class="style2">
                <asp:Image ID="Image1" runat="server" Height="96px" Width="99px" />
&nbsp; 替换图片：
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
            <td align="justify" class="style26">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style21">
                <asp:Label ID="Label13" runat="server" Text="图片2"></asp:Label>
            </td>
            <td class="style2">
                <asp:Image ID="Image2" runat="server" Height="82px" Width="78px" />
&nbsp; 替换图片：<asp:FileUpload ID="FileUpload2" runat="server" />
            </td>
            <td align="justify" class="style26">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="Label14" runat="server" Text="图片3"></asp:Label>
            </td>
            <td class="style22">
                <asp:Image ID="Image3" runat="server" Height="64px" Width="60px" />
&nbsp; 替换图片：<asp:FileUpload ID="FileUpload3" runat="server" />
            </td>
            <td align="justify" class="style23">
                </td>
        </tr>
        <tr>
        <td class="style5"></td>
         <td class="style6"> <asp:Button ID="UpdateProduct" runat="server" 
                 onclick="UpdateProduct_Click" Text="修改" />
            </td>
        </tr>
             <tr>
        <td class="style7">&nbsp;</td>
         <td class="style25"> <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        
    </p>
    </table>

        
    
    </div>
    
        </div>
      </div>
    </div>


     </div>

    </form>
     </body>
</html>
