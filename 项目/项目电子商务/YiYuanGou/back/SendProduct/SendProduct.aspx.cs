using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class back_SendProduct_Default : System.Web.UI.Page
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
                Response.Write("<script>alert('您没有权限发货'); window.location.href='../back_index.aspx';</script>");
            }
            else
            {
                if (!IsPostBack)
                {
                    sqlSource();
                }
            }
        }
    }
    protected void sqlSource()
    {
        string sqlstr = "select orders.orderID,product.productID,proName,prosize,price,color,uuser.userID,trueName,address,zipcode,cellphone,phone,roomID from Product,orders,uuser,cart where cart.orderID=orders.orderID and orders.userID=UUser.userID and product.productID=cart.productID and orders.statement=0 order by orders.orderID";
        DataTable dt = DBConn.ExecuteAdapter(sqlstr);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        string sql = "where orders.orderID in(";
        string sql1=sql;
        int flag=0;
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
           // sendTime = DateTime.Now;
            sql = "update orders set statement=1,SendTime=sysDate " + sql+")";
            DBConn.ExecuteUpdate(sql);
            Response.Write("<script>alert('发货成功！');</script>");
            sqlSource();
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e) 
    { 
        GridView1.PageIndex = e.NewPageIndex;
        sqlSource(); 
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < this.GridView1.Rows.Count; i++)
        {
            string buyWay = this.GridView1.Rows[i].Cells[13].Text;
            if(buyWay=="0")
                buyWay="经验值换购";
            else
                buyWay="房间投币";
            System.DateTime sendTime = new System.DateTime();
            sendTime = DateTime.Now;
            string ctext = "尊敬的客户，您在一元购网站" + buyWay + "所得的商品：" + this.GridView1.Rows[i].Cells[3].Text + "  " + this.GridView1.Rows[i].Cells[4].Text + "  " + this.GridView1.Rows[i].Cells[5].Text+"  "+"已于"+sendTime.ToString()+"发送，请注意查收！";
            //string uid = this.GridView1.Rows[i].Cells[1].Text;
            CheckBox cb = this.GridView1.Rows[i].FindControl("CheckBox1") as CheckBox;
            if (cb.Checked)
            {
                string sql = "insert into innermail(mtitle,sender,receiver,content,isopen,sendtime) values ('一元购网站商品已发货，请注意查收!',1," + this.GridView1.Rows[i].Cells[7].Text +",'"+ ctext+"',0,sysDate) ";

                try
                {
                    DBConn.ExecuteUpdate(sql);
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('"+ex.Message+";邮件发送失败！请重新发送');</script>");
                }              
               
            }
        }
        Response.Write("<script>alert('邮件发送成功！');</script>");
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
            // sendTime = DateTime.Now;
            sql = "update orders set statement=3,sendTime=sysDate,acceptTime=sysDate " + sql + ")";
            DBConn.ExecuteUpdate(sql);
            Response.Write("<script>alert('发货成功！');</script>");
            sqlSource();
        }

    }
}