using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OracleClient;
using System.Data;

public partial class front_room_stand : System.Web.UI.Page
{
    string roomID = "21";   //房间号
    string username = "szq";  //用户名
    string userID = "1";     //用户ID
    int limitedtime = 30;  //设置占座多长时间后可以让座 单位分钟

    string erroMessage = "";


    protected void Page_Load(object sender, EventArgs e)
    {


        if (!IsPostBack)
        {
            if (Request.UrlReferrer != null)
            {
                ViewState["UrlReferrer"] = Request.UrlReferrer.ToString();
            }
        }

        roomID = HttpContext.Current.Request.QueryString["roomID"];
        if (Session["UserName"] == null || Session["UserID"] == null)
        {
            Response.Redirect("../login.aspx");
        }
        username = Session["UserName"].ToString();
        userID = Session["UserID"].ToString();


        stand_Click();

        //从哪来回哪去
        Session["standresult"] = erroMessage;
        if (ViewState["UrlReferrer"] != null)
            Response.Redirect(ViewState["UrlReferrer"].ToString());

    }




    //让座
    protected void stand_Click()
    {
        OracleConnection conn = new OracleConnection("Data Source=YiYuanGou;User ID=SZQ;Password=123");
        OracleCommand cmd = new OracleCommand("userstand", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        //根据存储过程的参数个数及类型生成参数对象  
        OracleParameter p1 = new OracleParameter("uuid", OracleType.Number);//uuid——userID  
        OracleParameter p2 = new OracleParameter("rrid", OracleType.Number);//rrid——roomID 
        OracleParameter p3 = new OracleParameter("limittime", OracleType.Number);//limittime——limit time minute 
        OracleParameter p4 = new OracleParameter("returnresult", OracleType.Number);//returnval,返回值  （output）

        //设置参数的输入输出类型,默认为输入  
        p1.Direction = ParameterDirection.Input;
        p2.Direction = ParameterDirection.Input;
        p3.Direction = ParameterDirection.Input;
        p4.Direction = ParameterDirection.Output;

        //对输入参数定义初值,输出参数不必赋值.  
        p1.Value = Convert.ToInt32(userID);
        p2.Value = Convert.ToInt32(roomID);
        p3.Value = Convert.ToInt32(limitedtime);

        //按照存储过程参数顺序把参数依次加入到OracleCommand对象参数集合中  
        cmd.Parameters.Add(p1);
        cmd.Parameters.Add(p2);
        cmd.Parameters.Add(p3);
        cmd.Parameters.Add(p4);

        string resultval = "";

        try
        {
            conn.Open();
            cmd.ExecuteNonQuery();
            resultval = cmd.Parameters[3].Value.ToString();
        }
        catch (Exception ee)
        {
            //Response.Write("<script>alert('" + ee.Message + "');</script>"); //如果有错误，输出错误信息
            erroMessage = ee.Message;
        }
        finally
        {
            conn.Close(); //关闭连接
        }
        //result: 0房间关闭  1没有占座   2占座时间没到   3操作失败   4成功
        if (resultval == "0")
        {
            //Response.Write("<script>alert('房间暂时关闭，请稍后尝试。');</script>");
            erroMessage = "房间暂时关闭，请稍后尝试";
        }
        if (resultval == "1")
        {
            //Response.Write("<script>alert('您没有占座');</script>");
            erroMessage = "您没有占座";
        }
        if (resultval == "2")
        {
            //Response.Write("<script>alert('您占座的时间太短了，请耐心等待');</script>");
            erroMessage = "您占座的时间太短了，请耐心等待";
        }
        if (resultval == "3")
        {
            //Response.Write("<script>alert('出现未知错误，重新尝试！');</script>");
            erroMessage = "出现未知错误，重新尝试！";
        }
        if (resultval == "4")
        {
            //成功
            //sit.Enabled = true;
            //stand.Enabled = false;
            //Response.Write("<script>alert('让座成功！');</script>");
            erroMessage = "让座成功！";

        }


    }

}