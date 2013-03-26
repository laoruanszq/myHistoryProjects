using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class front_BuyerCenter_deleteMail : System.Web.UI.Page
{

         //string userID = Session["UserID"].ToString();
    string userID = "1";
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["UserName"] == null || Session["UserID"] == null)
        {
            Response.Redirect("../login.aspx");
        }
        //username = Session["UserName"].ToString();
        userID = Session["UserID"].ToString();


        if (!IsPostBack)
        {
            if (Request.UrlReferrer != null)
            {
                ViewState["UrlReferrer"] = Request.UrlReferrer.ToString();
            }
        }

        string Mailid = HttpContext.Current.Request.QueryString["Email"];
        string sqlstr = "delete from innerMail where MailID=" + Mailid ;
        int flag = DBConn.ExecuteUpdate(sqlstr);
        if (flag == 1)
        {
             if(ViewState["UrlReferrer"]!=null)
                    Response.Redirect(ViewState["UrlReferrer"].ToString());
        }
        else
        {
            Response.Write("<script typr='text/javascript'>alert('删除失败！');window.location = '../index.aspx';</script>");
        }
    }
}