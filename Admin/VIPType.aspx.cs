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
public partial class Admin_VIPType : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
            bindVIPType();
    }
    public void bindVIPType()
    {
        string sql = "select * from VIPType";
        gvVIPType.DataSource = dataOperate.getDataset(sql, "VIPType");
        gvVIPType.DataKeyNames = new string[] { "id" };
        gvVIPType.DataBind();
    }
    protected void gvVIPType_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = gvVIPType.DataKeys[e.RowIndex].Value.ToString();
        string seSql = "select count(*) from VIP where VIPType=" + id;
        if (dataOperate.seleSQL(seSql) <= 0)
        {
            string sql = "delete VIPType where id=" + id;
            dataOperate.execSQL(sql);
            RegisterStartupScript("", "<script>alert('删除成功！')</script>");
            bindVIPType();
        }
        else
            RegisterStartupScript("", "<script>alert('不可以删除！')</script>");
    }
    protected void gvVIPType_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvVIPType.PageIndex = e.NewPageIndex;
        bindVIPType();
    }
}
