<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addVIPInfo.aspx.cs" Inherits="Admin_addVIPInfo" %>

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
            会员信息管理</h4></div></td>
  </tr>
    <tr >
        <td colspan="2" style="height: 100%">
            <table align="center"  border="0" cellpadding="5" cellspacing="1"
                style="width: 100%">
                <tr >
                    <td align="left" style="height: 100%">
                        <table align="center" border="0" cellpadding="0" cellspacing="0" style="height: 263px"
                            width="100%">
                            <tr>
                                <td style="width: 99px; height: 16px" align="center">
                                    <div align="center">
                                        会员码：</div>
                                </td>
                                <td style="height: 16px" width="175">
                                    <asp:TextBox ID="txtVIPCode" runat="server"></asp:TextBox></td>
                                <td style="height: 16px" width="76">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 99px" align="center">
                                    <div align="center">
                                        姓名：</div>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtVIPName" runat="server" Width="114px"></asp:TextBox></td>
                                <td>
                                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtVIPName"
                                        ErrorMessage="必填"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr style="color: #000000">
                                <td align="center" style="width: 99px; height: 28px">
                                    登录密码：</td>
                                <td style="height: 28px">
                                    <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Width="114px"></asp:TextBox></td>
                                <td style="height: 28px">
                                </td>
                            </tr>
                            <tr style="color: #000000">
                                <td style="width: 99px; height: 20px" align="center">
                                    <div align="center">
                                        性别：</div>
                                </td>
                                <td style="height: 20px">
                                    <asp:RadioButton ID="radbtnMan" runat="server" Checked="True" GroupName="sex" Text="男" />
                                    <asp:RadioButton ID="radbtnWoman" runat="server" GroupName="sex" Text="女" /></td>
                                <td style="height: 20px">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 99px" align="center">
                                    <div align="right">
                                        会员类型：</div>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlVIPType" runat="server" Width="114px">
                                    </asp:DropDownList></td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr style="color: #000000">
                                <td style="width: 99px" align="center">
                                    <div align="right">
                                        证件号码：</div>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCertificate" runat="server" Width="307px"></asp:TextBox></td>
                                <td>
                                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCertificate"
                                        ErrorMessage="必填"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td style="width: 99px; height: 24px" align="center">
                                    <div align="right">
                                        联系电话：</div>
                                </td>
                                <td style="height: 24px">
                                    <asp:TextBox ID="txtTel" runat="server" Width="161px"></asp:TextBox></td>
                                <td style="height: 24px">
                                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtTel"
                                        ErrorMessage="必填"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td style="width: 99px; text-align: right" align="center">
                                    E-mail：</td>
                                <td>
                                    <asp:TextBox ID="txtEmail" runat="server" Width="186px"></asp:TextBox></td>
                                <td>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                                        ErrorMessage="格式错误" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
                            </tr>
                            <tr>
                                <td style="width: 99px; text-align: right; height: 82px;" align="center">
                                    备注：</td>
                                <td style="height: 82px">
                                    <asp:TextBox ID="txtRemark" runat="server" Height="74px" TextMode="MultiLine" Width="539px"></asp:TextBox></td>
                                <td style="height: 82px">
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
