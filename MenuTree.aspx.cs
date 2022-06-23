using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
public partial class MenuTree : System.Web.UI.Page
{
    public string Name = string.Empty, Power = string.Empty;
    public string Menu = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if ( Session["UserId"] == null)
            {
                Alert.AlertAndRedirect("对不起您没有登陆", "Login.aspx");
            }
            else
            {
                Name = Request.QueryString["Name"].ToString() == null ? "" : Request.QueryString["Name"].ToString();
                Power = Request.QueryString["Power"].ToString() == null ? "" : Request.QueryString["Power"].ToString();
                switch (Power)
                {
                    case "超级管理员":
                        Menu = "Menu1.xml";
                        break;
                    default:
                        Menu = "Menu1.xml";
                        break;
                };
                this.Page.EnableViewState = false;
                TreeInit();
            }
        }
    }

    private void TreeInit()
    {
        this.TreeView1.Nodes.Clear();
        string TreeUrl = Server.MapPath(Menu);

        XmlDocument xmlDoc = new XmlDocument();
        xmlDoc.Load(TreeUrl);
        LoadRootNode(xmlDoc.DocumentElement);
    }
    private void LoadRootNode(XmlNode xmlNode)
    {
        TreeNode node;

        foreach (XmlElement xe in xmlNode.ChildNodes)
        {
            node = new TreeNode();
            node.Text = xe.GetAttribute("Text");
            node.ImageUrl = xe.GetAttribute("ImageUrl");
            string url = xe.GetAttribute("NavigateUrl");
            string Expand = xe.GetAttribute("Expand");

            if (string.IsNullOrEmpty(url))
            {
                node.SelectAction = TreeNodeSelectAction.Expand;
                if (Expand == "true")
                {
                    node.ExpandAll();
                }
            }
            else
            {
                node.NavigateUrl = url;
                node.SelectAction = TreeNodeSelectAction.SelectExpand;
            }
            this.TreeView1.Nodes.Add(node);
            if (xe.ChildNodes.Count > 0) // 递归加载
            {
                LoadFunNode(node, xe);
            }
        }
    }
    private void LoadFunNode(TreeNode treeNode, XmlNode xmlNode)
    {
        TreeNode node;
        foreach (XmlElement xe in xmlNode.ChildNodes)
        {
            node = new TreeNode();
            node.Text = xe.GetAttribute("Text");
            node.ImageUrl = xe.GetAttribute("ImageUrl");
            string Expand = xe.GetAttribute("Expand");
            if (Expand == "true")
            {
                node.ExpandAll();
            }
            string url = xe.GetAttribute("NavigateUrl") ;

            if (string.IsNullOrEmpty(url))
            {
                node.SelectAction = TreeNodeSelectAction.Expand;
            }
            else
            {
                node.SelectAction = TreeNodeSelectAction.Select;
                TreeNode patNode = treeNode;

                while (patNode.Parent != null)
                {
                    patNode = patNode.Parent;
                }

                node.Text = xe.GetAttribute("Text");
                node.NavigateUrl = xe.GetAttribute("NavigateUrl");
                node.ImageUrl = xe.GetAttribute("ImageUrl");
            }

            treeNode.ChildNodes.Add(node);

            if (xe.ChildNodes.Count > 0) // 递归加载
            {
                LoadFunNode(node, xe);
            }

        }

    }

}
