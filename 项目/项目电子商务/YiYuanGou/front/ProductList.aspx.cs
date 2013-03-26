using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;

public partial class front_ProductList : System.Web.UI.Page
{
    private string method = null;//排序的方法（销售量，价格等）
    private string sort = null;//商品类别（电子产品）
    private string keyword = null;//搜索框输入的关键词
    private string isbool = null;//1元，十人商品
    private string clear = null;//是否清除所有的session对象
    private string brand = null;
    private string price = null;
    private string min = "0";
    private string max = "10000000";

    string username = "szq";
    string userID = "1";

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

        clear = HttpContext.Current.Request.QueryString["clear"];
        if (clear != "" && clear != null)
        {
            if (clear.Equals("clear"))
            {
                Session.Remove("method");
                Session.Remove("sort");
                Session.Remove("keyword");
                Session.Remove("isbool");
                Session.Remove("brand"); 
            }
        }

        method = HttpContext.Current.Request.QueryString["method"];
        if (method != "" && method != null)
        {
            if (method.Equals("non"))
            {
                Session.Remove("method");
            }
            else
            {
                Session["method"] = method;
            }
            method = null;
        }

        sort = HttpContext.Current.Request.QueryString["sort"];
        if (sort != "" && sort != null)
        {
            if (sort.Equals("non"))
            {
                Session.Remove("sort");
            }
            else
            {
                Session["sort"] = sort;
            }
            
            sort = null;
        }

        keyword = HttpContext.Current.Request.QueryString["keyword"];
        if (keyword != "" && keyword != null)
        {
            if (keyword.Equals("non"))
            {
                Session.Remove("keyword");
            }
            else
            {
                Session["keyword"] = keyword;
            }
            keyword = null;
        }

        isbool = HttpContext.Current.Request.QueryString["isbool"];
        if (isbool != "" && isbool != null)
        {
            if (isbool.Equals("non"))
            {
                Session.Remove("isbool");
            }
            else
            {
                Session["isbool"] = isbool;
            }
            isbool = null;
        }

        brand = HttpContext.Current.Request.QueryString["brand"];
        if (brand != "" && brand != null)
        {
            if (brand.Equals("non"))
            {
                Session.Remove("brand");
            }
            else
            {
                Session["brand"] = brand;
            }
            brand = null;
        }

        price = HttpContext.Current.Request.QueryString["price"];
        if (price != "" && price != null)
        {
            if (price.Equals("non"))
            {
                Session.Remove("price");
                Session.Remove("min");
                Session.Remove("max");
            }
            else
            {
                Session["price"] = price;
                Session["min"] = HttpContext.Current.Request.QueryString["min"];
                Session["max"] = HttpContext.Current.Request.QueryString["max"];
            }
            price = null;
        }


        if (!IsPostBack)
        {
            bindingtree();
            showListView();
        }
    }


    /// <summary>
    /// 添加商品分类的商标
    /// </summary>
    public void bindingbrand()
    {
        string sqlstr_brand = "select distinct  brand from Product where isJingYanBi=0 and PCID like '" + sort + "%'";
        DataTable dt2 =  DBConn.ExecuteAdapter(sqlstr_brand);
        ListView_Brand.DataSource = dt2;
        ListView_Brand.DataBind();
    }

    /// <summary>
    /// 绑定商品列表
    /// </summary>
    public void showListView()
    {
        //得到sql语句
        string sqlstr = "select Product.ProductID,Picture1,ProName,ProTitle,Price from Product ";     //sql前部分语句
        string sqlstr2 = " where IsJingyanbi=0 ";          //sql where语句
        string sqlstr3 = "";                          //sql order by语句

        if (Session["method"] != null)
        {
            method = Session["method"].ToString();
        }
        if (Session["sort"] != null)
        {
            sort = Session["sort"].ToString();
            //添加商品分类的商标
            bindingbrand();
        }
        if (Session["sort"] == null)
        {
            //移除商品分类的商标
            ListView_Brand.DataSource = null;
        }
        if (Session["keyword"] != null)
        {
            keyword = Session["keyword"].ToString();
        }
        if (Session["isbool"] != null)
        {
            isbool = Session["isbool"].ToString();
        }
        if (Session["brand"] != null)
        {
            brand = Session["brand"].ToString();
        }
        if (Session["price"] != null)
        {
            price = Session["price"].ToString();
            if (price.Equals("is"))
            {
                ResetPrice.Visible = true;
                min = Session["min"].ToString();
                max = Session["max"].ToString();
                if (int.Parse(min) > int.Parse(max))
                {
                    string temp = min;
                    min = max;
                    max = temp;
                }
            }
        }

        if (keyword != "" && keyword != null)
        {
            sqlstr2 += " and (ProName like '%" + keyword + "%' or ProTitle like '%" + keyword + "%') ";
        }
        if (sort != "" && sort != null)
        {
            sqlstr2 += " and PCID like '" + sort + "%' ";
        }
        if (isbool != "" && isbool != null)
        {
           sqlstr2 += " and  " + isbool + "='1' ";
        }
        if (brand != "" && brand != null)
        {
           sqlstr2 += " and  brand='" + brand + "' ";
        }
        if (price != "" && price != null)
        {
           sqlstr2 += " and  (price between " + min + " and  "+max+") ";
        }



        if (method != "" && method != null)
        {
            if (method.Equals("sitrate desc"))
            {
                //按照占座率排行
                sqlstr = "select * from( select  Product.ProductID,Picture1,ProName,ProTitle,Price, max(sitrate) as sitrate  from Product   ";  


                sqlstr += ",Room , sitrateview  ";
                sqlstr2 += " and Product.ProductID=Room.ProductID  and  Room.RoomID = sitrateview.RoomID  GROUP BY Product.ProductID,Picture1,ProName,ProTitle,Price) order by sitrate desc ";
            }
            else if (method.Equals("sitrate asc"))
            {
                //按照占座率排行

                sqlstr = "select * from( select  Product.ProductID,Picture1,ProName,ProTitle,Price, max(sitrate) as sitrate  from Product   ";
                sqlstr += ",Room , sitrateview  ";
                sqlstr2 += " and Product.ProductID=Room.ProductID  and  Room.RoomID = sitrateview.RoomID  GROUP BY Product.ProductID,Picture1,ProName,ProTitle,Price) order by sitrate asc ";
            }
            else
            {
                sqlstr3 += " order by " + method;
            }
        }


        sqlstr += sqlstr2 + sqlstr3;
        DataTable dt = DBConn.ExecuteAdapter(sqlstr);
        //ListView_Product.DataSource = dt;
        //ListView_Product.DataBind();



        string sqlstr4 = "select * from (room  LEFT outer JOIN sitrateview  ON Room.RoomID = sitrateview.RoomID ), product where room.productID=product.productid  and isJingYanBi=0 and isopen='1' and (roomtype='0' or roomtype='1' or roomtype='2' or roomtype='5' or roomtype='3' or roomtype='4') ";
        if (keyword != "" && keyword != null)
        {
            sqlstr4 += " and (ProName like '%" + keyword + "%' or ProTitle like '%" + keyword + "%') ";
        }
        if (sort != "" && sort != null)
        {
            sqlstr4 += " and PCID like '" + sort + "%' ";
        }
        if (isbool != "" && isbool != null)
        {
            sqlstr4 += " and  " + isbool + "='1' ";
        }
        if (brand != "" && brand != null)
        {
            sqlstr4 += " and  brand='" + brand + "' ";
        }
        if (price != "" && price != null)
        {
            sqlstr4 += " and  (price between " + min + " and  " + max + ") ";
        }
        DataTable dt1 = DBConn.ExecuteAdapter(sqlstr4);

      
        for (int i = 0; i < dt1.Rows.Count; i++)
        {
            if (dt1.Rows[i]["roomType"].ToString().Equals("0"))
            {
                dt1.Rows[i]["roomType"] = "10";
            }
            if (dt1.Rows[i]["roomType"].ToString().Equals("4"))
            {
                dt1.Rows[i]["roomType"] = "特惠";
            }
            if (dt1.Rows[i]["roomType"].ToString().Equals("3"))
            {
                dt1.Rows[i]["roomType"] = "只10人";
            }
            if (dt1.Rows[i]["sitrate"] == null || dt1.Rows[i]["sitrate"].ToString().Equals("") || dt1.Rows[i]["sitrate"].ToString().Equals("null"))
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
        ds.Relations.Add("myrelation", ds.Tables["product"].Columns["productid"], ds.Tables["room"].Columns["productid"],false);
       
        ListView_Product.DataSource = ds.Tables["product"];
        Page.DataBind();
    }

        /// <summary>
    /// 绑定树状菜单
    /// </summary>
    public void bindingtree()
    {
        string sqlstr1 = "select distinct GrandFather, substr(pcid, 0, 2) as pcid from Product_Cata";
        string sqlstr2 = "select distinct Father,GrandFather, SUBSTR(pcid,0,4) as pcid from Product_Cata";
        string sqlstr3 = "select * from Product_Cata";
        DataSet ds = new DataSet("sort");
        DataTable dt1 = DBConn.ExecuteAdapter(sqlstr1);
        dt1.TableName = "grandfather";
        DataTable dt2 = DBConn.ExecuteAdapter(sqlstr2);
        dt2.TableName = "father";
        DataTable dt3 = DBConn.ExecuteAdapter(sqlstr3);
        dt3.TableName = "pcsort";

        ds.Tables.Add(dt1);
        ds.Tables.Add(dt2);
        ds.Tables.Add(dt3);
        if (ds.Tables[0] != null && ds.Tables[0].Rows.Count != 0)
        {
            for (int c1 = 0; c1 < ds.Tables[0].Rows.Count; c1++)
            {
                TreeNode tnClass1 = new TreeNode();
                tnClass1.Text = ds.Tables[0].Rows[c1][0].ToString();
                tnClass1.Value = ds.Tables[0].Rows[c1][0].ToString();
                tnClass1.Expanded = true;
                tnClass1.ShowCheckBox = false;
                //tnClass1.ImageUrl = "~/img/images/bbsmark01.jpg";
                //tnClass1.SelectAction = TreeNodeSelectAction.Select;
                //tnClass1.Target = "TopicList";
                //tnClass1.NavigateUrl = "TopicList.aspx?class1=" + dt[c1].id;
                tnClass1.NavigateUrl = "ProductList.aspx?sort=" + ds.Tables[0].Rows[c1][1].ToString() + "&keyword=non&isbool=non&brand=non";

                //IList<BBS_Class2> listClass2 = bbsclass2bll.GetTechInfo(dt[c1].id, 0,0); //第二个表的数据
                if (ds.Tables[1] != null && ds.Tables[1].Rows.Count != 0)
                {
                    for (int c2 = 0; c2 < ds.Tables[1].Rows.Count; c2++)
                    {
                        if (tnClass1.Text == ds.Tables[1].Rows[c2][1].ToString())
                        {
                            TreeNode tnClass2 = new TreeNode();
                            tnClass2.Text = ds.Tables[1].Rows[c2][0].ToString();
                            tnClass2.Value = ds.Tables[1].Rows[c2][0].ToString();
                            //tnClass2.ImageUrl = "~/img/images/bbsmark05.jpg";
                            tnClass2.Expanded = false;
                            tnClass2.ShowCheckBox = false;
                            //tnClass2.Target = "TopicList";
                            //tnClass2.SelectAction = TreeNodeSelectAction.Select;
                            //tnClass2.NavigateUrl = "TopicList.aspx?class1=" + dt[c1].id + "&class2=" + listClass2[c2].id;
                            tnClass2.NavigateUrl = "ProductList.aspx?sort=" + ds.Tables[1].Rows[c2][2].ToString() + "&keyword=non&isbool=non&brand=non";
                            if (ds.Tables[2] != null && ds.Tables[2].Rows.Count != 0)
                            {
                                for (int c3 = 0; c3 < ds.Tables[2].Rows.Count; c3++)
                                {
                                    if (tnClass2.Text == ds.Tables[2].Rows[c3][2].ToString())
                                    {
                                        TreeNode tnClass3 = new TreeNode();
                                        tnClass3.Text = ds.Tables[2].Rows[c3][1].ToString();
                                        tnClass3.Value = ds.Tables[2].Rows[c3][0].ToString();
                                        //tnClass3.ImageUrl = "~/img/images/bbsmark05.jpg";
                                        tnClass3.Expanded = false;
                                        tnClass3.ShowCheckBox = false;
                                        //tnClass3.SelectAction = TreeNodeSelectAction.Expand;
                                        //tnClass3.Target = "TopicList";
                                        tnClass3.NavigateUrl = "ProductList.aspx?sort=" + ds.Tables[2].Rows[c3][0].ToString() + "&keyword=non&isbool=non&brand=non";
                                        tnClass2.ChildNodes.Add(tnClass3);//添加
                                    }
                                }

                            }
                            tnClass1.ChildNodes.Add(tnClass2);//添加
                        }//if

                    }//for
                }//if
                TreeView1.Nodes.Add(tnClass1); //添加
            }
        }
    }

    protected void ListView_Product_PagePropertiesChanged(object sender, EventArgs e)
    {
        int PageSize = ((DataPager)ListView_Product.FindControl("dpProduct")).PageSize;
        int StartRowIndex = ((DataPager)ListView_Product.FindControl("dpProduct")).StartRowIndex;
        int TotalRowCount = ((DataPager)ListView_Product.FindControl("dpProduct")).TotalRowCount;

        //Response.Write("PageSize = " + PageSize.ToString() + " ; StartRowIndex = " + StartRowIndex.ToString() + " ; TotalRowcount = " + TotalRowCount.ToString() + ";");
        ((DataPager)ListView_Product.FindControl("dpProduct")).SetPageProperties(StartRowIndex, PageSize, true);
        this.showListView();
    }
    protected void Price_Click(object sender, EventArgs e)
    {
        string minP, maxP;
        //表单验证，只能输入数字
        if (TextBox1.Text == "")
            minP = "0";
        else
            minP = TextBox1.Text.Trim();
        if (TextBox2.Text == "")
            maxP = "0";
        else
            maxP = TextBox2.Text.Trim();

        if (minP != maxP)
        {
            Response.Redirect("ProductList.aspx?price=is&min=" + minP + "&max=" + maxP);
        }
    }
    protected void ResetPrice_Click(object sender, EventArgs e)
    {
        Response.Redirect("ProductList.aspx?price=non");
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
