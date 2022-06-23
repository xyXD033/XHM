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
public partial class Admin_addShelf : System.Web.UI.Page
{
    string id = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        id = Request.QueryString["shelfID"].ToString();           
        if (!IsPostBack)                                    
        {
            if (id != "add")                                  
            {
                this.Title = "修改仓库信息";
                string sql = "select * from shelf where shelfID=" + id;            
                SqlDataReader sdr = dataOperate.getRow(sql);
                sdr.Read();
                txtShelf.Text = sdr["shelfName"].ToString();
                sdr.Close();
            }
            else
                this.Title = "添加仓库信息";
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string shelfName = txtShelf.Text;
        string sql = "";
        if (id == "add")
        {
            sql = "insert into shelf values('" + shelfName + "')";

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
            sql = "update shelf set shelfName='" + shelfName + "' where shelfID=" + id;

            if (dataOperate.execSQL(sql))
            {
                Response.Write("<script language=javascript>alert('修改成功！');window.opener.location.href='shelfManage.aspx';window.close();</script>");
            }
            else
            {
                RegisterStartupScript("", "<script>alert('修改失败！')</script>");
            }
        }

    }
}
