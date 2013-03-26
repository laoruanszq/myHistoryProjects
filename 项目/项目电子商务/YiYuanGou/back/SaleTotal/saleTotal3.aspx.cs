using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;

public partial class back_SaleTotal_saleTotal3 : System.Web.UI.Page
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
        //TextBox2.Text = "";
        //TextBox1.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
        DropDownList4.SelectedIndex = 0;
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
        string sqlstr = sqlstr = "select uuser.userID,userName,trueName,university_Province,college_City,sum(amount) as zongshu from  orders,uuser,cart where cart.orderID=orders.orderID and orders.userID=UUser.userID ";
        string wherestr = "";
        string orderstr = " order by zongshu desc";
        //构建查询条件
        if (TextBox6.Text != "")
            wherestr = wherestr + " and username like '%" + TextBox5.Text + "%'";
        if (TextBox5.Text != "")
            wherestr = wherestr + " and truename like '%" + TextBox5.Text + "%'";
        if (DropDownList1.Text != "不限")
            wherestr = wherestr + " and university_Province='" + DropDownList1.Text + "'";
        if (DropDownList2.Text != "不限")
            wherestr = wherestr + " and college_City='" + DropDownList2.Text + "'";
        if (TextBox4.Text != "" && TextBox3.Text != "")
            wherestr = wherestr + " and orderTime between to_date('" + TextBox4.Text + "','yyyymmdd') and to_date('" + TextBox3.Text + "','yyyymmdd')";
        else
            if ((TextBox4.Text == "" && TextBox3.Text != "") || (TextBox3.Text == "" && TextBox4.Text != ""))
                Response.Write("<script>alert('时间条件要么给全，要么不给！');</script>");
        if (DropDownList4.Text == "占座")
        {
            wherestr=wherestr + " and roomID!=0 ";
        }
        if (DropDownList4.Text == "换购")
        {
            wherestr = wherestr + " and roomID=0 ";
        }
        sqlstr = sqlstr + wherestr + " group by  uuser.userID,userName,trueName,university_Province,college_City " + orderstr;
        DataTable dt = DBConn.ExecuteAdapter(sqlstr);//获取数据源
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