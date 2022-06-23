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
public partial class Admin_InqueVIPInfoList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindVIPInfo();
        }
    }
    public void bindVIPInfo()
    {
        string VIPCode = Request.QueryString["VIPCode"].ToString();
        string userName = Request.QueryString["userName"].ToString();
        string VIPType = Request.QueryString["VIPType"].ToString();

        string sql = "select * from VIP where 1=1 ";
        if (VIPCode != "")
        {
            sql += " and   VIPCode   like   '%" + VIPCode + "%'   ";
        }
        if (userName != "")
        {
            sql += " and   userName   like   '%" + userName + "%'   ";
        }
        if (VIPType != "选择类别")
        {
            sql += " and   VIPType   like   '%" + VIPType + "%'   ";
        }

        if (dataOperate.getDataset(sql, "VIP").Tables[0].Rows.Count == 0)
        {
            Label1.Text = "没有符合条件的记录";
        }
        else
        {
            Label1.Text = "";
            gvVIPInfo.DataSource = dataOperate.getDataset(sql, "VIP");     
            gvVIPInfo.DataKeyNames = new string[] { "Userid" };            
            gvVIPInfo.DataBind();                                                 
        }
    }
    protected void gvGameManage_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvVIPInfo.PageIndex = e.NewPageIndex;
        bindVIPInfo();                             
    }
    protected void gvVIPInfo_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = gvVIPInfo.DataKeys[e.RowIndex].Value.ToString();
        string sql = "delete VIP where Userid='" + id + "'";
        dataOperate.execSQL(sql);
        RegisterStartupScript("", "<script>alert('删除成功！')</script>");
        bindVIPInfo();
    }
}
