using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;

public partial class front_room_room_backup : System.Web.UI.Page
{
    string roomID = "21";
    string username = "szq";
    string userID = "1";
    int limit = 0;
    int falseuser = 0;
    string state = "0";

    protected void Page_Load(object sender, EventArgs e)
    {
        //roomID = HttpContext.Current.Request.QueryString["roomID"];
        //string username = Session["UserName"].ToString();
        //string userID = Session["UserID"].ToString();


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

    }

    //让座
    protected void stand_Click(object sender, EventArgs e)
    {

    }

    //刷新占座率
    protected void refresh_Click(object sender, EventArgs e)
    {

    }

    //发送聊天信息
    protected void sendChat_Click(object sender, EventArgs e)
    {
        if (chatcontent.Text != "")
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
            limit = Int32.Parse(dr["limiteduser"].ToString().Trim());
            falseuser = Int32.Parse(dr["falseuser"].ToString().Trim());

            name.Text = username;
            name1.Text = username + ":";
        }


        //占座人数
        string sqlstr2 = "select rownum,userName from sitdown,uuser where sitdown.userID=uuser.userID and roomID=" + roomID;
        DataTable dt2 = DBConn.ExecuteAdapter(sqlstr2);

        int sittotal = Int32.Parse(dt2.Rows[dt2.Rows.Count - 1]["rownum"].ToString());
        sitrate.Text = ((int)(((sittotal + falseuser) / 1.0 / limit) * 10000.0) / 100.0).ToString() + "%";
        sitdownrat.Text = (sittotal + falseuser) + "/" + limit;
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
        string sqlstr4 = "select * from (select Username, Content, DissTime from DissRoom,UUser where DissRoom.UserID=UUser.UserID and Diss_Room=" + roomID + " order by DissTime) where rownum<=100 order by rownum";
        chatform.Text = "";
        DataTable dt4 = DBConn.ExecuteAdapter(sqlstr4);
        for (int i = 0; i < dt4.Rows.Count; i++)
        {
            chatform.Text += dt4.Rows[i]["UserName"].ToString() + ":" + dt4.Rows[i]["Content"].ToString() + "\n";

        }
        ScriptManager.RegisterStartupScript(this, this.GetType(), "myscript", "document.getElementById(\"chatform\").scrollTop = document.getElementById(\"chatform\").scrollHeight;", true);


        //公告
        string sqlstr5 = "select OrderID,UserName,RoomType,ProName,OrderTime from(select OrderID,UserName,RoomType,ProName,OrderTime from Orders,UUser,Room,Product where Orders.UserID=UUser.UserID and Orders.RoomID=Room.RoomID and Room.ProductID=Product.ProductID and Orders.RoomID<>0 order by OrderTime desc)where rownum<=100 order by rownum";
        DataTable dt5 = DBConn.ExecuteAdapter(sqlstr5);
        inform.DataSource = dt5;
        inform.DataBind();

    }
}