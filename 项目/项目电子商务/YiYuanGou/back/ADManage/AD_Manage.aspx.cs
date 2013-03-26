using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class back_ADManage_AD_Manage : System.Web.UI.Page
{
    private static  string savefilename=""; //暂存上传的图片文件名
    private static string filename2 = "";//暂存上传的默认图片文件名

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
        //    TextBox1.Attributes["onblur"] = ClientScript.GetPostBackEventReference(Button1, "Button1_Click");
        //}

        //TextBox1.Attributes.Add("OnFocus", "Calendar1.Visible=true");
        //TextBox1.Attributes.Add("OnBlur", "Calendar1.Visible=false");
        if (Session["UserName"] == null)
        {
            Response.Redirect("../adminLogin.aspx");//如果没有登录，就自动转到登录界面
        }
        else
        {
            if (Session["UMode"] != null && !Session["UMode"].ToString().Equals("0") && !Session["UMode"].ToString().Equals("3"))
            {
                //Response.Write("<script>alert('您没有权限进行管理员维护');</script>");
                Response.Write("<script>alert('您没有权限进行管理员维护'); window.location.href='../back_index.aspx';</script>");
            }
            else
            {
                //获取原有的广告，并显示在页面上
                string sqlstr = "select * from ad";
                IDataReader dr = DBConn.ExecuteReader(sqlstr);
                if (dr != null)
                {
                    dr.Read();
                    Image1.ImageUrl = dr["ad1_pic"].ToString().Replace(Server.MapPath("../../Images/AD/"), "../../Images/AD/");
                    Image2.ImageUrl = dr["ad2_pic"].ToString().Replace(Server.MapPath("../../Images/AD/"), "../../Images/AD/");
                    Image3.ImageUrl = dr["ad3_pic"].ToString().Replace(Server.MapPath("../../Images/AD/"), "../../Images/AD/");
                    Label1.Text = dr["ad1_begin"].ToString();
                    Label2.Text = dr["ad1_end"].ToString();
                    Label3.Text = dr["ad2_begin"].ToString();
                    Label4.Text = dr["ad2_end"].ToString();
                    Label5.Text = dr["ad3_begin"].ToString();
                    Label6.Text = dr["ad3_end"].ToString();
                }
            }
        }    
    }
   protected void Button1_Click(object sender, EventArgs e)
    {
        //Calendar1.Visible = true;
       
        //检查是否已经有同名的上传文件

        if (FileUpload1.HasFile)
        {
            //String filename = FileUpload1.FileName;//上传文件名
            string fname = this.FileUpload1.FileName;//获得上传文件的名字. 
            string type = FileUpload1.PostedFile.ContentType;//文件类型. 
            string type2 = fname.Substring(fname.LastIndexOf(".") + 1).ToLower();//LastIndexOf()最后一个索引位置匹配.Substring()里面的+1是重载. 
            if (type2 != "jpg" && type2 != "gif" && type2 != "bmp" && type2 != "png")
            {
                lblMsg.Text = "上传的文件只能是jpg,gif,bmp和png类型";
                return;
            }

            //创建上传文件的路径字符串
            savefilename = Server.MapPath("../../Images/AD/");

            if (FileUpload1.PostedFile.ContentLength > 153600)
            {
                lblMsg.Text = "上传的文件不能超过７０kb";
                return;
            }
            savefilename += fname;      //上传路经
            FileUpload1.SaveAs(savefilename);//保存文件
            Response.Write("<script>alert('图片上传成功！');</script>");

        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
       
            
            //检查是否已经有同名的上传文件

            if (FileUpload2.HasFile)
            {
                //创建上传文件的路径字符串
                filename2 = Server.MapPath("../../Images/AD/");
                String filename = FileUpload2.FileName;//上传文件名
                string type = FileUpload2.PostedFile.ContentType;//文件类型. 
                string type2 = filename.Substring(filename.LastIndexOf(".") + 1).ToLower();//LastIndexOf()最后一个索引位置匹配.Substring()里面的+1是重载. 
                if (type2 != "jpg" && type2 != "gif" && type2 != "bmp" && type2 != "png")
                {
                    lblMsg.Text = "上传的文件只能是jpg,gif,bmp和png类型";
                    return;
                }

                if (FileUpload2.PostedFile.ContentLength > 153600)
                {
                    lblMsg.Text = "上传的文件不能超过７０kb";
                    return;
                }
                filename2 += filename;      //上传路经
                FileUpload2.SaveAs(filename2);//保存文件
                Response.Write("<script>alert('图片上传成功！');</script>");
            }
   
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text != "" && TextBox2.Text != "")
        {
            string sqlstr = "";
            string weizhi = DropDownList1.SelectedItem.ToString(); //获取用户在下拉框中选择的广告位置
            //根据不同的位置，构造修改该位置广告信息的SQL语句，以便修改广告内容及有效期限
            switch (weizhi)
            {
                case "顶部":
                    sqlstr = "update ad set ad1_pic='" + savefilename + "', ad1_begin=to_date('" + TextBox1.Text + "','YYYYMMDD'),ad1_end=to_date('" + TextBox2.Text + "','YYYYMMDD')";
                    if (TextBox3.Text != "")
                        sqlstr += ",ad1_url='"+TextBox3.Text+"'";
                    break;
                case "中间":
                    sqlstr = "update ad set ad2_pic='" + savefilename + "', ad2_begin=to_date('" + TextBox1.Text + "','YYYYMMDD'),ad2_end=to_date('" + TextBox2.Text + "','YYYYMMDD')";
                    if (TextBox3.Text != "")
                        sqlstr += ",ad2_url='" + TextBox3.Text + "'";
                    break;
                case "底部":
                    sqlstr = "update ad set ad3_pic='" + savefilename + "', ad3_begin=to_date('" + TextBox1.Text + "','YYYYMMDD'),ad3_end=to_date('" + TextBox2.Text + "','YYYYMMDD')";
                    if (TextBox3.Text != "")
                        sqlstr += ",ad3_url='" + TextBox3.Text + "'";
                    break;
            }

            try
            {
                DBConn.ExecuteUpdate(sqlstr);
                Response.Write("<script>alert('" + weizhi + "广告成功添加！');</script>");
            }
            catch (Exception ee)
            {
                Response.Write("<script>alert('" + ee.Message + "');</script>"); //如果有错误，输出错误信息
            }
                      
        }
        else
            Response.Write("<script>alert('广告开始和结束日期不能为空！！');</script>");
    }
    
    protected void Button5_Click(object sender, EventArgs e)
    {
        string sqlstr = "";
        string weizhi = DropDownList2.SelectedItem.ToString();
        //根据不同的位置，构造修改该位置默认广告信息的SQL语句，以便修改默认广告内容
        switch (weizhi)
        {
            case "顶部":
                sqlstr = "update ad set ad1_def_pic='" + filename2 + "'";
                break;
            case "中间":
                sqlstr = "update ad set ad2_def_pic='" + filename2 + "'";
                break;
            case "底部":
                sqlstr = "update ad set ad3_def_pic='" + filename2 + "'";
                break;
        }
        try
        {
            DBConn.ExecuteUpdate(sqlstr);
            Response.Write("<script>alert('" + weizhi + "广告默认图片修改成功！');</script>");
        }
        catch (Exception ee)
        {
            Response.Write("<script>alert('" + ee.Message + "');</script>"); //如果有错误，输出错误信息
        }
    }    
}