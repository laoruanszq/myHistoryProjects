<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" language="javascript">
        //复制网址
        function aa() 
        {
            clipboardData.setData('text', document.title + window.location.href);
            alert("复制成功，请粘贴");
        }

        function bb()
         {
             clipboardData.setData('text', document.getElementById("sss").innerHTML);
            alert("复制成功");
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="sss" runat="server" Text="cacaca"></asp:Label>
        <input name="button1" type="button" onclick="aa()" value="复制网址" />
        <input name="button2" type="button" onclick="bb()" value="复制内容" />
    </div>
    </form>
</body>
</html>
