<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserLogin.ascx.cs" Inherits="UserLogin" %>
<table width="100%">
    <tr>
        <td colspan="3" style="text-align: center; height: 20px;">
            <table id="Login2" runat="server" align="center" border="0" cellpadding="1" cellspacing="0"
                style="width: 183px">
                <tr>
                    <td style="height: 18px">
                    </td>
                    <td align="middle" style="height: 18px">
                    </td>
                </tr>
                <tr>
                    <td nowrap="nowrap">
                        <div align="right">
                            <span>帐号: </span>
                        </div>
                    </td>
                    <td align="left">
                        <asp:TextBox ID="TxtUserName" runat="server" ValidationGroup="3" Width="144px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td align="left">
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <span>密码: </span>
                    </td>
                    <td align="left">
                        <asp:TextBox ID="TxtPassword" runat="server" TextMode="Password" ValidationGroup="3"
                            Width="142px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td align="left">
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2" style="height: 26px">
                        <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="用户登陆" ValidationGroup="3" />&nbsp;
                        </td>
                </tr>
            </table>
            <table id="Login1" runat="server" align="center" border="0" cellpadding="1" cellspacing="0"
                style="width: 191px">
                <tr>
                    <td style="width: 52px">
                    </td>
                    <td align="middle" style="width: 166px">
                    </td>
                </tr>
                <tr>
                    <td nowrap="nowrap" style="width: 52px">
                        <div align="right">
                            <span>欢迎: </span>
                        </div>
                    </td>
                    <td align="left" style="width: 166px">
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                        </td>
                </tr>
                <tr>
                    <td colspan="2" nowrap="nowrap">
                        当前金额：<asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td align="center" colspan="2" style="height: 26px">
                        <asp:Button ID="btnLogout" runat="server" CausesValidation="False" class="btn" OnClick="btnLogout_Click"
                            Text="注销" /><br />
                        <asp:LinkButton ID="lbtnModiPwd" runat="server" CausesValidation="False" OnClick="lbtnModiPwd_Click">修改登陆密码</asp:LinkButton><br />
                        <asp:LinkButton ID="lbtnModiInfo" runat="server" CausesValidation="False" OnClick="lbtnModiInfo_Click">修改个人信息</asp:LinkButton></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="3" style="text-align: center">
            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" CausesValidation="False">用户注册</asp:LinkButton></td>
    </tr>
</table>