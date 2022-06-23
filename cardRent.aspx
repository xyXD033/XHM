 <%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="cardRent.aspx.cs" Inherits="cardRent" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" border="0" cellpadding="5" cellspacing="1" style="width: 100%">
        <tr bgcolor="#0099cc">
            <td colspan="2" style="height: 25px">
                <div align="center" style="color: #ffffff">
                    <h4>
                        卡带租赁</h4>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="height: 100%">
                <table align="center" border="0" cellpadding="5" cellspacing="1" style="width: 100%">
                    <tr>
                        <td align="left" style="height: 100%">
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td style="width: 106px; height: 29px; text-align: right">
                                                    姓名：</td>
                                                <td style="width: 100px; height: 29px">
                                                    <asp:TextBox ID="txtVIPName" runat="server" Width="108px" ReadOnly="True"></asp:TextBox></td>
                                                <td style="width: 100px; height: 29px; text-align: center">
                                                    证件号：</td>
                                                <td style="width: 104px; height: 29px">
                                                    <asp:TextBox ID="txtCertificate" runat="server" Width="112px" ReadOnly="True"></asp:TextBox></td>
                                                <td style="width: 100px; height: 29px; text-align: center">
                                                    会员类型：</td>
                                                <td style="width: 75px; height: 29px">
                                                    <asp:TextBox ID="txtVIPType" runat="server" Width="106px" ReadOnly="True"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 106px; height: 33px; text-align: right">
                                                    可租天数：</td>
                                                <td style="width: 100px; height: 33px">
                                                    <asp:TextBox ID="TxtDate" runat="server" Width="108px" ReadOnly="True"></asp:TextBox></td>
                                                <td style="width: 100px; height: 33px; text-align: center">
                                                    已租数量：</td>
                                                <td style="width: 104px; height: 33px">
                                                    <asp:TextBox ID="txtAlready" runat="server" ReadOnly="True"></asp:TextBox></td>
                                                <td style="width: 100px; height: 33px; text-align: center">
                                                    可租数量：</td>
                                                <td style="width: 75px; height: 33px">
                                                    <asp:TextBox ID="txtNum" runat="server" Width="106px" ReadOnly="True"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 106px; height: 33px; text-align: right">
                                                    现有金额：</td>
                                                <td style="width: 100px; height: 33px">
                                                    <asp:TextBox ID="txtMoney" runat="server" ReadOnly="True" Width="108px"></asp:TextBox></td>
                                                <td style="width: 100px; height: 33px; text-align: center">
                                                    可租总数：</td>
                                                <td style="width: 104px; height: 33px">
                                                    <asp:TextBox ID="txtZong" runat="server" ReadOnly="True" Width="108px"></asp:TextBox>
                                                </td>
                                                <td style="width: 100px; height: 33px; text-align: center">
                                                </td>
                                                <td style="width: 75px; height: 33px">
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        游戏编码：<asp:TextBox ID="txtGameCode" runat="server" ValidationGroup="2" Width="178px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtgameCode"
                                            Display="Dynamic" ErrorMessage="不能为空" ValidationGroup="2"></asp:RequiredFieldValidator>
                                        <asp:Button ID="btnGameSearch" runat="server" OnClick="btnGameSearch_Click" Text="查找游戏"
                                            ValidationGroup="2" />
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;<asp:GridView ID="gvCardRent" runat="server" AutoGenerateColumns="False"
                                            CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDataBound="gvCardRent_RowDataBound"
                                            OnSelectedIndexChanging="gvCardRent_SelectedIndexChanging" PageSize="5" Width="100%">
                                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                            <Columns>
                                                <asp:BoundField DataField="gameName" HeaderText="游戏名称" />
                                                <asp:BoundField DataField="gameType" HeaderText="游戏类型" />
                                                <asp:BoundField DataField="companyName" HeaderText="开发公司" />
                                                <asp:BoundField DataField="version" HeaderText="版本" />
                                                <asp:BoundField DataField="price" HeaderText="定价" />
                                                <asp:CommandField HeaderText="租赁" SelectText="租赁" ShowSelectButton="True" />
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
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

