<%@ Control Language="C#" AutoEventWireup="true" CodeFile="anotherbackMenu.ascx.cs" Inherits="customcontrols_anotherbackMenu" %>


<!--
<script type="text/javascript" src="../JQuery_Tab_Menu_files/jquery-1.js"></script>
<script type="text/javascript" src="../JQuery_Tab_Menu_files/menu.js"></script>
-->
<script type="text/javascript" src="../../Scripts/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="../../Scripts/menu.js"></script>
<style type="text/css">


.menu_tab{ width:100%; margin-left: auto;
    margin-right: auto;
    margin-top: 0;
}
*{ padding:0;
    margin-left: 0;
    margin-right: 0;
    margin-top: 0;
}
.outer{ background:url("../../images/menu_sprites.png") no-repeat top left; margin-top:5px; padding-left:10px;}
.menu{ overflow:hidden;}
.inner{ background:url("../../images/menu_sprites.png") no-repeat top right; padding-right:5px;}
.menu ul{ background:url("../../images/menu_sprites.png") repeat-x 0 -102px; height:27px;
    width: 95%;
    margin:0 auto;
}
ul{ list-style:none;}

.menu li{ float:left; width:auto !important; width:1%; white-space:nowrap; padding:0 5px; background:url("../../images/menu_sprites.png") no-repeat bottom left;}
.menu li a{ display:block; text-decoration:none; padding-left:5px; cursor:pointer;}
.menu li a span { display:block;height:27px; line-height:27px; color:white; padding-right:5px;}

.menu_content ul{padding-left:80px; border:1px solid #ccc; border-top:none; height:1%; overflow:hidden; background:url("../../images/secdM_normal.png") repeat-x;}
.menu_content li{ float:left; }
.menu_content li a{ float:left; display:block; height:27px; line-height:27px; padding:0 10px; text-decoration:none; color:#666;}
</style>
    <div class="menu_tab">
	    <div class="menu outer">
		    <div class="inner">
			    <ul>
				    <li class="" style="background:none;"><a href="#"><span>后台首页</span></a></li>
				    <li class=""><a href="#"><span>管理员维护</span></a></li>
                    <li class=""><a href="#"><span>用户查询</span></a></li>
				    <li class=""><a href="#"><span>商品管理</span></a></li>
                    <li class=""><a href="#"><span>订单管理</span></a></li>
                    <li class=""><a href="#"><span>销售统计</span></a></li>
                    <li class=""><a href="#"><span>系统设置</span></a></li>
                    <li class=""><a href="../../back/WebManage/ModifyAccount.aspx"><span>充值</span></a>
                    <li class=""><a href="../../back/WebManage/sendMail.aspx"><span>站内信</span></a>                    
			    </ul>
		    </div>
	    </div>

	    <div class="menu_content">
		    <ul style="display: none;">
			    <li><a href="../../back/back_index.aspx">后台首页</a></li>
		    </ul>
		    <ul style="display: none;">
			    <li><a href="../../back/admin/adminManage.aspx">管理员管理</a></li>
                <li><a href="../../back/admin/changePWD.aspx">修改密码</a></li>
		    </ul>
            <ul style="display: none;">
			    <li><a href="../../back/Usermanage/userSearch.aspx">用户搜索</a></li>
		    </ul>
		    <ul style="display: none;">
                <li><a href="../../back/productManage/productManage.aspx">商品管理</a></li>
                <li><a href="../../back/productManage/addProduct.aspx">添加商品</a></li>
                <li><a href="../../back/productManage/AlermStock.aspx">库存预警</a></li>
                <li><a href="../../back/productManage/productCataManage.aspx">商品分类管理</a></li> 
		    </ul>
		    <ul style="display: none;">
                <li><a href="../../back/SendProduct/SendProduct.aspx">发货</a></li>
                <li><a href="../../back/sendConfirm/sendConfirm.aspx">物流确认</a></li>
                <li><a href="../../back/returnGoods/returnGoods.aspx">退货</a></li>
		    </ul>
             <ul style="display: none;">
                <li><a href="../../back/SaleTotal/SaleSearch1.aspx">商品销售查询</a></li>
                <li><a href="../../back/SaleTotal/saleSearch2.aspx">用户购买记录查询</a></li>
                <li><a href="../../back/SaleTotal/saleTotal1.aspx">按类别统计</a></li>
                <li><a href="../../back/SaleTotal/saleTotal2.aspx">按商品统计</a></li>
                <li><a href="../../back/SaleTotal/saleTotal3.aspx">按用户统计</a></li>
                <li><a href="../../back/SaleTotal/saleTotal4.aspx">退货统计</a></li>
		    </ul>
            <ul style="display: none;">
                <li><a href= "../../back/ADManage/AD_Manage.aspx">广告设置</a></li>
                <li><a href= "../../back/offOnFaultUser.aspx">开启虚拟用户</a></li>
                <li><a href= "../../back/onOffFaultUser.aspx">关闭虚拟用户</a></li>
                <li><a href= "../../back/setFaultUser.aspx">设置虚拟用户比例</a></li>
                <li><a href= "../../back/setHotRoom.aspx">开启或关闭房间</a></li>
		    </ul>
	    </div>
</div>
