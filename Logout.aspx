<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Logout.aspx.cs" Inherits="Logout" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>退出登录</title>
     <link href="Style/main.css" rel="stylesheet" type="text/css">
    <link href="Style/window.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
        function reopen()
        {
			ALLgoToURL('parent','Login.aspx');
        } 
        function ALLgoToURL() { 
          var i, args=ALLgoToURL.arguments; 
          document.MM_returnValue = false;
          for (i=0; i<(args.length-1); i+=2) 
            eval(args[i]+".location='"+args[i+1]+"'");
        }     
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <p style="margin:10%;"></p>
    <table cellpadding="0" cellspacing="0" border="0" width="350" bgcolor="#FFFFFF" align="center">
	<tr>
		<td class="wtabtitleleft wtabtitletxt" nowrap="nowrap">退出登录</td>
		<td class="wtabtitleright"></td>
	</tr>
	<tr>
		<td class="wtabcontent" colspan="2" style="height:100">
		<div style="float:left;width:80px;">
		<img src="images/logout.gif" border="0" align="absmiddle" />
		</div>
		<div style="float:left; margin:10px; text-align:center;">
		    你确定要退出当前登陆用户吗？<br /><br />
           <asp:Button ID="btnOK" runat="server" CssClass="button60" OnClick="btnOK_Click" Text="确定" />&nbsp;
      
         
         </div>
		</td>
	</tr>
	<tr>
		<td class="wtabbuttomleft" ></td>
		<td width="80%" class="wtabbuttomright"></td>
	</tr>
</table>
        

    </form>
</body>
</html>
