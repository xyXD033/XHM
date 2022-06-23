<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="gameList.aspx.cs" Inherits="gameList" Title="游戏信息" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="gvGameManage" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="gvGameManage_PageIndexChanging"
        OnRowDataBound="gvGameManage_RowDataBound"
        Width="100%" PageSize="15">
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:BoundField DataField="gameCode" HeaderText="游戏编码" />
            <asp:BoundField DataField="gameName" HeaderText="游戏名称" />
            <asp:BoundField DataField="gameType" HeaderText="游戏类型" />
            <asp:BoundField DataField="shelf" HeaderText="仓库" />
            <asp:BoundField DataField="companyName" HeaderText="开发公司" />
            <asp:BoundField DataField="version" HeaderText="版本" />
            <asp:BoundField DataField="price" HeaderText="定价" />
            <asp:BoundField DataField="rentSum" HeaderText="租赁次数" />
            <asp:TemplateField HeaderText="查看">
                <ItemTemplate>
                     	<a href='ShowGame.aspx?ID=<%#Eval("gameCode")%>' >
											查看</a>
                </ItemTemplate>
            </asp:TemplateField>
            
        </Columns>
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <EditRowStyle BackColor="#999999" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
</asp:Content>

