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
public partial class Admin_gameInfoManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindGame();                           
        }
    }
    public void bindGame()
    {
        string sql = "select * from games  ";
        gvGameManage.DataSource = dataOperate.getDataset(sql, "games");     
        gvGameManage.DataKeyNames = new string[] { "gameCode" };                
        gvGameManage.DataBind();                                                    
    }
    protected void gvGameManage_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)        //判断是不是数据行
        {   
            //设置游戏类型
            string gameType = e.Row.Cells[2].Text.ToString();               
            string typeSql = "select * from gameType where typeID=" + gameType;
            SqlDataReader typeSdr = dataOperate.getRow(typeSql);
            typeSdr.Read();                                                 
            e.Row.Cells[2].Text = typeSdr["typeName"].ToString();
            //设置仓库
            string shelf = e.Row.Cells[3].Text.ToString();               
            string shelfSql = "select * from shelf where shelfID=" + shelf;
            SqlDataReader shelfSdr = dataOperate.getRow(shelfSql);
            shelfSdr.Read();                                                
            e.Row.Cells[3].Text = shelfSdr["shelfName"].ToString();
        }
    }
    protected void gvGameManage_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string barCode = gvGameManage.DataKeys[e.RowIndex].Value.ToString();         
        string sql = "delete from games where gameCode='" + barCode + "'";
        dataOperate.execSQL(sql);
        RegisterStartupScript("", "<script>alert('删除成功！')</script>");
        bindGame();                                                                      
    }
    protected void gvGameManage_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvGameManage.PageIndex = e.NewPageIndex;               
        bindGame();
    }
}
