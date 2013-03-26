using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OracleClient;
using System.Data;

public partial class front_register_register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.ClientTarget = "UpLevel";  //客户端验证


    }
     public void resetform()
    {
        UserName.Text = "";
        Password.Text = "";
        ConfirmPassword.Text = "";
        Email.Text = "";
        Answer1.Text = "";
        Answer2.Text = "";
        Answer3.Text = "";
        DropDownList1.SelectedIndex = 0;
        DropDownList2.SelectedIndex = 0;
        DropDownList3.SelectedIndex = 0;
        truenamecheck.Text = "";
        schoolcheck.Text = "";
        collegecheck.Text = "";
        numcheck.Text = "";
        addresscheck.Text = "";
        TextBox1.Text = "";
        boxProtocol.Checked=false;
    }
    protected void comfirmSubmit_Click(object sender, EventArgs e)
    {
        if (Email.Text != null && Email.Text != "" && TextBox1.Text != null && TextBox1.Text != "" && UserName.Text != null && UserName.Text!="")
        {
            string queryReapet = "select * from uuser where Email='" + Email.Text + "' or  CellPhone='" + TextBox1.Text + "'";
            DataTable dt1 = DBConn.ExecuteAdapter(queryReapet);
            if (dt1.Rows.Count > 0)
            {
                //Response.Write("<script>alert('邮箱或电话号码已使用过！'); </script>");
                ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script>alert('邮箱或电话号码已使用过！')</script>");
            }
            else
            {
                string username = UserName.Text.ToString().Trim();
                string sqlstr1 = "select * from uuser where username='" + username + "'";
                DataTable dt = DBConn.ExecuteAdapter(sqlstr1);
                if (dt.Rows.Count == 0)
                {
                    if (DropDownList1.SelectedIndex != DropDownList2.SelectedIndex && DropDownList1.SelectedIndex != DropDownList3.SelectedIndex && DropDownList2.SelectedIndex != DropDownList3.SelectedIndex)
                    {
                        if (UserName.Text.Trim() != "" && Password.Text.Trim() != "" && Email.Text.Trim() != "" && Answer1.Text.Trim() != "" && Answer2.Text.Trim() != "" && Answer3.Text.Trim() != "" && truenamecheck.Text.Trim() != "" && schoolcheck.Text.Trim() != "" && collegecheck.Text.Trim() != "" && numcheck.Text.Trim() != "" && addresscheck.Text.Trim() != "" && TextBox1.Text.Trim() != "")
                        {
                            //数据库中的University_Province
                            string sqlstr = "insert into UUser (UserName,PassWord,Email,Question1,Answer1,Question2,Answer2,Question3,Answer3,TrueName,University_Province,College_City,IdentifyNo,Address,CellPhone) values('"
                                + UserName.Text.Trim() + "','" + Password.Text.Trim() + "','" + Email.Text.Trim() + "','" + DropDownList1.SelectedValue + "','" + Answer1.Text.Trim() + "','" + DropDownList2.SelectedValue + "','" + Answer2.Text.Trim() + "','" + DropDownList3.SelectedValue + "','"
                                + Answer3.Text.Trim() + "','" + truenamecheck.Text.Trim() + "','" + schoolcheck.Text.Trim() + "','" + collegecheck.Text.Trim() + "','" + numcheck.Text.Trim() + "','" + addresscheck.Text.Trim() + "','" + TextBox1.Text.Trim() + "')";
                            int flag = DBConn.ExecuteUpdate(sqlstr);
                            if (flag == 1)
                            {
                                Response.Write("<script>alert('注册成功！'); window.location.href='../login.aspx';</script>");
                                //ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script>alert('提示消息!!!')</script>");
                            }
                            else
                            {
                                resetform();
                                //Response.Write("<script>alert('注册失败！'); </script>");
                                ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script>alert('注册失败！')</script>");
                            }
                        }
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script>alert('为了您的账户安全，请选择不同的密码安全问题！')</script>");
                    }
   
                }
                else
                {
                    //Response.Write("<script>alert('用户名已存在！'); </script>");
                    ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script>alert('用户名已存在！')</script>");
                }
            }
        }
    }
    protected void reset_Click(object sender, EventArgs e)
    {
        resetform();
    }
   
}