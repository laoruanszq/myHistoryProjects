using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OracleClient;

public partial class front_BuyerCenter_MailDetail : System.Web.UI.Page
{
    String MailID;
    protected void Page_Load(object sender, EventArgs e)
    {
        MailID = Request.Params["Email"].ToString();
        string sqlstr = "select * from InnerMail,UUser where InnerMail.sender=UUser.UserID and  MailID=" + MailID ;
        
        string sqlstrUP = "update InnerMail set IsOpen='1' where MailID=" + MailID ;
        int flag = DBConn.ExecuteUpdate(sqlstrUP);
        if (flag != 0)
        {
            OracleDataReader dr = DBConn.ExecuteReader(sqlstr);
            if (dr != null && dr.HasRows)
            {
                dr.Read();
                //显示站内信
                title.Text = dr["MTitle"].ToString();
                whosender.Text = dr["username"].ToString();
                time.Text = dr["SendTime"].ToString();
                MailContent.Text = dr["Content"].ToString();
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //删除
        string sqlstrDE = "delete from InnerMail  where MailID='" + MailID + "'";
        int flag = DBConn.ExecuteUpdate(sqlstrDE);
        if (flag != 0)
        {
            Response.Redirect("Message.aspx");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //返回
        Response.Redirect("Message.aspx");
    }
}