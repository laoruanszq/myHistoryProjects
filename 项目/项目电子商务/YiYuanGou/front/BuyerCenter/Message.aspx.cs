using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class front_BuyerCenter_Message : System.Web.UI.Page
{
    //string username = Session["UserName"].ToString();
    //string username = "szq";
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
                SqlCon();

    }

    protected void SqlCon()
    {
        string sqlstr = "select * from InnerMail,UUser where InnerMail.sender=UUser.userID and Receiver=" + userID + " order by sendtime";
        DataTable dt = DBConn.ExecuteAdapter(sqlstr);

        int i = 0;
        for (i = 0; i < dt.Rows.Count; i++)
        {
            //dt.Rows[i]["UType"] = "fsf";
            switch (dt.Rows[i]["isopen"].ToString().Trim())
            {
                 
                case "0": dt.Rows[i]["isopen"] = "未读";
                    break;
                case "1": dt.Rows[i]["isopen"] = "已读";
                    break;

            }
        }

        ListView1.DataSource = dt;
        Page.DataBind();
    }

 
}