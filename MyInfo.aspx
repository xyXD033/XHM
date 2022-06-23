<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MyInfo.aspx.cs" Inherits="MyInfo" Title="修改个人信息" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" border="0" cellpadding="0" cellspacing="0" style="height: 263px"
        width="100%">
        <tr>
            <td style="width: 99px; height: 16px">
                <div align="right">
                    会员码：</div>
            </td>
            <td style="height: 16px" width="175">
                <asp:TextBox ID="txtVIPCode" runat="server" ReadOnly="True"></asp:TextBox></td>
            <td style="height: 16px" width="76">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 99px">
                <div align="right">
                    姓名：</div>
            </td>
            <td>
                <asp:TextBox ID="txtVIPName" runat="server" Width="114px"></asp:TextBox></td>
            <td>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtVIPName"
                    ErrorMessage="必填"></asp:RequiredFieldValidator></td>
        </tr>
        <tr style="color: #000000">
            <td style="width: 99px; height: 20px">
                <div align="right">
                    性别：</div>
            </td>
            <td style="height: 20px">
                <asp:RadioButton ID="radbtnMan" runat="server" Checked="True" GroupName="sex" Text="男" />
                <asp:RadioButton ID="radbtnWoman" runat="server" GroupName="sex" Text="女" /></td>
            <td style="height: 20px">
                &nbsp;</td>
        </tr>
        <tr style="color: #000000">
            <td style="width: 99px">
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
            <td style="width: 99px; height: 24px">
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
            <td style="width: 99px; text-align: right">
                E-mail：</td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" Width="186px"></asp:TextBox></td>
            <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="格式错误" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td style="width: 99px; text-align: right">
                备注：</td>
            <td>
                <asp:TextBox ID="txtRemark" runat="server" Height="74px" TextMode="MultiLine" Width="539px"></asp:TextBox></td>
            <td>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center">
                <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="保　存" />&nbsp;
            </td>
        </tr>
    </table>
</asp:Content>

