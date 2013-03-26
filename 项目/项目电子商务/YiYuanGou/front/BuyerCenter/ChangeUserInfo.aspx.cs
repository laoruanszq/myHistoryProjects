using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OracleClient;

public partial class front_BuyerCenter_ChangeUserInfo : System.Web.UI.Page
{
    //string username = Session["UserName"].ToString();
    string username = "szq";
    string userID = "1";

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["UserName"] == null || Session["UserID"] == null)
        {
            Response.Redirect("../login.aspx");
        }
        username = Session["UserName"].ToString();
        userID = Session["UserID"].ToString();

        name.Text = username;

        string sqlstr = "select * from UUser where UserName='" + username + "'";
        OracleDataReader dr = DBConn.ExecuteReader(sqlstr);
        if (dr != null && dr.HasRows)
        {
            dr.Read();
            UserName.Text = dr.GetString(1);
            Password.Text = dr.GetString(2);
            ConfirmPassword.Text = dr.GetString(2);
            Email.Text = dr.GetString(4);
            //DropDownList1.SelectedValue = dr.GetString(13);
            //Answer.Text = dr.GetString(16);
            truenamecheck.Text = dr.GetString(3);
            //schoolcheck.Text = dr.GetString(22);
            collegecheck.Text = dr.GetString(5);
            numcheck.Text = dr.GetString(6);
            addresscheck.Text = dr.GetString(7);
            //TextBox1.Text = dr.GetString(10);
        }

        bindingMessageANDShoppingCar();

    }


    //绑定站内信和购物车以及搜索功能
    void bindingMessageANDShoppingCar()
    {
        //站内信
        string sqlstr = "select isopen,count(*) from InnerMail,Uuser where Uuser.userID=InnerMail.receiver and username='" + username + "' group by isopen";
        OracleDataReader dr = DBConn.ExecuteReader(sqlstr);
        int hasread = 0, noread = 0;
        if (dr != null && dr.HasRows)
        {
            while (dr.Read())
            {
                if (dr["isopen"].ToString() == "1")
                    hasread += dr.GetInt32(1);
                else
                {
                    noread = dr.GetInt32(1);
                    hasread += noread;
                }
            }
            read.Text = hasread.ToString();
            noreading.Text = noread.ToString();
        }

        //绑定购物车
        string sqlstr1 = "select count(*) from Cart where  OrderID=0 and  UserID=" + userID;
        OracleDataReader dr1 = DBConn.ExecuteReader(sqlstr);
        string shoppingcar = "0";
        if (dr1 != null && dr1.HasRows)
        {
            if (dr1.Read())
            {
                shoppingcar = dr1[0].ToString();
            }
        }
        shoppingcarNum.Text = shoppingcar;
    }
    protected void doSearch_Click(object sender, EventArgs e)
    {
        if (searchKeyWord.Text.ToString() != "" && searchKeyWord.Text.ToString() != null)
        {
            Response.Redirect("../ProductList.aspx?clear=clear&keyword=" + searchKeyWord.Text.ToString());
        }
    }
    //上面是绑定站内信和购物车以及搜索功能


    protected void Button1_Click(object sender, EventArgs e)
    {
        //数据库中的University_Province
        string sqlstr = "update  UUser set PassWord='" + Password.Text + "',Email='" + Email.Text + "',Question1='" + DropDownList1.SelectedValue + "',Answer1='" + Answer.Text + "',TrueName='" + truenamecheck.Text + "',University_Province='"
            + schoolcheck.Text + "',College_City='" + collegecheck.Text + "',IdentifyNo='" + numcheck.Text + "',Address='" + addresscheck.Text + "',CellPhone='" + TextBox1.Text + "' where UserName='" + username + "'";
           
        int flag = DBConn.ExecuteUpdate(sqlstr);
        if (flag == 1)
        {
            Response.Write("<script>alert('修改成功！'); window.location.href='../login.aspx';</script>");
        }
        else
        {
            Response.Write("<script>alert('修改失败！'); </script>");
        }
    }
}