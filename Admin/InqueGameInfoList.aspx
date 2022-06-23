<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InqueGameInfoList.aspx.cs" Inherits="Admin_InqueGameInfoList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
   <title>游戏信息管理</title>

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
            游戏查询结果<asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label></h4></div></td>
  </tr>
    <tr >
        <td colspan="2" style="height: 100%">
            <table align="center"  border="0" cellpadding="5" cellspacing="1"
                style="width: 100%">
                <tr >
                    <td align="left" style="height: 100%">
                        <asp:GridView ID="gvGameManage" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="gvGameManage_PageIndexChanging"
                        OnRowDataBound="gvGameManage_RowDataBound" OnRowDeleting="gvGameManage_RowDeleting"
                        Width="100%">
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:BoundField DataField="gameCode" HeaderText="游戏编码" />
                            <asp:BoundField DataField="gameName" HeaderText="游戏名称" />
                            <asp:BoundField DataField="gameType" HeaderText="游戏类型" />
                            <asp:BoundField DataField="shelf" HeaderText="仓库" />
                            <asp:BoundField DataField="companyName" HeaderText="开发公司" />
                            <asp:BoundField DataField="version" HeaderText="版本" />
                            <asp:BoundField DataField="price" HeaderText="定价" />
                            <asp:BoundField DataField="rentSum" HeaderText="租赁次数" />
                            <asp:TemplateField HeaderText="修改">
                                <ItemTemplate>
                                    <a href="#" onclick="window.open('addGameInfo.aspx?ID=<%#Eval("gameCode") %>','','width=500,height=600')">修改</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                        </Columns>
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <EditRowStyle BackColor="#999999" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView></td>
                </tr>
            </table>
        </td>
    </tr>
  
</table></div>


    </form>
</body>
</html>
