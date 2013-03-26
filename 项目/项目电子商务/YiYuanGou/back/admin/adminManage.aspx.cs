using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_adminadd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("../adminLogin.aspx");//如果没有登录，就自动转到登录界面
        }
        else
        {
            if (Session["UMode"] != null && !Session["UMode"].ToString().Equals("0"))
            {
                //Response.Write("<script>alert('您没有权限进行管理员维护');</script>");
                Response.Write("<script>alert('您没有权限进行管理员维护'); window.location.href='../back_index.aspx';</script>");
            }
            else
            {
                if (!IsPostBack)
                    SqlCon();  //获取所有已有非超级用户的管理员用户
            }
        }
    }

    protected void SqlCon()
    {
        string sqlstr = "select * from Adminuser where UType<>'0'"; //查询所有非超级用户的管理员用户

        DataTable dt = DBConn.ExecuteAdapter(sqlstr);
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            //dt.Rows[i]["UType"] = "fsf";
            //把数据库中用户的类型转换成其实际含义
            switch ( dt.Rows[i]["UType"].ToString() )
            {
                case "0":     dt.Rows[i]["UType"]="超级管理员";
                                break;
                case "1": dt.Rows[i]["UType"] = "商品管理员";
                                break;
                case "2": dt.Rows[i]["UType"] = "物流管理员";
                                break;
                case "3": dt.Rows[i]["UType"] = "财务管理员";
                                break;
                case "4": dt.Rows[i]["UType"] = "用户管理员";
                                break;
                case "5": dt.Rows[i]["UType"] = "客服管理员";
                                break;
                case "6": dt.Rows[i]["UType"] = "论坛管理员";
                                break;
            }
        }
        GridView1.DataSource = dt;//为页面的表格绑定数据源
        GridView1.DataBind();
    }

    //添加管理员
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sqlstr = "insert into Adminuser values('" + TextBox2.Text + "','" + TextBox3.Text + "','" + DropDownList1.SelectedValue + "')";
        if (TextBox2.Text!=""&&TextBox3.Text!=""&&TextBox3.Text.Equals(TextBox4.Text))
        {
            int changeRow = DBConn.ExecuteUpdate(sqlstr);
            if (changeRow == 0)
            {
                Response.Write("<script>alert('您要增加的管理员已存在！请重新编辑！');</script>");
            }
            else
            {
                Response.Write("<script>alert('提交成功！');</script>");
                SqlCon();
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
                DropDownList1.SelectedIndex = 0;
            }
        }
        else
        {
            Response.Write("<script>alert('输入不合法');</script>");
        }
    }
    //重置
    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
        DropDownList1.SelectedIndex = 0;
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //////删除要做判断
        //int BookNum = int.Parse(GridView1.Rows[e.RowIndex].Cells[0].Text);
        string sqlStr = "delete AdminUser  where UName='" + GridView1.Rows[e.RowIndex].Cells[0].Text+"'";

        int flag = DBConn.ExecuteUpdate(sqlStr);
        if (flag==1)
        {
            Response.Write("<script>alert('删除成功！');</script>");
        }
        else
        { Response.Write("<script>alert('该管理员无法删除！');</script>"); }
        GridView1.EditIndex = -1;
        SqlCon();
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e) 
    { 
        //下面的代码用于点击“删除”时，显示输出删除确认界面
        if (e.Row.RowType == DataControlRowType.DataRow) 
        {
            if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate) 
            { 
                ((LinkButton)e.Row.Cells[2].Controls[0]).Attributes.Add("onclick","javascript:return confirm('你确认要删除：\"" + e.Row.Cells[0].Text + "\"吗?')"); 
                
            }
        }
    } 
}