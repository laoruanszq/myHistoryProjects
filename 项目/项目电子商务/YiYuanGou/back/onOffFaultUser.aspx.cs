using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;

public partial class back_onOffFaultUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("adminLogin.aspx");
        }
        if (Session["UMode"] != null && !Session["UMode"].ToString().Equals("0"))
        {
            //Response.Write("<script>alert('您没有权限进行管理员维护');</script>");
            Response.Write("<script>alert('您没有权限关闭虚拟用户功能'); window.location.href='../back_index.aspx';</script>");
        }
        else
        {
            if (!IsPostBack)
            {
                /* string sqlstr = "select distinct university_Province from UUser ";
               DataTable dt1 = DBConn.ExecuteAdapter(sqlstr);
                DropDownList1.DataSource=dt1;
                DropDownList1.DataBind();*/

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
        string sqlstr = "select roomID,product.productID,proName,proSize,price,color,roomType from Product,room,product_cata where product.productID=room.productID and product.pcid=product_cata.pcid and room.statement='1' ";
        string orderstr = " order by room.productID,roomID";
        if (TextBox1.Text != "")
            sqlstr = sqlstr + " and proName like '%" + TextBox1.Text + "%'";
        if (DropDownList1.Text != "不限")
            sqlstr = sqlstr + " and grandfather='" + DropDownList1.Text + "'";
        if (DropDownList2.Text != "不限")
            sqlstr = sqlstr + " and father='" + DropDownList2.Text + "'";
        if (DropDownList3.Text != "不限")
            sqlstr = sqlstr + " and pcname='" + DropDownList3.Text + "'";
        sqlstr = sqlstr + orderstr;
        DataTable dt = DBConn.ExecuteAdapter(sqlstr);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        string sql = "where roomID in(";
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
            sql = "update room set statement=0 " + sql + ")";
            DBConn.ExecuteUpdate(sql);
            Response.Write("<script>alert('设置成功！');</script>");
            sqlSource();
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        sqlSource();
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
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

        /* string sqlstr = "select distinct college_City from UUser where university_Province='"+DropDownList1.Text+"'";
         DataTable dt = DBConn.ExecuteAdapter(sqlstr);
         DropDownList2.DataSource=dt;
         DropDownList2.DataBind();*/
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
}