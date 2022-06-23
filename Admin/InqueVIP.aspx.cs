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

public partial class Admin_InqueVIP : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindVIPType();
        }
    }
    /// <summary>
    /// 绑定会员类型下拉菜单
    /// </summary>
    public void bindVIPType()
    {
        string sql = "select * from VIPType";
        ddlVIPType.DataSource = dataOperate.getDataset(sql, "VIPType");
        ddlVIPType.DataTextField = "type";
        ddlVIPType.DataValueField = "id";
        ddlVIPType.DataBind();

        //设置默认选中项
        ddlVIPType.Items.Add("选择类别");
        ddlVIPType.Items[this.ddlVIPType.Items.Count - 1].Value = " ";
        ddlVIPType.SelectedIndex = this.ddlVIPType.Items.Count - 1;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        Response.Redirect("InqueVIPInfoList.aspx?VIPCode=" + txtVIPCode.Text + "&userName=" + txtVIPName.Text + "&VIPType=" + ddlVIPType.SelectedItem.Text);
    }
}
