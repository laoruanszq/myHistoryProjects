using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;

public partial class back_productManage_productCataManage : System.Web.UI.Page
{
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
                Response.Write("<script>alert('您没有权限维护商品类别'); window.location.href='../back_index.aspx';</script>");
            }
            else
            {
                if (!IsPostBack)
                {
                    BindProductNode();
                }
            }
        }
    }
    private void BindProductNode()
    {
        //如果分类树有节点，则先清空它
        if(TreeView1.Nodes.Count>0)
            TreeView1.Nodes.Clear();
        TreeNode root = new TreeNode("商品目录","00");//添加根节点       
        root.Expanded = true;
        this.TreeView1.Nodes.Add(root);
        string l1 = "";//一级类
        string l2 = "";//二级类       
        int t=0;//标记变量，用于控制循环
        string ll2 = "";//二级类
        string ll3 = "";//三级类
        string ll1="";//一级类
        string llid = "";//类别编号
        string strsql = "select * from product_cata order by pcid";//找出所有的分类信息
        OracleDataReader dr = DBConn.ExecuteReader(strsql);
       if(dr.Read())
       {
           ll1 = dr["grandfather"].ToString();
           ll2 = dr["father"].ToString();
           ll3 = dr["pcname"].ToString();
           llid = dr["pcid"].ToString();
           t=1;          
       }
       while(t==1)
       {           
           TreeNode node1 = new TreeNode(ll1, llid.Substring(0, 2));                
           root.ChildNodes.Add(node1);
           l1 = ll1;
           while(t==1 && ll1==l1)
           {
               TreeNode node11 = new TreeNode(ll2, llid.Substring(0, 4)); 
               if (ll2 != "")
               {
                   node1.ChildNodes.Add(node11);
               }
               l2 = ll2;
               while(t==1 && ll2==l2 )    
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
      // TreeView1.ExpandAll();
      
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        TreeNodeCollection treenode = TreeView1.CheckedNodes;
        if (treenode.Count == 0)
        {
            Response.Write("<script>alert('请选中待修改节点！');</script>");
            return;
        }
        if (treenode.Count > 1)
        {
            Response.Write("<script>alert('一次只能修改一个节点！');</script>");
            return;
        }
        int treedepth = treenode[0].Depth;  
        if (TextBox1.Text != "")
        {
            string sql = "";
            if (treedepth ==1)
            {
                sql = "update product_cata set grandfather='" +  TextBox1.Text + "' where pcid like '"+treenode[0].Value+"%'";
            }
            else if (treedepth == 2)
            {
                sql = "update product_cata set father='" + TextBox1.Text + "' where pcid like '" + treenode[0].Value + "%'";
            }
            else if (treedepth == 3)
            {
                sql = "update product_cata set pcname='" + TextBox1.Text + "' where pcid='" + treenode[0].Value + "'";
            }
            else
            {
                Response.Write("<script>alert('根节点无需修改！');</script>");
                return;
            }
            try
            {
                DBConn.ExecuteUpdate(sql);
                Response.Write("<script>alert('修改成功');</script>");
                treenode[0].Text = TextBox1.Text;
                //BindProductNode();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }
        else
        {
            Response.Write("<script>alert('新节点名不能为空！');</script>");
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        TreeNodeCollection treenode = TreeView1.CheckedNodes;
        if (treenode.Count == 0)
        {
            Response.Write("<script>alert('请选中待删除节点！');</script>");
            return;
        }
        if (treenode.Count > 1)
        {
            Response.Write("<script>alert('一次只能删除一个节点！');</script>");
            return;
        }
        int treedepth = treenode[0].Depth;
       
        string sql = "";
        /*string flag ="0";
       
        if (treedepth == 3 || treedepth == 2)
        {            
            OracleDataReader dr = DBConn.ExecuteReader("select count(*) as sl from product_cata where pcid like '" + treenode[0].Parent.Value + "%'");
            if (dr.Read())
                flag = dr["sl"].ToString();            
        }*/
        if (treedepth == 1)
        {
            sql = "delete product_cata where pcid like '" + treenode[0].Value + "%'";
        }
        else if (treedepth == 2)
        {
            sql = "begin delete product_cata where pcid like '" + treenode[0].Value + "%' and substr(rtrim(pcid,' '),length(rtrim(pcid,' '))-1,2)!='01';";
            sql += " delete product_cata where pcid='"+treenode[0].Parent.Value+"';";
            sql += " update product_cata set pcname='', father='',pcid='" + treenode[0].Parent.Value + "' where pcid like '" + treenode[0].Value + "%'; end;";
        }
        else if (treedepth == 3)
        {
            sql = "begin update product_cata set pcname='',pcid='" + treenode[0].Parent.Value + "' where pcid='" + treenode[0].Value + "' and substr(pcid,length(pcid)-1,2)='01';";
            sql += "delete product_cata where pcid='" + treenode[0].Value + "' and substr(pcid,length(pcid)-1,2)!='01'; end;";
        }
        else
        {
            sql = "delete product_cata ";
        }
        try
        {
            DBConn.ExecuteUpdate(sql);
            Response.Write("<script>alert('删除成功');</script>");
            BindProductNode();
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        TreeNodeCollection treenode=TreeView1.CheckedNodes;
        if (treenode.Count ==0)
        {
            Response.Write("<script>alert('请选中待添加节点的父节点！');</script>");
            return;
        }
        if (treenode.Count > 1)
        {
            Response.Write("<script>alert('一次只能添加一个节点！');</script>");
            return;
        }
        int treedepth=treenode[0].Depth;
        int childs = treenode[0].ChildNodes.Count+1;
        if (TextBox1.Text != "")
        {
            string sql = "";
            if (treedepth == 0)
            {
                sql = "insert into product_cata(pcid,grandfather) values('" + childs.ToString().PadLeft(2, '0') + "','" + TextBox1.Text + "')";
            }
            else if (treedepth ==1)
            {
               // TreeNode father = treenode[0].Parent;
                sql = "begin delete product_cata where pcid='"+treenode[0].Value+"';";
                sql += "insert into product_cata(pcid,father,grandfather) values('" + treenode[0].Value+childs.ToString().PadLeft(2,'0') + "','" + TextBox1.Text +"','"+treenode[0].Text+ "'); end;";                   
            }
            else if (treedepth == 2)
            {
                TreeNode father = treenode[0].Parent;
               // TreeNode gfather = father.Parent;
                sql = "begin delete product_cata where pcid='" +treenode[0].Value + "';";
                sql += "insert into product_cata(pcid,pcname,father,grandfather) values('" +treenode[0].Value + childs.ToString().PadLeft(2, '0') + "','" + TextBox1.Text + "','" + treenode[0].Text + "','"+father.Text+"'); end;";           
                             
            }
            else
            {
                Response.Write("<script>alert('叶子节点下面不能再添加新节点！');</script>");
                return;
            }
            try
            {
                DBConn.ExecuteUpdate(sql);
                Response.Write("<script>alert('添加成功');</script>");
                BindProductNode();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }
        else
        {
            Response.Write("<script>alert('新节点名不能为空！');</script>");
        }

    }
}