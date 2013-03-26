using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;
//按商品编号和房间类型统计销量，可以指定时间范围和购买方式

public partial class back_SaleTotal_saleTotal2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UMode"] == null)
        {
            //Response.Write("<script>alert('您没有权限进行管理员维护');</script>");
            Response.Write("<script>alert('您还没有登录，请登录'); window.location.href='../adminLogin.aspx';</script>");
        }
        else
        {
            if (!IsPostBack)
            {
                sqlSource();
            }
        }
    }
    protected void sqlSource()
    {
        string sqlstr = "";
        string orderstr = " order by zongshu desc";
       //构建查询条件
        string wherestr = "";
        if (TextBox5.Text != "")
            wherestr = wherestr + " and proname like '%" + TextBox5.Text + "%'";
        if (TextBox2.Text != "" && TextBox3.Text != "")
            wherestr = wherestr + " and orderTime between to_date('" + TextBox2.Text + "','yyyymmdd') and to_date('" + TextBox3.Text + "','yyyymmdd')";
        else
            if ((TextBox2.Text == "" && TextBox3.Text != "") || (TextBox3.Text == "" && TextBox2.Text != ""))
                Response.Write("<script>alert('时间条件要么给全，要么不给！');</script>");
        if (CheckBox1.Checked == true)
        {
            if (DropDownList4.Text == "换购")
            {
                //当用户选择了“换购”，则统计所有满足条件的换购销售的商品的销售总量
                sqlstr = "select product.productID,proName,proName as roomType,sum(amount) as zongshu from  Product,cart,orders where product.productID=cart.productID and cart.orderID=orders.orderID and roomID=0";
                sqlstr = sqlstr + wherestr + " group by product.productID,proName";
            }
            if (DropDownList4.Text == "占座")
            {
                //当用户选择了“换购”，则统计所有满足条件的投注销售的商品的销售总量
                sqlstr = "select product.productID,proName,proName as roomType,sum(amount) as zongshu from  Product,cart,orders where product.productID=cart.productID and cart.orderID=orders.orderID and roomID!=0";
                sqlstr = sqlstr + wherestr + " group by product.productID,proName";
            }
        }
        else
        {
            if (DropDownList4.Text == "换购")
            {
                //当用户选择了“换购”，则统计所有满足条件的换购销售的商品的销售总量
                sqlstr = "select product.productID,proName,proName as roomType,sum(amount) as zongshu from  Product,cart,orders where product.productID=cart.productID and cart.orderID=orders.orderID and roomID=0";
                sqlstr = sqlstr + wherestr + " group by product.productID,proName";
            }
            if (DropDownList4.Text == "占座")
            {
                //当用户选择了“换购”，则统计所有满足条件的投注销售的商品房间类型及该类房间的销售总量
                sqlstr = "select product.productID,proName,roomType,sum(amount) as zongshu from  Product,cart,orders,room where product.productID=cart.productID and cart.orderID=orders.orderID and orders.roomID=room.roomId and orders.roomID!=0";
                sqlstr = sqlstr + wherestr + " group by product.productID,proName,roomType";
            }
        }
       
            //wherestr = wherestr + " and roomID!=0";
        sqlstr = sqlstr + orderstr;
        DataTable dt = DBConn.ExecuteAdapter(sqlstr);
       //将内部表示换成其实际含义
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            string ss=dt.Rows[i]["roomType"].ToString().Trim();
            switch (ss)
            {
                case "0": dt.Rows[i]["roomType"] = "10元";
                    break;
                case "1": dt.Rows[i]["roomType"] = "1元";
                    break;
                case "2": dt.Rows[i]["roomType"] = "2元";
                    break;
                case "3": dt.Rows[i]["roomType"] = "只十人";
                    break;
                case "4": dt.Rows[i]["roomType"] = "特便宜";
                    break;
                case "5": dt.Rows[i]["roomType"] = "5元";
                    break;
                default: dt.Rows[i]["roomType"] = "换购";
                    break;
            }
        }
        GridView1.DataSource = dt;
        if (CheckBox1.Checked == true)
        {
            GridView1.Columns[2].Visible = false;
        }
        else
        {
            if (DropDownList4.Text == "换购")
                GridView1.Columns[2].Visible = false;
            else
                GridView1.Columns[2].Visible = true;
        }

        GridView1.DataBind();

    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        sqlSource();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        sqlSource();
    }
   
    protected void Button4_Click(object sender, EventArgs e)
    {
        //TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        DropDownList4.SelectedIndex = 0;
        CheckBox1.Checked = false;
    }
}