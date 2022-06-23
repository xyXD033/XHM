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

public partial class Admin_AddMoney : System.Web.UI.Page
{
    string id = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        id = Request.QueryString["Userid"].ToString();
        if (!IsPostBack)                                    
        {           
            bindVIPInfo();         
        }        
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string sql = "update VIP set MoneyInfo=MoneyInfo+'" + txtchong.Text + "'  where Userid='" + id + "'";

        if (dataOperate.execSQL(sql))
        {
            Response.Write("<script language=javascript>alert('充值成功！');window.opener.location.href='VIPInfo.aspx';window.close();</script>");
        }
        else
        {
            RegisterStartupScript("", "<script>alert('修改失败！')</script>");
        }
    }
    public void bindVIPInfo()
    {
        string sql = "select * from VIP  where Userid='" + id + "'";
        SqlDataReader sdr = dataOperate.getRow(sql);
        sdr.Read();
        txtVIPCode.Text = sdr["VIPCode"].ToString();
        txtMoney.Text = sdr["MoneyInfo"].ToString();       
    }
}
