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

public partial class gameReturn : System.Web.UI.Page
{
    static int isSum = 0;
    SqlHelper data = new SqlHelper() ;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userName"] == null)
            {
                Alert.AlertAndRedirect("对不起您还没有登录", "Default.aspx");
            }
            else
            {            
                bindVIPInfo();     
                bindGridView();             
            }
        }
    }
    public void bindVIPInfo()
    {
        string Userid = Session["Userid"].ToString();             
        string VIPSql = "select * from VIP where Userid='" + Userid + "'";
        SqlDataReader sdr = dataOperate.getRow(VIPSql);
        sdr.Read();
        if (sdr["VIPType"].ToString() != "普通用户")
        {                                           
            txtVIPName.Text = sdr["username"].ToString();        
            txtCertificate.Text = sdr["certificate"].ToString();
            txtVIPType.Text = sdr["VIPType"].ToString();
            txtMoney.Text = sdr["MoneyInfo"].ToString();

            string VIPTypeSql = "select * from VIPType where type='" + sdr["VIPType"].ToString() + "'";
            SqlDataReader typeSdr = dataOperate.getRow(VIPTypeSql);  
            typeSdr.Read();                                                 
            int rentNum = Convert.ToInt32(typeSdr["num"]);          
            string selSql = "select count(*) from cardRent where VIPCode='" + sdr["VIPCode"].ToString() + "' and isReturn ='0'";
            int alreadyNum = dataOperate.seleSQL(selSql);

            txtNum.Text = Convert.ToString(rentNum - alreadyNum);     
            txtAlready.Text = Convert.ToString(alreadyNum);

            isSum = 1;
        }
        else
            Alert.AlertAndRedirect("无权限", "Default.aspx");
    }

    protected void gvGameReturn_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        string gameCode = gvGameReturn.DataKeys[e.NewSelectedIndex].Value.ToString();        
        //计算卡带超期时间
        string sqlfahuan = "select datediff(day,returnTime,GetDate()) as days from cardRent  where  gameCode='" + gameCode + "'and  VIPCode ='" + Session["VIPCode"].ToString() + "'and isReturn='0'";
        int days = 0;
        double fakuan = 0;
        SqlDataReader dr = data.GetDataReader(sqlfahuan);
        if (dr.Read())
        {
            if (int.Parse(dr["days"].ToString()) > 0)
            {
                days = int.Parse(dr["days"].ToString());
                fakuan = days * 0.5; 
            }
        }
                    
        string updateSql = "update cardRent set isReturn='1',gqdate='" + days.ToString() + "',fakuan='" + fakuan.ToString() + "' where  gameCode='" + gameCode + "'and VIPCode='" + Session["VIPCode"].ToString() + "'and isReturn='0'";

        if (dataOperate.execSQL(updateSql)) 
        {
            string updateSql1 = "update games set ZongNum=ZongNum+1 where gameCode='" + gameCode + "'";
            dataOperate.execSQL(updateSql1);
            string updateSql2 = "update games set KeZuNum=KeZuNum+1 where gameCode='" + gameCode + "'";
            dataOperate.execSQL(updateSql2);
            string updateSql3 = "update VIP set MoneyInfo -=" + fakuan + " where Userid='" + Session["Userid"].ToString() + "'";
            dataOperate.execSQL(updateSql3);

            bindVIPInfo();
            bindGridView();
            RegisterStartupScript("", "<script>alert('归还成功！')</script>");
        }
        else
        {
            RegisterStartupScript("", "<script>alert('归还失败！')</script>");
        }
    }
    public void bindGridView()
    {
        string sql = "select * from cardRent where  VIPCode='" + Session["VIPCode"].ToString() + "'and isReturn='0'";
        gvGameReturn.DataSource = dataOperate.getRow(sql);
        gvGameReturn.DataKeyNames = new string[] { "gameCode" };
        gvGameReturn.DataBind();
    }
}
