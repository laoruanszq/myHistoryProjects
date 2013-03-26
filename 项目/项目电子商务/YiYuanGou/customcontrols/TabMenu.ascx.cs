using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class front_TabMenu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void sreach_Click(object sender, EventArgs e)
    {
        Response.Redirect("../front/ProductList.aspx?keyword=" + keyword.Text.ToString());
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("../front/ExpChangePro/ShowShoppingCar.aspx");
    }
}