<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FaKuanInque.aspx.cs" Inherits="Admin_FaKuanInque" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
   <title>添加用户信息</title>

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
            罚款信息查询</h4></div></td>
  </tr>
    <tr >
        <td colspan="2" style="height: 100%">
            <table align="center"  border="0" cellpadding="5" cellspacing="1"
                style="width: 100%">
                <tr >
                    <td align="left" style="height: 100%">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td style="height: 23px;" align="center" width="100%">
                    &nbsp;选择查询条件：<asp:DropDownList ID="ddlCondition" runat="server" Width="92px" >
                        <asp:ListItem Value="gameCode">游戏编码</asp:ListItem>
                        <asp:ListItem Value="gameName">游戏名称</asp:ListItem>
                        <asp:ListItem Value="VIPCode">会员码</asp:ListItem>
                    </asp:DropDownList>
                  <asp:TextBox ID="txtKey" runat="server"></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="搜索" Width="53px" />
                    &nbsp; &nbsp; &nbsp;
                    <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label></td>
            </tr>
            <tr>
                <td style="height: 122px">
                    <asp:GridView ID="gvCardRent" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" OnPageIndexChanging="gvCardRent_PageIndexChanging" PageSize="10">
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:BoundField DataField="gameCode" HeaderText="游戏编码" />
                            <asp:BoundField DataField="gameName" HeaderText="游戏名称" />
                            <asp:BoundField DataField="rentTime" DataFormatString="{0:yy-MM-dd}" HeaderText="租赁日期"
                                HtmlEncode="False" />
                            <asp:BoundField DataField="returnTime" DataFormatString="{0:yy-MM-dd}" HeaderText="应还日期" />
                            <asp:BoundField DataField="VIPCode" HeaderText="会员码" />
                            <asp:BoundField DataField="VIPName" HeaderText="会员名称" />
                                <asp:BoundField DataField="fakuan" HeaderText="罚款金额" />
                 
                        </Columns>
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <EditRowStyle BackColor="#999999" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>
                
                </td>
            </tr>
        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
  
</table></div>


    </form>
</body>
</html>
