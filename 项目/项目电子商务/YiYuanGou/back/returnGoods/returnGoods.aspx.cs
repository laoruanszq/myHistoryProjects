using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;

public partial class back_returnGoods_returnGoods : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("../adminLogin.aspx");
        }
        else
        {
            if (Session["UMode"] != null && !Session["UMode"].ToString().Equals("0") && !Session["UMode"].ToString().Equals("2"))
            {
                //Response.Write("<script>alert('您没有权限进行管理员维护');</script>");
                Response.Write("<script>alert('您没有权限确认退货'); window.location.href='../back_index.aspx';</script>");
            }
            else
            {
                if (!IsPostBack)
                {

                    sqlSource();
                }
            }
        }
    }
    protected void sqlSource()
    {
        string sqlstr = "select orders.orderID,product.productID,proName,prosize,price,color,uuser.userID,trueName,address,zipcode,cellphone,phone,roomID from Product,orders,uuser,cart where cart.orderID=orders.orderID and orders.userID=UUser.userID and product.productID=cart.productID and (orders.statement=2 or orders.statement=3) and sysdate-sendtime<=23";
        if (TextBox1.Text != "")
            sqlstr = sqlstr + " and orders.orderID="+TextBox1.Text;
        if (TextBox2.Text != "")
            sqlstr = sqlstr + " and trueName like '%" + TextBox2.Text + "%'";
        if(TextBox3.Text!="")
            sqlstr = sqlstr + " and proName like '%" + TextBox3.Text+"%'";
        sqlstr = sqlstr + " order by orders.orderID";
        DataTable dt = DBConn.ExecuteAdapter(sqlstr);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        int f = 1;
        for (int i = 0; i < this.GridView1.Rows.Count; i++)
        {            
            CheckBox cb = this.GridView1.Rows[i].FindControl("CheckBox1") as CheckBox;
             if (cb.Checked)
            {
                string rid = this.GridView1.Rows[i].Cells[1].Text;
                string pid = this.GridView1.Rows[i].Cells[2].Text;
                string uid = this.GridView1.Rows[i].Cells[7].Text;
                TextBox tb = this.GridView1.Rows[i].FindControl("TextBox4") as TextBox;
                string sl = tb.Text;
                string roomid = this.GridView1.Rows[i].Cells[13].Text;
                //调用存储过程，完成退货相关的处理：更新商品库存、归还用户钱或经验币、修改或删除订单明细，修改订单信息等
                OracleConnection conn = new OracleConnection("Data Source=YiYuanGou;User ID=SZQ;Password=123");
                OracleCommand cmd = new OracleCommand("ReturnGoodsP", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                //根据存储过程的参数个数及类型生成参数对象  
                OracleParameter p1 = new OracleParameter("pid", OracleType.Number);//pid——productID  
                OracleParameter p2 = new OracleParameter("ooid", OracleType.Number);//ooid——orderID  
                OracleParameter p3 = new OracleParameter("shuliang", OracleType.Number);//shuliang——退货数量  
                OracleParameter p4 = new OracleParameter("uuid", OracleType.Number);//uuid——userID  
                OracleParameter p5 = new OracleParameter("rid", OracleType.Number);//rid——roomID  
                OracleParameter p6 = new OracleParameter("returnval", OracleType.Number);//returnval,返回值  （output）

                //设置参数的输入输出类型,默认为输入  
                p1.Direction = ParameterDirection.Input;
                p2.Direction = ParameterDirection.Input;
                p3.Direction = ParameterDirection.Input;
                p4.Direction = ParameterDirection.Input;
                p5.Direction = ParameterDirection.Input;
                p6.Direction = ParameterDirection.Output;

                //对输入参数定义初值,输出参数不必赋值.  
                p1.Value = Convert.ToInt32(pid);
                p2.Value = Convert.ToInt32(rid);
                p3.Value = Convert.ToInt16(sl);
                p4.Value = Convert.ToInt32(uid);
                p5.Value = Convert.ToInt32(roomid);

                //按照存储过程参数顺序把参数依次加入到OracleCommand对象参数集合中  
                cmd.Parameters.Add(p1);
                cmd.Parameters.Add(p2);
                cmd.Parameters.Add(p3);
                cmd.Parameters.Add(p4);
                cmd.Parameters.Add(p5);
                cmd.Parameters.Add(p6);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();//执行存储过程
                    string result = cmd.Parameters[5].Value.ToString();//获得程序运行结果，若为0，则发生了错误
                    if (result == "0")
                    {
                        Response.Write("<script>alert('订单"+rid+"退货数量高于订货数量！！');</script>");
                        f = 0;
                    }
                    
                }
                catch (Exception ee)
                {
                    Response.Write("<script>alert('"+ee.Message+"');</script>"); //如果有错误，输出错误信息
                }
                finally
                {
                    conn.Close(); //关闭连接
                }
            }
        }
        if(f==1)
            Response.Write("<script>alert('所选订单退货成功！');</script>");
        else
            Response.Write("<script>alert('所选订单未能全部退货成功！');</script>");

        sqlSource();//刷新可退货列表
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        sqlSource();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //发送邮件
        for (int i = 0; i < this.GridView1.Rows.Count; i++)
        {
            //获得用户购得商品的方式
            string buyWay = this.GridView1.Rows[i].Cells[13].Text;
            if (buyWay == "0")
                buyWay = "经验值换购";
            else
                buyWay = "房间投币";
            System.DateTime sendTime = new System.DateTime();
            sendTime = DateTime.Now;//获得系统当前时间
            //构建邮件内容
            string ctext = "尊敬的客户，您在一元购网站" + buyWay + "所得的商品：" + this.GridView1.Rows[i].Cells[3].Text + "  " + this.GridView1.Rows[i].Cells[4].Text + "  " + this.GridView1.Rows[i].Cells[5].Text + "  " + "退货已经于" + sendTime.ToString() + "收到，得到了确认！";
            //string uid = this.GridView1.Rows[i].Cells[1].Text;
            //将邮件信息插入到数据库中
            CheckBox cb = this.GridView1.Rows[i].FindControl("CheckBox1") as CheckBox;
            if (cb.Checked)
            {
                string sql = "insert into innermail(mtitle,sender,receiver,content,isopen,sendtime) values ('您发送的一元购网站退货商品已收到!',1," + this.GridView1.Rows[i].Cells[7].Text + ",'" + ctext + "',0,sysDate) ";

                try
                {
                    DBConn.ExecuteUpdate(sql);
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + ";邮件发送失败！请重新发送');</script>");
                }

            }
        }
        Response.Write("<script>alert('邮件发送成功！');</script>");
    }

    protected void cbSelect_CheckedChanged(object sender, EventArgs e)
    {
        //实现全选功能
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            ((CheckBox)this.GridView1.Rows[i].Cells[0].FindControl("CheckBox1")).Checked = ((CheckBox)sender).Checked;
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        sqlSource();
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        TextBox3.Text = "";
        TextBox2.Text = "";
        TextBox1.Text = "";
    }
}