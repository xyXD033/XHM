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
public partial class Admin_shelfManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
            bindShelf();
    }
    public void bindShelf()
    {
        string sql = "select * from shelf";
        gvShelf.DataSource = dataOperate.getDataset(sql, "shelf");
        gvShelf.DataKeyNames = new string[] { "ShelfID" };
        gvShelf.DataBind();
    }
    protected void gvShelf_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = gvShelf.DataKeys[e.RowIndex].Value.ToString();
        string seSql = "select count(*) from games where Shelf=" + id;
        if (dataOperate.seleSQL(seSql) <= 0)
        {
            string sql = "delete from shelf where ShelfID=" + id;
            dataOperate.execSQL(sql);
            RegisterStartupScript("", "<script>alert('删除成功！')</script>");
            bindShelf();
        }
        else
            RegisterStartupScript("", "<script>alert('此仓库存有游戏，不可以删除！')</script>");
    }
    protected void gvShelf_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvShelf.PageIndex = e.NewPageIndex;
        bindShelf();
    }
}
