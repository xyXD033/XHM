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
public partial class UserStReg : System.Web.UI.Page
{
    string barcode = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string VIPName = txtVIPName.Text;
        string sex = "";
        if (radbtnMan.Checked)
        {
            sex = "男";
        }
        else
        {
            sex = "女";
        }
        string certificate = txtCertificate.Text;
        string tel = txtTel.Text;
        string email = txtEmail.Text;
        string remark = txtRemark.Text;
        string sql = "";

        sql = "insert into VIP(userName,sex,certificate,tel,email,remark,userPwd)values('" +  VIPName + "','" + sex + "','" +
        certificate + "','" + tel + "','" + email + "','" + remark + "','" + txtPwd.Text + "')";
   
        if (dataOperate.execSQL(sql))
        {
             Alert.AlertAndRedirect("注册成功", "Default.aspx");
        }
        else
        {
             Alert.AlertAndRedirect("注册失败", "Default.aspx");
        }
    }
}
