using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OracleClient;
using System.Data;

public partial class front_room_sitdown : System.Web.UI.Page
{

    string roomID = "21";   //房间号
    string username = "szq";  //用户名
    string userID = "1";     //用户ID
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

        string sqlstr = "select * from sitdown where userid=" + userID + "  and  roomid=" + roomID;
        DataTable dt = DBConn.ExecuteAdapter(sqlstr);
        if (dt.Rows.Count == 0)
        {
            sit_Click();
        }
        //从哪来回哪去
        Session["sitresult"] = erroMessage;
        if (ViewState["UrlReferrer"] != null)
            Response.Redirect(ViewState["UrlReferrer"].ToString());
    }


    //占座
    protected void sit_Click()
    {

        OracleConnection conn = new OracleConnection("Data Source=YiYuanGou;User ID=SZQ;Password=123");
        OracleCommand cmd = new OracleCommand("usersitdown", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        //根据存储过程的参数个数及类型生成参数对象  
        OracleParameter p1 = new OracleParameter("uuid", OracleType.Number);//uuid——userID  
        OracleParameter p2 = new OracleParameter("rrid", OracleType.Number);//rrid——roomID 
        OracleParameter p3 = new OracleParameter("returnresult", OracleType.Number);//returnval,返回值  （output）

        //设置参数的输入输出类型,默认为输入  
        p1.Direction = ParameterDirection.Input;
        p2.Direction = ParameterDirection.Input;
        p3.Direction = ParameterDirection.Output;

        //对输入参数定义初值,输出参数不必赋值.  
        p1.Value = Convert.ToInt32(userID);
        p2.Value = Convert.ToInt32(roomID);

        //按照存储过程参数顺序把参数依次加入到OracleCommand对象参数集合中  
        cmd.Parameters.Add(p1);
        cmd.Parameters.Add(p2);
        cmd.Parameters.Add(p3);

        string resultval = "";

        try
        {
            conn.Open();
            cmd.ExecuteNonQuery();
            resultval = cmd.Parameters[2].Value.ToString();
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

        //result:0 房间关闭  1没钱   2人满   3操作失败  4一般成功  5最后一个用户成功
        if (resultval == "0")
        {
            //Response.Write("<script>alert('房间暂时关闭，请稍后尝试。');</script>");
            erroMessage = "房间暂时关闭，请稍后尝试";
        }
        if (resultval == "1")
        {
            //Response.Write("<script>alert('您的账户余额不足，请充值后在尝试');</script>");
            erroMessage = "您的账户余额不足，请充值后在尝试";
        }
        if (resultval == "2")
        {
            //Response.Write("<script>alert('占座人数已满，请稍候下一轮。');</script>");
            erroMessage = "占座人数已满，请稍候下一轮";
        }
        if (resultval == "3")
        {
            //Response.Write("<script>alert('出现未知错误，重新尝试！');</script>");
            erroMessage = "出现未知错误，重新尝试！";
        }
        if (resultval == "4")
        {
            //一般成功
            //sit.Enabled = false;
            //stand.Enabled = true;
            //Response.Write("<script>alert('占座成功！');</script>");
            erroMessage = "占座成功！";

        }
        if (resultval == "5")
        {
            //最后一个成功，随机用户。
            int limit = 0;
            string sqlstr1 = "select limiteduser from room where roomid=" + roomID;
            string sqlstr2 = "select * from sitdown where roomid=" + roomID;

            DataTable dt1 = DBConn.ExecuteAdapter(sqlstr1);
            DataTable dt2 = DBConn.ExecuteAdapter(sqlstr2);

            if (dt1.Rows.Count!=0)
            {
                limit = Int32.Parse(dt1.Rows[0]["limiteduser"].ToString().Trim());
            }
            else 
            {
                erroMessage = "未知错误！请稍候重试！";
                return;
            }

            int randflag = 1;
            Random rand = new Random();
            int finaluser = 0;
            string finaluserID = "0";
            while (randflag == 1)
            {
                finaluser = rand.Next(limit);
                finaluserID = dt2.Rows[finaluser]["userID"].ToString();
                if (Int32.Parse(finaluserID) > 2000)
                {
                    randflag = 0;
                }
            }


            //生成订单
            OracleCommand cmd1 = new OracleCommand("beginOrder1P", conn);
            cmd1.CommandType = CommandType.StoredProcedure;
            //根据存储过程的参数个数及类型生成参数对象  
            OracleParameter p4 = new OracleParameter("uuid", OracleType.Number);//uuid——userID  
            OracleParameter p5 = new OracleParameter("rid", OracleType.Number);//rid——roomID  
            OracleParameter p6 = new OracleParameter("returnval", OracleType.Number);//returnval,返回值  （output）

            //设置参数的输入输出类型,默认为输入  
            p4.Direction = ParameterDirection.Input;
            p5.Direction = ParameterDirection.Input;
            p6.Direction = ParameterDirection.Output;

            //对输入参数定义初值,输出参数不必赋值.  
            p4.Value = Convert.ToInt32(userID);
            p5.Value = Convert.ToInt32(roomID);

            //按照存储过程参数顺序把参数依次加入到OracleCommand对象参数集合中  
            cmd1.Parameters.Add(p4);
            cmd1.Parameters.Add(p5);
            cmd1.Parameters.Add(p6);
            string result = "";
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                result = cmd.Parameters[2].Value.ToString();
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
            if (result.Equals("1"))
            {
                Response.Write("<script>alert('生成订单成功！');</script>");
                //erroMessage += "生成订单成功！";
            }
            else
            {
                //生成订单失败
                Response.Write("<script>alert('生成订单失败！');</script>");
                //erroMessage += "生成订单失败！";
            }

        }


        //最后一个的话  插入占座表，扣钱，关闭房间，执行随机过程。算出竞标的胜者
    }


}