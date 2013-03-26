using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;

public partial class back_SaleTotal_saleSearch2 : System.Web.UI.Page
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
                    string strSQL = "select distinct university_Province from UUser";
                    OracleDataReader dr = DBConn.ExecuteReader(strSQL);
                    while (dr.Read())
                    {
                        this.DropDownList1.Items.Add(dr["university_Province"].ToString());
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<scirpt>alert('" + ex.Message.ToString() + "')</script>");
                }
                DropDownList2.Items.Add("不限");
                sqlSource();
            }
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList2.Items.Clear();
        this.DropDownList2.Items.Add("不限");
        if (this.DropDownList1.Text != "不限")
        {
            try
            {
                string strSQL = "select distinct college_City from UUser where university_Province='" + DropDownList1.Text + "'";
                OracleDataReader dr = DBConn.ExecuteReader(strSQL);
                while (dr.Read())
                {
                    this.DropDownList2.Items.Add(dr["college_City"].ToString());
                }
            }
            catch (Exception ex)
            {
                Response.Write("<scirpt>alert('" + ex.Message.ToString() + "')</script>");
            }
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox2.Text = "";
        TextBox1.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
        DropDownList1.Items.Clear();
        //this.DropDownList1.Items.Add("不限");
        DropDownList2.Items.Clear();
        try
        {
            this.DropDownList1.Items.Add("不限");
            string strSQL = "select distinct university_Province from UUser";
            OracleDataReader dr = DBConn.ExecuteReader(strSQL);
            while (dr.Read())
            {
                this.DropDownList1.Items.Add(dr["university_Province"].ToString());
            }
        }
        catch (Exception ex)
        {
            Response.Write("<scirpt>alert('" + ex.Message.ToString() + "')</script>");
        }
        this.DropDownList2.Items.Add("不限");
    }
    protected void sqlSource()
    {
        string sqlstr = "select cart.productID,proName,proSize,color,orders.statement,to_char(orders.roomID) as roomID,amount,orderTime,sendTime,acceptTime,rejectTime from  Product,orders,uuser,cart where cart.orderID=orders.orderID and orders.userID=UUser.userID and product.productID=cart.productID ";
        string orderstr = " order by orderTime,cart.productID";
        if (TextBox1.Text != "")
           sqlstr = sqlstr + " and userName like '%" + TextBox1.Text + "%'";
        if (TextBox2.Text != "")
           sqlstr = sqlstr + " and trueName like '%" + TextBox2.Text + "%'";
        if (DropDownList1.Text != "不限")
            sqlstr = sqlstr + " and university_Province='" + DropDownList1.Text + "'";
        if (DropDownList2.Text != "不限")
            sqlstr = sqlstr + " and college_City='" + DropDownList2.Text + "'";
        if (TextBox4.Text != "" && TextBox3.Text != "")
            sqlstr = sqlstr + " and orderTime between to_date('" + TextBox4.Text + "','yyyymmdd') and to_date('" + TextBox3.Text + "','yyyymmdd')";
        else
            if ((TextBox4.Text == "" && TextBox3.Text != "") || (TextBox3.Text == "" && TextBox4.Text != ""))
                Response.Write("<script>alert('时间条件要么给全，要么不给！');</script>");
        sqlstr = sqlstr + orderstr;
        DataTable dt = DBConn.ExecuteAdapter(sqlstr);
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            string s = dt.Rows[i]["roomID"].ToString();
            if (s == "0")
                dt.Rows[i]["roomID"] = "经验值换购";
            else
                dt.Rows[i]["roomID"] = "房间占座";

            switch (dt.Rows[i]["statement"].ToString())
            {
                case "0": dt.Rows[i]["statement"] = "尚未发货";
                    break;
                case "1": dt.Rows[i]["statement"] = "已经发货";
                    break;
                case "2": dt.Rows[i]["statement"] = "物流已送达";
                    break;
                case "3": dt.Rows[i]["statement"] = "用户已收货";
                    break;
                case "4": dt.Rows[i]["statement"] = "退货已收到";
                    break;
            }
        }
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        sqlSource();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        sqlSource();
    }
}