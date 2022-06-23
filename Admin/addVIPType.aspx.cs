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
public partial class Admin_addVIPType : System.Web.UI.Page
{
    string id = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        id = Request.QueryString["id"].ToString();           
        if (!IsPostBack)                                    
        {
            if (id != "add")                                  
            {
                this.Title = "修改会员类型";
                string sql = "select * from VIPType where id=" + id;
                SqlDataReader sdr = dataOperate.getRow(sql);
                sdr.Read();
                TxtName.Text = sdr["type"].ToString();
                txtNum.Text = sdr["num"].ToString();
                txtDate.Text = sdr["Date"].ToString();
                sdr.Close();
            }
            else
                this.Title = "添加会员类型";
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string type = TxtName.Text;        
        string num = txtNum.Text;
        string date = txtDate.Text;
        string sql = "";
        if (id == "add")
        {
            sql = "insert into VIPType(type,num,Date) values('" + type + "'," + num + ",'" + date+ "')";

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
            sql = "update VIPType set type='" + type + "',num=" + num + " ,Date='" + date + "' where id=" + id;

            if (dataOperate.execSQL(sql))
            {
                Response.Write("<script language=javascript>alert('修改成功！');window.opener.location.href='VIPType.aspx';window.close();</script>");
            }
            else
            {
                RegisterStartupScript("", "<script>alert('修改失败！')</script>");
            }
        }
    }
}
