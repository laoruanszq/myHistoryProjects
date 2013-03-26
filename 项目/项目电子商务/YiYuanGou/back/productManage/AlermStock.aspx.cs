using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class back_productManage_AlermStock : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("../adminLogin.aspx");
        }
        else
        {
            if (Session["UMode"] != null && !Session["UMode"].ToString().Equals("0") && !Session["UMode"].ToString().Equals("1") && !Session["UMode"].ToString().Equals("2"))
            {
                //Response.Write("<script>alert('您没有权限进行管理员维护');</script>");
                Response.Write("<script>alert('您没有权限查看库存不足商品'); window.location.href='../back_index.aspx';</script>");
            }
            else
            {
                //查询出所有库存警告商品
                string sqlstr = "select * from Product where Left<Alarm";
                DataTable dt = DBConn.ExecuteAdapter(sqlstr);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
    }
}