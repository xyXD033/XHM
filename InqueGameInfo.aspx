<%@ Page Language="C#"   MasterPageFile="~/MasterPage.master"  AutoEventWireup="true" CodeFile="InqueGameInfo.aspx.cs" Inherits="UserManger_InqueGameInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table border="0" align="center" cellpadding="5" cellspacing="1"  style="width: 100%">
  
  <tr bgcolor="#0099cc" >
    <td colspan="2" style="height: 25px"><div align="center" style="color: #ffffff">
        <h4>
            查询游戏信息</h4></div></td>
  </tr>
    <tr >
        <td colspan="2" style="height: 100%">
            <table align="center"  border="0" cellpadding="5" cellspacing="1"
                style="width: 60%">
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
  
</table>

</asp:Content>

