<%@ Page Language="C#" AutoEventWireup="true" CodeFile="shelfManage.aspx.cs" Inherits="Admin_shelfManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
   <title>仓库信息管理</title>

<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
body,td,th {
	font-size: 9pt;
}
body {
	margin-left: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	margin-top: 0px;
}
    .style1
    {
        width: 55px;
    }
-->
</style>
<script language="javascript" type="text/javascript">
</script>
</head>
<body >
    <form id="form1" runat="server">
<div>
<table border="0" align="center" cellpadding="5" cellspacing="1"  style="width: 100%">
  
  <tr bgcolor="#0099cc" >
    <td colspan="2" style="height: 25px"><div align="center" style="color: #ffffff">
        <h4>
            仓库信息管理</h4></div></td>
  </tr>
    <tr >
        <td colspan="2" style="height: 100%">
            <table align="center"  border="0" cellpadding="5" cellspacing="1"
                style="width: 100%">
                <tr >
                    <td align="left" style="height: 100%">
                        <asp:GridView ID="gvShelf" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            CellPadding="4" ForeColor="#333333"  GridLines="None" Height="1px"
                            OnPageIndexChanging="gvShelf_PageIndexChanging" OnRowDeleting="gvShelf_RowDeleting"
                            Width="100%">
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <Columns>
                                <asp:BoundField DataField="ShelfName" HeaderText="仓库名称" />
                                <asp:TemplateField HeaderText="修改">
                                    <ItemTemplate>
                                               <a href="#" class="huise1" onclick="window.open('addShelf.aspx?ShelfID=<%#Eval("ShelfID") %>','','width=300,height=300')">修改</a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField HeaderText="删除" ShowDeleteButton="True">
                                    <ControlStyle Font-Underline="False" />
                                </asp:CommandField>
                            </Columns>
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#999999" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                 
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
  
</table></div>


    </form>
</body>
</html>
