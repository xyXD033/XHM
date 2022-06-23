<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddMoney.aspx.cs" Inherits="Admin_AddMoney" %>

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
            充值管理</h4></div></td>
  </tr>
    <tr >
        <td colspan="2" style="height: 100%">
            <table align="center"  border="0" cellpadding="5" cellspacing="1"
                style="width: 100%">
                <tr >
                    <td align="left" style="height: 100%">
                        <table align="center" border="0" cellpadding="0" cellspacing="0" style="height: 88px"
                            width="100%">
                            <tr>
                                <td style="width: 99px; height: 16px" align="center">
                                    <div align="center">
                                        会员码：</div>
                                </td>
                                <td style="height: 16px" width="175">
                                    <asp:TextBox ID="txtVIPCode" runat="server" ReadOnly="True"></asp:TextBox></td>
                                <td style="height: 16px" width="76">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 99px" align="center">
                                    <div align="center">
                                        &nbsp;&nbsp;
                                        现有金额：</div>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtMoney" runat="server" Width="114px" ReadOnly="True"></asp:TextBox></td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 99px; text-align: right" align="center">
                                    充值金额：</td>
                                <td>
                                    <asp:TextBox ID="txtchong" runat="server" Width="186px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtchong"
                                        ErrorMessage="必填" Width="40px"></asp:RequiredFieldValidator></td>
                                <td>
                                    </td>
                            </tr>
                            <tr>
                                <td colspan="3" style="text-align: center">
                                    <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="保　存" />&nbsp;
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
