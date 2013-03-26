using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;

public partial class back_productManage_addProduct : System.Web.UI.Page
{
    private static string pcid="";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("../adminLogin.aspx"); //未登录的话，转移到登录页面，防止非法访问页面
        }
        else
        {
            if (Session["UMode"] != null && !Session["UMode"].ToString().Equals("0") && !Session["UMode"].ToString().Equals("1"))
            {
                //Response.Write("<script>alert('您没有权限进行管理员维护');</script>");
                Response.Write("<script>alert('您没有权限添加商品'); window.location.href='../back_index.aspx';</script>");
            }
            else
            {
                if (!IsPostBack)
                {
                   //初始化页面，给商品类别下拉框邦定初始数据
                    try
                    {
                        this.DropDownList1.Items.Add("不限");
                        string strSQL = "select distinct grandfather from product_cata";
                        OracleDataReader dr = DBConn.ExecuteReader(strSQL);
                        while (dr.Read())
                        {
                            this.DropDownList1.Items.Add(dr["grandfather"].ToString());
                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<scirpt>alert('" + ex.Message.ToString() + "')</script>");
                    }
                    DropDownList2.Items.Add("不限");
                    DropDownList3.Items.Add("不限");
                    // sqlSource();
                }
            }
        }
    }
    protected void AddProduct_Click(object sender, EventArgs e)
    {
        //界面不正确输入处理，并获取用户在界面上输入的值
        string ProductName = tbName.Text;
        if (ProductName == "")
        {
            Response.Write("<scirpt>alert('商品名称不能为空')</script>");
            return;
        }
        string ProTitle = tbTitle.Text;
        if (ProTitle== "")
        {
            Response.Write("<scirpt>alert('商品简述不能为空')</script>");
            return;
        }
        string Size = tbSize.Text;
        double Price = 0;
        try
        {
            Price = double.Parse((tbPrice.Text));
        }
        catch (Exception ex)
        {
            Response.Write("<scirpt>alert('" + ex.Message.ToString() + "')</script>");
            return;
        }
        string color = tbColor.Text;
        string brand =tbBrand.Text;
        int left = int.Parse((tbLeft.Text));
        int Alarm = int.Parse((tbAlarm.Text));
        String cheap;
        if (rbCheap1.Checked)
        {
           cheap = "1";
        }
        else
        {
            cheap = "0";
        }
        string onlyone;
        if (rbOne1.Checked)
        {
            onlyone = "1";
        }
        else
        {
            onlyone = "0";
        }
        string jingyanbi;
        if (rbJingyanbi1.Checked)
        {
            jingyanbi= "1";
        }
        else
        {
            jingyanbi = "0";
        }
        string onlyten;
        if (rbTen1.Checked)
        {
            onlyten = "1";
        }
        else
        {
            onlyten = "0";
        }
        if (int.Parse(cheap) + int.Parse(onlyten) + int.Parse(onlyone) + int.Parse(jingyanbi) > 1)
        {
            Response.Write("<scirpt>alert('一件商品不能同时设为只一元、只十人、特便宜和经验币换购，只能是四者中的一种！')</script>");
            return;
        }
        if (pcid == "" || pcid == "0"||DropDownList3.Text=="不限")
        {
            Response.Write("<scirpt>alert('请选择商品类别到第三级！')</script>");
            return;
        }


        string room1;//只一元房间是否启用水军；roomi表示i元房间是否启用水军；fuseri表示i元房间的水军人数，luseri表示i元房间的水军人数限制人数。
        int fuser1 = 0;
        if (rbFalseUser11.Checked)
        {
            room1 = "1";
            if (tbRoom1.Text == "")
            {
                Response.Write("<scirpt>alert('开启虚拟用户后一定要设定虚拟用户的比例')</script>");
                return;
            }
            fuser1 = int.Parse((tbRoom1.Text));
        }
        else
        {
            room1= "0";
        }
        string room2;
        int fuser2 = 0;
        if (rbFalseUser21.Checked)
        {
            room2 = "1";
            if (tbRoom2.Text == "")
            {
                Response.Write("<scirpt>alert('开启虚拟用户后一定要设定虚拟用户的比例')</script>");
                return;
            }
            fuser2 = int.Parse((tbRoom2.Text));
            
        }
        else
        {
            room2 = "0";
        }
        string room5;
        int fuser5 = 0;
        if (rbFalseUser51.Checked)
        {
            room5 = "1";
            if (tbRoom5.Text == "")
            {
                Response.Write("<scirpt>alert('开启虚拟用户后一定要设定虚拟用户的比例')</script>");
                return;
            }
            fuser5 = int.Parse((tbRoom5.Text));
        }
        else
        {
            room5 = "0";
        }
        string room0;
        int fuser0 = 0;
        if (rbFalseUser01.Checked)
        {
            room0 = "1";
            if (tbRoom0.Text == "")
            {
                Response.Write("<scirpt>alert('开启虚拟用户后一定要设定虚拟用户的比例')</script>");
                return;
            }
            fuser0 = int.Parse((tbRoom0.Text));
        }
        else
        {
            room0 = "0";
        }
        string room4;//特便宜，特指0.5币房间
        int fuser4= 0;
        if (rbFalseUser41.Checked)
        {
            room4 = "1";
            if (tbRoom4.Text == "")
            {
                Response.Write("<scirpt>alert('开启虚拟用户后一定要设定虚拟用户的比例')</script>");
                return;
            }
            fuser4 = int.Parse((tbRoom4.Text));
        }
        else
        {
            room4 = "0";
        }
        //string PCID = DropDownList3.SelectedValue;
        
       // string descript1 = tbAnnotation1.Text; //limited User
        //计算出5个房间的水军人数
        int luser1 = (int)(fuser1*Price/100);
        int luser2 = (int)(fuser2*Price/200); 
        int luser5 = (int)(fuser5*Price/500); 
        int luser0 = (int)(fuser0*Price/1000);
        int luser4 = (int)(fuser4*Price/50);


        //四个房间对应的商品号是同一个，商品号自动增长，seqID用于获取系统自动产生的商品号
        string seqID="";
         try
            {
             string seqstr="select   SZQ.S_Product.nextval as i  from sys.dual ";
                OracleDataReader dr = DBConn.ExecuteReader(seqstr);
                if (dr.Read())
                {
                    seqID=dr["i"].ToString();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<scirpt>alert('" + ex.Message.ToString() + "')</script>");
            }
        //构造适当的查询语句，插入一件商品，意味着需同时插入6条记录，即product表一条，关于商品本身的信息，room表7条，即和该商品相关的1，2，5，0四个房间，以及只10人和特便宜（0.5币）房间，最后两个房间可以根据上面的设置为关闭状态。
        string sqlStrF = "begin insert into Product (productID,ProName,ProTitle,proSize,Price,color,left,Alarm,ischeap,isonlyone,isonlyten,ANNOTATION1,annotation2,annotation3,annotation4,annotation5,PCID,upload_time,brand,isJingyanbi,sale_num";
        string sqlStrB = " values("+seqID+",'" + ProductName + "','" + ProTitle + "','" + Size + "'," + Price + ",'" + color + "'," + left + "," + Alarm + ",'" + cheap + "','" + onlyone + "','" + onlyten + "','" + tbAnnotation1.Text + "','" + tbAnnotation2.Text + "','"+tbAnnotation3.Text+"','"+tbAnnotation4.Text+"','"+tbAnnotation5.Text+"','"+pcid+"',sysdate,'" + brand + "','"+jingyanbi+"',0";

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
                sqlStrF += ",PICTURE1";
                sqlStrB += ",'" + FileUpload1.FileName + "'";
            
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
                sqlStrF += ",PICTURE2";
                sqlStrB += ",'" + FileUpload2.FileName + "'";

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
            sqlStrF += ",PICTURE3";
            sqlStrB += ",'" + FileUpload3.FileName + "'";
        }

        string sqlstr = sqlStrF + ") " + sqlStrB + "); ";

        if (onlyone == "1")//设为只一元商品时，其他房间应为关闭状态
        {
            sqlstr += "insert into Room(productID,statement,falseuser,limiteduser,roomType,newfaultuser,isopen) values(" + seqID + ",'" + room1 + "'," + luser1 + "," + ((int)Price).ToString() + ",'1'," + fuser1.ToString() + ",'1'); ";
            sqlstr += "insert into Room(productID,statement,falseuser,limiteduser,roomType,newfaultuser,isopen) values(" + seqID + ",'" + room2 + "'," + luser2 + "," + ((int)(Price / 2)).ToString() + ",'2'," + fuser2.ToString() + ",'4'); ";
            sqlstr += "insert into Room(productID,statement,falseuser,limiteduser,roomType,newfaultuser,isopen) values(" + seqID + ",'" + room5 + "'," + luser5 + "," + ((int)(Price / 5)).ToString() + ",'5 '," + fuser5.ToString() + ",'4'); ";
            sqlstr += "insert into Room(productID,statement,falseuser,limiteduser,roomType,newfaultuser,isopen) values(" + seqID + ",'" + room0 + "'," + luser0 + "," + ((int)(Price / 10)).ToString() + ",'0'," + fuser0.ToString() + ",'4'); ";
            sqlstr += "insert into Room(productID,statement,falseuser,limiteduser,roomType,newfaultuser,isopen) values(" + seqID + ",'0',0,10,'3',0,'4'); ";
            sqlstr += "insert into Room(productID,statement,falseuser,limiteduser,roomType,newfaultuser,isopen) values(" + seqID + ",'" + room4 + "'," + luser4 + "," + ((int)(Price *2)).ToString() + ",'4'," + fuser4.ToString() + ",'4'); end;";
        }
        else
        {
            if (onlyten == "1")//设为只十人商品时，其他房间应为关闭状态
            {
                sqlstr += "insert into Room(productID,statement,falseuser,limiteduser,roomType,newfaultuser,isopen) values(" + seqID + ",'" + room1 + "'," + luser1 + "," + ((int)Price).ToString() + ",'1'," + fuser1.ToString() + ",'4'); ";
                sqlstr += "insert into Room(productID,statement,falseuser,limiteduser,roomType,newfaultuser,isopen) values(" + seqID + ",'" + room2 + "'," + luser2 + "," + ((int)(Price / 2)).ToString() + ",'2'," + fuser2.ToString() + ",'4'); ";
                sqlstr += "insert into Room(productID,statement,falseuser,limiteduser,roomType,newfaultuser,isopen) values(" + seqID + ",'" + room5 + "'," + luser5 + "," + ((int)(Price / 5)).ToString() + ",'5 '," + fuser5.ToString() + ",'4'); ";
                sqlstr += "insert into Room(productID,statement,falseuser,limiteduser,roomType,newfaultuser,isopen) values(" + seqID + ",'" + room0 + "'," + luser0 + "," + ((int)(Price / 10)).ToString() + ",'0'," + fuser0.ToString() + ",'4'); ";
                sqlstr += "insert into Room(productID,statement,falseuser,limiteduser,roomType,newfaultuser,isopen) values(" + seqID + ",'0',0,10,'3',0,'1'); ";
                sqlstr += "insert into Room(productID,statement,falseuser,limiteduser,roomType,newfaultuser,isopen) values(" + seqID + ",'" + room4 + "'," + luser4 + "," + ((int)(Price * 2)).ToString() + ",'4'," + fuser4.ToString() + ",'4'); end;";
            }
            else
            {
                if (cheap == "1")//设为特便宜商品时，其他房间应为关闭状态
                {
                    sqlstr += "insert into Room(productID,statement,falseuser,limiteduser,roomType,newfaultuser,isopen) values(" + seqID + ",'" + room1 + "'," + luser1 + "," + ((int)Price).ToString() + ",'1'," + fuser1.ToString() + ",'4'); ";
                    sqlstr += "insert into Room(productID,statement,falseuser,limiteduser,roomType,newfaultuser,isopen) values(" + seqID + ",'" + room2 + "'," + luser2 + "," + ((int)(Price / 2)).ToString() + ",'2'," + fuser2.ToString() + ",'4'); ";
                    sqlstr += "insert into Room(productID,statement,falseuser,limiteduser,roomType,newfaultuser,isopen) values(" + seqID + ",'" + room5 + "'," + luser5 + "," + ((int)(Price / 5)).ToString() + ",'5 '," + fuser5.ToString() + ",'4'); ";
                    sqlstr += "insert into Room(productID,statement,falseuser,limiteduser,roomType,newfaultuser,isopen) values(" + seqID + ",'" + room0 + "'," + luser0 + "," + ((int)(Price / 10)).ToString() + ",'0'," + fuser0.ToString() + ",'4'); ";
                    sqlstr += "insert into Room(productID,statement,falseuser,limiteduser,roomType,newfaultuser,isopen) values(" + seqID + ",'0',0,10,'3',0,'4'); ";
                    sqlstr += "insert into Room(productID,statement,falseuser,limiteduser,roomType,newfaultuser,isopen) values(" + seqID + ",'" + room4 + "'," + luser4 + "," + ((int)(Price * 2)).ToString() + ",'4'," + fuser4.ToString() + ",'1'); end;";

                }
                else
                {
                    if (jingyanbi == "1")//设为换购商品时，所有房间应为关闭状态
                    {
                        sqlstr += "insert into Room(productID,statement,falseuser,limiteduser,roomType,newfaultuser,isopen) values(" + seqID + ",'" + room1 + "'," + luser1 + "," + ((int)Price).ToString() + ",'1'," + fuser1.ToString() + ",'4'); ";
                        sqlstr += "insert into Room(productID,statement,falseuser,limiteduser,roomType,newfaultuser,isopen) values(" + seqID + ",'" + room2 + "'," + luser2 + "," + ((int)(Price / 2)).ToString() + ",'2'," + fuser2.ToString() + ",'4'); ";
                        sqlstr += "insert into Room(productID,statement,falseuser,limiteduser,roomType,newfaultuser,isopen) values(" + seqID + ",'" + room5 + "'," + luser5 + "," + ((int)(Price / 5)).ToString() + ",'5 '," + fuser5.ToString() + ",'4'); ";
                        sqlstr += "insert into Room(productID,statement,falseuser,limiteduser,roomType,newfaultuser,isopen) values(" + seqID + ",'" + room0 + "'," + luser0 + "," + ((int)(Price / 10)).ToString() + ",'0'," + fuser0.ToString() + ",'4'); ";
                        sqlstr += "insert into Room(productID,statement,falseuser,limiteduser,roomType,newfaultuser,isopen) values(" + seqID + ",'0',0,10,'3',0,'4'); ";
                        sqlstr += "insert into Room(productID,statement,falseuser,limiteduser,roomType,newfaultuser,isopen) values(" + seqID + ",'" + room4 + "'," + luser4 + "," + ((int)(Price * 2)).ToString() + ",'4'," + fuser4.ToString() + ",'4'); end;";


                    }
                    else//不是四种特殊商品时，特便宜和只十人房间关闭，其他房间打开
                    {
                        sqlstr += "insert into Room(productID,statement,falseuser,limiteduser,roomType,newfaultuser,isopen) values(" + seqID + ",'" + room1 + "'," + luser1 + "," + ((int)Price).ToString() + ",'1'," + fuser1.ToString() + ",'1'); ";
                        sqlstr += "insert into Room(productID,statement,falseuser,limiteduser,roomType,newfaultuser,isopen) values(" + seqID + ",'" + room2 + "'," + luser2 + "," + ((int)(Price / 2)).ToString() + ",'2'," + fuser2.ToString() + ",'1'); ";
                        sqlstr += "insert into Room(productID,statement,falseuser,limiteduser,roomType,newfaultuser,isopen) values(" + seqID + ",'" + room5 + "'," + luser5 + "," + ((int)(Price / 5)).ToString() + ",'5 '," + fuser5.ToString() + ",'1'); ";
                        sqlstr += "insert into Room(productID,statement,falseuser,limiteduser,roomType,newfaultuser,isopen) values(" + seqID + ",'" + room0 + "'," + luser0 + "," + ((int)(Price / 10)).ToString() + ",'0'," + fuser0.ToString() + ",'1'); ";
                        sqlstr += "insert into Room(productID,statement,falseuser,limiteduser,roomType,newfaultuser,isopen) values(" + seqID + ",'0',0,10,'3',0,'4'); ";
                        sqlstr += "insert into Room(productID,statement,falseuser,limiteduser,roomType,newfaultuser,isopen) values(" + seqID + ",'" + room4 + "'," + luser4 + "," + ((int)(Price * 2)).ToString() + ",'4'," + fuser4.ToString() + ",'4'); end;";
 
                    }
 
                }
      
            }
        }
        
        int flag = DBConn.ExecuteUpdate(sqlstr);
        if (flag == 1)
        {
            Response.Write("<script>alert('success!')</script>");
        }
    }
    protected void ResetAdd_Click(object sender, EventArgs e)
    {
        DropDownList1.Items.Clear();
        DropDownList2.Items.Clear();
        DropDownList3.Items.Clear();
        DropDownList4.Items.Clear();
        try
        {
            this.DropDownList1.Items.Add("不限");
            string strSQL = "select distinct grandfather from product_cata";
            OracleDataReader dr = DBConn.ExecuteReader(strSQL);
            while (dr.Read())
            {
                this.DropDownList1.Items.Add(dr["grandfather"].ToString());
            }
        }
        catch (Exception ex)
        {
            Response.Write("<scirpt>alert('" + ex.Message.ToString() + "')</script>");
        }
        DropDownList2.Items.Add("不限");
        DropDownList3.Items.Add("不限");
        DropDownList4.Items.Add("不限");

        tbTitle.Text = "";
        tbSize.Text = "";
        tbAlarm.Text = "5";
        tbAnnotation1.Text = "";
        tbAnnotation2.Text = "";
        tbAnnotation3.Text = "";
        tbAnnotation4.Text = "";
        tbAnnotation5.Text = "";
        tbBrand.Text = "";
        tbColor.Text = "";
        tbLeft.Text = "1";
        tbName.Text = "";
        tbPrice.Text = "";
        tbRoom0.Text = "";
        tbRoom1.Text = "";
        tbRoom2.Text = "";
        tbRoom5.Text = "";
        rbCheap2.Checked =true;
        rbJingyanbi2.Checked = true;
        rbOne2.Checked=true;
        rbTen2.Checked=true;
        rbFalseUser01.Checked = true;
        rbFalseUser11.Checked = true;
        rbFalseUser21.Checked = true;
        rbFalseUser51.Checked = true;

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
        this.DropDownList4.Items.Add("0");
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
        pcid = DropDownList4.Items[DropDownList3.SelectedIndex].ToString();        
    }
}