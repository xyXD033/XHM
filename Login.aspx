<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>图书馆管理系统</title>
 
</head>
<body bgColor=#ffffff>
    <form id="form1" runat="server">
    <div align=center >
    <TABLE cellSpacing=0 cellPadding=0 border=0 >
  <TBODY>
  <TR>
    <TD><IMG height=1 alt="" src="Images/spacer.gif" width=297 border=0></TD>
    <TD><IMG height=1 alt="" src="Images/spacer.gif" width=427 border=0></TD>
    <TD><IMG height=1 alt="" src="Images/spacer.gif" width=296 border=0></TD>
    <TD><IMG height=1 alt="" src="Images/spacer.gif" width=1 border=0></TD></TR>
  <TR>
    <TD bgColor=#0d5c94 colSpan=3></TD>
    <TD><IMG height=169 alt="" src="Images/spacer.gif" width=1 
  border=0></TD></TR>
  <TR>
    <TD bgColor=#0d5c94></TD>
    <TD bgColor=#0d5c94>
      <TABLE cellSpacing=0 cellPadding=0 width=427 border=0>
       
        <TBODY>
        <TR>
          <TD><IMG height=1 alt="" src="Images/spacer.gif" width=123 
            border=0></TD>
          <TD><IMG height=1 alt="" src="Images/spacer.gif" width=72 
          border=0></TD>
          <TD><IMG height=1 alt="" src="Images/spacer.gif" width=36 
          border=0></TD>
          <TD><IMG height=1 alt="" src="Images/spacer.gif" width=72 
          border=0></TD>
          <TD><IMG height=1 alt="" src="Images/spacer.gif" width=124 
            border=0></TD>
          <TD><IMG height=1 alt="" src="Images/spacer.gif" width=1 
          border=0></TD></TR>
        <TR>
          <TD colSpan=5><IMG height=52 alt="" 
            src="Images/bg_r2_c2_r1_c1.gif" width=427 border=0 
            name=bg_r2_c2_r1_c1></TD>
          <TD><IMG height=52 alt="" src="Images/spacer.gif" width=1 
          border=0></TD></TR>
        <TR>
          <TD vAlign=top background=Images/bg_r2_c2_r2_c1.gif colSpan=5 style="height: 125px">
            <TABLE class=Font-white cellSpacing=0 cellPadding=0 width=400 
            border=0>
              <TBODY>
              <TR>
                <TD style="height: 41px; width: 139px;">&nbsp;</TD>
                <TD width=200 style="height: 41px">&nbsp;</TD>
                <TD width=25 style="height: 41px">&nbsp;</TD></TR>
                  <tr>
                      <td style="height: 30px; width: 139px;">
                            <DIV class=Font-white align=right>
                      登陆账号：</DIV></td>
                      <td align="left" style="height: 30px">
                          &nbsp;<asp:TextBox ID="TxtUserName" runat="server" ValidationGroup="3" Width="144px"></asp:TextBox></td>
                      <td style="height: 30px">
                      </td>
                  </tr>
              <TR>
                <TD style="height: 30px; width: 139px;">
                  <DIV class=Font-white align=right>
                      登陆密码：</DIV></TD>
                <TD align="left" style="height: 30px">
                    &nbsp;<asp:TextBox ID="txtPassword" runat="server" ValidationGroup="3" Width="144px" TextMode="Password"></asp:TextBox></TD>
                <TD style="height: 30px">&nbsp;</TD></TR>
              </TBODY></TABLE></TD>
          <TD style="height: 125px"><IMG height=125 alt="" src="Images/spacer.gif" width=1 
            border=0></TD></TR>
        <TR>
          <TD bgColor=#208ecf style="height: 21px"><IMG height=27 src="Images/bg_r2_c2_r3_c1.gif" 
            width=123 border=0></TD>
            <td bgcolor="#208ecf" colspan="3" style="height: 21px" align="center">
                <INPUT type=image height=27 width=72 
            src="Images/bg_r2_c2_r3_c2.gif" border=0 name=imageField id="Image1" onserverclick="Image1_ServerClick" runat="server">
                <br />
                </td>
          <TD style="height: 21px"><IMG height=27 alt="" src="Images/bg_r2_c2_r3_c5.gif" 
            width=124 border=0 name=bg_r2_c2_r3_c5></TD>
          <TD style="height: 21px"><IMG height=27 alt="" src="Images/spacer.gif" width=1 
          border=0></TD></TR>
        <TR>
          <TD colSpan=5><IMG height=6 alt="" src="Images/bg_r2_c2_r4_c1.gif" 
            width=427 border=0 name=bg_r2_c2_r4_c1></TD>
          <TD><IMG height=6 alt="" src="Images/spacer.gif" width=1 
          border=0></TD></TR> </table></td>
   <td bgcolor="0D5C94"></td>
   <td><img src="images/spacer.gif" width="1" height="210" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="3" valign="top" background="images/bg_r3_c1.gif"><table width="100%"  border="0" cellspacing="1" cellpadding="0">
     <tr>
       <td width="29%" height="20">&nbsp;</td>
       <td width="42%"><div align="center"></div></td>
       <td width="29%">&nbsp;</td>
     </tr>
     <tr>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
     </tr>
   </table></td>
   <td><img src="images/spacer.gif" width="1" height="221" border="0" alt=""></td>
  </tr>
</table>
    </div>
    </form>
</body>
</html>
