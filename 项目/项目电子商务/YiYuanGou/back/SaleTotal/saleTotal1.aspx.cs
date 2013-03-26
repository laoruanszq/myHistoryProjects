using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;
//统计指定类别的商品在指定时间内的销量总和，不指定类别和时间的话，统计所有类别的商品的销售情况，按销量降序排序
public partial class back_SaleTotal_saleTotal1 : System.Web.UI.Page
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
                try
                {
                    this.DropDownList1.Items.Add("不限");
                    string strSQL = "select distinct grandfather from product_cata";
                    OracleDataReader dr = DBConn.ExecuteReader(strSQL);
                    while (dr.Read())
                    {
                        this.DropDownList1.Items.Add(dr["grandfather"].ToString());
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<scirpt>alert('" + ex.Message.ToString() + "')</script>");
                }
                DropDownList2.Items.Add("不限");
                DropDownList3.Items.Add("不限");
                sqlSource();
            }
        }
    }
    protected void sqlSource()
    {
        string sqlstr = "select grandfather,father,pcname,sum(amount) as zongshu from  Product,cart,product_cata,orders where product.productID=cart.productID and cart.orderID=orders.orderID and product.pcid=product_cata.pcid ";
        string orderstr = " order by zongshu desc";
        string wherestr = "";
        if (TextBox2.Text != "" && TextBox3.Text != "")
            wherestr = wherestr + " and orderTime between to_date('" + TextBox2.Text + "','yyyymmdd') and to_date('" + TextBox3.Text + "','yyyymmdd')";
        else
            if ((TextBox2.Text == "" && TextBox3.Text != "") || (TextBox3.Text == "" && TextBox2.Text != ""))
                Response.Write("<script>alert('时间条件要么给全，要么不给！');</script>");
        if (DropDownList1.Text != "不限")
            wherestr = wherestr + " and grandfather='" + DropDownList1.Text + "'";
        if (DropDownList2.Text != "不限")
            wherestr = wherestr + " and father='" + DropDownList2.Text + "'";
        if (DropDownList3.Text != "不限")
            wherestr = wherestr + " and pcname='" + DropDownList3.Text + "'";
        if (DropDownList4.Text == "换购")
            wherestr = wherestr + " and roomID＝0";
        if (DropDownList4.Text == "占座")
            wherestr = wherestr + " and roomID!=0";
        sqlstr = sqlstr + wherestr + " group by  grandfather,father,pcname " + orderstr;
        DataTable dt = DBConn.ExecuteAdapter(sqlstr);
        GridView1.DataSource = dt;
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
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList2.Items.Clear();
        this.DropDownList2.Items.Add("不限");
        if (this.DropDownList1.Text != "不限")
        {
            try
            {
                string strSQL = "select distinct father from product_cata where grandfather='" + DropDownList1.Text + "'";
                OracleDataReader dr = DBConn.ExecuteReader(strSQL);
                while (dr.Read())
                {
                    this.DropDownList2.Items.Add(dr["father"].ToString());
                }
            }
            catch (Exception ex)
            {
                Response.Write("<scirpt>alert('" + ex.Message.ToString() + "')</script>");
            }
        }

    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList3.Items.Clear();
        this.DropDownList3.Items.Add("不限");
        if (this.DropDownList2.Text != "不限")
        {
            try
            {
                string strSQL = "select distinct pcname from product_cata where father='" + DropDownList2.Text + "'" + " and grandfather='" + DropDownList1.Text + "'";
                OracleDataReader dr = DBConn.ExecuteReader(strSQL);
                while (dr.Read())
                {
                    this.DropDownList3.Items.Add(dr["pcname"].ToString());
                }
            }
            catch (Exception ex)
            {
                Response.Write("<scirpt>alert('" + ex.Message.ToString() + "')</script>");
            }
        }
    }
    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        //TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        DropDownList1.Items.Clear();
        //this.DropDownList1.Items.Add("不限");
        try
        {
            this.DropDownList1.Items.Add("不限");
            string strSQL = "select distinct grandfather from product_cata";
            OracleDataReader dr = DBConn.ExecuteReader(strSQL);
            while (dr.Read())
            {
                this.DropDownList1.Items.Add(dr["grandfather"].ToString());
            }
        }
        catch (Exception ex)
        {
            Response.Write("<scirpt>alert('" + ex.Message.ToString() + "')</script>");
        }
        DropDownList2.Items.Clear();
        this.DropDownList2.Items.Add("不限");
        DropDownList3.Items.Clear();
        this.DropDownList3.Items.Add("不限");
        DropDownList4.SelectedIndex=0;
    }  
}