<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="UserLogin.ascx" TagName="UserLogin" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>小红帽电玩卡带租赁</title>
    <link href="style/css.css" rel="stylesheet" type="text/css"/>
    <style type="text/css">
        .auto-style1 {
            margin-bottom: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header w_980" style="left: 0px; top: 0px">
            <asp:Image ID="Image1" runat="server" Height="112px" ImageUrl="~/images/Logo.gif"
                Width="976px" /></div>      
      <div class="topmenu w_980">
      <a href="Default.aspx">首页</a>|           
       <a href="UserStReg.aspx">用户注册</a>|         
            <a href="gameList.aspx">游戏信息</a>|
       
            <a href="InqueGameInfo.aspx">游戏查询</a>|
              <a href="cardRent.aspx">在线租</a>|
              
                  <a href="gameReturn.aspx">归还</a>|
                  <a href="gameXuZu.aspx">续租</a>|
            <a href="MycardRent.aspx">我的租赁信息</a>|
            
        </div>
        <div class="w_980">
            <div class="w_260 fl">
                    <div class="t_1"><div><a href="#">用户中心</a></div></div>
                    <div class="f_1 pa20 h26 mb10" style="font-size:14px;">
                        <uc1:UserLogin ID="UserLogin1" runat="server" />
                      
                    </div>
                    <div class="t_1"><div><a href="#">热门游戏&gt;&gt;</a></div></div>
                    <div class="f_2 pa15 mb10">
                        <asp:DataList ID="dlHot" runat="server" ForeColor="#333333" RepeatColumns="1"
                            Width="222px">
                            <ItemTemplate>
                                <li style="left: 0px; top: 0px"><a href='<%#Eval("gameCode","ShowGame.aspx?id={0}")%>'>
                                    <%#Eval("gameName").ToString().Length > 38 ? CutChar(Eval("gameName").ToString(), 38) + "..." : Eval("gameName")%>
                                </a></li>
                            </ItemTemplate>
                        </asp:DataList>&nbsp;</div>
                 
                  
             </div>
             <div class="w_710 fr" style="font-size:14px;">
                
                <p class="h25" style="font-size:14px;">
                    </p>
                    <div runat=server id="About"></div>
                <div class="clear_all"></div>
                <div class="w_350 clear fl" style="width: 704px">
                    <div class="t_2"><a href="#" class="auto-style1">最新游戏</a></div>
                    <div style="height:163px; overflow:hidden;">
                     <ul class="list_2 list_ico_1">
                     
                     <asp:DataList ID="dlNews" runat="server"   ForeColor="#333333" Width="672px" RepeatColumns="2">
                            <ItemTemplate>
                      
                       <li style="left: 0px; top: 0px"> <a href='<%#Eval("gameCode","ShowGame.aspx?id={0}")%>'>
                                        <%#Eval("gameName").ToString().Length > 38 ? CutChar(Eval("gameName").ToString(), 38) + "..." : Eval("gameName")%>
                                    </a> </li>  
                            </ItemTemplate>
                           
                        </asp:DataList>
                       </ul> </div>
                </div>
                 <div class="clear"></div>
                    &nbsp;
                <div class="clear"></div>
             </div>
        </div>
        <div class="foot w_980">
            <div class="footmenu">
               
            </div>
            <p style="font-size:14px; text-align:center;">
                卡带租赁管理系统 版权所有  
      
            </p>
            <p style="font-size: 14px; text-align: center">
                <a href="Login.aspx">管理员登陆</a>
            </p>
       </div>
    </form>

</body>
</html>
