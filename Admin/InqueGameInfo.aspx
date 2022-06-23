<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InqueGameInfo.aspx.cs" Inherits="Admin_InqueGameInfo" %>

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
            查询游戏信息</h4></div></td>
  </tr>
    <tr >
        <td colspan="2" style="height: 100%">
            <table align="center"  border="0" cellpadding="5" cellspacing="1"
                style="width: 100%">
                <tr >
                    <td align="left" style="height: 100%">
                        <table align="center" border="0" cellpadding="0" cellspacing="0" style="height: 112px"
                            width="100%">
                            <tr>
                                <td align="right" style="width: 88px; height: 16px">
                                    <div align="right">
                                        游戏编码：</div>
                                </td>
                                <td style="height: 16px" width="175">
                                    <asp:TextBox ID="txtGameCode" runat="server"></asp:TextBox></td>
                                <td style="height: 16px" width="76">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 88px">
                                    <div align="right">
                                        游戏名称：</div>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtGameName" runat="server" Width="114px"></asp:TextBox></td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 88px">
                                    <div align="right">
                                        游戏类型：</div>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlGameType" runat="server" Width="112px">
                                    </asp:DropDownList></td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="3" style="text-align: center">
                                    &nbsp;<asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="搜索" />
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
