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

public partial class MyInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string sql = "select * from VIP  where Userid='" + Session["Userid"].ToString() + "'";
            SqlDataReader sdr = dataOperate.getRow(sql);
            sdr.Read();

            txtVIPCode.Text = sdr["VIPCode"].ToString();
            txtVIPName.Text = sdr["userName"].ToString();
            txtRemark.Text = sdr["remark"].ToString();
            txtTel.Text = sdr["tel"].ToString();
            txtEmail.Text = sdr["email"].ToString();
            txtCertificate.Text = sdr["certificate"].ToString();
            if (sdr["sex"].ToString().Trim() == "男")
            {
                radbtnMan.Checked = true;
            }
            else
            {
                radbtnWoman.Checked = true;
            }
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string VIPCode = txtVIPCode.Text;
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

        sql = "update VIP set userName='" + VIPName + "',sex='" + sex + "',certificate='" +
            certificate + "',tel='" + tel + "',email='" + email + "',remark='" + remark + "' where Userid='" + Session["Userid"].ToString() + "'";

        if (dataOperate.execSQL(sql))
        {
            Alert.AlertAndRedirect("保存成功", "MyInfo.aspx");
        }
        else
            Alert.AlertAndRedirect("保存失败", "MyInfo.aspx");
    }
}
