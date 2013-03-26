using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;

//由于商品的属性太多，放在表格中不利于编辑，因此，该模块将常用的商品属性放在表格中，而不常用的部分放在下面
public partial class back_productManage_productManage : System.Web.UI.Page
{
    private static string pcid1 = "";//商品的分类号
    private static string pdid="";//商品编号
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("../adminLogin.aspx");
        }
        else
        {
            if (Session["UMode"] != null && !Session["UMode"].ToString().Equals("0") && !Session["UMode"].ToString().Equals("1"))
            {
                //Response.Write("<script>alert('您没有权限进行管理员维护');</script>");
                Response.Write("<script>alert('您没有权限维护商品信息'); window.location.href='../back_index.aspx';</script>");
            }
            else
            {
                if (!IsPostBack)
                {
                    try
                    {
                        this.DropDownList1.Items.Add("不限");
                        this.DropDownList5.Items.Add("不限");
                        string strSQL = "select distinct grandfather from product_cata";
                        OracleDataReader dr = DBConn.ExecuteReader(strSQL);
                        while (dr.Read())
                        {
                            this.DropDownList1.Items.Add(dr["grandfather"].ToString());
                            this.DropDownList5.Items.Add(dr["grandfather"].ToString());
                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<scirpt>alert('" + ex.Message.ToString() + "')</script>");
                    }
                    DropDownList2.Items.Add("不限");
                    DropDownList3.Items.Add("不限");
                    DropDownList6.Items.Add("不限");
                    DropDownList7.Items.Add("不限");
                    // sqlSource();
                    SqlCon();//初始化gridview表格
                   // BindProductNode();//初始化分类树
                }
            }
        }
    }
    protected void SqlCon()
    {
        string sqlstr = "select * from Product,product_cata where product.pcid=product_cata.pcid ";
       // string where = "where";
        //构建查询条件
       /* if (TreeView1.CheckedNodes.Count > 0)
        {
            where += " (pcid like '" + TreeView1.CheckedNodes[0].Value + "%'";
            for(int i=1;i<TreeView1.CheckedNodes.Count;i++)
                where += " or pcid like '" + TreeView1.CheckedNodes[i].Value + "%'";
            where += " ) ";
        }*/
        
        if (DropDownList5.Text != "不限")
            sqlstr = sqlstr + " and grandfather='" + DropDownList5.Text + "'";                     
        if (DropDownList6.Text != "不限")
            sqlstr = sqlstr + " and father='" + DropDownList6.Text + "'";
        if (DropDownList7.Text != "不限")
            sqlstr = sqlstr + " and pcname='" + DropDownList7.Text + "'";
        if (TextBox1.Text != "")
            sqlstr += " and (proName like '%" + TextBox1.Text + "%' or protitle like '%" + TextBox1.Text + "%' or brand like '%" + TextBox1.Text + "%')";
     
       // if(where!="where")
         //   sqlstr += where;
        DataTable dt = DBConn.ExecuteAdapter(sqlstr);//查询符合条件的记录，默认情况下，返回所有记录，结果绑定到gridview表格中
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    private void BindProductNode()
    {
        if (TreeView1.Nodes.Count > 0)
            TreeView1.Nodes.Clear();
        TreeNode root = new TreeNode("商品目录", "00");
        //root.Expanded = true;
        this.TreeView1.Nodes.Add(root);
        string l1 = "";//一级类
        string l2 = "";//二级类       
        int t = 0;
        string ll2 = "";
        string ll3 = "";
        string ll1 = "";
        string llid = "";
        string strsql = "select * from product_cata order by pcid";
        OracleDataReader dr = DBConn.ExecuteReader(strsql);
        if (dr.Read())
        {
            ll1 = dr["grandfather"].ToString();
            ll2 = dr["father"].ToString();
            ll3 = dr["pcname"].ToString();
            llid = dr["pcid"].ToString();
            t = 1;
        }
        while (t == 1)
        {
            TreeNode node1 = new TreeNode(ll1, llid.Substring(0, 2));
            root.ChildNodes.Add(node1);
            l1 = ll1;
            while (t == 1 && ll1 == l1)
            {
                TreeNode node11 = new TreeNode(ll2, llid.Substring(0, 4));
                if (ll2 != "")
                {
                    node1.ChildNodes.Add(node11);
                }
                l2 = ll2;
                while (t == 1 && ll2 == l2)
                {
                    TreeNode node111 = new TreeNode(ll3, llid);
                    if (ll3 != "")
                    {
                        node11.ChildNodes.Add(node111);
                    }
                    if (dr.Read())
                    {
                        ll1 = dr["grandfather"].ToString();
                        ll2 = dr["father"].ToString();
                        ll3 = dr["pcname"].ToString();
                        llid = dr["pcid"].ToString();
                    }
                    else
                        t = 0;
                }

            }
        }
        TreeView1.ExpandAll();

    }


    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        SqlCon();
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        SqlCon();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int ProductID = int.Parse(GridView1.Rows[e.RowIndex].Cells[1].Text);
        //假如商品正在交易中，在不允许删除
        OracleDataReader dr = DBConn.ExecuteReader("select * from sitdown where roomid in (select roomid from room where ProductID=" + ProductID+")");
        if (dr.Read())
        {
            Response.Write("<script>alert('该商品正在占座交易中，不能删除');</script>");
            return;
        }
        //否则，删除该商品，并将该商品相关的占座信息、进入信息、房间信息、订单信息和订单明细信息均删除
        string sqlStr = " begin delete sitdown where roomid in (select roomid from room where ProductID=" + ProductID+")";
        sqlStr += "; delete enterroom where roomNO in (select roomid from room where ProductID=" + ProductID+")";
        sqlStr+= "; delete Room where ProductID=" + ProductID;        
        sqlStr += "; delete cart where ProductID=" + ProductID;
        sqlStr += "; delete Orders where orderID not in (select distinct orderID from cart )";
        sqlStr += "; delete Product  where ProductID=" + ProductID + "; end;";
       // string selectStr1 = "select count(*) from Orders where ProductID=" + ProductID;
        //string selectStr3 = "select count(*) from cart where ProductID=" + ProductID;
        DBConn.ExecuteUpdate(sqlStr);//刷新gridview表格中的数据
        GridView1.EditIndex = -1;
        SqlCon();

    }
   
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int ProductID = int.Parse(GridView1.Rows[e.RowIndex].Cells[1].Text);

        //取得文本框中输入的内容
        string ProductName = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[2].Controls[0])).Text;
        string ProTitle = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[3].Controls[0])).Text;
        string Size = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[4].Controls[0])).Text;
        string Price = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[5].Controls[0])).Text;//
        string coler = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[6].Controls[0])).Text;
        string band = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[7].Controls[0])).Text;
        string left = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[8].Controls[0])).Text;//
        string Alarm= ((TextBox)(GridView1.Rows[e.RowIndex].Cells[9].Controls[0])).Text;//
        string jingyanbi = "0";
        if (((TextBox)(GridView1.Rows[e.RowIndex].Cells[10].Controls[0])).Text != "")
            jingyanbi = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[10].Controls[0])).Text;
        string cheap = "0";
        if (((TextBox)(GridView1.Rows[e.RowIndex].Cells[11].Controls[0])).Text != "")
            cheap = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[11].Controls[0])).Text;
        string one = "0";
        if(((TextBox)(GridView1.Rows[e.RowIndex].Cells[12].Controls[0])).Text!="")
            one = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[12].Controls[0])).Text;
        string ten = "0";
        if(((TextBox)(GridView1.Rows[e.RowIndex].Cells[13].Controls[0])).Text!="")
            ten = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[13].Controls[0])).Text;

        if (int.Parse(cheap) + int.Parse(ten) + int.Parse(one) + int.Parse(jingyanbi) > 1)
        {
            Response.Write("<scirpt>alert('一件商品不能同时设为只一元、只十人、特便宜和经验币换购，只能是四者中的一种！')</script>");
            return;
        }
        //修改商品信息，商品编号不能修改
        string sqlStr = "begin update product set ProName='" + ProductName + "',ProTitle='" + ProTitle + "',proSize='" + Size + "',color='" + coler + "',brand='" + band + "',ischeap='"+cheap+"',isonlyone='"+one+"',isonlyten='"+ten+"',isjingyanbi='"+jingyanbi+"'";
        string whereStr=" where ProductID=" + ProductID;
        //价格等整数类型的数据，防止用户界面上什么也不输而引发错误
        if (Price != "")
            sqlStr += ",Price=" + Price;
        if (left != "")
            sqlStr += ",left=" + left;
        if (Alarm != "")
            sqlStr += ",Alarm=" + Alarm;
        sqlStr += whereStr;
       /* if (one == "1")//设为只一元商品时，其他房间应为关闭状态
        {
            sqlStr += "; update Room set isopen='1' where roomtype='1' and productID=" + ProductID;
            sqlStr += "; update Room set isopen='4' where roomtype='2' and productID=" + ProductID;
            sqlStr += "; update Room set isopen='4' where roomtype='5' and productID=" + ProductID;
            sqlStr += "; update Room set isopen='4' where roomtype='0' and productID=" + ProductID;
            sqlStr += "; update Room set isopen='4' where roomtype='3' and productID=" + ProductID;
            sqlStr += "; update Room set isopen='4' where roomtype='4' and productID=" + ProductID;
        }
        else
        {
            if (ten == "1")//设为只十人商品时，其他房间应为关闭状态
            {
                sqlStr += "; update Room set isopen='4' where roomtype='1' and productID=" + ProductID;
                sqlStr += "; update Room set isopen='4' where roomtype='2' and productID=" + ProductID;
                sqlStr += "; update Room set isopen='4' where roomtype='5' and productID=" + ProductID;
                sqlStr += "; update Room set isopen='4' where roomtype='0' and productID=" + ProductID;
                sqlStr += "; update Room set isopen='1' where roomtype='3' and productID=" + ProductID;
                sqlStr += "; update Room set isopen='4' where roomtype='4' and productID=" + ProductID;
            }
            else
            {
                if (cheap == "1")//设为特便宜商品时，其他房间应为关闭状态
                {
                    sqlStr += "; update Room set isopen='4' where roomtype='1' and productID=" + ProductID;
                    sqlStr += "; update Room set isopen='4' where roomtype='2' and productID=" + ProductID;
                    sqlStr += "; update Room set isopen='4' where roomtype='5' and productID=" + ProductID;
                    sqlStr += "; update Room set isopen='4' where roomtype='0' and productID=" + ProductID;
                    sqlStr += "; update Room set isopen='4' where roomtype='3' and productID=" + ProductID;
                    sqlStr += "; update Room set isopen='1' where roomtype='4' and productID=" + ProductID;
                }
                else
                {
                    if (jingyanbi == "1")//设为换购商品时，所有房间应为关闭状态
                    {
                        sqlStr += "; update Room set isopen='4' where roomtype='1' and productID=" + ProductID;
                        sqlStr += "; update Room set isopen='4' where roomtype='2' and productID=" + ProductID;
                        sqlStr += "; update Room set isopen='4' where roomtype='5' and productID=" + ProductID;
                        sqlStr += "; update Room set isopen='4' where roomtype='0' and productID=" + ProductID;
                        sqlStr += "; update Room set isopen='4' where roomtype='3' and productID=" + ProductID;
                        sqlStr += "; update Room set isopen='4' where roomtype='4' and productID=" + ProductID;

                    }
                    else//不是四种特殊商品时，特便宜和只十人房间关闭，其他房间打开
                    {
                        sqlStr += "; update Room set isopen='1' where roomtype='1' and productID=" + ProductID;
                        sqlStr += "; update Room set isopen='1' where roomtype='2' and productID=" + ProductID;
                        sqlStr += "; update Room set isopen='1' where roomtype='5' and productID=" + ProductID;
                        sqlStr += "; update Room set isopen='1' where roomtype='0' and productID=" + ProductID;
                        sqlStr += "; update Room set isopen='4' where roomtype='3' and productID=" + ProductID;
                        sqlStr += "; update Room set isopen='4' where roomtype='4' and productID=" + ProductID;
                    }

                }

            }
        }
        sqlStr += "; end;";*/
        DBConn.ExecuteUpdate(sqlStr);//修改数据，并刷新界面
        GridView1.EditIndex = -1;
        SqlCon();
    }
   
    protected void Search_Click(object sender, EventArgs e)
    {
        //构造查询条件
       /* string sqlstr = "select * from Product ";
        string where="where";
        if(TextBox1.Text!="")
            where = where + " (proName like '%" + TextBox1.Text + "%' or protitle like '%" + TextBox1.Text + "%' or brand like '%" + TextBox1.Text + "%')";     
        if (TreeView1.CheckedNodes.Count > 0)
        {
            if(where=="where")
                where = where + " ( pcid like '" + TreeView1.CheckedNodes[0].Value.ToString()+"%'";
            else
                where = where + " and (pcid like '" + TreeView1.CheckedNodes[0].Value.ToString() + "%'";
            for (int i = 1; i < TreeView1.CheckedNodes.Count; i++)
                where += " or pcid like '" + TreeView1.CheckedNodes[i].Value.ToString() + "%'";
            where += ")";
        }
        if (where != "where")
            sqlstr = sqlstr + where;
        DataTable dt = DBConn.ExecuteAdapter(sqlstr);
        GridView1.DataSource = dt;
        GridView1.DataBind();*/
        SqlCon();
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //将选中行的不常用信息显示在表格下面
        pdid = GridView1.SelectedRow.Cells[1].Text;
        pcid1 = GridView1.DataKeys[GridView1.SelectedIndex]["pcid"].ToString();
        string strSQL = "select * from product_cata where pcid='" + pcid1 + "'";
        OracleDataReader dr = DBConn.ExecuteReader(strSQL);
        if (dr.Read())
        {
            Label1.Text = dr["grandfather"].ToString() + "/" + dr["father"].ToString() + "/" + dr["pcname"].ToString(); 
            /*this.DropDownList1.Text = dr["grandfather"].ToString();
            this.DropDownList2.Items.Add(dr["father"].ToString());
            this.DropDownList2.Text = dr["father"].ToString();
            this.DropDownList3.Items.Add(dr["pcname"].ToString());
            this.DropDownList3.Text = dr["pcname"].ToString();
            this.DropDownList4.Items.Add(dr["pcid"].ToString());
            this.DropDownList4.Text = dr["pcid"].ToString();*/
        }
        tbAnnotation1.Text = GridView1.DataKeys[GridView1.SelectedIndex]["annotation1"].ToString();
        tbAnnotation2.Text = GridView1.DataKeys[GridView1.SelectedIndex]["annotation2"].ToString();
        tbAnnotation3.Text = GridView1.DataKeys[GridView1.SelectedIndex]["annotation3"].ToString();
        tbAnnotation4.Text = GridView1.DataKeys[GridView1.SelectedIndex]["annotation4"].ToString();
        tbAnnotation5.Text = GridView1.DataKeys[GridView1.SelectedIndex]["annotation5"].ToString();
        Image1.ImageUrl = "../../Images/product/" + GridView1.DataKeys[GridView1.SelectedIndex]["picture1"].ToString();
        Image2.ImageUrl = "../../Images/product/" + GridView1.DataKeys[GridView1.SelectedIndex]["picture2"].ToString();
        Image3.ImageUrl = "../../Images/product/" + GridView1.DataKeys[GridView1.SelectedIndex]["picture3"].ToString();
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList2.Items.Clear();
        this.DropDownList2.Items.Add("不限");
        if (this.DropDownList1.Text != "不限")
        {
            try
            {
                string strSQL = "select distinct father from product_cata where grandfather='" + DropDownList1.Text + "'";
                OracleDataReader dr = DBConn.ExecuteReader(strSQL);
                while (dr.Read())
                {
                    this.DropDownList2.Items.Add(dr["father"].ToString());
                }
            }
            catch (Exception ex)
            {
                Response.Write("<scirpt>alert('" + ex.Message.ToString() + "')</script>");
            }
        }

    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList3.Items.Clear();
        this.DropDownList3.Items.Add("不限");
        this.DropDownList4.Items.Add("0");//隐藏的下拉框，记录选中分类的分类编号
        if (this.DropDownList2.Text != "不限")
        {
            try
            {
                string strSQL = "select pcid, pcname from product_cata where father='" + DropDownList2.Text + "'" + " and grandfather='" + DropDownList1.Text + "'";
                OracleDataReader dr = DBConn.ExecuteReader(strSQL);
                while (dr.Read())
                {
                    this.DropDownList3.Items.Add(dr["pcname"].ToString());
                    this.DropDownList4.Items.Add(dr["pcid"].ToString());
                }
            }
            catch (Exception ex)
            {
                Response.Write("<scirpt>alert('" + ex.Message.ToString() + "')</script>");
            }
        }
    }

    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        pcid1 = DropDownList4.Items[DropDownList3.SelectedIndex].ToString();
    }

    protected void UpdateProduct_Click(object sender, EventArgs e)
    {
        string sqlStrF = "update Product set pcid='"+pcid1+"',ANNOTATION1='"+tbAnnotation1.Text+"',annotation2='"+tbAnnotation2.Text+"',annotation3='"+tbAnnotation3.Text+"',annotation4='"+tbAnnotation4.Text+"',annotation5='"+tbAnnotation5.Text+"'";
       
        String savePath = Server.MapPath("../../Images/Product/");
        if (FileUpload1.HasFile)
        {
            if (FileUpload1.PostedFile.ContentLength > 153600)
            {
                lblMsg.Text = "上传的文件不能超过７０kb";
                return;
            }
            //检查是否已经有同名的上传文件
            String filename = FileUpload1.FileName;//上传文件名
            string type = FileUpload1.PostedFile.ContentType;//文件类型. 
            string type2 = filename.Substring(filename.LastIndexOf(".") + 1).ToLower();//LastIndexOf()最后一个索引位置匹配.Substring()里面的+1是重载. 
            if (type2 != "jpg" && type2 != "gif" && type2 != "bmp" && type2 != "png")
            {
                lblMsg.Text = "上传的文件只能是jpg,gif,bmp和png类型";
                return;
            }
            string path = savePath + filename;      //上传路经
            FileUpload1.SaveAs(path);//保存文件
            sqlStrF += ",PICTURE1='"+ FileUpload1.FileName + "'";

        }
        if (FileUpload2.HasFile)
        {
            if (FileUpload2.PostedFile.ContentLength > 153600)
            {
                lblMsg.Text = "上传的文件不能超过７０kb";
                return;
            }
            //检查是否已经有同名的上传文件
            String filename = FileUpload2.FileName;//上传文件名
            string type = FileUpload2.PostedFile.ContentType;//文件类型. 
            string type2 = filename.Substring(filename.LastIndexOf(".") + 1).ToLower();//LastIndexOf()最后一个索引位置匹配.Substring()里面的+1是重载. 
            if (type2 != "jpg" && type2 != "gif" && type2 != "bmp" && type2 != "png")
            {
                lblMsg.Text = "上传的文件只能是jpg,gif,bmp和png类型";
                return;
            }
            string path = savePath + filename;      //上传路经
            FileUpload2.SaveAs(path);//保存文件
            sqlStrF += ",PICTURE2='" + FileUpload2.FileName + "'";

        }
        if (FileUpload3.HasFile)
        {
            if (FileUpload3.PostedFile.ContentLength > 153600)
            {
                lblMsg.Text = "上传的文件不能超过７０kb";
                return;
            }
            //检查是否已经有同名的上传文件
            String filename = FileUpload3.FileName;//上传文件名
            string type = FileUpload3.PostedFile.ContentType;//文件类型. 
            string type2 = filename.Substring(filename.LastIndexOf(".") + 1).ToLower();//LastIndexOf()最后一个索引位置匹配.Substring()里面的+1是重载. 
            if (type2 != "jpg" && type2 != "gif" && type2 != "bmp" && type2 != "png")
            {
                lblMsg.Text = "上传的文件只能是jpg,gif,bmp和png类型";
                return;
            }
            string path = savePath + filename;      //上传路经
            FileUpload3.SaveAs(path);//保存文件
            sqlStrF += ",PICTURE3='" + FileUpload3.FileName + "'";
        }
        sqlStrF += " where productID="+pdid;
        try
        {

            DBConn.ExecuteUpdate(sqlStrF);
        }
        catch (Exception ex)
        {
            Response.Write("<scirpt>alert('" + ex.Message.ToString() + "')</script>");
        }
        Response.Write("<scirpt>alert('修改成功！')</script>");
        SqlCon();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        SqlCon();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //点击删除时，给出删除确认
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
            {
                ((LinkButton)e.Row.Cells[24].Controls[0]).Attributes.Add("onclick", "javascript:return confirm('你确认要删除：\"" + e.Row.Cells[2].Text + "\"吗?')");

            }
        }
    }
    protected void DropDownList5_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList6.Items.Clear();
        this.DropDownList6.Items.Add("不限");
        if (this.DropDownList5.Text != "不限")
        {
            try
            {
                string strSQL = "select distinct father from product_cata where grandfather='" + DropDownList5.Text + "'";
                OracleDataReader dr = DBConn.ExecuteReader(strSQL);
                while (dr.Read())
                {
                    this.DropDownList6.Items.Add(dr["father"].ToString());
                }
            }
            catch (Exception ex)
            {
                Response.Write("<scirpt>alert('" + ex.Message.ToString() + "')</script>");
            }
        }

    }
    protected void DropDownList6_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList7.Items.Clear();
        this.DropDownList7.Items.Add("不限");
        if (this.DropDownList6.Text != "不限")
        {
            try
            {
                string strSQL = "select distinct pcname from product_cata where father='" + DropDownList6.Text + "'" + " and grandfather='" + DropDownList5.Text + "'";
                OracleDataReader dr = DBConn.ExecuteReader(strSQL);
                while (dr.Read())
                {
                    this.DropDownList7.Items.Add(dr["pcname"].ToString());
                }
            }
            catch (Exception ex)
            {
                Response.Write("<scirpt>alert('" + ex.Message.ToString() + "')</script>");
            }
        }
    }
    protected void DropDownList7_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}