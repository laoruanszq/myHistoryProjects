<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addProduct.aspx.cs" Inherits="back_productManage_addProduct" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>添加商品</title>
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

<div id="right">
      <div id="position">所在位置：商品中心&gt;&gt;添加商品</div>
      <div id="list_a">
      商品增加


    <form id="form2" runat="server">

    <br />
    <table align="center" style="width: 90%; height: 895px; margin-left: 0px;">
        <tr>
            <td align="justify" width="width: 100%; height: 116px;">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="Labe2" runat="server" Text="商品名称"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="tbName" runat="server" Width="217px"></asp:TextBox>
            </td>
            <td align="justify" width="width: 100%; height: 116px;">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="Label3" runat="server" Text="简述"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="tbTitle" runat="server" Width="217px"></asp:TextBox>
            &nbsp;注：关于商品的、能吸引顾客的一句话描述</td>
            <td align="justify" width="width: 100%; height: 116px;">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="Label4" runat="server" Text="尺寸大小"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="tbSize" runat="server" Width="217px"></asp:TextBox>
            </td>
            <td align="justify" width="width: 100%; height: 116px;">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="Label7" runat="server" Text="价格"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="tbPrice" runat="server" Width="217px"></asp:TextBox>
            </td>
            <td align="justify" width="width: 100%; height: 116px;">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="Label1" runat="server" Text="颜色"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="tbColor" runat="server" Width="217px"></asp:TextBox>
            </td>
            <td align="justify" width="width: 100%; height: 116px;">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="Label15" runat="server" Text="商标"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="tbBrand" runat="server" Width="217px"></asp:TextBox>
            </td>
            <td align="justify" width="width: 100%; height: 116px;">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="Label2" runat="server" Text="库存"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="tbLeft" runat="server" Width="217px">1</asp:TextBox>
            </td>
            <td align="justify" width="width: 100%; height: 116px;">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="Label5" runat="server" Text="预警数量"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="tbAlarm" runat="server" Width="217px">5</asp:TextBox>
            </td>
            <td align="justify" width="width: 100%; height: 116px;">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="Label6" runat="server" Text="经验值换购"></asp:Label>
            </td>
            <td>
                 <asp:RadioButton ID="rbJingyanbi1" runat="server" GroupName="IsJingyanbi" 
                    Text="是" />
                <asp:RadioButton ID="rbJingyanbi2" runat="server" GroupName="IsJingyanbi" 
                    Text="否"  Checked="True" />
            </td>
            <td align="justify" width="width: 100%; height: 116px;">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="Label8" runat="server" Text="特惠商品"></asp:Label>
            </td>
            <td>
                <asp:RadioButton ID="rbCheap1" runat="server" GroupName="IsCheap" Text="是"/>
                <asp:RadioButton ID="rbCheap2" runat="server" GroupName="IsCheap" Text="否"  Checked="True"  />
            </td>
            <td align="justify" width="width: 100%; height: 116px;">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="Label9" runat="server" Text="只一元商品"></asp:Label>
            </td>
            <td>
                <asp:RadioButton ID="rbOne1" runat="server" GroupName="IsOne" Text="是"  />
                <asp:RadioButton ID="rbOne2" runat="server" GroupName="IsOne" Text="否" Checked="True"/>
            </td>
            <td align="justify" width="width: 100%; height: 116px;">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="Label24" runat="server" Text="只十人商品"></asp:Label>
            </td>
            <td>
                <asp:RadioButton ID="rbTen1" runat="server" GroupName="IsTen" Text="是"  />
                <asp:RadioButton ID="rbTen2" runat="server" GroupName="IsTen" Text="否" Checked="True"/>
            </td>
            <td align="justify" width="width: 100%; height: 116px;">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="Label10" runat="server" Text="类型"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" Height="23px" AutoPostBack="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged" Width="106px">     </asp:DropDownList>
                 &nbsp;&nbsp;&nbsp;
               <asp:DropDownList ID="DropDownList2" runat="server" Height="23px" AutoPostBack="True"  onselectedindexchanged="DropDownList2_SelectedIndexChanged" Width="126px">     </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;
               <asp:DropDownList ID="DropDownList3" runat="server" Height="23px" 
                    AutoPostBack="True"  Width="126px" 
                    onselectedindexchanged="DropDownList3_SelectedIndexChanged">    </asp:DropDownList>
        
            &nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="DropDownList4" runat="server" Visible="False">
                </asp:DropDownList>
        
            </td>
            <td align="justify" width="width: 100%; height: 116px;">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="Label11" runat="server" Text="描述1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="tbAnnotation1" runat="server" Width="356px" 
                    TextMode="MultiLine" Height="88px"></asp:TextBox>
            </td>
            <td align="justify" width="width: 100%; height: 116px;">  &nbsp;</td>
        </tr>
                <tr>
            <td class="style4">
                <asp:Label ID="Label20" runat="server" Text="描述2"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="tbAnnotation2" runat="server" Width="356px" TextMode="MultiLine" 
                    Height="88px"></asp:TextBox>
            </td>
            <td align="justify" width="width: 100%; height: 116px;">
                &nbsp;</td>
        </tr>
                <tr>
            <td class="style4">
                <asp:Label ID="Label21" runat="server" Text="描述3"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="tbAnnotation3" runat="server" Width="356px" TextMode="MultiLine" 
                    Height="88px"></asp:TextBox>
            </td>
            <td align="justify" width="width: 100%; height: 116px;">
                &nbsp;</td>
        </tr>
                <tr>
            <td class="style4">
                <asp:Label ID="Label22" runat="server" Text="描述4"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="tbAnnotation4" runat="server" Width="356px" TextMode="MultiLine" 
                    Height="88px"></asp:TextBox>
            </td>
            <td align="justify" width="width: 100%; height: 116px;">
                &nbsp;</td>
        </tr>
                <tr>
            <td class="style4">
                <asp:Label ID="Label23" runat="server" Text="描述5"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="tbAnnotation5" runat="server" Width="356px" TextMode="MultiLine" 
                    Height="88px"></asp:TextBox>
            </td>
            <td align="justify" width="width: 100%; height: 116px;">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="Label12" runat="server" Text="图片1"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            &nbsp;</td>
            <td align="justify" width="width: 100%; height: 116px;">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="Label13" runat="server" Text="图片2"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="FileUpload2" runat="server" />
            &nbsp;</td>
            <td align="justify" width="width: 100%; height: 116px;">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="Label14" runat="server" Text="图片3"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="FileUpload3" runat="server" />
            &nbsp;</td>
            <td align="justify" width="width: 100%; height: 116px;">
                &nbsp;</td>
        </tr>
         <tr>
            <td class="style4">
                <asp:Label ID="Label16" runat="server" Text="一元房间"></asp:Label>
            </td>
            <td>
                 是否启用虚拟用户：<asp:RadioButton 
                     ID="rbFalseUser11" runat="server" GroupName="SetFalseUser1" Text="是"  Checked="True"  />
                <asp:RadioButton ID="rbFalseUser12" runat="server" GroupName="SetFalseUser1" Text="否" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;虚拟用户比例： 
                 <asp:TextBox ID="tbRoom1" runat="server" Width="81px"></asp:TextBox>%<br />
            </td>
            <td align="justify" width="width: 100%; height: 116px;">
                &nbsp;</td>
        </tr>
         <tr>
            <td class="style4">
                <asp:Label ID="Label17" runat="server" Text="二元房间"></asp:Label>
            </td>
            <td>
                 是否启用虚拟用户：<asp:RadioButton ID="rbFalseUser21" runat="server" GroupName="SetFalseUser2" Text="是"   Checked="True" />
                <asp:RadioButton ID="rbFalseUser22" runat="server" GroupName="SetFalseUser2" Text="否" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;虚拟用户比例： 
                 <asp:TextBox ID="tbRoom2" runat="server" Width="81px"></asp:TextBox>%<br />
            </td>
            <td align="justify" width="width: 100%; height: 116px;">
                &nbsp;</td>
        </tr>
         <tr>
            <td class="style4">
                <asp:Label ID="Label18" runat="server" Text="五元房间"></asp:Label>
            </td>
            <td>
                 是否启用虚拟用户：<asp:RadioButton ID="rbFalseUser51" runat="server" GroupName="SetFalseUser5" Text="是"   Checked="True" />
                <asp:RadioButton ID="rbFalseUser52" runat="server" GroupName="SetFalseUser5" Text="否" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;虚拟用户比例： 
                 <asp:TextBox ID="tbRoom5" runat="server" Width="81px"></asp:TextBox>%<br />
            </td>
            <td align="justify" width="width: 100%; height: 116px;">
                &nbsp;</td>
        </tr>
         <tr>
            <td class="style4">
                <asp:Label ID="Label19" runat="server" Text="十元房间"></asp:Label>
            </td>
            <td>
                 是否启用虚拟用户：<asp:RadioButton ID="rbFalseUser01" runat="server" GroupName="SetFalseUser0" Text="是"   Checked="True" />
                <asp:RadioButton ID="rbFalseUser02" runat="server" GroupName="SetFalseUser0" Text="否" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;虚拟用户比例： 
                 <asp:TextBox ID="tbRoom0" runat="server" Width="81px"></asp:TextBox>%<br />
            </td>
            <td align="justify" width="width: 100%; height: 116px;">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="Label25" runat="server" Text="特便宜房间"></asp:Label>
            </td>
            <td>
                 是否启用虚拟用户：<asp:RadioButton ID="rbFalseUser41" runat="server" GroupName="SetFalseUser4" Text="是"   Checked="True" />
                <asp:RadioButton ID="rbFalseUser42" runat="server" GroupName="SetFalseUser4" Text="否" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;虚拟用户比例： 
                 <asp:TextBox ID="tbRoom4" runat="server" Width="81px"></asp:TextBox>%<br />
            </td>
            <td align="justify" width="width: 100%; height: 116px;">
                &nbsp;</td>
        </tr>
    </table>
    <br />
    &nbsp;<asp:Button ID="AddProduct" runat="server" onclick="AddProduct_Click" Text="确认提交" />
    &nbsp;
    <asp:Button ID="ResetAdd" runat="server" onclick="ResetAdd_Click" 
        style="width: 50px" Text="重置" />

    <br />
    <br />    
    <p>
        <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
    </p>
    </form>

      </div>
    </div>
  </div>
  <br />
<div id="footer">
底部信息
</div>



    </body>
</html>
