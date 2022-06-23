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

public partial class ShowGame : System.Web.UI.Page
{
    string id;
    protected void Page_Load(object sender, EventArgs e)
    {
        id = Request.QueryString["ID"].ToString();          
        if (!IsPostBack)                                   
        {
            bindGameInfo();
        }
    }
    public void bindGameInfo()
    {
        string sql = "select * from games where gameCode='" + id + "'";
        SqlDataReader sdr = dataOperate.getRow(sql);
        sdr.Read();

        txtGameCode.Text = sdr["gameCode"].ToString();        
        txtGameName.Text = sdr["gameName"].ToString();            
        ddlGameType.Text = sdr["gameType"].ToString();    
        ddlShelf.Text = sdr["shelf"].ToString();    
        txtKe.Text = sdr["KeZuNum"].ToString();
        txtZong.Text = sdr["ZongNum"].ToString();
        txtVersion.Text = sdr["version"].ToString();              
        txtPrice.Text = sdr["Price"].ToString();
        TextBox1.Text = sdr["ds"].ToString();
        companyName.Text = sdr["companyName"].ToString();
        txtDate.Text = sdr["RuKuTime"].ToString();
    }
}
