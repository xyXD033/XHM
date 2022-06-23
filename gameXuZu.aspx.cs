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

public partial class gameXuZu : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    static int isSum = 0;
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
            txtMoney.Text = sdr["MoneyInfo"].ToString();  
            txtCertificate.Text = sdr["certificate"].ToString();
            txtVIPType.Text = sdr["VIPType"].ToString();

            string VIPTypeSql = "select * from VIPType where type='" + sdr["VIPType"].ToString() + "'";
            SqlDataReader typeSdr = dataOperate.getRow(VIPTypeSql);  
            typeSdr.Read();                                        
            int rentNum = Convert.ToInt32(typeSdr["num"]);           
            int date = Convert.ToInt32(typeSdr["Date"]);
            string selSql = "select count(*) from cardRent where VIPCode='" + sdr["VIPCode"].ToString() + "' and isReturn ='0'";
            int alreadyNum = dataOperate.seleSQL(selSql);

            txtNum.Text = Convert.ToString(rentNum - alreadyNum);     
            txtAlready.Text = Convert.ToString(alreadyNum);
            txtDate.Text = Convert.ToString(date);

            isSum = 1;
        }
        else
            Alert.AlertAndRedirect("无权限", "Default.aspx");
    }
    protected void gvGameReturn_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        if (float.Parse(txtMoney.Text) < 100)
        {
            RegisterStartupScript("", "<script>alert('您的金额不足100不能进行续租请先充值！')</script>");
        }
        else
        {
            string gameCode = gvGameReturn.DataKeys[e.NewSelectedIndex].Value.ToString();
            string sqlpanduan = "select datediff(dd,getdate(),dateadd(dd," + TextBox1.Text + ",returnTime)) as days from cardRent  where  gameCode='" + gameCode + "'and  VIPCode ='" + Session["VIPCode"].ToString() + "'and isReturn='0'";
            SqlDataReader dr = data.GetDataReader(sqlpanduan);
            dr.Read();

            if (int.Parse(dr["days"].ToString()) < int.Parse(txtDate.Text))
            {
                string updateSql = "update cardRent set returnTime=dateadd(dd," + TextBox1.Text + ",returnTime)   where  gameCode='" + gameCode + "'and VIPCode='" + Session["VIPCode"].ToString() + "'and isReturn='0'";
                if (dataOperate.execSQL(updateSql)) 
                {
                    string updateSqlMoney = "update VIP set MoneyInfo=MoneyInfo-8 where Userid='" + Session["Userid"].ToString() + "'";
                    dataOperate.execSQL(updateSqlMoney);

                    bindVIPInfo();
                    bindGridView();
                    RegisterStartupScript("", "<script>alert('续租成功！')</script>");
                }
                else
                {
                    RegisterStartupScript("", "<script>alert('续租失败！')</script>");
                }
            }
            else
            {
                RegisterStartupScript("", "<script>alert('时间超限！')</script>");
            }
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
