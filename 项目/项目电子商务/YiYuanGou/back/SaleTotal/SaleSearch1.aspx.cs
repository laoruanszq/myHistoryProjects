using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;

public partial class back_SaleTotal_Default : System.Web.UI.Page
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
                //初始化页面
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
    protected void sqlSource()/////////
    {
        //构建查询语句
        string sqlstr = "select uuser.userID,userName,trueName,university_Province,college_City,orders.statement,to_char(orders.roomID) as roomID,amount,orderTime,sendTime,acceptTime,rejectTime from  Product,orders,uuser,cart,product_cata where cart.orderID=orders.orderID and orders.userID=UUser.userID and product.productID=cart.productID and product.pcid=product_cata.pcid ";
        string orderstr = " order by orderTime,cart.productID,uuser.userID";
        if (TextBox1.Text != "")
            sqlstr = sqlstr + " and proName like '%" + TextBox1.Text + "%'";
        if (DropDownList1.Text != "不限")
            sqlstr = sqlstr + " and grandfather='" + DropDownList1.Text + "'";
        if (DropDownList2.Text != "不限")
            sqlstr = sqlstr + " and father='" + DropDownList2.Text + "'";
        if (DropDownList3.Text != "不限")
            sqlstr = sqlstr + " and pcname='" + DropDownList3.Text + "'";
        if (TextBox2.Text != "" && TextBox3.Text != "")
            sqlstr = sqlstr + " and orderTime between to_date('" + TextBox2.Text + "','yyyymmdd') and to_date('" + TextBox3.Text + "','yyyymmdd')";
        else
            if ((TextBox2.Text == "" && TextBox3.Text != "") || (TextBox3.Text == "" && TextBox2.Text != ""))
                Response.Write("<script>alert('时间条件要么给全，要么不给！');</script>");
        sqlstr = sqlstr + orderstr;
        DataTable dt = DBConn.ExecuteAdapter(sqlstr);
        //将换购方式的内部表示（roomID=0为换购，否则为投注）转换为其实际含义，同样，将订单状态也从内部表示转化为其实际含义
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
        TextBox1.Text = "";
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
    }  


    /*==================================
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "")
            Response.Write("<script>alert('发货成功！');</script>");
        else
        {
            if (DDLTiaoJian.Text == "按商品查询")
            {
                string sqlstr = "select uuser.userID,userName,trueName,university_Province,college_City,orders.statement,substring(roomID) as roomID from orders,uuser where orders.userID=UUser.userID and substring(roomID)='" + TextBox1.Text + "'  order by userID";
                DataTable dt = DBConn.ExecuteAdapter(sqlstr);
                GridView1.DataSource = dt;
                GridView1.DataBind();
                GridView1.Visible = true;
                GVUser.Visible = false;
            }
            else
            {
                string sqlstr = "select orderID,product.productID,proName,prosize,price,color,uuser.userID,trueName,address,zipcode,cellphone,phone from Product,orders,uuser,room where room.roomID=orders.roomID and orders.userID=UUser.userID and product.productID=room.productID and orders.statement=0 order by orderID";
                DataTable dt = DBConn.ExecuteAdapter(sqlstr);
                GVUser.DataSource = dt;
                GVUser.DataBind();
                GridView1.Visible = false;
                GVUser.Visible = true;
            }
        }
    }*/
}