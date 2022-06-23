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

public partial class Admin_addUser : System.Web.UI.Page
{
    string id = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        id = Request.QueryString["userId"].ToString();
        if (!IsPostBack)
        {
            if (id != "add")
            {
                this.Title = "修改账号信息";
                string sql = "select * from users where userId=" + id;
                SqlDataReader sdr = dataOperate.getRow(sql);
                sdr.Read();
                txtUserName.Text = sdr["userName"].ToString();
                sdr.Close();
            }
            else
                this.Title = "添加账号信息";
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        string userName = txtUserName.Text;
        string pass = txtPass.Text;
        string sql = "";
        if (id == "add")
        {
            sql = "insert into users(userName,userPwd,PowerName)values('" + userName + "','" + pass + "','超级管理员')";

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
            sql = "update users set userName='" + userName + "',userPwd='" + pass + "'  where userId=" + id;

            if (dataOperate.execSQL(sql))
            {
                Response.Write("<script language=javascript>alert('修改成功！');window.opener.location.href='userManage.aspx';window.close();</script>");
            }
            else
            {
                RegisterStartupScript("", "<script>alert('修改失败！')</script>");
            }
        }
    }
}
