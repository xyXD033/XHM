<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addUser.aspx.cs" Inherits="Admin_addUser" %>

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
            账号信息管理</h4></div></td>
  </tr>
    <tr >
        <td colspan="2" style="height: 100%">
            <table align="center"  border="0" cellpadding="5" cellspacing="1"
                style="width: 100%">
                <tr >
                    <td align="left" style="height: 100%">
                        <table align="center" border="0" cellpadding="0" cellspacing="0" height="125" width="100%">
                            <tr>
                                <td align="center" style="width: 79px; height: 24px; text-align: right">
                                    登录名称：</td>
                                <td style="height: 24px" width="105">
                                    <asp:TextBox ID="txtUserName" runat="server" Width="185px"></asp:TextBox></td>
                                <td style="height: 24px" width="110">
                                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server"
                                        ControlToValidate="txtUserName" ErrorMessage="名称不能为空"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr style="color: #000000">
                                <td align="center" style="width: 79px; text-align: right">
                                    登录密码：</td>
                                <td>
                                    <asp:TextBox ID="txtPass" runat="server" TextMode="Password" Width="184px"></asp:TextBox></td>
                                <td>
                                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorPass" runat="server"
                                        ControlToValidate="txtPass" ErrorMessage="密码不能为空"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr style="color: #000000">
                                <td align="center" style="width: 79px; text-align: right">
                                    确认密码：</td>
                                <td>
                                    <asp:TextBox ID="txtQpass" runat="server" TextMode="Password" Width="185px"></asp:TextBox></td>
                                <td>
                                    &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPass"
                                        ControlToValidate="txtQpass" ErrorMessage="密码不一致" Width="80px"></asp:CompareValidator><asp:RequiredFieldValidator ID="RequiredFieldValidatorPass0" runat="server"
                                        ControlToValidate="txtQpass" ErrorMessage="请再输入一遍"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td colspan="3" style="height: 24px; text-align: center">
                                    &nbsp;<asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="保 存" />
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
