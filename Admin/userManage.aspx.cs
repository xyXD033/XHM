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

public partial class Admin_userManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bindUser();
    }

    public void bindUser()
    {
        string sql = "select * from users";
        gvUser.DataSource = dataOperate.getDataset(sql, "users");
        gvUser.DataKeyNames = new string[] { "userId" };
        gvUser.DataBind();
    }
    protected void gvUser_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = gvUser.DataKeys[e.RowIndex].Value.ToString();
        string sql = "delete from users where userId=" + id;
        dataOperate.execSQL(sql);
        RegisterStartupScript("", "<script>alert('删除成功！')</script>");
        bindUser();
    }
}
