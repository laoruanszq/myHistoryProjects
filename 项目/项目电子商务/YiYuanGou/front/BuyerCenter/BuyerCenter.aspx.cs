using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;

public partial class front_BuyerCenter_BuyerCenter : System.Web.UI.Page
{
    //用户名取session对象
    //string username = Session["UserName"].ToString();
    ///string userID = Session["UserID"].ToString();
    string username = "szq";
    string userID = "1";

    protected void Page_Load(object sender, EventArgs e)
    {



        if (Session["UserName"] == null || Session["UserID"] == null)
        {
            Response.Redirect("../login.aspx");
        }
        username = Session["UserName"].ToString();
        userID = Session["UserID"].ToString();
        name.Text = username;

        name.Text = username;
        bindingMessageANDShoppingCar();

        bindingdata();


        if (Session["standresult"] != null)
        {
            //显示让座结果
            result.Text = Session["standresult"].ToString();
            Session.Remove("standresult");
        }
        if (Session["confirmresult"] != null)
        {
            //显示确认收货结果
            result.Text = Session["confirmresult"].ToString();
            Session.Remove("confirmresult");
        }
        if (Session["deleteShopping"] != null)
        {
            //显示删除购物车记录结果
            result.Text = Session["deleteShopping"].ToString();
            Session.Remove("deleteShopping");
        }
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
        if (dt1 != null && dt1.Rows.Count!=0)
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




    void bindingdata()
    {
        //绑定数据
       

        //个人信息
        string sqlstr1 = "select * from UUser where UserName='"+username+"'";
        DataTable dt1 = DBConn.ExecuteAdapter(sqlstr1);
        ListViewUserInfo.DataSource = dt1;
        ListViewUserInfo.DataBind();

        //账户信息
        ListViewUserAcount.DataSource = dt1;
        ListViewUserAcount.DataBind();


        //我的收藏
        string sqlstr2 = "select * from UUser,SitDown,Room,Product where UUser.UserID=SitDown.UserID and SitDown.RoomID=Room.RoomID and Room.ProductID=Product.ProductID and UserName='" + username + "'";
        DataTable dt2 = DBConn.ExecuteAdapter(sqlstr2);

        ListViewBuyUserRoom.DataSource = dt2;
        ListViewBuyUserRoom.DataBind();
        for (int i = 0; i < dt2.Rows.Count; i++)
        {
            if (dt2.Rows[i]["roomtype"].ToString().Trim() == "0")
            {
                dt2.Rows[i]["roomtype"] = "10元";
            }
            else if (dt2.Rows[i]["roomtype"].ToString().Trim() == "3")
            {
                dt2.Rows[i]["roomtype"] = "只10人";
            }
            else
            {
                dt2.Rows[i]["roomtype"] = dt2.Rows[i]["roomtype"].ToString().Trim() + "元";
            }

            if (dt2.Rows[i]["roomid"].ToString().Trim() == "0")
            {
                dt2.Rows[i]["roomtype"] = "免费";
            }
        }




        //我的换购商品
        string sqlstr3 = "select * from UUser,Product,Cart where UUser.UserID=Cart.UserID and Cart.ProductID=Product.ProductID and OrderID=0 and  UserName='" + username + "'";
        DataTable dt3 = DBConn.ExecuteAdapter(sqlstr3);
        ListViewUserCar.DataSource = dt3;
        ListViewUserCar.DataBind();



        //我的仓库      
        string sqlstr4 = "select Orders.OrderID,Room.RoomType,Room.RoomID,Orders.Statement,Orders.OrderTime,sum(cart.amount*Product.Price) as TotalPrice,description  from Orders,Cart,Room,Product where Cart.ProductID=Product.ProductID and  Room.RoomID=Orders.RoomID and cart.OrderID=Orders.OrderID  and Orders.OrderID<>0 and Orders.UserID="
                    + userID + " group by Orders.OrderID,Room.RoomType,Room.RoomID,Orders.Statement,Orders.OrderTime,description";
        DataTable dt4 = DBConn.ExecuteAdapter(sqlstr4);

        for (int i = 0; i < dt4.Rows.Count; i++)
        {
            if (dt4.Rows[i]["roomtype"].ToString().Trim() == "0")
            {
                dt4.Rows[i]["roomtype"] = "10元";
            }
            else if (dt4.Rows[i]["roomtype"].ToString().Trim() == "3")
            {
                dt4.Rows[i]["roomtype"] = "只10人";
            }
            else 
            {
                dt4.Rows[i]["roomtype"] = dt4.Rows[i]["roomtype"].ToString().Trim()+"元";
            }

            if (dt4.Rows[i]["roomid"].ToString().Trim() == "0")
            {
                dt4.Rows[i]["roomtype"] = "免费";
            }

            //dt4.Rows[i]["description"] = @"BuyerCenter/BuyerCenter.aspx";
            if (dt4.Rows[i]["statement"].ToString().Trim() == "0")
            {
                dt4.Rows[i]["statement"] = "生成";
            }
            if (dt4.Rows[i]["statement"].ToString().Trim() == "1")
            {
                dt4.Rows[i]["statement"] = "发货";
                //确认收货
                //dt4.Rows[i]["description"] = @"ExpChangePro/confirmReceiving.aspx?OrderID=" + dt4.Rows[i]["roomid"].ToString().Trim();
            }
            if (dt4.Rows[i]["statement"].ToString().Trim() == "2")
            {
                dt4.Rows[i]["statement"] = "送达";
                //确认收货
                //dt4.Rows[i]["description"] = @"ExpChangePro/confirmReceiving.aspx?OrderID=" + dt4.Rows[i]["roomid"].ToString().Trim();
            }
            if (dt4.Rows[i]["statement"].ToString().Trim() == "3")
            {
                dt4.Rows[i]["statement"] = "确认收货";
              
            }
            if (dt4.Rows[i]["statement"].ToString().Trim() == "4")
            {
                dt4.Rows[i]["statement"] = "退货";
            }
        }
        

        string sqlstr5 = "select * from Cart,Product where Cart.ProductID=Product.ProductID and OrderID<>0 and userID=" + userID;
        DataTable dt5 = DBConn.ExecuteAdapter(sqlstr5);

        DataSet ds = new DataSet();
        DataTable dt11 = dt4.Copy();
        dt11.TableName = "orders";
        ds.Tables.Add(dt11);

        DataTable dt22 = dt5.Copy();
        dt22.TableName = "cart";
        ds.Tables.Add(dt22);

        ds.Relations.Add("myrelation", ds.Tables["orders"].Columns["orderid"], ds.Tables["cart"].Columns["orderid"]);

        ListViewUserStore.DataSource = ds.Tables["orders"];
        Page.DataBind();
    }

    void bindingRepeater(string OrderID)
    {
        string sqlstr = "select * from Product,Order,Cart where Order.OrderID=Cart.OrderID and  Cart.ProductID=Product.ProductID and  Order.OrderID=" + OrderID ;
        DataTable dt = DBConn.ExecuteAdapter(sqlstr);
        //Repeater1.DataSource = dt;
        //Repeater1.DataBind();
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        bindingMessageANDShoppingCar();
    }
  
}