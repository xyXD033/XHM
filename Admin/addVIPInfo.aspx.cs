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

public partial class Admin_addVIPInfo : System.Web.UI.Page
{
    string barcode = "";
    SqlHelper mydata = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        barcode = Request.QueryString["Userid"].ToString();           
        if (!IsPostBack)                                    
        {
            //绑定会员类型下拉菜单
            string sql = "select * from VIPType";
            ddlVIPType.DataSource = dataOperate.getDataset(sql, "VIPType");
            ddlVIPType.DataTextField = "type";
            ddlVIPType.DataValueField = "id";
            ddlVIPType.DataBind();

            if (barcode != "add")                                  
            {
                this.Title = "修改会员信息";
                bindVIPInfo();
            }
            else
            {
                this.Title = "添加会员信息";
            }
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string VIPCode = txtVIPCode.Text;
        string VIPName = txtVIPName.Text;
        string pwd = txtPwd.Text;
        string sex = "";
        if (radbtnMan.Checked)
        {
            sex = "男";
        }
        else
        {
            sex = "女";
        }
        string VIPType = ddlVIPType.SelectedItem.Text;
        string certificate = txtCertificate.Text;
        string tel = txtTel.Text;
        string email = txtEmail.Text;
        string remark = txtRemark.Text;
        string sql = "";
        if (barcode == "add")
        {
            sql = "insert into VIP(VIPCode,userName,sex,certificate,tel,email,remark,userPwd,VIPType)values('" + VIPCode + "','" + VIPName + "','" + sex + "','" +
                certificate + "','" + tel + "','" + email + "','" + remark + "','" + pwd + "','" + VIPType + "')";

            if (dataOperate.execSQL(sql))
            {
                Response.Write("<script language=javascript>alert('添加成功！');location.href=location.href;</script>");
            }
            else
            {
                RegisterStartupScript("", "<script>alert('添加失败！')</script>");
            }
        }
        else
        {
            sql = "update VIP set userName='" + VIPName + "',sex='" + sex + "',certificate='" +
                certificate + "',tel='" + tel + "',email='" + email + "',remark='" + remark + "',VIPCode='" + VIPCode + "',userPwd='" + pwd + "',VIPType='" + VIPType + "' where Userid='" + barcode + "'";

            if (dataOperate.execSQL(sql))
            {
                Response.Write("<script language=javascript>alert('修改成功！');window.opener.location.href='VIPInfo.aspx';window.close();</script>");
            }
            else
            {
                RegisterStartupScript("", "<script>alert('修改失败！')</script>");
            }
        }
    }
    /// <summary>
    /// 绑定会员信息
    /// </summary>
    public void bindVIPInfo()
    {
        string sql = "select * from VIP as a left join VIPType as b on a.VIPType=type where a.Userid='" + barcode + "'";
        SqlDataReader sdr = dataOperate.getRow(sql);
        sdr.Read();
        txtVIPCode.Text = sdr["VIPCode"].ToString();
        txtVIPName.Text = sdr["userName"].ToString();
        txtPwd.Text = sdr["userPwd"].ToString();
        ddlVIPType.SelectedValue = sdr["id"].ToString();
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
