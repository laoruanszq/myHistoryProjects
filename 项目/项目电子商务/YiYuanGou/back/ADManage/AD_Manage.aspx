<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AD_Manage.aspx.cs" Inherits="back_ADManage_AD_Manage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>广告维护</title>

    <script language="javascript" type="text/javascript">
       
        function checkType() {

            //得到上传文件的值 
            var fileName = document.getElementsByName("FileUp1").value;

            //返回String对象中子字符串最后出现的位置. 
            var seat = fileName.lastIndexOf(".");

            //返回位于String对象中指定位置的子字符串并转换为小写. 
            var extension = fileName.substring(seat).toLowerCase();

            //判断允许上传的文件格式 
            //if(extension!=".jpg"&&extension!=".jpeg"&&extension!=".gif"&&extension!=".png"&&extension!=".bmp"){ 
            //alert("不支持"+extension+"文件的上传!"); 
            //return false; 
            //}else{ 
            //return true; 
            //} 

            var allowed = [".jpg", ".gif", ".png", ".bmp", ".jpeg"];
            for (var i = 0; i < allowed.length; i++) {
                if (!(allowed[i] != extension)) {
                    return true;
                }
            }
            alert("不支持" + extension + "格式");
            return false;
        } 

</script>
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
            width: 682px;
        }
    </style>
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
      <div id="position">所在位置：系统设置&gt;&gt;广告设置</div>
      <div id="list_a">
          广告列表<br />
     <br />
     <div id="listposition">
     <form id="form1" runat="server">

     <p style="background-color: #CCFF99">  现有广告</p>
    <p>
     <table>
      <tr>
        <td class="style1">
         &nbsp;&nbsp;&nbsp;&nbsp; 顶部广告&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />   <br />
         <asp:Image ID="Image1" runat="server" Height="109px" Width="689px" /> <br />   <br />
         开始日期：&nbsp;<asp:Label ID="Label1" runat="server" Text="暂缺"></asp:Label> <br />   <br /> 
          结束日期：&nbsp;<asp:Label ID="Label2" runat="server" Text="暂缺"></asp:Label> <br />   <br /> 
        </td>
       </tr>
       <tr>
        <td class="style1">
         &nbsp;&nbsp;&nbsp;&nbsp; 中间广告&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />   <br />
         <asp:Image ID="Image2" runat="server" Height="109px" Width="683px" /> <br />   <br />
         开始日期：&nbsp;<asp:Label ID="Label3" runat="server" Text="暂缺"></asp:Label> <br />   <br /> 
          结束日期：&nbsp;<asp:Label ID="Label4" runat="server" Text="暂缺"></asp:Label> <br />   <br /> 
        </td>
         </tr>
       <tr>
        <td class="style1">
         &nbsp;&nbsp;&nbsp;&nbsp; 底部广告&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />   <br />
         <asp:Image ID="Image3" runat="server" Height="109px" Width="684px" /> <br />   <br />
         开始日期：&nbsp;<asp:Label ID="Label5" runat="server" Text="暂缺"></asp:Label> <br />   <br /> 
          结束日期：&nbsp;<asp:Label ID="Label6" runat="server" Text="暂缺"></asp:Label> <br />   <br /> 
        </td>
      </tr>
     </table>
    </p>
    <p style="background-color: #CCFF99">  广告设置</p>
    <asp:FileUpload ID="FileUpload1" runat="server" />
&nbsp;<asp:Button ID="Button1" runat="server" onclick="Button1_Click"  Text="图片上传" />
    <br />
    <br />
    广告位置：<asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem Selected="True">顶部</asp:ListItem>
        <asp:ListItem>中间</asp:ListItem>
        <asp:ListItem>底部</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    开始日期：<asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
    &nbsp;例如：20120908<br />
    <br />
    结束日期：<asp:TextBox ID="TextBox2" runat="server" ></asp:TextBox>
    &nbsp;例如：20120908<br />
    <br />
    广告URL： <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
    &nbsp; 例如：http://www.sina.com.cn<br />
    <br />
    <br />
&nbsp;<asp:Button ID="Button3" runat="server" Text="确定" 
        onclick="Button3_Click" />
    &nbsp;<asp:Button ID="Button4" runat="server" Text="重置" 
        onclick="Button4_Click" />
    <br />
    <br />
    <p style="background-color: #CCFF99">
        广告位置默认图片设置</p>
    <p>
        <asp:FileUpload ID="FileUpload2" runat="server" />
           &nbsp;<asp:Button ID="Button2" runat="server" onclick="Button2_Click"    Text="图片上传" />

    <br />
     <br />

        广告位置：<asp:DropDownList ID="DropDownList2" runat="server">
            <asp:ListItem Selected="True">顶部</asp:ListItem>
            <asp:ListItem>中间</asp:ListItem>
            <asp:ListItem>底部</asp:ListItem>
        </asp:DropDownList>
    <br />
    <br />
    <br />
&nbsp;<asp:Button ID="Button5" runat="server" Text="确定" onclick="Button5_Click" />
    &nbsp;</p>
   
    <p>
        <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
    </p>
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
