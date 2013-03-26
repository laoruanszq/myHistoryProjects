using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class back_sendConfirm_sendConfirm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("../adminLogin.aspx");
        }
        else
        {
            if (Session["UMode"] != null && !Session["UMode"].ToString().Equals("0") && !Session["UMode"].ToString().Equals("2"))
            {
                //Response.Write("<script>alert('您没有权限进行管理员维护');</script>");
                Response.Write("<script>alert('您没有权限确认收货'); window.location.href='../back_index.aspx';</script>");
            }
            else
            {
                if (!IsPostBack)
                {
                    //初始化页面
                    sqlSource();
                }
            }
        }
    }
    protected void sqlSource()
    {
        //构建查询语句
        string sqlstr = "select orders.orderID,product.productID,proName,prosize,price,color,uuser.userID,trueName,address,zipcode,cellphone,phone,roomID from Product,orders,uuser,cart where cart.orderID=orders.orderID and orders.userID=UUser.userID and product.productID=cart.productID and orders.statement=1";
        if (TextBox1.Text != "")
            sqlstr = sqlstr + " and orders.orderID=" + TextBox1.Text;
        if (TextBox2.Text != "")
            sqlstr = sqlstr + " and trueName like '%" + TextBox2.Text + "%'";
        if (TextBox3.Text != "")
            sqlstr = sqlstr + " and proName like '%" + TextBox3.Text + "%'";
        sqlstr = sqlstr + " order by orders.orderID";
        DataTable dt = DBConn.ExecuteAdapter(sqlstr);
        GridView1.DataSource = dt;//绑定数据源
        GridView1.DataBind();
    }


       protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        sqlSource();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //构造查询条件
        string sql = "where orders.orderID in(";
        string sql1 = sql;
        int flag = 0;
        for (int i = 0; i < this.GridView1.Rows.Count; i++)
        {
            string rid = this.GridView1.Rows[i].Cells[1].Text;
            CheckBox cb = this.GridView1.Rows[i].FindControl("CheckBox1") as CheckBox;
            if (cb.Checked)
            {
                if (flag == 0)
                {
                    sql = sql + rid;
                    flag = 1;
                }
                else
                    sql = sql + "," + rid;
            }
        }
        if (sql != sql1)
        {
            //System.DateTime sendTime = new System.DateTime();
            // 将订单状态修改为2，并记录用户收到货物的时间
            sql = "update orders set statement=2,acceptTime=sysDate " + sql + ")";
            DBConn.ExecuteUpdate(sql);
            Response.Write("<script>alert('物流确认成功！');</script>");
            sqlSource();
        }
    }

    protected void cbSelect_CheckedChanged(object sender, EventArgs e)
    {
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            ((CheckBox)this.GridView1.Rows[i].Cells[0].FindControl("CheckBox1")).Checked = ((CheckBox)sender).Checked;
        }
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
        TextBox3.Text = "";
        TextBox2.Text = "";
        TextBox1.Text = "";
    }
}