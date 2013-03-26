using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;
//统计指定类别指定购买方式指定时间段内的商品的退货总数和退货率
public partial class back_SaleTotal_saleTotal4 : System.Web.UI.Page
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
       //退货总数
        string sqlstr1= " (select proName,grandfather,father,pcname,sum(amount) as tuizongshu from  Product,cart,product_cata,orders where product.productID=cart.productID and cart.orderID=orders.orderID and product.pcid=product_cata.pcid and statement='4'";
        //销售总数
        string sqlstr2 = " (select proName,grandfather,father,pcname,sum(amount) as zongshu from  Product,cart,product_cata,orders where product.productID=cart.productID and cart.orderID=orders.orderID and product.pcid=product_cata.pcid ";
        string orderstr = " order by tuilv desc";
        //加上用户指定的查询条件
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
        /* sqlstr1 ="create or replace view tuihuo1 as " + sqlstr1 + wherestr + " group by proName,grandfather,father,pcname ";
        sqlstr2 = "create or replace view tuihuo2 as "+sqlstr2 + wherestr + "group by proName,grandfather,father,pcname";
        DBConn.ExecuteUpdate(sqlstr1);
        DBConn.ExecuteUpdate(sqlstr2);
        string sqlstr = "select tuihuo1.*,zongshu,tuizongshu/zongshu as tuilv from tuihuo1,tuihuo2 where tuihuo1.grandfather=tuihuo2.grandfather AND tuihuo1.father=tuihuo2.father AND tuihuo1.pcname=tuihuo2.pcname and tuihuo1.proName=2.proName " + orderstr;
       */
        //按商品统计指定条件下的商品的退货率
        string sqlstr = "select R1.*,zongshu,round(tuizongshu/zongshu,5) as tuilv from " + sqlstr1+wherestr+" group by proName,grandfather,father,pcname) R1," +sqlstr2+wherestr+"group by proName,grandfather,father,pcname) R2"+ " where R1.grandfather=R2.grandfather AND R1.father=R2.father AND R1.pcname=R2.pcname and R1.proName=R2.proName " + orderstr;
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
        DropDownList4.SelectedIndex = 0;
    }
}