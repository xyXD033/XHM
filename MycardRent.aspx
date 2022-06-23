<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MycardRent.aspx.cs" Inherits="MycardRent" Title="我的租赁信息" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="gvGameManage" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="gvGameManage_PageIndexChanging"
        Width="100%" PageSize="15">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:BoundField DataField="gameCode" HeaderText="游戏编码" />
            <asp:BoundField DataField="gameName" HeaderText="游戏名称" />
            <asp:BoundField DataField="rentTime" DataFormatString="{0:yyy-MM-dd}" HeaderText="租赁时间"
                HtmlEncode="False" />
            <asp:BoundField DataField="VIPName" HeaderText="租赁人" />
            <asp:BoundField DataField="isReturn" HeaderText="是否归还" />
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
</asp:Content>

