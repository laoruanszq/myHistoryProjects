using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;

public partial class front_register_getPWD : System.Web.UI.Page
{
    string question1, answer1, question2, answer2, question3, answer3, PWD;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) 
        {
            string sqlstr = "select * from UUser where UserName='" + this.TextBox1.Text + "'";
            OracleDataReader dr = DBConn.ExecuteReader(sqlstr);
            if (dr != null && dr.HasRows)
            {
                dr.Read();
                answer1 = dr.GetString(15);
                answer2 = dr.GetString(16);
                answer3 = dr.GetString(17);
                PWD = dr.GetString(2);
            }
            //else
            //{
            //    Response.Write("<script>alert('该用户不存在！'); </script>");
            //}
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sqlstr = "select * from UUser where UserName='" + this.TextBox1.Text + "'";
        OracleDataReader dr = DBConn.ExecuteReader(sqlstr);
        if (dr != null && dr.HasRows)
        {
            dr.Read();

            question1 = dr.GetString(12);
            answerQuestion1.Visible = true;
            Label_question1.Text = question1;

            question2 = dr.GetString(13);
            answerQuestion2.Visible = true;
            Label_question2.Text = question2;

            question3 = dr.GetString(14);
            answerQuestion3.Visible = true;
            Label_question3.Text = question3;

            answerQuestionConfirm.Visible = true;
        }
        else
        {
            //Response.Write("<script>alert('该用户不存在！'); </script>");
            ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script>alert('该用户不存在！')</script>");
            answerQuestion1.Visible = false;
            answerQuestion2.Visible = false;
            answerQuestion3.Visible = false;

        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (answer1.Equals(TextBox2.Text.ToString()) && answer2.Equals(TextBox3.Text.ToString()) && answer3.Equals(TextBox4.Text.ToString()))
        {
            answerQuestion1.Visible = false;
            answerQuestion2.Visible = false;
            answerQuestion3.Visible = false;
            answerQuestionConfirm.Visible = false;
            Response.Write("<script>alert('您的密码是:"+PWD+"'); window.location.href='../login.aspx';</script>");
        }
        else
        {
            //Response.Write("<script>alert('安全问题不正确，请重新回答');</script>");
            ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script>alert('安全问题不正确，请重新回答')</script>");
        }
    }
}