using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class front_ExpChangePro_updateShoppingCar : System.Web.UI.Page
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

        string productid = HttpContext.Current.Request.QueryString["ProductID"];
        string mode = HttpContext.Current.Request.QueryString["mode"];
        string sqlstr = null;
        if (mode.Equals("sub"))
        {
            sqlstr = "update cart set amount=amount-1 where userID=" + userID + " and productID=" + productid + " and orderID=0";
        }
        else if (mode.Equals("add"))
        {
            sqlstr = "update cart set amount=amount+1 where userID=" + userID + " and productID=" + productid + " and orderID=0";
        }

        int flag = DBConn.ExecuteUpdate(sqlstr);
        if (flag == 1)
        {
            if (ViewState["UrlReferrer"] != null)
                Response.Redirect(ViewState["UrlReferrer"].ToString());
        }
        else
        {
            Response.Write("<script typr='text/javascript'>alert('删除失败！');window.location = 'ShowShoppingCar.aspx';</script>");
        }
    }
}