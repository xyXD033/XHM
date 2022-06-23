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

public partial class Admin_InqueGameInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindGameType();
        }

    }
    /// <summary>
    /// 绑定游戏类型下拉菜单
    /// </summary>
    public void bindGameType()
    {
        string sql = "select * from gameType";
        ddlGameType.DataSource = dataOperate.getDataset(sql, "gameType");
        ddlGameType.DataTextField = "typeName";
        ddlGameType.DataValueField = "typeID";
        ddlGameType.DataBind();

        //添加默认选中选项
        ddlGameType.Items.Add("选择类别");
        ddlGameType.Items[this.ddlGameType.Items.Count - 1].Value = " ";
        ddlGameType.SelectedIndex = this.ddlGameType.Items.Count - 1;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        Response.Redirect("InqueGameInfoList.aspx?gameCode=" + txtGameCode.Text + "&gameName=" + txtGameName.Text + "&gameType=" + ddlGameType.SelectedItem.Value );
    }
}
