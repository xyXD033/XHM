using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class main : System.Web.UI.Page
{
    public string Name = string.Empty, Power = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if ( Session["UserId"] == null)
        {
            Alert.AlertAndRedirect("对不起您没有登陆", "Login.aspx");
        }
        else
        {
            Name = Request.QueryString["Name"].ToString() == null ? "" : Request.QueryString["Name"].ToString();

            Power = Request.QueryString["Power"].ToString() == null ? "" : Request.QueryString["Power"].ToString();
            this.txtStf.Text = Name;
        }
    }
}
