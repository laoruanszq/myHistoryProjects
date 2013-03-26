using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;

public partial class back_adminLogin_new : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void cancle_Click(object sender, EventArgs e)
    {
        username.Text = "";
        password.Text = "";
        usercheck.ForeColor = System.Drawing.Color.Black;
        pwdcheck.ForeColor = System.Drawing.Color.Black;
        usercheck.Text = "*";
        pwdcheck.Text = "*";
        erroMessage.Text = "";
    }
    protected void login_Click(object sender, EventArgs e)
    {

        if (username.Text.ToString().Trim().Equals("") || username.Text == null)
        {
            usercheck.ForeColor = System.Drawing.Color.Red;
            usercheck.Text = "*用户名不能为空";
        }
        else if (password.Text.ToString().Trim().Equals("") || password.Text == null)
        {
            usercheck.ForeColor = System.Drawing.Color.Black;
            usercheck.Text = "*";

            pwdcheck.ForeColor = System.Drawing.Color.Red;
            pwdcheck.Text = "*密码不能为空";
        }
        else
        {
            usercheck.ForeColor = System.Drawing.Color.Black;
            usercheck.Text = "*";
            pwdcheck.ForeColor = System.Drawing.Color.Black;
            pwdcheck.Text = "*";

            string uname = username.Text.ToString().Trim();
            string pwd = password.Text.ToString().Trim();
            string strSql = @"select * from AdminUser where Uname='" + uname + "' and PWD='" + pwd + "'";
            OracleDataReader dr = DBConn.ExecuteReader(strSql);
            if (dr != null && dr.HasRows)
            {
                dr.Read();
                //登陆成功
                Session["LoginTime"] = DateTime.Now;
                Session["UserName"] = uname;
                Session["UMode"] = dr.GetString(2);
                string s = Session["UMode"].ToString();
                Response.Write(" <script   language=javascript> var   rtn=window.alert( '登陆成功'); </script> ");
                Response.Redirect("back_index.aspx");
            }
            else
            {
                string result = DBConn.ErrorMessage;
                erroMessage.Text = "用户名密码不正确！";
                //erroMessage.Text = result;
            }
        }
    }
}