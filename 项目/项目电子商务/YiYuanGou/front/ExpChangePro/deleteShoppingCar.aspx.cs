using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class front_ExpChangePro_deleteShoppingCar : System.Web.UI.Page
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
        string sqlstr = "delete from cart where userID=" + userID + " and productID=" + productid + " and orderID=0";
        int flag = DBConn.ExecuteUpdate(sqlstr);
        if (flag == 1)
        {
            erroMessage = "从购物车中删除成功！";
        }
        else
        {
            erroMessage = "从购物车中删除失败！";
        }

        //从哪来回哪去
        Session["deleteShopping"] = erroMessage;
        if (ViewState["UrlReferrer"] != null)
            Response.Redirect(ViewState["UrlReferrer"].ToString());
    }

}