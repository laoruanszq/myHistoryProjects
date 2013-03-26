using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OracleClient;
using System.Data;

public partial class front_ExpChangePro_showorder : System.Web.UI.Page
{
    //string userID = Session["UserID"].ToString();
    string userID = "1";
    string username = "szq";
    string orderID = "0";
    string result = null;

    protected void Page_Load(object sender, EventArgs e)
    {


        if (Session["UserName"] == null || Session["UserID"] == null)
        {
            Response.Redirect("../login.aspx");
        }
        username = Session["UserName"].ToString();
        userID = Session["UserID"].ToString();
        name.Text = username;


        bindingMessageANDShoppingCar();
        orderID = HttpContext.Current.Request.QueryString["orderID"];
        if (orderID != null && orderID != "")
        {
            showorderchanged(orderID);
        }
    }

    public void showorderchanged(string orderID)
    {
        //显示订单信息（收货地址，描述---修改）
        string sqlstr3 = "select * from UUser,Orders,Room where Room.RoomID=Orders.RoomID and Orders.userID=UUser.userID and OrderID="+orderID;
        OracleDataReader dr = DBConn.ExecuteReader(sqlstr3);

        int moneyANDjinyanbi = 0;   //0表示免费  要计算
        int tempprice = 0;

        if (dr.Read())
        {
            //读出用户信息，生成订单
            orderID = dr["OrderID"].ToString();
            showaddress.Text = dr["address"].ToString();
            showdescription.Text = dr["description"].ToString();
            showorder.Text = dr["OrderID"].ToString();

            if (dr["roomtype"].ToString().Trim() == "0")
            {
                showroomtype.Text = "10元";
                
            }
            else if (dr["roomtype"].ToString().Trim() == "3")
            {
                showroomtype.Text = "10人";
                //查询十人房间价格
            }
            else
            {
                showroomtype.Text = dr["roomtype"].ToString().Trim() + "元";
                
            }

            if (dr["roomid"].ToString().Trim() == "0")
            {
                showroomtype.Text = "免费";
            }


            if (dr["statement"].ToString().Trim() == "0")
            {
                showstate.Text = "生成";
                //修改订单
                HyperLink_changed.NavigateUrl = "CreateOrder.aspx?orderID=" + orderID;
            }
            if (dr["statement"].ToString().Trim() == "1")
            {
                showstate.Text = "发货";
                //确认收货
                HyperLink_confirm.NavigateUrl = "confirmReceiving.aspx?OrderID=" + orderID;
            }
            if (dr["statement"].ToString().Trim() == "2")
            {
                showstate.Text = "送达";
                //确认收货
                HyperLink_confirm.NavigateUrl = "confirmReceiving.aspx?OrderID=" + orderID;
               
            }
            if (dr["statement"].ToString().Trim() == "3")
            {
                showstate.Text = "确认收货";

            }
            if (dr["statement"].ToString().Trim() == "4")
            {
                showstate.Text = "退货";
            }

            showtime.Text = dr["OrderTime"].ToString();
        }

        string sqlstr4 = "select * from Cart,Product where Cart.ProductID=Product.ProductID and OrderID=" + orderID;
        DataTable dt = DBConn.ExecuteAdapter(sqlstr4);
        showproduct.DataSource = dt;
        showproduct.DataBind();
        //绑定listview
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
}