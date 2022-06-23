<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ModifyMyPwd.aspx.cs" Inherits="ModifyMyPwd" Title="修改密码" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 135px">
        <tr>
            <td style="width: 100px">
                登录账号：</td>
            <td style="width: 100px">
                <asp:TextBox ID="txtUserName" runat="server" ReadOnly="True" Width="138px"></asp:TextBox></td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td style="width: 100px">
                旧密码：</td>
            <td style="width: 100px">
                <asp:TextBox ID="txtOldPass" runat="server" TextMode="Password"></asp:TextBox></td>
            <td style="width: 100px">
            </td>
        </tr>
        <tr>
            <td style="width: 100px">
                新密码：</td>
            <td style="width: 100px">
                <asp:TextBox ID="txtNewPass" runat="server" TextMode="Password"></asp:TextBox></td>
            <td>
                <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="新旧密码不可相同" Operator="NotEqual" ControlToCompare="txtOldPass" ControlToValidate="txtNewPass"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 100px">
                确认新密码：</td>
            <td style="width: 100px">
                <asp:TextBox ID="txtQNewPass" runat="server" TextMode="Password"></asp:TextBox></td>
            <td style="width: 100px">
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPass" ControlToValidate="txtQNewPass" ErrorMessage="密码不一致"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="保　存" /></td>
        </tr>
    </table>
</asp:Content>

