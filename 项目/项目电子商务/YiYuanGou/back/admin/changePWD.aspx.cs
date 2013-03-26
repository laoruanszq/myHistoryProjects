using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_changePWD : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Write("<script>alert('你没有登陆'); window.location.href='../adminLogin.aspx';</script>");
        }   
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        old.Text = "";
        new1.Text = "";
        new2.Text = "";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (old.Text != "" && new1.Text != "" && new2.Text != "" && new1.Text == new2.Text)
        {
            string sqlstr = "update AdminUser set password='" + new1.Text + "' where UName='" + Session["UserName"].ToString() + "' and PWD='" + old.Text + "'";
            int flag = DBConn.ExecuteUpdate(sqlstr);
            if (flag == 1)
            {
                Response.Write("<script>alert('修改成功，请重新登录'); window.location.href='../adminLogin.aspx';</script>");
            }
            else
            {
                Response.Write("<script>alert('修改失败，请重新登录');</script>");
            }
        }
    }
}