using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;

public partial class back_WebManage_Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("../adminLogin.aspx");
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
    protected void Button3_Click(object sender, EventArgs e)
    {
        //string[] temp = new string[200];
        int flag=0; 
        for (int i = 0; i < this.GridView1.Rows.Count; i++)
        {
            string rid = this.GridView1.Rows[i].Cells[1].Text;
            CheckBox cb = this.GridView1.Rows[i].FindControl("CheckBox1") as CheckBox;
            if (cb.Checked)
            {
                if (flag == 0)
                {
                    Session["accepter"] = rid;
                    flag = 1;
                }
                else
                    Session["accepter"] = Session["accepter"] + ";" + rid;                
            }
        }
        Response.Write("<script>alert('添加成功！');</script>");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox2.Text = "";
        TextBox1.Text = "";
        DropDownList1.Items.Clear();
        //this.DropDownList1.Items.Add("不限");
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
        DropDownList2.Items.Clear();
        this.DropDownList2.Items.Add("不限");
    }
    protected void sqlSource()
    {
        string sqlstr = "select * from UUser ";
        string wherestr = "";
        if (TextBox1.Text != "")
        {
            wherestr = wherestr + "where userName like '%" + TextBox1.Text + "%'";
            if (TextBox2.Text != "")
                wherestr = wherestr + " and trueName like '%" + TextBox2.Text + "%'";
            if (DropDownList1.Text != "不限")
                wherestr = wherestr + " and university_Province='" + DropDownList1.Text + "'";
            if (DropDownList2.Text != "不限")
                wherestr = wherestr + " and college_City='" + DropDownList2.Text + "'";
        }
        else
        {
            if (TextBox2.Text != "")
            {
                wherestr = wherestr + "where trueName like '%" + TextBox2.Text + "%'";
                if (DropDownList1.Text != "不限")
                    wherestr = wherestr + " and university_Province='" + DropDownList1.Text + "'";
                if (DropDownList2.Text != "不限")
                    wherestr = wherestr + " and college_City='" + DropDownList2.Text + "'";
            }
            else
            {
                if (DropDownList1.Text != "不限")
                {
                    wherestr = wherestr + "where university_Province='" + DropDownList1.Text + "'";
                    if (DropDownList2.Text != "不限")
                        wherestr = wherestr + " and college_City='" + DropDownList2.Text + "'";
                }
                else
                {
                    if (DropDownList2.Text != "不限")
                        wherestr = wherestr + "where college_City='" + DropDownList2.Text + "'";
                }
            }

        }
        sqlstr = sqlstr + wherestr;
        DataTable dt = DBConn.ExecuteAdapter(sqlstr);
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