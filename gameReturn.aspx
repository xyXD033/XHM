<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="gameReturn.aspx.cs" Inherits="gameReturn" Title="归还" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="0" align="center" cellpadding="5" cellspacing="1"  style="width: 100%">
  
  <tr bgcolor="#0099cc" >
    <td colspan="2" style="height: 25px"><div align="center" style="color: #ffffff">
        <h4>
            卡带归还</h4></div></td>
  </tr>
    <tr >
        <td colspan="2" style="height: 100%">
            <table align="center"  border="0" cellpadding="5" cellspacing="1"
                style="width: 100%">
                <tr >
                    <td align="center" style="height: 100%">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td style="width: 106px; height: 29px; text-align: right">
                                姓名：</td>
                            <td style="width: 100px; height: 29px">
                                <asp:TextBox ID="txtVIPName" runat="server" Width="108px" ReadOnly="True"></asp:TextBox></td>
                            <td style="width: 100px; height: 29px; text-align: center">
                                证件号码：</td>
                            <td style="width: 100px; height: 29px">
                                <asp:TextBox ID="txtCertificate" runat="server" Width="112px" ReadOnly="True"></asp:TextBox></td>
                            <td style="width: 100px; height: 29px; text-align: center">
                                会员类型：</td>
                            <td style="width: 75px; height: 29px">
                                <asp:TextBox ID="txtVIPType" runat="server" Width="106px" ReadOnly="True"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 106px; text-align: right; height: 33px;">
                                剩余金额：</td>
                            <td style="width: 100px; height: 33px;">
                                <asp:TextBox ID="txtMoney" runat="server" Width="108px" ReadOnly="True"></asp:TextBox></td>
                            <td style="width: 100px; text-align: center; height: 33px;">
                                已租数量：</td>
                            <td style="width: 100px; height: 33px;">
                                <asp:TextBox ID="txtAlready" runat="server" ReadOnly="True"></asp:TextBox></td>
                            <td style="width: 100px; text-align: center; height: 33px;">
                                可租数量：</td>
                            <td style="width: 75px; height: 33px;">
                                <asp:TextBox ID="txtNum" runat="server" Width="106px" ReadOnly="True"></asp:TextBox></td>
                        </tr>
                    </table>
                    </td>
                </tr>
                <tr>
                    <td align="center" style="height: 100%"><asp:GridView ID="gvGameReturn" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        ForeColor="#333333" GridLines="None" OnSelectedIndexChanging="gvGameReturn_SelectedIndexChanging"
                        PageSize="5" Width="100%">
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:BoundField DataField="gameCode" HeaderText="游戏编码" />
                            <asp:BoundField DataField="gameName" HeaderText="游戏名称" />
                            <asp:BoundField DataField="rentTime" DataFormatString="{0:yyy-MM-dd}" HeaderText="租赁时间"
                                HtmlEncode="False" />
                            <asp:BoundField DataField="returnTime" DataFormatString="{0:yyyy-MM-dd}" HeaderText="应还时间"
                                HtmlEncode="False" />
                            <asp:BoundField DataField="VIPName" HeaderText="租赁人" />
                            <asp:CommandField HeaderText="归还" SelectText="归还" ShowSelectButton="True" />
                        </Columns>
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <EditRowStyle BackColor="#999999" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
  
</table>
</asp:Content>

