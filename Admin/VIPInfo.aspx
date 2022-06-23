<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VIPInfo.aspx.cs" Inherits="Admin_VIPInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
   <title>会员信息管理</title>

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
            会员信息管理</h4></div></td>
  </tr>
    <tr >
        <td colspan="2" style="height: 100%">
            <table align="center"  border="0" cellpadding="5" cellspacing="1"
                style="width: 100%">
                <tr >
                    <td align="left" style="height: 100%">
                    <asp:GridView ID="gvVIPInfo" runat="server" AutoGenerateColumns="False" Width="100%" AllowPaging="True"  OnPageIndexChanging="gvVIPInfo_PageIndexChanging" OnRowDeleting="gvVIPInfo_RowDeleting" CellPadding="4" GridLines="None">
                        <Columns>
                        <asp:BoundField HeaderText="会员码" DataField="VIPCode" />
                            <asp:BoundField HeaderText="姓名" DataField="userName" />
                            <asp:BoundField HeaderText="性别" DataField="sex" />
                         
                            <asp:BoundField HeaderText="会员类型" DataField="VIPType" />
                            <asp:BoundField HeaderText="证件号码" DataField="certificate" />
                            <asp:BoundField HeaderText="联系电话" DataField="tel" />
                            <asp:BoundField DataField="email" HeaderText="E-mail" />
                                      <asp:BoundField DataField="MoneyInfo" HeaderText="金额" />
                            <asp:BoundField HeaderText="备注" DataField="remark" />
                            <asp:TemplateField HeaderText="修改">
                                <ItemTemplate>
                                   <a href="#"  onclick="window.open('addVIPInfo.aspx?Userid=<%#Eval("Userid") %>','','width=500,height=600')">修改</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="充值">
                                <ItemTemplate>
                                   <a href="#"  onclick="window.open('AddMoney.aspx?Userid=<%#Eval("Userid") %>','','width=500,height=600')">充值</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField HeaderText="删除" ShowDeleteButton="True" >
                                <ControlStyle Font-Underline="False" />
                            </asp:CommandField>
                        </Columns>
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <EditRowStyle BackColor="#999999" />
                        <SelectedRowStyle BackColor="#E2DED6"　 Font-Bold="True" ForeColor="#333333"  />
                        <PagerStyle BackColor="#284775"　ForeColor="White"  HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
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
