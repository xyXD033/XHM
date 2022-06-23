<%@ Page Language="C#" AutoEventWireup="true" CodeFile="main.aspx.cs" Inherits="main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>小红帽电玩卡带租赁</title>
    <link href="Style/Main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <table style="width: 100%; height: 100%; table-layout: fixed" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td height="31">
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
	
			<tr>
				<td class="TopLeft"><span class="TopInfo">欢迎：<asp:Literal ID="txtStf" runat="server"></asp:Literal>使用本系统</span></td>
				<td class="TopBg">
					<table cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td class="TopAle" nowrap></td>
							<td class="TopTxt" nowrap><a href="Desktop.aspx?Name=<%=Name %>&Power=<%=Power %>" target="MainFrame">桌面</a></td>
							<td class="TopAle" nowrap></td>
							<td class="TopTxt" nowrap><a href="javascript:history.go(-1);">后退</a></td>  
							<td class="TopAle" nowrap></td>
							<td class="TopTxt" nowrap><a href="javascript:history.go(1);">前进</a></td>
							<td class="TopAle" nowrap></td>
							<td class="TopTxt" nowrap><a href="Logout.aspx" target="MainFrame">退出登录</a></td>
							<td class="TopAle" nowrap></td>
							<td class="TopTxt" nowrap><a href="Exit.aspx"   target="MainFrame">退出系统</a></td>
						</tr>
					</table>		
				</td>
                <td class="TopBg">
                </td>
				<td class="TopRightImg"></td>
				<td class="TopRightBg"></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr >
		<td>
			<table cellpadding="0" cellspacing="0" border="0" width="100%" height="100%">
				<tr>
					<td style="width:180px; vertical-align:top; background:#E7F5FD; height: 615px;" id="frmleft">
					<iframe src="MenuTree.aspx?Name=<%=Name %>&Power=<%=Power %>" style="width: 100%; height: 600px; " frameborder="0"></iframe></td>
					<td style="width:6px; background:url(Images/switchbg.gif); vertical-align:middle; white-space:nowrap; height: 615px;"  id="splitBar">
						<img src="Images/splitBar.gif" id="switchPoint" onClick="switchSysBar()" style="CURSOR:hand" title="关闭/打开左边导航栏">
					</td>
					<td style="height: 615px">
						<table cellpadding="0" cellspacing="0" border="0" height="100%" width="100%">
							<tr>								
								<td>
									<iframe name="MainFrame" id="mainfrm" src="Desktop.aspx?Name=<%=Name %>&Power=<%=Power %>" style="width: 100%; height: 600px; " frameborder="0"> </iframe>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr >
		<td height=20px valign=bottom>
			<table cellpadding="0" cellspacing="0" border="0" width="100%" height="100%">
				<tr>
					<td valign="bottom" style="height: 20px">
		 	                   <iframe src="Bottom.aspx?Name=<%=Name %>" scrolling="no" style="width: 100%; height:20px" frameborder="0"> </iframe>
                        </td>
					
				</tr>
			</table>
		</td>
	</tr>
  </table> 
    </form>
    <script language="javascript">
    if(window.top.location.href != window.location.href)
    {
        window.top.location.href = window.location.href;
    }
	function switchSysBar(){
		var frmleft1=document.getElementById("frmleft");
		var switchPoint1=document.getElementById("switchPoint");
		frmleft1.style.display=frmleft1.style.display==""?"none":"";
		switchPoint1.src=frmleft1.style.display==""?"Images/splitBar.gif":"Images/splitBar2.gif";
	}	
</script>
</body>
</html>
