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
public partial class Admin_companyManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
            bindCompany();
    }
    public void bindCompany()
    {
        string sql = "select * from company";
        gvCompany.DataSource = dataOperate.getDataset(sql, "company");
        gvCompany.DataKeyNames = new string[] { "id" };       //设置主键字段
        gvCompany.DataBind();
    }
    protected void gvCompany_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = gvCompany.DataKeys[e.RowIndex].Value.ToString();
        string seSql = "select count(*) from games where companyId=" + id;
        if (dataOperate.seleSQL(seSql) <= 0)
        {
            string sql = "delete from company where id=" + id;
            dataOperate.execSQL(sql);
            RegisterStartupScript("", "<script>alert('删除成功！')</script>");
            bindCompany();
        }
        else
            RegisterStartupScript("", "<script>alert('该开发公司下面存在游戏信息，不可以删除！')</script>");
    }
    protected void gvCompany_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvCompany.PageIndex = e.NewPageIndex;
        bindCompany();
    }
}
