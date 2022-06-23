<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShowGame.aspx.cs" Inherits="ShowGame" Title="游戏详情" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" border="0" cellpadding="0" cellspacing="0" style="height: 263px"
        width="100%">
        <tr>
            <td align="right" style="width: 116px; height: 16px">
                <div align="right">
                    游戏编码：</div>
            </td>
            <td style="height: 16px" width="175">
                <asp:TextBox ID="txtGameCode" runat="server" ReadOnly="True"></asp:TextBox></td>
            <td style="height: 16px" width="76">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" style="width: 116px">
                <div align="right">
                    游戏名称：</div>
            </td>
            <td>
                <asp:TextBox ID="txtGameName" runat="server" Width="374px" ReadOnly="True"></asp:TextBox></td>
            <td>
            </td>
        </tr>
        <tr style="color: #000000">
            <td align="right" style="width: 116px; height: 22px">
                <div align="right">
                    游戏类型：</div>
            </td>
            <td style="height: 22px">
                <asp:TextBox ID="ddlGameType" runat="server" Width="114px" ReadOnly="True"></asp:TextBox></td>
            <td style="height: 22px">
            </td>
        </tr>
        <tr style="color: #000000">
            <td align="right" style="width: 116px">
                开发公司：</td>
            <td>
                <asp:TextBox ID="companyName" runat="server" Width="114px" ReadOnly="True"></asp:TextBox></td>
            <td>
            </td>
        </tr>
        <tr style="color: #000000">
            <td align="right" style="width: 116px; height: 23px">
                <div align="right">
                    卡带版本：</div>
            </td>
            <td style="height: 23px">
                <asp:TextBox ID="txtVersion" runat="server" Width="116px" ReadOnly="True"></asp:TextBox></td>
            <td style="height: 23px">
                &nbsp;</td>
        </tr>
        <tr style="color: #000000">
            <td align="right" style="width: 116px; height: 23px;">
                <div align="right">
                    价格：</div>
            </td>
            <td style="height: 23px">
                <asp:TextBox ID="txtPrice" runat="server" Width="116px" ReadOnly="True"></asp:TextBox></td>
            <td style="height: 23px">
            </td>
        </tr>
        <tr style="color: #000000">
            <td align="right" style="width: 116px; height: 29px">
                总数量：</td>
            <td style="height: 29px">
                <asp:TextBox ID="txtZong" runat="server" ReadOnly="True"></asp:TextBox></td>
            <td style="height: 29px">
            </td>
        </tr>
        <tr style="color: #000000">
            <td align="right" style="width: 116px; height: 29px">
                可租数量：</td>
            <td style="height: 29px">
                <asp:TextBox ID="txtKe" runat="server" ReadOnly="True"></asp:TextBox></td>
            <td style="height: 29px">
            </td>
        </tr>
        <tr>
            <td align="right" style="width: 116px; height: 30px">
                <div align="right">
                    仓库：</div>
            </td>
            <td style="height: 30px">
                <asp:TextBox ID="ddlShelf" runat="server" ReadOnly="True"></asp:TextBox></td>
            <td style="height: 30px">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" style="width: 116px; height: 30px">
                入库时间：</td>
            <td style="height: 30px">
                <asp:TextBox ID="txtDate" runat="server" onclick="fPopCalendar(event,this,this)"
                    onfocus="this.select()" ReadOnly="True"></asp:TextBox></td>
            <td style="height: 30px">
            </td>
        </tr>
        <tr>
            <td align="right" style="width: 116px; height: 97px">
                游戏简介：</td>
            <td style="height: 97px">
                <asp:TextBox ID="TextBox1" runat="server" Height="121px" TextMode="MultiLine" Width="460px" ReadOnly="True"></asp:TextBox></td>
            <td style="height: 97px">
            </td>
        </tr>
        <tr>
            <td colspan="3" style="height: 24px; text-align: center">
                &nbsp;
            </td>
            <td class="TopTxt" nowrap><a href="javascript:history.go(-1);">后退</a></td> 
        </tr>
    </table>
</asp:Content>

