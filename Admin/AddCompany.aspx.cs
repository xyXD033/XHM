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
public partial class Admin_AddCompany : System.Web.UI.Page
{
    string id = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        id = Request.QueryString["id"].ToString();           
        if (!IsPostBack)
        {
            if (id != "add")                                 
            {
                Title = "修改开发公司信息";
                string sql = "select * from company where id=" + id;            
                SqlDataReader sdr = dataOperate.getRow(sql);
                sdr.Read();
                txtCompany.Text = sdr["Name"].ToString();
                sdr.Close();
            }
            else
                Title = "添加开发公司信息";
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string companyName = txtCompany.Text;
        string sql = "";
        if (id == "add")
        {
            sql = "insert into company values('" + companyName + "')";

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
            sql = "update company set Name='" + companyName + "' where id=" + id;

            if (dataOperate.execSQL(sql))   
            {
                Response.Write("<script language=javascript>alert('修改成功！');window.opener.location.href='companyManage.aspx';window.close();</script>");
            }
            else
            {
                RegisterStartupScript("", "<script>alert('修改失败！')</script>");
            }
        }            
    }
}