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

public partial class Admin_addGameInfo : System.Web.UI.Page
{
    string id = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        id = Request.QueryString["id"].ToString();           
        if (!IsPostBack)                                    
        {
            bindGameType();                                 
            bindShelf();
            bindCompany();
          
            if (id != "add")                                  
            {
                this.Title = "修改游戏信息";
                bindGameInfo();                             
            }
            else
            {
                this.Title = "添加游戏信息";
            }
        }
    }
    /// <summary>
    /// 绑定游戏信息
    /// </summary>
    public void bindGameInfo()
    {
        string sql = "select * from games where gameCode='" + id + "'";
        SqlDataReader sdr = dataOperate.getRow(sql);
        sdr.Read();                                                 
        txtGameCode.Text = sdr["gameCode"].ToString();           
        txtGameName.Text = sdr["gameName"].ToString();              
        ddlGameType.SelectedValue = sdr["gameType"].ToString();
        ddlShelf.SelectedValue = sdr["shelf"].ToString();     
        tatKe.Text = sdr["KeZuNum"].ToString();
        txtZong.Text = sdr["ZongNum"].ToString();
        txtVersion.Text = sdr["version"].ToString();                  
        txtPrice.Text = sdr["Price"].ToString();
        txtds.Text = sdr["ds"].ToString();

        ddlCompany.Items.FindByValue(sdr["companyId"].ToString()).Selected = true; 
        ddlCompany.Items.FindByText(sdr["companyName"].ToString()).Selected = true; 
    }
    /// <summary>
    /// 绑定游戏类型下拉菜单
    /// </summary>
    public void bindGameType()
    {
        string sql = "select * from gameType";  
        ddlGameType.DataSource = dataOperate.getDataset(sql, "gameType");    //将游戏类型绑定到DropDownList控件上
        ddlGameType.DataTextField = "typeName";                              //设置DropDownList控件的显示文本
        ddlGameType.DataValueField = "typeID";                               //设置DropDownList控件的值
        ddlGameType.DataBind();
    }
    /// <summary>
    /// 绑定仓库下拉菜单
    /// </summary>
    public void bindShelf()
    {
        string sql = "select * from shelf";
        ddlShelf.DataSource = dataOperate.getDataset(sql, "shelf");
        ddlShelf.DataTextField = "shelfName";
        ddlShelf.DataValueField = "shelfID";
        ddlShelf.DataBind();
    }
    /// <summary>
    /// 绑定开发公司下拉菜单
    /// </summary>
    public void bindCompany()
    {
        string sql = "select * from company";
        ddlCompany.DataSource = dataOperate.getDataset(sql, "company");
        ddlCompany.DataTextField = "Name";
        ddlCompany.DataValueField = "id";
        ddlCompany.DataBind();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string gamecode = txtGameCode.Text;                   
        string gameName = txtGameName.Text;                     
        string gameType = ddlGameType.SelectedValue;            
        string shelf = ddlShelf.SelectedValue;            
        string version = txtVersion.Text;                         
        string price = txtPrice.Text;
        string ds = txtds.Text;
        string companyid = ddlCompany.SelectedValue;
        string companyname = ddlCompany.SelectedItem.Text;
        string zongnum = txtZong.Text;
        string kezunum = tatKe.Text;
        string rukutime = txtTime.Text;
        string sql = "";

        if (id == "add")
        {
            sql = "insert into games(gameCode,gameName,gameType,shelf,version,price,ds,companyId,companyName,ZongNum,KeZuNum,RuKuTime) values('" + gamecode + "','" + gameName + "','" + gameType + "','" + shelf + "','" +
               version + "'," + price + ",'" + ds + "','" + companyid + "','" + companyname + "','" + zongnum + "','" + kezunum + "','" + rukutime + "')";
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
            sql = "update games set gameName='" + gameName + "',gameType='" + gameType + "',shelf='" + shelf + "',version='" + version + "',price=" + price + " ,ds='" + ds + "',companyId='" + companyid + "',companyName='" + companyname + "',ZongNum='" + zongnum + "',KeZuNum='" + kezunum + "',RuKuTime='" + rukutime + "' where gamecode='" + gamecode + "'";

            if (dataOperate.execSQL(sql))
            {
                Response.Write("<script language=javascript>alert('修改成功！');window.opener.location.href='gameInfoManage.aspx';window.close();</script>");
            }
            else
            {
                RegisterStartupScript("", "<script>alert('修改失败！')</script>");
            }
        }   
    }
}
