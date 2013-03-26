using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;

public partial class front_room_room : System.Web.UI.Page
{
    string roomID = "21";   //房间号
    string username = "szq";  //用户名
    string userID = "1";     //用户ID

    int limit = 0;          //上限人数
    int falseuser = 0;      //水军人数
    string state = "0";     //用户状态   1为占座    其他为旁观
    int sittotal = 0;       //占座人数
    int limitedtime = 30;  //设置占座多长时间后可以让座 单位分钟

    DataTable dt2;          //占座用户表

    protected void Page_Load(object sender, EventArgs e)
    {

        roomID = HttpContext.Current.Request.QueryString["roomID"];
        if (Session["UserName"] == null || Session["UserID"] == null)
        {
            Response.Redirect("../login.aspx");
        }
        username = Session["UserName"].ToString();
        userID = Session["UserID"].ToString();
        name.Text = username;
        Label2.Text = username;

        string sqlstr = "insert into enterroom(userid,roomno) values(" + userID + "," + roomID + ")";
        int flag = DBConn.ExecuteUpdate(sqlstr);

        bindingMessageANDShoppingCar();

        bindsoures();
    }

    //调用刷新函数
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        bindsoures();
    }

    //占座
    protected void sit_Click(object sender, EventArgs e)
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
            erroMessage.Text = ee.Message;
        }
        finally
        {
            conn.Close(); //关闭连接
        }

        //result:0 房间关闭  1没钱   2人满   3操作失败  4一般成功  5最后一个用户成功
        if (resultval == "0")
        {
            //Response.Write("<script>alert('房间暂时关闭，请稍后尝试。');</script>");
            erroMessage.Text = "房间暂时关闭，请稍后尝试";
        }
        if (resultval == "1")
        {
            //Response.Write("<script>alert('您的账户余额不足，请充值后在尝试');</script>");
            erroMessage.Text = "您的账户余额不足，请充值后在尝试";
        }
        if (resultval == "2")
        {
            //Response.Write("<script>alert('占座人数已满，请稍候下一轮。');</script>");
            erroMessage.Text = "占座人数已满，请稍候下一轮";
        }
        if (resultval == "3")
        {
            //Response.Write("<script>alert('出现未知错误，重新尝试！');</script>");
            erroMessage.Text = "出现未知错误，重新尝试！";
        }
        if (resultval == "4")
        {
            //一般成功
            sit.Enabled = false;
            stand.Enabled = true;
            //Response.Write("<script>alert('占座成功！');</script>");
            erroMessage.Text = "占座成功！";

        }
        if (resultval == "5")
        {
            bindsoures();
            //最后一个成功，随机用户。
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
                erroMessage.Text = ee.Message;
            }
            finally
            {
                conn.Close(); //关闭连接
            }
            if (result.Equals("1"))
            {
                //Response.Write("<script>alert('生成订单成功！');</script>");
                erroMessage.Text += "生成订单成功！";
            }
            else
            {
                //生成订单失败
                //Response.Write("<script>alert('生成订单失败！');</script>");
                erroMessage.Text += "生成订单失败！";
            }

        }


        //最后一个的话  插入占座表，扣钱，关闭房间，执行随机过程。算出竞标的胜者
    }

    //让座
    protected void stand_Click(object sender, EventArgs e)
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
            erroMessage.Text = ee.Message;
        }
        finally
        {
            conn.Close(); //关闭连接
        }
        //result: 0房间关闭  1没有占座   2占座时间没到   3操作失败   4成功
        if (resultval == "0")
        {
            //Response.Write("<script>alert('房间暂时关闭，请稍后尝试。');</script>");
            erroMessage.Text = "房间暂时关闭，请稍后尝试";
        }
        if (resultval == "1")
        {
            //Response.Write("<script>alert('您没有占座');</script>");
            erroMessage.Text = "您没有占座";
        }
        if (resultval == "2")
        {
            //Response.Write("<script>alert('您占座的时间太短了，请耐心等待');</script>");
            erroMessage.Text = "您占座的时间太短了，请耐心等待";
        }
        if (resultval == "3")
        {
            //Response.Write("<script>alert('出现未知错误，重新尝试！');</script>");
            erroMessage.Text = "出现未知错误，重新尝试！";
        }
        if (resultval == "4")
        {
            //成功
            sit.Enabled = true;
            stand.Enabled = false;
            //Response.Write("<script>alert('让座成功！');</script>");
            erroMessage.Text = "让座成功！";

        }


    }

    //刷新占座率
    protected void refresh_Click(object sender, EventArgs e)
    {

    }

    //发送聊天消息
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (chatcontent.Text.ToString().Trim() != "" && chatcontent.Text != null)
        {
            string sqlstr = "insert into DissRoom values(\"S_DissRoom\".nextval," + userID + ",to_date('" + DateTime.Now + "','YYYY/MM/DD HH24:MI:SS'),'" + chatcontent.Text + "'," + roomID + ")";
            int flag = DBConn.ExecuteUpdate(sqlstr);
            chatcontent.Text = "";
            bindsoures();
        }
    }


    //绑定所有数据
    private void bindsoures()
    {
        //房间商品信息
        string sqlstr1 = "select * from room,product where room.ProductID=product.ProductID and roomID=" + roomID;
        OracleDataReader dr = DBConn.ExecuteReader(sqlstr1);
        if (dr != null && dr.HasRows)
        {
            dr.Read();
            roomid.Text = roomID;
            productdetail1.NavigateUrl = "../ProductDetails.aspx?productID=" + dr["ProductID"].ToString().Trim();
            productdetail2.NavigateUrl = "../ProductDetails.aspx?productID=" + dr["ProductID"].ToString().Trim();
            productimage.ImageUrl = "../../images/product/" + dr["Picture1"].ToString().Trim();
            proName.Text = dr["ProName"].ToString().Trim();
            ProTitle.Text = dr["ProTitle"].ToString().Trim();
            Price.Text = "￥" + dr["Price"].ToString().Trim();
            fee.Text = "￥" + dr["RoomType"].ToString().Trim();
            if (dr["RoomType"].ToString().Trim().Equals("0"))
            {
                fee.Text = "￥10";
            }
            if (dr["RoomType"].ToString().Trim().Equals("3"))
            {
                fee.Text = "￥" + Int32.Parse( dr["Price"].ToString() )/10;
            }
            if (dr["RoomType"].ToString().Trim().Equals("4"))
            {
                fee.Text = "￥0.5";
            }




            limit = Int32.Parse(dr["limiteduser"].ToString().Trim());
            falseuser = Int32.Parse(dr["falseuser"].ToString().Trim());

            name.Text = username;
            Label2.Text = username + ":";
        }


        //占座人数s
        string sqlstr2 = "select rownum,userName from sitdown,uuser where sitdown.userID=uuser.userID and roomID=" + roomID;
        dt2 = DBConn.ExecuteAdapter(sqlstr2);

        //sittotal = Int32.Parse( dt2.Rows[dt2.Rows.Count-1]["rownum"].ToString() );
        sittotal = dt2.Rows.Count;
        sitrate.Text = ((int)(((sittotal * 1.0) / limit) * 10000.0) / 100.0).ToString() + "%";
        sitdownrat.Text = sittotal + "/" + limit;
        Seatman.DataSource = dt2;
        Seatman.DataBind();


        //查询该用户是否占座
        for (int i = 0; i < dt2.Rows.Count; i++)
        {
            if (dt2.Rows[i]["userName"].ToString().Equals(username))
            {
                state = "1";
            }
        }

        if (state == "1")
        {
            State.Text = "已占座";
            sit.Enabled = false;
            stand.Enabled = true;
        }
        else
        {
            State.Text = "旁观中";
            sit.Enabled = true;
            stand.Enabled = false;
        }


        //旁观
        string sqlstr3 = "select rownum,userName from enterRoom,Uuser where enterroom.userID=uuser.userID and roomno=" + roomID;
        DataTable dt3 = DBConn.ExecuteAdapter(sqlstr3);
        EnterMan.DataSource = dt3;
        EnterMan.DataBind();

        //聊天室
        string sqlstr4 = "select * from (select Username, Content, DissTime from DissRoom,UUser where DissRoom.UserID=UUser.UserID and Diss_Room=" + roomID + " order by DissTime asc) where rownum<=100 order by rownum";
        DataTable dt4 = DBConn.ExecuteAdapter(sqlstr4);

        chat.DataSource = dt4;
        chat.DataBind();

        ScriptManager.RegisterStartupScript(this, this.GetType(), "myscript", "document.getElementById(\"showchat\").scrollTop = document.getElementById(\"showchat\").scrollHeight;", true);


        //公告
        string sqlstr5 = "select * from(select * from gonggao  order by gonggaoTime desc)where rownum<=100 order by rownum";
        DataTable dt5 = DBConn.ExecuteAdapter(sqlstr5);
        inform.DataSource = dt5;
        inform.DataBind();

    }


    //绑定站内信和购物车以及搜索功能
    void bindingMessageANDShoppingCar()
    {
        //站内信
        string sqlstr = "select isopen,count(*) from InnerMail,Uuser where Uuser.userID=InnerMail.receiver and username='" + username + "' group by isopen";
        OracleDataReader dr = DBConn.ExecuteReader(sqlstr);
        int hasread = 0, noread = 0;
        if (dr != null && dr.HasRows)
        {
            while (dr.Read())
            {
                if (dr["isopen"].ToString() == "1")
                    hasread += dr.GetInt32(1);
                else
                {
                    noread = dr.GetInt32(1);
                    hasread += noread;
                }
            }
            read.Text = hasread.ToString();
            noreading.Text = noread.ToString();
        }

        //绑定购物车
        string sqlstr1 = "select * from Cart where  OrderID=0 and  UserID=" + userID;
        DataTable dt1 = DBConn.ExecuteAdapter(sqlstr1);
        string shoppingcar = "0";
        if (dt1 != null && dt1.Rows.Count != 0)
        {
            shoppingcar = dt1.Rows.Count.ToString();
        }
        shoppingcarNum.Text = shoppingcar;
    }
    protected void doSearch_Click(object sender, EventArgs e)
    {
        if (searchKeyWord.Text.ToString() != "" && searchKeyWord.Text.ToString() != null)
        {
            Response.Redirect("../ProductList.aspx?clear=clear&keyword=" + searchKeyWord.Text.ToString());
        }
    }
    //上面是绑定站内信和购物车以及搜索功能




    protected void leave_Click(object sender, EventArgs e)
    {
        //从旁观表删除，跳到index
        string sqlstr = "delete from enterroom where userid=" + userID + "  and roomno=" + roomID;
        int flag = DBConn.ExecuteUpdate(sqlstr);
        Response.Redirect("../index.aspx");
    }
}