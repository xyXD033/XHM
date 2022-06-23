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
public partial class Admin_VIPInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
            bindVIPInfo();
    }
    public void bindVIPInfo()
    {
        string sql = "select * from VIP ";
        gvVIPInfo.DataSource = dataOperate.getDataset(sql, "VIP");
        gvVIPInfo.DataKeyNames = new string[] { "Userid" };
        gvVIPInfo.DataBind();
    }
    protected void gvVIPInfo_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = gvVIPInfo.DataKeys[e.RowIndex].Value.ToString();
        string sql = "delete VIP where Userid='" + id + "'";
        dataOperate.execSQL(sql);
        RegisterStartupScript("", "<script>alert('删除成功！')</script>");
        bindVIPInfo();
    }
    protected void gvVIPInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvVIPInfo.PageIndex = e.NewPageIndex;
        bindVIPInfo();
    }
}
