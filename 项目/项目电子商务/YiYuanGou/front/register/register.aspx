<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="front_register_register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <script type="text/javascript" language="javascript">
        function isChecked(oSrc, args) 
        {
            args.IsValid = (document.all.boxProtocol.checked);
        }
     </script>
     <link href="../../Styles/css.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            height: 124px;
            width: 297px;
        }
        .auto-style2 {
            height: 124px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

<div id="reg">


    <table>
        <tr>
            <td align="right" class="style3">
                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">用户名:</asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                    ControlToValidate="UserName" ErrorMessage="必须填写“用户名”" 
                    ValidationGroup="reg" ForeColor="Red" SetFocusOnError="True" 
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="style3">
                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">密码:</asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                    ControlToValidate="Password" ErrorMessage="必须填写“密码”" 
                    ValidationGroup="reg" ForeColor="Red" SetFocusOnError="True" 
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="style3">
                <asp:Label ID="ConfirmPasswordLabel" runat="server" 
                    AssociatedControlID="ConfirmPassword">确认密码:</asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="PasswordCompare" runat="server" 
                    ControlToCompare="Password" ControlToValidate="ConfirmPassword" ErrorMessage="“密码”和“确认密码”必须匹配" 
                    ValidationGroup="reg" ForeColor="Red" SetFocusOnError="True" 
                    Display="Dynamic"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="style3">
                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">电子邮件:</asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                    ControlToValidate="Email" ErrorMessage="必须填写“电子邮件”"  
                    ValidationGroup="reg" ForeColor="Red" SetFocusOnError="True" 
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="Email" ErrorMessage="邮箱格式不正确" ForeColor="Red" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    SetFocusOnError="True" ValidationGroup="reg" Display="Dynamic">
               </asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="style3">
                <asp:Label ID="QuestionLabel1" runat="server"  >安全提示问题1:</asp:Label>
            </td>
            <td class="style1">
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>您的出生地？</asp:ListItem>
                    <asp:ListItem>您的生日？</asp:ListItem>
                    <asp:ListItem>父亲的名字？</asp:ListItem>
                    <asp:ListItem>父亲的生日？</asp:ListItem>
                    <asp:ListItem>母亲的名字？</asp:ListItem>
                    <asp:ListItem>母亲的生日？</asp:ListItem>
                    <asp:ListItem>初中班主任？</asp:ListItem>
                    <asp:ListItem>高中班主任？</asp:ListItem>
                    <asp:ListItem>小学班主任？</asp:ListItem>
                    <asp:ListItem>您的学号（或工号）是？</asp:ListItem>
                    <asp:ListItem>对您影响最大的人？</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" class="style3">
                <asp:Label ID="AnswerLabel1" runat="server" AssociatedControlID="Answer1">答案:</asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="Answer1" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" 
                    ControlToValidate="Answer1" ErrorMessage="必须填写“答案”"  
                    ValidationGroup="reg" ForeColor="Red" SetFocusOnError="True" 
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
           <tr>
            <td align="right" class="style3">
                <asp:Label ID="QuestionLabel2" runat="server"  >安全提示问题2:</asp:Label>
            </td>
            <td class="style1">
                <asp:DropDownList ID="DropDownList2" runat="server">
                    <asp:ListItem>您的出生地？</asp:ListItem>
                    <asp:ListItem>您的生日？</asp:ListItem>
                    <asp:ListItem>父亲的名字？</asp:ListItem>
                    <asp:ListItem>父亲的生日？</asp:ListItem>
                    <asp:ListItem>母亲的名字？</asp:ListItem>
                    <asp:ListItem>母亲的生日？</asp:ListItem>
                    <asp:ListItem>初中班主任？</asp:ListItem>
                    <asp:ListItem>高中班主任？</asp:ListItem>
                    <asp:ListItem>小学班主任？</asp:ListItem>
                    <asp:ListItem>您的学号（或工号）是？</asp:ListItem>
                    <asp:ListItem>对您影响最大的人？</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" class="style3">
                <asp:Label ID="Label3" runat="server" AssociatedControlID="Answer2">答案:</asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="Answer2" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="Answer2" ErrorMessage="必须填写“答案”"  
                    ValidationGroup="reg" ForeColor="Red" SetFocusOnError="True" 
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
           <tr>
            <td align="right" class="style3">
                <asp:Label ID="QuestionLabel3" runat="server"  >安全提示问题3:</asp:Label>
            </td>
            <td class="style1">
                <asp:DropDownList ID="DropDownList3" runat="server">
                    <asp:ListItem>您的出生地？</asp:ListItem>
                    <asp:ListItem>您的生日？</asp:ListItem>
                    <asp:ListItem>父亲的名字？</asp:ListItem>
                    <asp:ListItem>父亲的生日？</asp:ListItem>
                    <asp:ListItem>母亲的名字？</asp:ListItem>
                    <asp:ListItem>母亲的生日？</asp:ListItem>
                    <asp:ListItem>初中班主任？</asp:ListItem>
                    <asp:ListItem>高中班主任？</asp:ListItem>
                    <asp:ListItem>小学班主任？</asp:ListItem>
                    <asp:ListItem>您的学号（或工号）是？</asp:ListItem>
                    <asp:ListItem>对您影响最大的人？</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" class="style3">
                <asp:Label ID="Label5" runat="server" AssociatedControlID="Answer3">答案:</asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="Answer3" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="Answer3" ErrorMessage="必须填写“答案”"  
                    ValidationGroup="reg" ForeColor="Red" SetFocusOnError="True" 
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" colspan="2" style="color: Red;">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="auto-style1">
                <asp:Label ID="truename" runat="server" AssociatedControlID="truenamecheck">真实姓名:</asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="truenamecheck" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="UserNameRequired0" runat="server" 
                    ControlToValidate="truenamecheck" ErrorMessage="必须填写“真实姓名”" 
                     ValidationGroup="reg" ForeColor="Red" SetFocusOnError="True" 
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="style3">
                <asp:Label ID="school" runat="server" AssociatedControlID="schoolcheck">学校:</asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="schoolcheck" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="schoolcheck" ErrorMessage="必须填写“真实学校”" 
                     ValidationGroup="reg" ForeColor="Red" SetFocusOnError="True" 
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="style3">
                <asp:Label ID="college" runat="server" AssociatedControlID="collegecheck">院系:</asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="collegecheck" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="collegecheck" ErrorMessage="必须填写“真实院系”" 
                     ValidationGroup="reg" ForeColor="Red" SetFocusOnError="True" 
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="style3">
                <asp:Label ID="num" runat="server" AssociatedControlID="numcheck">学号:</asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="numcheck" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="numcheck" ErrorMessage="必须填写“真实学号”" 
                    ValidationGroup="reg" ForeColor="Red" SetFocusOnError="True" 
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="numcheck" ErrorMessage="学号格式不正确" ForeColor="Red" 
                    ValidationExpression="^\d{6,18}$" SetFocusOnError="True" 
                    ValidationGroup="reg" Display="Dynamic"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="style3">
                <asp:Label ID="address" runat="server" AssociatedControlID="addresscheck">地址:</asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="addresscheck" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="addresscheck" ErrorMessage="必须填写“真实地址”" 
                     ValidationGroup="reg" ForeColor="Red" SetFocusOnError="True" 
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="style3">
                <asp:Label ID="Label1" runat="server" AssociatedControlID="collegecheck">联系方式:</asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="collegecheck" ErrorMessage="必须填写“真实联系方式”" 
                     ValidationGroup="reg" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                    ControlToValidate="TextBox1" ErrorMessage="联系方式格式不正确" ForeColor="Red" 
                    
                    ValidationExpression="(^(\d{3,4}-)?\d{7,8})$|(13[0-9]\d{8}|15[0-9]\d{8}|18[0-9]\d{8})" 
                    Display="Dynamic" ValidationGroup="reg"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <font color="red">以上信息请务必填写真实信息(快递商品验证使用，网站中不显示)</font>
            </td>
        </tr>
        <tr>
            <td align="right" class="style3">
                验证码：</td>
            <td class="style1">
                【暂缺】</td>
        </tr>
        <tr>
            <td class="style2" colspan="2" >
                <b>用户注册协议</b><br />
                <pre style=" overflow:scroll; height:162px; width:615px; ">
欢迎注册并使用本网站进行购物。为了保障用户的权益，请您在注册前，详细阅读本网站服务协议（下称“用户协议”或“本协议”）所有内容。
本协议具有合同同等效力，本网站依据本协议的规定提供服务，您必须完全同意本协议，才能够享受本网站提供的服务。
您在本网站登录即表示您完全接受本协议的全部条款。如不接受条款，不得使用本网站服务。
 
服务条款的确认和接纳 ：
本网站提供的服务将完全按照本协议及其他随时发布的修订版、补充文件、服务条款和操作规则严格执行。
用户在线点击“同意以下条款并注册”键，或在本网站登录，应视为用户已经详细阅读本协议的全部内容，且完全同意遵守本协议的约定。
因以下情况，您不得使用服务且不能接受本协议：
中国法律规定禁止与本网站签署任何具有法律效力协议或约定者。
 
1、定义
 
    在本协议及本网站其它相关规定中所使用的下列词语，除非另有定义，应具有以下含义： 
    1.1“用户”指符合本协议所规定的条件，同意遵守本网站各种规则、条款（包括但不限于本协议），并使用本网站的个人或机构； 
    1.2本网站的核心内容是 “凑零钱合买商品”，即以少量零钱为单位，凑齐商品金额进行购物，并随机产生商品归属；
    1.3 “积分”指用户进行“凑零钱合买商品”后取得的，在本网站用以兑换相应商品；
 
2、用户的权利和义务
 
    2.1本网站使用自己的操作系统通过国际互联网络为用户提供网络服务。用户必须： 
    2.1.1自行配备上网的所需设备，包括个人电脑、调制解调器或其他必备上网装置； 
    2.1.2自行负担个人上网所支付的与此服务有关的电话费用、网络费用。 
    2.2基于本网站所提供的网络服务的重要性，用户同意提供详尽、准确的注册资料； 
    2.3不断更新注册资料，使注册资料符合及时、详尽、准确的要求，注册用户名中不能包含以下内容： 
    2.3.1反对宪法所确定的基本原则的； 
    2.3.2危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的； 
    2.3.3损害国家荣誉和利益的； 
    2.3.4煽动民族仇恨、民族歧视，破坏民族团结的； 
    2.3.5破坏国家宗教政策，宣扬邪教和封建迷信的； 
    2.3.6散布谣言，扰乱社会秩序，破坏社会稳定的； 
    2.3.7散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的； 
    2.3.8侮辱或者诽谤他人，侵害他人合法权益的； 
    2.3.9含有法律、行政法规禁止的其他内容的。 
    2.4用户有权根据使用需要更改注册密码，用户应对以该用户名进行的所有活动和时间负全部责任。 
    2.5用户不得以任何形式擅自转让或授权他人使用自己在本网站的用户帐号；
    2.6用户在本网进行交易活动应当遵守诚实信用原则，不得从事下列扰乱网上交易秩序的行为：
        2.6.1对本网站的网络以及服务器进行攻击造成网站响应缓慢或者无法连接； 
        2.6.2通过黑客手段窃取其他用户信息；
        2.6.3同一自然人注册或使用多个账号； 
        2.6.5在本网站发布任何违法信息； 
        2.6.6从事与网上交易无关的不当行为； 
        2.6.8其他干扰本网站网上交易的行为。 
    2.7为了维护交易过程中的公平性和合理性，用户需明确了解并同意，对于有以上行为的用户，本网站有权随时冻结其用户账号，并终止对上述行为的账户提供服务。
    2.8本网站的产品和服务仅为私人用户提供。 
    2.9对于拥有多个账户的用户，本网站视为同一个用户账户对其他关联账户拥有完全控制权。为维护本网站商品交易的公平性，用户须明确表示同意，本网站有权要求用户放弃其他关联账户的所有权。 
    2.10为了获得某些服务，用户可能被要求提供其个人资料，作为对本服务，或作为您持续使用服务的部分条件（如核实身份或提供联系资料）。为保证为您提供优质的服务，您需要确保您的任何登记信息是准确的，最新的。 
    2.11如果出现用户账户异常，本网站有权临时冻结用户账号展开调查，直至异常或问题解决；或因其他原因用户使用过程中存在争议，为避免不必要争端，本网站有权暂时限制用户使用直至争议解除。
    2.12如果是由于以上几点情况造成商品交易活动的不公平，本网站有权剥夺该用户该商品归属权，并让用户承担因此引起的本网站所受的直接或间接的损失。 
    2.13未经本网站书面允许，用户不得将本网站资料以及本网站所展示的任何信息以复制、修改、翻译等形式制作衍生作品、分发或公开展示。 
    2.14用户同意接收来自本网站的信息，包括但不限于活动信息、交易信息、促销信息等。 
    2.15用户不得使用以下方式登录网站或破坏网站所提供的服务：　　 
    2.15.1以任何机器人软件、蜘蛛软件、爬虫软件、刷屏软件或其它自动方式访问或登录本网站； 
    2.15.2通过任何方式对本网站内部结构造成或可能造成不合理或不合比例的重大负荷的行为； 
    2.15.3通过任何方式干扰或试图干扰网站的正常工作或网站上进行的任何活动。 
    2.16用户因违反本协议，或其他事由，被本网站中断、终止、限制使用权限的；并赔偿本网站因违反协议造成的损失后，可以使用其账户内剩余的虚拟币，以进行正常交易。
 
3、本网站的权利和义务
 
    3.1本网站不是传统意义上的“购物网”。本网站以充值形式（包括但不限于网上充值，线下充值卡充值）供用户以“凑零钱合买商品”方式参与商品交易，最终随机获得商品使用权，交易结束将获得“积分”，同时消耗积分可以获得相应商品。
    3.3本网站不公开用户的姓名、地址、电子邮箱，除以下情况外： 
    3.3.1用户授权本网站透露这些信息； 
    3.3.2法律、行政法规、规章或其他法律文件要求本网站提供用户的个人资料； 
    3.3.3司法、行政部门要求本网站提供用户的个人资料。 
    3.4本网站有权利在下列情况下，取消用户以成交价购买商品的权利： 
    3.4.1用户违反了本协议规定的义务; 
    3.4.2商品交易因各种原因非正常结束，包括但不限于： 
    3.4.2.1不可抗力，例如：自然灾害、突发战争等； 
    3.4.2.2本网站遭受黑客攻击。 
    3.5用户提供的注册资料违反本协议，或未达到本协议之要求的，本网站有权对该用户采取下列措施： 
    3.5.1全部或部分限制该用户使用本网站相关服务的权利； 
    3.5.2中断或终止该用户使用本网站相关服务的权利；
    3.5.3本协议所述“使用本网站服务的权利”，包括但不限于本协议所授予的用户权利。 
    3.6本网站有权在不通知用户的前提下删除或采取其他限制性措施处理下列信息： 
    3.6.1与本网站无关或不是以正常交易为目的； 
    3.6.2存在试图扰乱正常交易秩序因素； 
    3.6.3该信息违反公共利益或可能严重损害本网站和其他用户合法利益的。 
 
4、商品相关
 
    4.1本网站将保证用户所参与交易购买的商品与网站的描述一致。 
    4.2本网站上有可能存在不准确、遗漏、及排版错误，可能涉及到产品说明，定价和可用性信息。本网站有权更正任何错误，改变或更新，恕不另行通知。如果您无法接受任何关于产品信息的变更，您可根据我们退货政策返还商品。 
    4.3任何换货/退款请求需在7日内通知本网站（以电话、信件或电子邮件联系客服）收到日期为准，您必须保证商品仍然包装完整且不影响二次销售。
 
5、退款、退货及保修
 
    5.1用户第一次购买本网站虚拟币且未使用的，有权申请本网站退款。本网站在根据用户的要求退款后，将收回对应的帐户虚拟币。另请注意，用户“积分”不列入退款金额之内。
    5.2用户在本网站进行交易活动所购买的商品，可以向本网站客服申请退货，退货则退还用户个人所投入购买的虚拟币或相应金额。
    5.3如商品非人为破坏且在保修期范围内或符合其他保修条件（根据商品内附保修说明而定），可以送至本网站销售网点进行保修，同时提供商品保修卡及本网站购买凭证，如产生额外费用，用户自行支付。
 
6、送货相关
 
    6.1本网站将会把产品送到用户所指定的送货地址。本网站列出的送货时间为参考时间，参考时间的计算是根据库存状况、正常的处理过程和送货时间、送货地点的基础上估计得出的。送货费用根据用户选择的配送方式的不同而异。配送时间与参考时间不同的情况。 
    6.2用户应提供真实准确的姓名、送货地址及联系方式。因如下情况造成订单延迟或无法配送等，本网站将不承担责任： 
    6.2.1用户提供错误信息和不详细的地址。 
    6.2.2货物送达无人签收或非本人签收，由此造成的重复配送所产生的费用及相关的后果。
    6.2.3不可抗力，例如：自然灾害、交通戒严、突发战争等。 
   
7、服务条款的变更及补充
 
    7.1本网站将可能不定期的修改本用户协议的有关条款，一旦条款及服务内容产生变动，本网站将会在协议页面和论坛上显示修改后的内容。用户不同意本网站对条款内容所作修改的，可以主动取消获得的网络服务。如果用户继续使用本网站的服务，则视为接受服务条款的变动。本网站保留随时修改或中断服务而不需告知用户的权利。本网站行使修改或中断服务的权利，不需对用户或第三方负责。 
    7.2您需要理解并同意，如果您使用本协议变更日期后的服务，本网站将视为您接受更新后的服务条款。 
 
8、用户隐私相关
 
    8.1本网站尊重用户的个人隐私。本网站不会在未经合法用户授权时公开、编辑或透露其注册资料及保存在本网站中的非公开内容，但下列情形除外： 
    8.1.1遵守有关法律规定，遵从本网站合法服务程序。 
    8.1.2保持维护本网站的商标所有权。 
    8.1.3在紧急情况下竭力维护用户个人和社会大众的隐私安全 
    8.1.4符合其他相关的要求。 
 
9、拒绝提供担保
 
    9.1用户个人对网络服务的使用承担风险。本网站对此不作任何类型的担保，不论是明确的或隐含的，但是不对商业性的隐含担保、特定目的和不违反规定的适当担保作限制。 
    9.2本网站不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保。 
    9.3本网站对在本网站上得到的任何商品购物服务或交易进程，不作担保。 
 
10、免责声明
 
    10.1本网站对任何不正当使用网络服务，在网上购买商品或进行同类型服务，在网上进行交易，非法使用网络服务或用户传送的信息有所变动所引起的直接、间接、偶然、特殊及继起的损害不负责任。 
    10.2因为通讯技术/互联网网络的不确定因素，我们无法保证能够明确告知您对于任何网络情况的表述，以及本网站是否能够及时收到您投入的虚拟币。因为这取决多种我们无法控制的因素，其中包括您的网络连接设备和您的ISP服务商等。您需要同意，任何因网络因素所造成的任何用户损失及索赔要求或诉讼请求，本网站有权拒绝。 
 
11、对用户信息的存储和限制
 
     11.1本网站不对用户所发布信息的删除或储存失败负责。本网站有判定用户的行为是否符合本网站服务条款的要求和精神的保留权利，如果用户违背了服务条款的规定，本网站有中断对其提供网络服务的权利。 
 
12、用户管理
 
    12.1用户单独承担发布内容的责任。用户对服务的使用是根据所有适用于本网站的国家法律、地方法律和国际法律标准的。用户必须遵循： 
    12.1.1从中国境内向外传输技术性资料时必须符合中国有关法规。 
    12.1.2使用网络服务不作非法用途。 
    12.1.3不干扰或混乱网络服务。 
    12.1.4遵守所有使用网络服务的网络协议、规定、程序和惯例。 
    12.2用户须承诺不传输任何非法的、骚扰性的、中伤他人的、辱骂性的、恐怖性的、伤害性的、庸俗的，淫秽等信息资料。另外，用户也不能传输和教唆他人构成犯罪行为的资料；不能传输助长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法律的资料。禁止未经许可而非法进入其它电脑系统。 
    12.3若用户的行为不符合以上提到的服务条款，本网站将有权立即取消用户服务帐号。用户需对自己在网上的行为承担法律责任。用户若在本网站上散布和传播反动、色情或其他违反国家法律的信息，本网站的系统记录有可能作为用户违反法律的证据。 
 
13、保障用户
 
    13.1用户同意保障和维护本网站全体成员的利益，负责支付由用户使用超出业务范围引起的律师费用，违反服务条款的损害补偿费用等。 
 
14、服务的终止
 
    14.1用户或本网站可随时根据实际情况中断一项或多项网络服务。本网站不需对任何个人或第三方负责而随时中断服务。用户对后来的条款修改有异议，或对本网站的服务不满，可以行使如下权利： 
    14.1.1停止使用本网站的网络服务。 
    14.1.2通告本网站停止对该用户的服务。 
    14.2结束用户服务后，用户使用本网站服务的权利马上终止。 
    14.3本网站没有义务传送任何未处理的信息或未完成的服务给用户或第三方。 
 
15、通告
 
    15.1所有发给用户的通告都将通过本页面或以公告/电子邮件/常规信件/本网站其他页面传送。 
    15.2用户协议条款的修改、服务变更、或其它重要事件的通告都会以此形式进行，亦被视为本协议的补充或增订。 
 
16、参与广告策划
 
       16.1用户在发表的信息中加入宣传资料或参与广告策划，或在本网站的免费服务上展示他们的产品，或其他任何促销方法，包括运输货物、付款、服务、商业条件、担保及与广告有关的描述都只是在相应的用户和广告销售商之间发生。本网站不承担任何责任，本网站没有义务为这类广告销售负任何一部分的责任。 
 
17、网络服务内容的所有权
 
      17.1本网站定义的网络服务内容包括：文字、软件、声音、图片、录象、图表、广告中的全部内容；电子邮件的全部内容；本网站为用户提供的其他信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。用户只能在本网站和广告商授权下才能使用这些内容，而不能擅自复制、再造这些内容、或创造与内容有关的派生产品。本网站所有的文章版权归原文作者和本网站共同所有，任何人需要转载本网站的文章，必须征得原文作者以及本网站授权。 
 
18、责任限制
 
    18.1如因不可抗力或其他本网站无法控制的原因使网站服务无法正常使用导致网上交易无法完成或丢失有关的信息、记录等，本网站不承担责任。本网站将尽可能合理地协助处理善后事宜，并努力使用户免受经济损失。 
    18.2除了本网站的使用条件中规定的其它限制和除外情况之外，对于因交易而引起的或与之有关的任何直接的、间接的、特殊的、附带的、后果性的或惩罚性的损害，或任何其它性质的损害，本网站不承担责任。 
    18.3本网站的全部责任，不论是合同、保证、侵权（包括过失）项下的还是其它的责任，均不超过用户所购买的与该索赔有关的商品价值额。 
 
19、知识产权
 
    19.1本网站上所有的内容及资料，其著作权、专利权、商标专用权及其它知识产权，均为本网站所有，除非事先经本网站合法授权，任何人皆不得擅自以任何形式使用，否则本网站有权立即终止向用户提供产品和服务，并依法追究其法律责任。 
    19.2此外，在用户使用本网站过程中产生并储存于本网站服务器中的任何数据信息（包括但不限于帐号数据信息、角色数据信息、等级物品数据信息等，除用户的姓名、身份证号、学生证号、电话号码等个人身份数据信息外），所有权均属于本网站，用户在按照本服务条款正常使用本网站的过程中对属于其用户帐号的数据信息享有有限使用权。
                </pre>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:CheckBox runat="server" ID="boxProtocol" Text="同意协议" />
                <asp:CustomValidator ID="CustomValidator1" runat="server" 
                    ErrorMessage="阅读并同意注册协议"  ValidationGroup="reg" Display="Dynamic"  
                    ClientValidationFunction="isChecked" ForeColor="Red" 
                    SetFocusOnError="True"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">   
                <asp:Label ID="erroMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" class="style3"><asp:Button ID="comfirmSubmit" runat="server"  
                    onclick="comfirmSubmit_Click" Text="确认提交" ValidationGroup="reg" /></td>
            <td>&nbsp;&nbsp;&nbsp;<asp:Button ID="reset" runat="server" onclick="reset_Click" Text="重置" /></td>
        </tr>
    </table>


    </div>
        </form>
</body>
</html>
