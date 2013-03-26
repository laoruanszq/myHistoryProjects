using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OracleClient;
using System.Data;

public partial class front_ExpChangePro_CreateOder : System.Web.UI.Page
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

        string mode = HttpContext.Current.Request.QueryString["mode"];
        OracleConnection conn = new OracleConnection("Data Source=YiYuanGou;User ID=SZQ;Password=123");
        if (mode != null && mode.Equals("change"))
        {
            //经验值换购
            OracleCommand cmd = new OracleCommand("beginOrder2P", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            //根据存储过程的参数个数及类型生成参数对象  
            OracleParameter p4 = new OracleParameter("uuid", OracleType.Number);//uuid——userID  
            OracleParameter p6 = new OracleParameter("returnval", OracleType.Number);//returnval,返回值  （output）

            //设置参数的输入输出类型,默认为输入  
            p4.Direction = ParameterDirection.Input;
            p6.Direction = ParameterDirection.Output;

            //对输入参数定义初值,输出参数不必赋值.  
            p4.Value = Convert.ToInt32(userID);

            //按照存储过程参数顺序把参数依次加入到OracleCommand对象参数集合中  
            cmd.Parameters.Add(p4);
            cmd.Parameters.Add(p6);

            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                result = cmd.Parameters[1].Value.ToString();
            }
            catch (Exception ee)
            {
                Response.Write("<script>alert('" + ee.Message + "');</script>"); //如果有错误，输出错误信息
            }
            finally
            {
                conn.Close(); //关闭连接
            }

            if (result.Equals("1"))
            {
                showorderchanged();
            }
            else
            {
                //生成订单失败
                Response.Redirect("ShowShoppingCar.aspx");
            }

        }
     

        orderID = "";
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
            }
            if (dr["statement"].ToString().Trim() == "1")
            {
                showstate.Text = "发货";
            }
            if (dr["statement"].ToString().Trim() == "2")
            {
                showstate.Text = "送达";
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
    public void showorderchanged()
    {
        //显示订单信息（收货地址，描述---修改）
        string sqlstr3 = "select * from UUser,Orders,Room where Room.RoomID=Orders.RoomID and Orders.userID=UUser.userID and OrderID=(select max(orderID) from Orders where userid=" + userID + " )";
        OracleDataReader dr = DBConn.ExecuteReader(sqlstr3);
        


        int moneyANDjinyanbi = 0;   //0表示免费  要计算
        int tempprice = 0;

        if (dr.Read())
        {
            //读出用户信息，生成订单
            orderID = dr["OrderID"].ToString();
            showOrderid.Visible = true;
            showOrderid.Text += orderID;
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
            }
            if (dr["statement"].ToString().Trim() == "1")
            {
                showstate.Text = "发货";
            }
            if (dr["statement"].ToString().Trim() == "2")
            {
                showstate.Text = "送达";

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

    protected void Button1_Click(object sender, EventArgs e)
    {
        //确认修改
        string sqlstr = "begin update UUSer set address='" + showaddress.Text + "' where userDI=" + userID + "; update Orders set Description='" + showdescription.Text + "' where orderID=" + orderID + "; end;";
        int flag = DBConn.ExecuteUpdate(sqlstr);
        if (flag != 0)
        {
            Response.Redirect("showorder.aspx");
        }
        else
        {
            //无法修改
            Response.Redirect("../index.aspx");
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