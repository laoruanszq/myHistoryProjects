using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;

public partial class front_ExpChangePro_ShowShoppingCar : System.Web.UI.Page
{
    string username = "szq";
    //string userID = Session["UserID"].ToString();
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


        bindingMessageANDShoppingCar();
             //string username = Session["UserName"].ToString();
            //我的换购商品
            string sqlstr = "select * from Product,Cart where Cart.ProductID=Product.ProductID and OrderID=0 and  UserID=" + userID;
            DataTable dt = null;
            dt = DBConn.ExecuteAdapter(sqlstr);
            ListViewUserCar.DataSource = dt;
            ListViewUserCar.DataBind();
            if (dt.Rows.Count == 0)
            {
                shownone.Text = "亲，您还没有添加商品到购物车中！<a href='../ProductListFree.aspx?clear=clear'>请继续浏览商品</a>\n\n";
                Table1.Visible = false;
            }

            double price = 0.0;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                price += double.Parse(dt.Rows[i]["price"].ToString()) * double.Parse(dt.Rows[i]["amount"].ToString());
            }
            totalPrice.Text ="总价：" + price + "元";

    }
    protected void clear_Click(object sender, EventArgs e)
    {
        string sqlstr = "delete from cart where OrderID=0 and  UserID=" + userID;
        int flag = DBConn.ExecuteUpdate(sqlstr);
        if (flag == 0)
        {
            Response.Write("<script typr='text/javascript'>alert('清空失败~亲，稍后重试！');</script>");
        }
        else
        {
            Response.Write("<script typr='text/javascript'>alert('清空完成！继续购物~');window.location = '../ProductListFree.aspx?clear=clear';</script>");
        }
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
        string sqlstr1 = "select * from Cart where  OrderID=0 and  UserID=" + userID;
        DataTable dt1 = DBConn.ExecuteAdapter(sqlstr1);
        string shoppingcar = "0";
        if (dt1 != null && dt1.Rows.Count != 0)
        {
            shoppingcar = dt1.Rows.Count.ToString();
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



}