using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
public partial class _Default : System.Web.UI.Page 
{
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {      
        if (!IsPostBack)
        {
            dlNews.DataSource = data.GetDataReader("select top  10 * from  games  order by  RuKuTime desc ");
            dlNews.DataBind();

            dlHot.DataSource = data.GetDataReader("select top 8  * from games  order by  rentSum desc ");
            dlHot.DataBind();          
        }
    }  
    protected string CutChar(string strChar, int intLength)
    {
        //取得自定义长度的字符串
        if (strChar.Length > intLength)
        { return strChar.Substring(0, intLength); }
        else
        { return strChar; }
    }   
}
