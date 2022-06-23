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
public partial class Admin_gameType : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
            bindGameType();
    }
    public void bindGameType()
    {
        string sql = "select * from gameType";
        gvGameType.DataSource = dataOperate.getDataset(sql, "gameType");
        gvGameType.DataKeyNames = new string[] { "typeID" };
        gvGameType.DataBind();
    }
    protected void gvGameType_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = gvGameType.DataKeys[e.RowIndex].Value.ToString();
        string seSql = "select count(*) from games where gameType=" + id;
        if (dataOperate.seleSQL(seSql) <= 0)
        {
            string sql = "delete gameType where typeID=" + id;
            dataOperate.execSQL(sql);
            RegisterStartupScript("", "<script>alert('删除成功！')</script>");
            bindGameType();
        }
        else
            RegisterStartupScript("", "<script>alert('不可以删除！')</script>");
    }
    protected void gvGameType_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvGameType.PageIndex = e.NewPageIndex;
        bindGameType();
    }
}
