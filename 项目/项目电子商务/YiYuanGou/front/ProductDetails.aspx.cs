using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;


public partial class front_ProductDetail : System.Web.UI.Page
{
    string username = "szq";
    string userID = "6";
    string productid;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["UserName"] == null || Session["UserID"] == null)
        {
            userID = "0";
            username = "匿名用户";
            login.Visible = true;
            loginout.Visible = false;
        }
        else
        {
            username = Session["UserName"].ToString();
            userID = Session["UserID"].ToString();
            Label3.Text = username;
            //name.Text = username;
            login.Visible = false;
            loginout.Visible = true;
        }


        bindingMessageANDShoppingCar();

        if (Session["sitresult"] != null)
        {
            //显示占座结果
            result.Text = Session["sitresult"].ToString();
            Session.Remove("sitresult");
        }


        selectnumber.Visible = false;
        productid = HttpContext.Current.Request.QueryString["ProductID"];
        if (productid != null && productid != "") 
        {
            string sqlstr = "select * from Product,Product_Cata where Product.PCID=Product_Cata.PCID  and ProductID=" + productid;
            string sqlstr1 = "select * from room  LEFT outer JOIN sitrateview  ON Room.RoomID = sitrateview.RoomID  where isopen='1'  and (roomtype='0' or roomtype='1' or roomtype='2' or roomtype='5' or roomtype='3' or  roomtype='4') and ProductID=" + productid;
            DataTable dt = DBConn.ExecuteAdapter(sqlstr);
            DataTable dt1 = DBConn.ExecuteAdapter(sqlstr1); 

            if (dt.Rows.Count != 0)
            {
                if (dt.Rows[0]["IsJingyanbi"].ToString().Equals("1"))
                {
                    selectnumber.Visible = true;
                    //Exchange.Visible = true;
                    //TextBox1.Visible = true;
                    //Label1.Visible = true;
                }
            }
            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                if (dt1.Rows[i]["roomType"].ToString().Equals("0"))
                {
                    dt1.Rows[i]["roomType"] = "10";
                }
                if (dt1.Rows[i]["roomType"].ToString().Equals("3"))
                {
                    dt1.Rows[i]["roomType"] = "只10人";
                }
                if (dt1.Rows[i]["roomType"].ToString().Equals("4"))
                {
                    dt1.Rows[i]["roomType"] = "特惠";
                }
                if (dt1.Rows[i]["sitrate"] == null || dt1.Rows[i]["sitrate"].ToString().Equals(""))
                {
                    dt1.Rows[i]["sitrate"] = "0";
                    dt1.Rows[i]["sitnum"] = 0;
                }
                dt1.Rows[i]["sitrate"] = (int)(float.Parse(dt1.Rows[i]["sitrate"].ToString()) * 100);
            }

            DataSet ds = new DataSet();
            DataTable dt11 = dt.Copy();
            dt11.TableName = "product";
            ds.Tables.Add(dt11);

            DataTable dt22 = dt1.Copy();
            dt22.TableName = "room";
            ds.Tables.Add(dt22);

            ds.Relations.Add("myrelation", ds.Tables["product"].Columns["productid"], ds.Tables["room"].Columns["productid"]);

            ProductDetail.DataSource = ds.Tables["product"];
            Page.DataBind();


            //ProductDetail.DataSource = dt;
            //ProductDetail.DataBind();    
         
        }
    }

    /// <summary>
    /// 加入购物车
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Exchange_Click(object sender, ImageClickEventArgs e)
    {
        //用户名取session对象
        if (Session["UserName"] == null || Session["UserID"] == null)
        {
            Response.Redirect("../login.aspx");
        }
        username = Session["UserName"].ToString();
        userID = Session["UserID"].ToString();




        string pronum = TextBox1.Text.ToString().Trim();

        string sql = "select * from cart where userID=" + userID + " and productID=" + productid + " and orderID=0";
        OracleDataReader dr = DBConn.ExecuteReader(sql);

        string sqlstr;
        if (dr != null && dr.HasRows)
        {
            sqlstr = "update cart set amount=amount+" + pronum + " where userID=" + userID + " and productID=" + productid + " and orderID=0";
        }
        else
        {
            sqlstr = "insert into cart(cartID,productID,userID,amount,orderID) values(\"S_cart\".nextval,"+productid+","+userID+","+pronum+",0)";
        }

        int flag = DBConn.ExecuteUpdate(sqlstr);

        if (flag == 1)
        {
            Response.Write(" <script  language=javascript> var r= r=confirm('加入购物车成功,去结算点or继续购物？'); if (r==true){window.location = 'ExpChangePro/ShowShoppingCar.aspx';} </script> ");
        }
        else
        {
            Response.Write(" <script  language=javascript> var   rtn=window.alert( '该商品无法加入购物车，请稍后重试'); </script> ");
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
            Response.Redirect("ProductList.aspx?clear=clear&keyword=" + searchKeyWord.Text.ToString());
        }
    }
    //上面是绑定站内信和购物车以及搜索功能



}