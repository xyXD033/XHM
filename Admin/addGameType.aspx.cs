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

public partial class Admin_addGameType : System.Web.UI.Page
{
    string id = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        id = Request.QueryString["id"].ToString();           
        if (!IsPostBack)                                    
        {
            if (id != "add")                                  
            {
                this.Title = "修改游戏类型";
                string sql = "select * from gameType where typeID=" + id;            
                SqlDataReader sdr = dataOperate.getRow(sql);
                sdr.Read();
                txtTypeName.Text = sdr["typeName"].ToString();              
                sdr.Close();
            }
            else
                this.Title = "添加游戏类型";
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string typeName = txtTypeName.Text;
        string sql = "";
        if (id == "add")
        {
            sql = "insert into gameType values('" + typeName + "')";

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
            sql = "update gameType set typeName='" + typeName + "' where typeID=" + id;

            if (dataOperate.execSQL(sql))
            {
                Response.Write("<script language=javascript>alert('修改成功！');window.opener.location.href='gameType.aspx';window.close();</script>");
            }
            else
            {
                RegisterStartupScript("", "<script>alert('修改失败！')</script>");
            }
        }
    }
}
