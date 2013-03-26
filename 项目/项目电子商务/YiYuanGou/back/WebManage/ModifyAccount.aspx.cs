using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing.Printing;
using System.Drawing;

public partial class back_WebManage_Default : System.Web.UI.Page
{
    //private string printStr;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("../adminLogin.aspx");
        }
        else
        {
            if (Session["UMode"] != null && !Session["UMode"].ToString().Equals("0") && !Session["UMode"].ToString().Equals("3"))
            {
                //Response.Write("<script>alert('您没有权限进行管理员维护');</script>");
                Response.Write("<script>alert('您没有权限给客户在线充值'); window.location.href='../back_index.aspx';</script>");
            }
        }


    }
    protected void Button3_Click(object sender, EventArgs e)
    {
         //显示用户信息
        if (UserID.Text != "")
        {
            string sqlstr = "select * from UUser where userID=" + this.UserID.Text;
            IDataReader dr = DBConn.ExecuteReader(sqlstr);
            if (dr != null)
            {
                dr.Read();
                UName.Text = dr["UserName"].ToString();
                TrueName.Text = dr["TrueName"].ToString();
                University.Text = dr["University_Province"].ToString();
                Collage.Text = dr["College_City"].ToString();
                IdentifyNo.Text = dr["IdentifyNo"].ToString();
                Address.Text = dr["Address"].ToString();
                Account.Text = dr["Account"].ToString();
                if (Account.Text == "")
                    Account.Text = "0";
            }
            else
                Response.Write("<script>alert('用户编号不正确，请重新输入！');</script>");
        }
        else
            Response.Write("<script>alert('用户编号不能为空，请重新输入！');</script>");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        UserID.Text = "";
        UName.Text = "";
        TrueName.Text = "";
        University.Text ="";
        Collage.Text = "";
        IdentifyNo.Text = "";
        Address.Text = "";
        Account.Text = "";
        Append.Text = "";
        //printStr = "";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (UserID.Text == "" || Append.Text == "")
            Response.Write("<script>alert('用户编号和充值数量不能为空，请重新输入！');</script>");
        else
        {
            double i = Convert.ToDouble(Account.Text) + Convert.ToDouble(Append.Text);
            string sql = "update uuser set account=account+" + Append.Text + " Where userID=" + UserID.Text;
           // System.DateTime currentTime = new System.DateTime();
            //printStr = "   "+University.Text+ Collage.Text+"的用户" +UName.Text+"(编号："+ UserID.Text + ")于"+currentTime.ToString()+"充值"+Append.Text+"充值前余额"+Account.Text+"元，充值后余额"+i.ToString()+"元\n\n    此资\n        证明\n\n一元购网站管理部\n"+currentTime.ToString();    
            DBConn.ExecuteUpdate(sql);
            Response.Write("<script>alert('充值成功！您当前的余额为："+i.ToString()+"');</script>");            
        }

    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        PrintDocument printDocument = new PrintDocument();
        printDocument.DocumentName = "充值凭证";//设置完后可在打印对话框及队列中显示（默认显示document）


        //打印输出（过程）
        printDocument.PrintPage += new PrintPageEventHandler(printDocument_PrintPage);

        printDocument.Print(); //打印

    }

    void printDocument_PrintPage(object sender, PrintPageEventArgs ev)
    {     

        float yPos = 10;
        float leftMargin = ev.MarginBounds.Left;
        float topMargin = ev.MarginBounds.Top;
       // string line = null;
        Font titleFont = new Font("宋体", 16);
        Font otherFont = new Font("宋体", 10);

        double i = Convert.ToDouble(Account.Text) + Convert.ToDouble(Append.Text);
        System.DateTime currentTime =new System.DateTime();
        string line1 = University.Text + Collage.Text + "的用户" + UName.Text + "(编号：" + UserID.Text + ")今日充值" + Append.Text + "元整。";
        string line2 = "充值前余额" + Account.Text + "元，充值后余额" + i.ToString() + "元。"; 
        string line3="特此为据!";
        string line4 = "一元购网站管理部";
        currentTime = DateTime.Now;
        string line5=currentTime.ToString();

        // Calculate the number of lines per page.
       // linesPerPage = ev.MarginBounds.Height / printFont.GetHeight(ev.Graphics);

        string title = "充值证明";
        yPos += topMargin;
        ev.Graphics.DrawString(title, titleFont, Brushes.Black, leftMargin+60, yPos);

        // Print each line of the file. 
        yPos += 40;
        ev.Graphics.DrawString(line1, otherFont, Brushes.Black, leftMargin, yPos, new StringFormat());
        yPos += 20;
        ev.Graphics.DrawString(line2, otherFont, Brushes.Black, leftMargin, yPos, new StringFormat());
        yPos += 40;
        ev.Graphics.DrawString(line3, otherFont, Brushes.Black, leftMargin+10, yPos, new StringFormat());
        yPos += 40;
        ev.Graphics.DrawString(line4, otherFont, Brushes.Black, leftMargin, yPos, new StringFormat());
        yPos += 20;
        ev.Graphics.DrawString(line5, otherFont, Brushes.Black, leftMargin, yPos, new StringFormat());  
    
    }
 
}