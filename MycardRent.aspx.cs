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
public partial class MycardRent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserId"] == null)
            {
                Alert.AlertAndRedirect("对不起您还没有登陆", "Default.aspx");
            }
            else
            {
                bindGame();
            }          
        }
    }
    public void bindGame()
    {
        string sql = "select * from cardRent where VIPCode='" + Session["VIPCode"].ToString() + "'  ";
        gvGameManage.DataSource = dataOperate.getDataset(sql, "cardRent");     
        gvGameManage.DataKeyNames = new string[] { "gameCode" };         
        gvGameManage.DataBind();                                           
    }
    protected void gvGameManage_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvGameManage.PageIndex = e.NewPageIndex;              
        bindGame();                             
    }
}
