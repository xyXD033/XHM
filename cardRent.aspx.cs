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
public partial class cardRent : System.Web.UI.Page
{
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
            }
        }
    }
    /// <summary>
    /// 绑定会员信息
    /// </summary>
    public void bindVIPInfo()
    {
        string Userid = Session["Userid"].ToString(); 
        string VIPSql = "";

        VIPSql = "select * from VIP where Userid='" + Userid + "'";
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
            int borrowNum = Convert.ToInt32(typeSdr["num"]);                  
            int date = Convert.ToInt32(typeSdr["Date"]);
            string selSql = "select count(*) from cardRent where VIPCode='" + sdr["VIPCode"].ToString() + "' and isReturn ='0'";
            int alreadyNum = dataOperate.seleSQL(selSql);

            txtAlready.Text = Convert.ToString(alreadyNum);
            txtNum.Text = Convert.ToString(borrowNum - alreadyNum);   
            txtZong.Text = Convert.ToString(borrowNum);
            TxtDate.Text = Convert.ToString(date);

            isSum = 1;
        }
        else
            Alert.AlertAndRedirect("无权限", "Default.aspx");
    }
    protected void btnGameSearch_Click(object sender, EventArgs e)
    {
        if (isSum > 0)
        {
                if (txtGameCode.Text.Trim() != "")                   //判断游戏编码是否为空
                {
                    string gameCode = txtGameCode.Text;          
                    string sql = "select * from games where gameCode='" + gameCode + "'";
                    DataSet ds = dataOperate.getDataset(sql, "games");
                    if (ds.Tables["games"].DefaultView.Count > 0)
                    {
                        gvCardRent.DataSource = ds.Tables["games"].DefaultView; 
                        gvCardRent.DataKeyNames = new string[] { "gameCode" }; 
                        gvCardRent.DataBind();                     
                    }
                    else
                    RegisterStartupScript("", "<script>alert('游戏编码错误！')</script>");
                }
                else
                {
                    RegisterStartupScript("", "<script>alert('游戏编码不能为空')</script>");
                }
        }
        else
            Alert.AlertAndRedirect("无权限", "Default.aspx");
    }
    protected void gvCardRent_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {   
            //设置游戏类型
            string gameType = e.Row.Cells[1].Text.ToString();               
            string typeSql = "select * from gameType where TypeID=" + gameType;
            SqlDataReader typeSdr = dataOperate.getRow(typeSql);
            typeSdr.Read();                                                 
            e.Row.Cells[1].Text = typeSdr["typeName"].ToString();         
        }
    }
    protected void gvCardRent_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        string sql1;
        sql1 = "select * from cardRent where gameCode='" + txtGameCode.Text + "' and  VIPName='" + Session["userName"].ToString() + "' and isReturn='0'";
        DataSet ds = dataOperate.getDataset(sql1, "cardRent");
        if (ds.Tables["cardRent"].DefaultView.Count <= 0)
        {
            if (int.Parse(txtAlready.Text) >= int.Parse(txtZong.Text))
            {
                RegisterStartupScript("", "<script>alert('您的租赁数量已经超限了不能再租了！')</script>");
            }
            else
            {
                if (float.Parse(txtMoney.Text) < 100)
                {
                    RegisterStartupScript("", "<script>alert('您的金额不足100不能进行租赁请先充值！')</script>");
                }
                else
                {
                    string updateSqlMoney = "update VIP set MoneyInfo=MoneyInfo-8 where Userid='" + Session["UserId"].ToString() + "'";
                    dataOperate.execSQL(updateSqlMoney);
                    
                    string gameCode = gvCardRent.DataKeys[e.NewSelectedIndex].Value.ToString();
                    string sql = "select * from games where gameCode='" + gameCode + "'";
                    SqlDataReader sdr = dataOperate.getRow(sql);                                  
                    sdr.Read();

                    int rentDay = Convert.ToInt32(TxtDate.Text);                    
                    string gameName = sdr["gameName"].ToString();                              
                    string rentTime = DateTime.Now.Date.ToShortDateString();       
                    string VIPCode = Session["VIPCode"].ToString();                              
                    string returnTime = DateTime.Now.Date.AddDays(rentDay).ToShortDateString(); 
                    string VIPName = txtVIPName.Text;                                     

                    string addSql = "insert cardRent(gamecode,gameName,rentTime,returnTime,VIPCode,VIPName)values('" + gameCode + "','" + gameName + "','" + rentTime + "','" + returnTime + "','" + VIPCode + "','" + VIPName + "')";
                    if (dataOperate.execSQL(addSql))       
                    {
                        string updateSql = "update games set rentSum=rentSum+1 where gameCode='" + gameCode + "'";
                        dataOperate.execSQL(updateSql);
                        string updateSql1 = "update games set ZongNum=ZongNum-1 where gameCode='" + gameCode + "'";
                        dataOperate.execSQL(updateSql1);
                        string updateSql2 = "update games set KeZuNum=KeZuNum-1 where gameCode='" + gameCode + "'";
                        dataOperate.execSQL(updateSql2);              

                        bindVIPInfo();               
                        gvCardRent.DataSource = null;       //将数据源设置为空
                        gvCardRent.DataBind();
                        txtGameCode.Text = "";
                        RegisterStartupScript("", "<script>alert('租赁成功！')</script>");
                    }
                    else
                    {
                        RegisterStartupScript("", "<script>alert('租赁失败！')</script>");
                    } 
                }           
            }
        }
        else
        {
            RegisterStartupScript("", "<script>alert('一个人同一张卡带只能租一张！')</script>");
        }
    }
}

