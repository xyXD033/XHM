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
public partial class UserLogin : System.Web.UI.UserControl
{
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserId"] == null)
            {
                Login1.Visible = false;
                Login2.Visible = true;
            }
            else
            {
                Label1.Text = Session["UserName"].ToString();
                Login1.Visible = true;
                Login2.Visible = false;
                string   VIPSql = "select * from VIP where UserID='" + Session["UserId"].ToString() + "'";
                SqlDataReader sdr = dataOperate.getRow(VIPSql);       
                if (sdr.Read())
                {
                    Label2.Text = sdr["MoneyInfo"].ToString();
                }
            }
        }
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserStReg.aspx");
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Session["UserId"] = null;
        Session["UserName"] = null;
        Response.Redirect("Default.aspx");
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        SqlDataReader sdr;
        sdr = data.GetDataReader("select * from VIP where userName='" + this.TxtUserName.Text.Trim() + "' and userPwd='" + this.TxtPassword.Text.Trim() + "'");

        if (sdr.Read())
        {
            Session["UserName"] = sdr["UserName"].ToString();
            Session["UserId"] = sdr["UserID"].ToString();
            Session["Sysuser"] = sdr["UserName"].ToString();
            Session["VIPCode"] = sdr["VIPCode"].ToString();
            Alert.AlertAndRedirect("登录成功！", "Default.aspx");
        }
        else
        {
            Alert.AlertAndRedirect("登录失败！", "Default.aspx");
        }
    }
    protected void lbtnModiPwd_Click(object sender, EventArgs e)
    {
        Response.Redirect("ModifyMyPwd.aspx");
    }
    protected void lbtnModiInfo_Click(object sender, EventArgs e)
    {
        Response.Redirect("MyInfo.aspx");

    }
}
