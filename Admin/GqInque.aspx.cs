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

public partial class Admin_GqInque : System.Web.UI.Page
{

    static string sql = "";
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string condition = ddlCondition.SelectedValue;
        string key = txtKey.Text;
        sql = "select * from cardRent where " + condition + " like '%" + key + "%'  and  isReturn='1' and gqdate>'0'";

        if (dataOperate.getDataset(sql, "cardRent").Tables[0].Rows.Count == 0)
        {
            Label1.Text = "没有符合条件的记录";
            bindCardRent(sql);
        }
        else
        {
            Label1.Text = "";
            bindCardRent(sql);
        }
    }
    public void bindCardRent(string seSql)
    {
        gvgqCardRent.DataSource = dataOperate.getDataset(seSql, "cardRent");
        gvgqCardRent.DataBind();
    }
    protected void gvgqCardRent_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvgqCardRent.PageIndex = e.NewPageIndex;
        bindCardRent(sql);
    }
}
