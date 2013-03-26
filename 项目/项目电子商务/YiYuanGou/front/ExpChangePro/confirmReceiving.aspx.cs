using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OracleClient;
using System.Data;

public partial class front_ExpChangePro_confirmReceiving : System.Web.UI.Page
{

    string username = "szq";  //用户名
    string userID = "1";     //用户ID
    string erroMessage = "";

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["UserName"] == null || Session["UserID"] == null)
        {
            Response.Redirect("../login.aspx");
        }
        username = Session["UserName"].ToString();
        userID = Session["UserID"].ToString();
  

        if (!IsPostBack)
        {
            if (Request.UrlReferrer != null)
            {
                ViewState["UrlReferrer"] = Request.UrlReferrer.ToString();
            }
        }

        string ordertid = HttpContext.Current.Request.QueryString["OrderID"];
        string sqlstr = "update orders set statement=3 where (statement=1 or statement=2) and orderid=" + ordertid;
        int flag = DBConn.ExecuteUpdate(sqlstr);

        if (flag == 1)
        {
            //成功了
            erroMessage = "确认收货成功！";
        }
        else
        {
            erroMessage = "无法确认收货！";
        }



        //从哪来回哪去
        Session["confirmresult"] = erroMessage;
        if (ViewState["UrlReferrer"] != null)
            Response.Redirect(ViewState["UrlReferrer"].ToString());


    }
}