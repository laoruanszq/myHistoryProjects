using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;
using System.IO;

public partial class front_index : System.Web.UI.Page
{
    string username = null;
    string userID = "0";
    protected void Page_Load(object sender, EventArgs e)
    {

        //显示广告
        //showAD();

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
            name.Text = username;
            login.Visible = false;
            loginout.Visible = true;
            HyperLink3.Visible = false;
        }

        bindingMessageANDShoppingCar();
     
        if (!IsPostBack)
        {
            bindingtree();

            bindinglist();

            bindingRepeater();          
        }
        //聊天室
        flashchat();

        //显示tab
        string tabtag=HttpContext.Current.Request.QueryString["tabtag"];
        if (tabtag != null && tabtag != "")
        {
            MultiView1.ActiveViewIndex = Int32.Parse(tabtag);
            Menu1.SelectedItem.Selected = false;
            Menu1.Items[Int32.Parse(tabtag)].Selected = true;
        }

    }


    /// <summary>
    /// 显示广告
    /// </summary>
    private void showAD()
    {
        string sqlstr = "select * from AD";
        IDataReader dr = DBConn.ExecuteReader(sqlstr);
        
        if(dr.Read())
        {
            if(dr[3].ToString()!=null && dr[3].ToString()!="" )
            {
                DateTime endDate1 = DateTime.Parse( dr[3].ToString() );
                int flag = endDate1.CompareTo(DateTime.Now);

                if (flag > 0)
                {
                    //显示广告图片
                    if (File.Exists(dr[0].ToString()))
                    {
                        img_AD1.ImageUrl = dr[0].ToString();
                    }
                    else if (File.Exists(dr[1].ToString()))
                    {
                        //广告图片不存在的话显示默认图片
                        img_AD1.ImageUrl = dr[1].ToString();
                    }
                    else
                    {
                        img_AD1.ImageUrl = "../images/AD/ad1.jpg";
                    }
                }
                else
                {
                    //显示默认图片
                    if (File.Exists(dr[1].ToString()))
                    {
                        //广告图片不存在的话显示默认图片
                        img_AD1.ImageUrl = dr[1].ToString();
                    }
                    else
                    {
                        img_AD1.ImageUrl = "../images/AD/ad1.jpg";
                    }
                }
            }
            if(dr[7].ToString()!=null && dr[7].ToString()!="")
            {
                DateTime endDate2 = DateTime.Parse(dr[7].ToString());
                int flag = endDate2.CompareTo(DateTime.Now);

                if (flag > 0)
                {
                    //显示广告图片
                    if (File.Exists(dr[4].ToString()))
                    {
                        img_AD2.ImageUrl = dr[4].ToString();
                    }
                    else if (File.Exists(dr[5].ToString()))
                    {
                        //广告图片不存在的话显示默认图片
                        img_AD2.ImageUrl = dr[5].ToString();
                    }
                    else
                    {
                        img_AD2.ImageUrl = "../images/AD/ad2.jpg";
                    }
                }
                else
                {
                    //显示默认图片
                    if (File.Exists(dr[5].ToString()))
                    {
                        //广告图片不存在的话显示默认图片
                        img_AD2.ImageUrl = dr[5].ToString();
                    }
                    else
                    {
                        img_AD2.ImageUrl = "../images/AD/ad2.jpg";
                    }
                }
            }
            if(dr[11].ToString()!=null && dr[11].ToString()!="")
            {
                DateTime endDate3 = DateTime.Parse(dr[11].ToString());
                int flag = endDate3.CompareTo(DateTime.Now);

                if (flag > 0)
                {
                    //显示广告图片
                    if (File.Exists(dr[8].ToString()))
                    {
                        img_AD3.ImageUrl = dr[8].ToString();
                    }
                    else if (File.Exists(dr[9].ToString()))
                    {
                        //广告图片不存在的话显示默认图片
                        img_AD3.ImageUrl = dr[9].ToString();
                    }
                    else
                    {
                        img_AD3.ImageUrl = "../images/AD/ad3.jpg";
                    }
                }
                else
                {
                    //显示默认图片
                    if (File.Exists(dr[9].ToString()))
                    {
                        //广告图片不存在的话显示默认图片
                        img_AD3.ImageUrl = dr[9].ToString();
                    }
                    else
                    {
                        img_AD3.ImageUrl = "../images/AD/ad3.jpg";
                    }
                }
            }
        }
    }









    /// <summary>
    /// 刷新聊天室内容
    /// </summary>
    private void flashchat()
    {
 
        string sqlstr = "select * from (select Username, Content, DissTime from DissRoom,UUser where DissRoom.UserID=UUser.UserID and Diss_Room=0 order by DissTime asc) where rownum<=100 order by rownum";
        DataTable dt = DBConn.ExecuteAdapter(sqlstr);

        chat.DataSource = dt;
        chat.DataBind();

        //ClientScript.RegisterStartupScript(this.GetType(), "", "<script type=\"text/javascript\">sc();</script>)");
        //ClientScript.RegisterStartupScript(this.GetType(), "", "<script type=\"text/javascript\">document.getElementById(\"chatform\").scrollTop = document.getElementById(\"chatform\").scrollHeight;</script>");
        ScriptManager.RegisterStartupScript(this, this.GetType(), "myscript", "document.getElementById(\"showchat\").scrollTop = document.getElementById(\"showchat\").scrollHeight;", true);
        //chatform.validateNow();
        //chatform.verticalScrollPosition = chatform.maxVerticalScrollPosition; 


    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        flashchat();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text.ToString().Trim() != "" && TextBox1.Text != null)
        {
            string sqlstr = "insert into DissRoom values(\"S_DissRoom\".nextval," + userID + ",to_date('" + DateTime.Now + "','YYYY/MM/DD HH24:MI:SS'),'" + TextBox1.Text + "',0)";
            int flag = DBConn.ExecuteUpdate(sqlstr);
            TextBox1.Text = "";
            flashchat();
        }
    }
 

    /// <summary>
    /// 绑定listview实现商品展示
    /// </summary>
    public void bindinglist()
    {
        //热卖
        string sqlstr1 = "select * from (select * from Product order by Sale_Num) where rownum<=7 order by rownum";
        DataTable dt1 = DBConn.ExecuteAdapter(sqlstr1);
        ListView_hot.DataSource = dt1;
        ListView_hot.DataBind();
        //新品
        string sqlstr2 = "select * from (select * from Product order by  Upload_Time desc) where rownum<=7 order by rownum";
        DataTable dt2 = DBConn.ExecuteAdapter(sqlstr2);
        ListView_new.DataSource = dt2;
        ListView_new.DataBind();
        //经验值换购
        string sqlstr3 = "select * from (select * from Product where IsJingyanbi=1 order by Sale_Num) where rownum<=3 order by rownum";
        DataTable dt3 = DBConn.ExecuteAdapter(sqlstr3);
        ListView_Change.DataSource = dt3;
        ListView_Change.DataBind();

        //数码电子
        string sqlstr4 = "select * from(select  * from Product where PCID like '01%' order by Sale_Num) where rownum<=8 order by rownum";
        DataTable dt4 = DBConn.ExecuteAdapter(sqlstr4);
        ListView1.DataSource = dt4;
        ListView1.DataBind();
        //生活电器
        string sqlstr5 = "select * from(select  * from Product where PCID like '02%' order by Sale_Num) where rownum<=8 order by rownum";
        DataTable dt5 = DBConn.ExecuteAdapter(sqlstr5);
        ListView2.DataSource = dt5;
        ListView2.DataBind();
        //服装服饰
        string sqlstr6 = "select * from(select  * from Product where PCID like '06%' order by Sale_Num) where rownum<=8 order by rownum";
        DataTable dt6 = DBConn.ExecuteAdapter(sqlstr6);
        ListView3.DataSource = dt6;
        ListView3.DataBind();
        //图书音像
        string sqlstr7 = "select * from(select  * from Product where PCID like '1001%' order by Sale_Num) where rownum<=8 order by rownum";
        DataTable dt7 = DBConn.ExecuteAdapter(sqlstr7);
        ListView4.DataSource = dt7;
        ListView4.DataBind();
        //只一元
        string sqlstr9 = "select * from (select * from Product where IsOnlyOne=1 order by Sale_Num) product1,room where product1.productID=room.productID and roomtype=1 and rownum<=3 order by rownum";     
        DataTable dt9 = DBConn.ExecuteAdapter(sqlstr9);
        ListViewonlyone.DataSource = dt9;
        ListViewonlyone.DataBind();
        //特便宜
        string sqlstr11 = "select * from (select * from Product where IsCheap=1 order by Sale_Num) product1,room where product1.productID=room.productID and roomtype=4 and rownum<=3 order by rownum";
        DataTable dt11 = DBConn.ExecuteAdapter(sqlstr11);
        ListViewonlyfive.DataSource = dt11;
        ListViewonlyfive.DataBind();
        //只十人
        string sqlstr10 = "select * from (select * from Product where IsOnlyTen=1 order by Sale_Num) product1,room where product1.productID=room.productID and roomtype=3 and rownum<=3 order by rownum";
        //OracleDataReader dr = DBConn.ExecuteReader(sqlstr10);
        DataTable dt10 = DBConn.ExecuteAdapter(sqlstr10);
        ListViewonlyten.DataSource = dt10;
        ListViewonlyten.DataBind();
    }

    /// <summary>
    /// 绑定公告repeater
    /// </summary>
    public void bindingRepeater()
    {
        //数据库中订单时间
        string sqlstr = "select * from(select * from gonggao where conType='0' order by gonggaoTime desc)where rownum<=100 order by rownum";
        DataTable dt = DBConn.ExecuteAdapter(sqlstr);
        Repeater1.DataSource = dt;
        Repeater1.DataBind();
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


    protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
    {
        MultiView1.ActiveViewIndex = Int32.Parse(e.Item.Value);
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

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {

    }
}