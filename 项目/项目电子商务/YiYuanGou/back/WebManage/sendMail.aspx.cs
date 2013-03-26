using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class back_WebManage_Default1 : System.Web.UI.Page
{
    //public static string[] accepter=new string[200];
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("../adminLogin.aspx");
        }
        else
        {
            if (Session["UMode"] != null && !Session["UMode"].ToString().Equals("0") && !Session["UMode"].ToString().Equals("4") && !Session["UMode"].ToString().Equals("5"))
            {
                //Response.Write("<script>alert('您没有权限进行管理员维护');</script>");
                Response.Write("<script>alert('您没有权限给客户发送邮件'); window.location.href='../back_index.aspx';</script>");
            }
            else
            {
                if (Session["accepter"] != null)
                    TextBox1.Text = Session["accepter"].ToString();
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if(TextBox1.Text!=""&&TextBox2.Text!=""&&TextBox3.Text!="")
        {
            string a = TextBox1.Text;
            string[] alist=a.Split(new Char [] {';'});
            string sql = "";
            foreach (string s in alist)
            {
                try
                {
                    if (s.Trim() != "")
                    {
                        sql = "insert into innermail(mtitle,sender,receiver,content,isopen,sendtime) values ('" + TextBox2.Text + "',1," + s + ",'" + TextBox3.Text + "',0,sysDate) ";
                        DBConn.ExecuteUpdate(sql);
                    }
                }
                catch
                {
                    Response.Write("<script>alert('邮件无法投递给" + s + ",后续其他用户均未收到邮件，请重新发送！');</script>");
                }
            }
            Response.Write("<script>alert('邮件发送成功！');</script>");
            
        }
        else
            Response.Write("<script>alert('收件人、主题和内容不能为空！');</script>");
       
    }

}