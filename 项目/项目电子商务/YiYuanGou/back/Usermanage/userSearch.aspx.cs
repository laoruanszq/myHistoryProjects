using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class back_Usermanage_userSearch : System.Web.UI.Page
{
    string userID = "";
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
                Response.Write("<script>alert('您没有权限查找用户信息'); window.location.href='../back_index.aspx';</script>");
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Name.Text = "";
        truename.Text = "";
        Email.Text = "";
        CollageCity.Text = "";
        IdentifyNo.Text = "";
        Address.Text = "";
        Account.Text = "";
        JinYanBi.Text = "";
        string search = this.TextBox1.Text.ToString().Trim();
        if (search != "" && search != null)
        {
            //显示用户信息
            string sqlstr = "select * from UUser where TrueName like '%" + this.TextBox1.Text + "%' or UserName like '%" + this.TextBox1.Text + "%'";
            IDataReader dr = DBConn.ExecuteReader(sqlstr);
            if (dr != null)
            {
                dr.Read();
                userID = dr["userID"].ToString();
                Name.Text = dr["UserName"].ToString();
                truename.Text = "真实姓名：" + dr["TrueName"].ToString();
                Email.Text = "Email:" + dr["Email"].ToString();
                CollageCity.Text = "学院:" + dr["College_City"].ToString();
                IdentifyNo.Text = "学号：" + dr["IdentifyNo"].ToString();
                Address.Text = "地址:" + dr["Address"].ToString();
                Account.Text = "账户余额：" + dr["Account"].ToString();
                JinYanBi.Text = "经验币：" + dr["JinYanBi"].ToString();

                //显示历史记录
                string sqlstr1 = "select * from Orders,cart,product where Orders.OrderID=cart.OrderID and cart.ProductID=Product.ProductID and Orders.userID=" + userID + " and RoomID<>0";
                string sqlstr2 = "select * from Orders,cart,product where Orders.OrderID=cart.OrderID and cart.ProductID=Product.ProductID andOrders.userID='" + userID + " and RoomID=0";
                //查询出该用户购买的所有商品，根据订单中房间号判断是什么类型的购物，决定花费
                DataTable dt = DBConn.ExecuteAdapter(sqlstr1);
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    if (dt.Rows[i]["statement"].ToString().Trim().Equals("0"))
                    {
                        dt.Rows[i]["statement"] = "生成";
                    }
                    if (dt.Rows[i]["statement"].ToString().Trim().Equals("1"))
                    {
                        dt.Rows[i]["statement"] = "发货";
                    }
                    if (dt.Rows[i]["statement"].ToString().Trim().Equals("2"))
                    {
                        dt.Rows[i]["statement"] = "收到";
                    }
                    if (dt.Rows[i]["statement"].ToString().Trim().Equals("3"))
                    {
                        dt.Rows[i]["statement"] = "确认";
                    }
                    if (dt.Rows[i]["statement"].ToString().Trim().Equals("4"))
                    {
                        dt.Rows[i]["statement"] = "退货";
                    }
                }
                GridView1.DataSource = dt;
                GridView1.DataBind();


                DataTable dt2 = DBConn.ExecuteAdapter(sqlstr2);
                for (int i = 0; i < dt2.Rows.Count; i++)
                {
                    if (dt2.Rows[i]["statement"].ToString().Trim().Equals("0"))
                    {
                        dt2.Rows[i]["statement"] = "生成";
                    }
                    if (dt2.Rows[i]["statement"].ToString().Trim().Equals("1"))
                    {
                        dt2.Rows[i]["statement"] = "发货";
                    }
                    if (dt2.Rows[i]["statement"].ToString().Trim().Equals("2"))
                    {
                        dt2.Rows[i]["statement"] = "收到";
                    }
                    if (dt2.Rows[i]["statement"].ToString().Trim().Equals("3"))
                    {
                        dt2.Rows[i]["statement"] = "确认";
                    }
                    if (dt2.Rows[i]["statement"].ToString().Trim().Equals("4"))
                    {
                        dt2.Rows[i]["statement"] = "退货";
                    }
                }
                GridView2.DataSource = dt2;
                GridView2.DataBind();
            }
            else
            {
                //查无此人
                Response.Write("<script>alert('查无此人！');</script>");
            }
        }
        else 
        {
            Name.Text = "请输入用户名或者真实姓名";
        }


    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //查询不同时间节点的数据
        string sqlstr1 = "select * from Orders,cart,product where Orders.OrderID=cart.OrderID and cart.ProductID=Product.ProductID and Orders.userID=" + userID + " and RoomID<>0 ";
        string sqlstr2 = "select * from Orders,cart,product where Orders.OrderID=cart.OrderID and cart.ProductID=Product.ProductID andOrders.userID='" + userID + " and RoomID=0";
        //查询出该用户购买的所有商品，根据订单中房间号判断是什么类型的购物，决定花费
        DataTable dt = DBConn.ExecuteAdapter(sqlstr1);
        GridView1.DataSource = dt;
        GridView1.DataBind();
        DataTable dt2 = DBConn.ExecuteAdapter(sqlstr2);
        GridView2.DataSource = dt2;
        GridView2.DataBind();
    }
}