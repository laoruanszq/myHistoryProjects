<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TabMenu.ascx.cs" Inherits="front_TabMenu" %>



<!--
<script type="text/javascript" src="../JQuery_Tab_Menu_files/jquery-1.js"></script>
<script type="text/javascript" src="../JQuery_Tab_Menu_files/menu.js"></script>
-->
<script type="text/javascript" src="../Scripts/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="../Scripts/menu.js"></script>
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
.outer{ background:url("../images/menu_sprites.png") no-repeat top left; margin-top:5px; padding-left:10px;}
.menu{ overflow:hidden;}
.inner{ background:url("../images/menu_sprites.png") no-repeat top right; padding-right:5px;}
.menu ul{ background:url("../images/menu_sprites.png") repeat-x 0 -102px; height:27px;
    width: 95%;
    margin:0 auto;
}
ul{ list-style:none;}

.menu li{ float:left; width:auto !important; width:1%; white-space:nowrap; padding:0 5px; background:url("../images/menu_sprites.png") no-repeat bottom left;}
.menu li a{ display:block; text-decoration:none; padding-left:5px; cursor:pointer;}
.menu li a span { display:block;height:27px; line-height:27px; color:white; padding-right:5px;}

.menu_content ul{padding-left:80px; border:1px solid #ccc; border-top:none; height:1%; overflow:hidden; background:url("../images/secdM_normal.png") repeat-x;}
.menu_content li{ float:left; }
.menu_content li a{ float:left; display:block; height:27px; line-height:27px; padding:0 10px; text-decoration:none; color:#666;}
</style>
    <div class="menu_tab">
	    <div class="menu outer">
		    <div class="inner">
			    <ul>
				    <li class="" style="background:none;"><a href="#"><span>首页</span></a></li>
				    <li class=""><a href="#"><span>买家中心</span></a></li>
				    <li class=""><a href="#"><span>所有商品</span></a></li>
				    <li class=""><a href="#"><span>论坛</span></a></li>
				    <li class=""><a href="#"><span>用户帮助</span></a></li>
                    <li class="">
                        <a href="#"><span>
                            <asp:TextBox ID="keyword" runat="server" Width="90px"></asp:TextBox>&nbsp;
                            <asp:Button ID="sreach" runat="server" onclick="sreach_Click" Text="一元搜" 
                            Height="20px" Width="50px" />
                        </span></a>
                   </li>
                   <li class="">
                        <a href="#"><span>
                            <asp:Button ID="Button1" runat="server" Text="购物车" onclick="Button1_Click" 
                            Height="20px" Width="50px" />
                        </span></a>
                    </li>
			    </ul>
		    </div>
	    </div>

	    <div class="menu_content">
		    <ul style="display: none;">
			    <li><a href="../front/index.aspx">首页</a></li>
		    </ul>
		    <ul style="display: none;">
			    <li><a href="../front/BuyerCenter/BuyerCenter.aspx">个人资料</a></li>
			    <li><a href="../front/BuyerCenter/Message.aspx">站内信</a></li>
		    </ul>
		    <ul style="display: none;">
			    <li><a href="../front/ProductList.aspx?clear=clear">所有商品</a></li>
			    <li><a href="../front/ProductList.aspx?isbool=ischeap">免费商品</a></li>

		    </ul>
		    <ul style="display: none;">
			    <li><a href="#">浏览</a></li>
                <li><a href="#">发帖</a></li>
		    </ul>
		    <ul style="display: none;">
			    <li><a href="#">用户帮助</a></li>
		    </ul>
            <ul style="display: none;">
		    </ul>
	    </div>
</div>



