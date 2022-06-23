using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Image1_ServerClick(object sender, ImageClickEventArgs e)
    {
        SqlHelper data = new SqlHelper();
        SqlDataReader sdr;
        sdr = data.GetDataReader("select * from users where userName='" + TxtUserName.Text.Trim() + "' and userPwd='" + txtPassword.Text.Trim() + "'");

        if (sdr.Read())
        {
            Session["Sysuser"] = sdr["UserName"].ToString();
            Session["PowerName"] = sdr["PowerName"].ToString();
            Session["UserId"] = sdr["userId"].ToString();
            Session["userName"] = sdr["UserName"].ToString();
            Response.Redirect("main.aspx?Name=" + sdr["UserName"].ToString() + "&Power=" + sdr["PowerName"].ToString());
        }
        else
        {
            Alert.AlertAndRedirect("登录失败！", "Login.aspx");
        }        
    }
  
}
