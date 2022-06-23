<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addShelf.aspx.cs" Inherits="Admin_addShelf" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
   <title>添加仓库信息</title>

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
                        <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" style="height: 52px">
                            <tr>
                                <td align="center" style="width: 79px; height: 24px; text-align: right">
                                    仓库名称：</td>
                                <td style="height: 24px" width="105">
                                    <asp:TextBox ID="txtShelf" runat="server" Width="207px"></asp:TextBox></td>
                                <td style="height: 24px" width="110">
                                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server"
                                        ControlToValidate="txtShelf" ErrorMessage="名称不能为空"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td colspan="3" style="height: 24px; text-align: center">
                                    &nbsp;<asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="保　存" />
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
