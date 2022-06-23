﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addGameInfo.aspx.cs" Inherits="Admin_addGameInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
   <title>游戏信息管理</title>
<script type="text/javascript">
/*********************************************************
 * 	使用方法
 * 		控件调用onclick="fPopCalendar(event,this,this)"
 * 	如下，给控件设置为readonly
 * 	<input type="text" style="border:1px solid #cccccc;" 
 * 		size="15" onclick="fPopCalendar(event,this,this)" 
 * 		onfocus="this.select()" readonly="readonly" />
 * 	
 * 	如果页面乱码，把下面包含汉字的定义项放到页面中即可
********************************************************/
var gMonths=new Array("一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月");
var WeekDay=new Array("日","一","二","三","四","五","六");
var strToday="今天";
var strYear="年";
var strMonth="月";
var strDay="日";
var splitChar="-";
var startYear=2000;
var endYear=2050;
var dayTdHeight=12;
var dayTdTextSize=12;
var gcNotCurMonth="#E0E0E0";
var gcRestDay="#FF0000";
var gcWorkDay="#444444";
var gcMouseOver="#79D0FF";
var gcMouseOut="#F4F4F4";
var gcToday="#444444";
var gcTodayMouseOver="#6699FF";
var gcTodayMouseOut="#79D0FF";
var gdCtrl=new Object();
var goSelectTag=new Array();
var gdCurDate=new Date();
var giYear=gdCurDate.getFullYear();
var giMonth=gdCurDate.getMonth()+1;
var giDay=gdCurDate.getDate();
function $(){var elements=new Array();for(var i=0;i<arguments.length;i++) {var element=arguments[i];if(typeof(arguments[i])=='string'){element=document.getElementById(arguments[i]);}if(arguments.length==1){return element;}elements.Push(element);}return elements;}
Array.prototype.Push=function(){var startLength=this.length;for(var i=0;i<arguments.length;i++){this[startLength+i]=arguments[i];}return this.length;}
String.prototype.HexToDec=function(){return parseInt(this,16);}
String.prototype.cleanBlank=function(){return this.isEmpty()?"":this.replace(/\s/g,"");}
function checkColor(){var color_tmp=(arguments[0]+"").replace(/\s/g,"").toUpperCase();var model_tmp1=arguments[1].toUpperCase();var model_tmp2="rgb("+arguments[1].substring(1,3).HexToDec()+","+arguments[1].substring(1,3).HexToDec()+","+arguments[1].substring(5).HexToDec()+")";model_tmp2=model_tmp2.toUpperCase();if(color_tmp==model_tmp1 ||color_tmp==model_tmp2){return true;}return false;}
function $V(){return $(arguments[0]).value;}
function fPopCalendar(evt,popCtrl,dateCtrl){evt.cancelBubble=true;gdCtrl=dateCtrl;fSetYearMon(giYear,giMonth);var point=fGetXY(popCtrl);with($("calendardiv").style){left=point.x+"px";top=(point.y+popCtrl.offsetHeight+1)+"px";visibility='visible';zindex='99';position='absolute';}$("calendardiv").focus();}
function fSetDate(iYear,iMonth,iDay){var iMonthNew=new String(iMonth);var iDayNew=new String(iDay);if(iMonthNew.length<2){iMonthNew="0"+iMonthNew;}if(iDayNew.length<2){iDayNew="0"+iDayNew;}gdCtrl.value=iYear+splitChar+iMonthNew+splitChar+iDayNew;fHideCalendar();}
function fHideCalendar(){$("calendardiv").style.visibility="hidden";for(var i=0;i<goSelectTag.length;i++){goSelectTag[i].style.visibility="visible";}goSelectTag.length=0;}
function fSetSelected(){var iOffset=0;var iYear=parseInt($("tbSelYear").value);var iMonth=parseInt($("tbSelMonth").value);var aCell=$("cellText"+arguments[0]);aCell.bgColor=gcMouseOut;with(aCell){var iDay=parseInt(innerHTML);if(checkColor(style.color,gcNotCurMonth)){iOffset=(innerHTML>10)?-1:1;}iMonth+=iOffset;if(iMonth<1){iYear--;iMonth=12;}else if(iMonth>12){iYear++;iMonth=1;}}fSetDate(iYear,iMonth,iDay);}
function Point(iX,iY){this.x=iX;this.y=iY;}
function fBuildCal(iYear,iMonth){var aMonth=new Array();for(var i=1;i<7;i++){aMonth[i]=new Array(i);}var dCalDate=new Date(iYear,iMonth-1,1);var iDayOfFirst=dCalDate.getDay();var iDaysInMonth=new Date(iYear,iMonth,0).getDate();var iOffsetLast=new Date(iYear,iMonth-1,0).getDate()-iDayOfFirst+1;var iDate=1;var iNext=1;for(var d=0;d<7;d++){aMonth[1][d]=(d<iDayOfFirst)?(iOffsetLast+d)*(-1):iDate++;}for(var w=2;w<7;w++){for(var d=0;d<7;d++){aMonth[w][d]=(iDate<=iDaysInMonth)?iDate++:(iNext++)*(-1);}}return aMonth;}
function fDrawCal(iYear,iMonth,iCellHeight,iDateTextSize){var colorTD=" bgcolor='"+gcMouseOut+"' bordercolor='"+gcMouseOut+"'";var styleTD=" valign='middle' align='center' style='height:"+iCellHeight+"px;font-weight:bolder;font-size:"+iDateTextSize+"px;";var dateCal="";dateCal+="<tr>";for(var i=0;i<7;i++){dateCal+="<td"+colorTD+styleTD+"color:#990099'>"+WeekDay[i]+"</td>";}dateCal+="</tr>";for(var w=1;w<7;w++){dateCal+="<tr>";for(var d=0;d<7;d++){var tmpid=w+""+d;dateCal+="<td"+styleTD+"cursor:pointer;' onclick='fSetSelected("+tmpid+")'>";dateCal+="<span id='cellText"+tmpid+"'></span>";dateCal+="</td>";}dateCal+="</tr>";}return dateCal;}
function fUpdateCal(iYear,iMonth){var myMonth=fBuildCal(iYear,iMonth);var i=0;for(var w=1;w<7;w++){for(var d=0;d<7;d++){with($("cellText"+w+""+d)){parentNode.bgColor=gcMouseOut;parentNode.borderColor=gcMouseOut;parentNode.onmouseover=function(){this.bgColor=gcMouseOver;};parentNode.onmouseout=function(){this.bgColor=gcMouseOut;};if(myMonth[w][d]<0){style.color=gcNotCurMonth;innerHTML=Math.abs(myMonth[w][d]);}else{style.color=((d==0)||(d==6))?gcRestDay:gcWorkDay;innerHTML=myMonth[w][d];if(iYear==giYear && iMonth==giMonth && myMonth[w][d]==giDay){style.color=gcToday;parentNode.bgColor=gcTodayMouseOut;parentNode.onmouseover=function(){this.bgColor=gcTodayMouseOver;};parentNode.onmouseout=function(){this.bgColor=gcTodayMouseOut;};}}}}}}
function fSetYearMon(iYear,iMon){$("tbSelMonth").options[iMon-1].selected=true;for(var i=0;i<$("tbSelYear").length;i++){if($("tbSelYear").options[i].value==iYear){$("tbSelYear").options[i].selected=true;}}fUpdateCal(iYear,iMon);}
function fPrevMonth(){var iMon=$("tbSelMonth").value;var iYear=$("tbSelYear").value;if(--iMon<1){iMon=12;iYear--;}fSetYearMon(iYear,iMon);}
function fNextMonth(){var iMon=$("tbSelMonth").value;var iYear=$("tbSelYear").value;if(++iMon>12){iMon=1;iYear++;}fSetYearMon(iYear,iMon);}
function fGetXY(aTag){var oTmp=aTag;var pt=new Point(0,0);do{pt.x+=oTmp.offsetLeft;pt.y+=oTmp.offsetTop;oTmp=oTmp.offsetParent;}while(oTmp.tagName.toUpperCase()!="BODY");return pt;}
function getDateDiv(){var noSelectForIE="";var noSelectForFireFox="";if(document.all){noSelectForIE="onselectstart='return false;'";}else{noSelectForFireFox="-moz-user-select:none;";}var dateDiv="";dateDiv+="<div id='calendardiv' onclick='event.cancelBubble=true' "+noSelectForIE+" style='"+noSelectForFireFox+"position:absolute;z-index:99;visibility:hidden;border:1px solid #999999;'>";dateDiv+="<table border='0' bgcolor='#E0E0E0' cellpadding='1' cellspacing='1' >";dateDiv+="<tr>";dateDiv+="<td><input type='button' id='PrevMonth' value='&lt;' style='height:20px;width:20px;font-weight:bolder;' onclick='fPrevMonth()'>";dateDiv+="</td><td><select id='tbSelYear' style='border:1px solid;' onchange='fUpdateCal($V(\"tbSelYear\"),$V(\"tbSelMonth\"))'>";for(var i=startYear;i<endYear;i++){dateDiv+="<option value='"+i+"'>"+i+strYear+"</option>";}dateDiv+="</select></td><td>";dateDiv+="<select id='tbSelMonth' style='border:1px solid;' onchange='fUpdateCal($V(\"tbSelYear\"),$V(\"tbSelMonth\"))'>";for(var i=0;i<12;i++){dateDiv+="<option value='"+(i+1)+"'>"+gMonths[i]+"</option>";}dateDiv+="</select></td><td>";dateDiv+="<input type='button' id='NextMonth' value='&gt;' style='height:20px;width:20px;font-weight:bolder;' onclick='fNextMonth()'>";dateDiv+="</td>";dateDiv+="</tr><tr>";dateDiv+="<td align='center' colspan='4'>";dateDiv+="<div style='background-color:#cccccc'><table width='100%' border='0' cellpadding='3' cellspacing='1'>";dateDiv+=fDrawCal(giYear,giMonth,dayTdHeight,dayTdTextSize);dateDiv+="</table></div>";dateDiv+="</td>";dateDiv+="</tr><tr><td align='center' colspan='4' nowrap>";dateDiv+="<span style='cursor:pointer;font-weight:bolder;' onclick='fSetDate(giYear,giMonth,giDay)' onmouseover='this.style.color=\""+gcMouseOver+"\"' onmouseout='this.style.color=\"#000000\"'>"+strToday+":"+giYear+strYear+giMonth+strMonth+giDay+strDay+"</span>";dateDiv+="</tr></tr>";dateDiv+="</table></div>";return dateDiv;}
with(document){onclick=fHideCalendar;write(getDateDiv());}
</script>
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
body,td,th {
	font-size: 9pt;
}
body {
	margin-left: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	margin-top: 0px;
}
    .style1
    {
        width: 55px;
    }
-->
</style>
<script language="javascript" type="text/javascript">
</script>
</head>
<body >
    <form id="form1" runat="server">
<div>
<table border="0" align="center" cellpadding="5" cellspacing="1"  style="width: 100%">
  
  <tr bgcolor="#0099cc" >
    <td colspan="2" style="height: 25px"><div align="center" style="color: #ffffff">
        <h4>
            游戏信息管理</h4></div></td>
  </tr>
    <tr >
        <td colspan="2" style="height: 100%">
            <table align="center"  border="0" cellpadding="5" cellspacing="1"
                style="width: 100%">
                <tr >
                    <td align="left" style="height: 100%">
                        <table align="center" border="0" cellpadding="0" cellspacing="0" style="height: 263px"
                            width="100%">
                            <tr>
                                <td align="right" style="width: 116px; height: 16px">
                                    <div align="right">
                                        游戏编码：</div>
                                </td>
                                <td style="height: 16px" width="175">
                                    <asp:TextBox ID="txtGameCode" runat="server"></asp:TextBox></td>
                                <td style="height: 16px" width="76">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 116px">
                                    <div align="right">
                                        游戏名称：</div>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtGameName" runat="server" Width="114px"></asp:TextBox></td>
                                <td>
                                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorGameName" runat="server"
                                        ControlToValidate="txtGameName" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr style="color: #000000">
                                <td align="right" style="width: 116px; height: 22px">
                                    <div align="right">
                                        游戏类型：</div>
                                </td>
                                <td style="height: 22px">
                                    <asp:DropDownList ID="ddlGameType" runat="server" Width="144px">
                                    </asp:DropDownList></td>
                                <td style="height: 22px">
                                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorAuthor" runat="server"
                                        ControlToValidate="txtVersion" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr style="color: #000000">
                                <td align="right" style="width: 116px">
                                    开发公司：</td>
                                <td>
                                    <asp:DropDownList ID="ddlCompany" runat="server" Width="144px">
                                    </asp:DropDownList></td>
                                <td>
                                </td>
                            </tr>
                            <tr style="color: #000000">
                                <td align="right" style="width: 116px">
                                    <div align="right">
                                        版本：</div>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtVersion" runat="server" Width="116px"></asp:TextBox></td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr style="color: #000000">
                                <td align="right" style="width: 116px">
                                    <div align="right">
                                        价格：</div>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPrice" runat="server" Width="116px"></asp:TextBox></td>
                                <td>
                                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorPrice" runat="server"
                                        ControlToValidate="txtPrice" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr style="color: #000000">
                                <td align="right" style="width: 116px; height: 29px">
                                    总数量：</td>
                                <td style="height: 29px">
                                    <asp:TextBox ID="txtZong" runat="server"></asp:TextBox></td>
                                <td style="height: 29px">
                                </td>
                            </tr>
                            <tr style="color: #000000">
                                <td align="right" style="width: 116px; height: 29px">
                                    可租数量：</td>
                                <td style="height: 29px">
                                    <asp:TextBox ID="tatKe" runat="server"></asp:TextBox></td>
                                <td style="height: 29px">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 116px; height: 30px">
                                    <div align="right">
                                        仓库：</div>
                                </td>
                                <td style="height: 30px">
                                    <asp:DropDownList ID="ddlShelf" runat="server" Width="74px">
                                    </asp:DropDownList></td>
                                <td style="height: 30px">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 116px; height: 30px">
                                    入库时间：</td>
                                <td style="height: 30px">
                                    <asp:TextBox ID="txtTime" runat="server" onclick="fPopCalendar(event,this,this)" onfocus="this.select()"></asp:TextBox></td>
                                <td style="height: 30px">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 116px; height: 97px">
                                    游戏简介：</td>
                                <td style="height: 97px">
                                    <asp:TextBox ID="txtds" runat="server" Height="121px" TextMode="MultiLine" Width="460px"></asp:TextBox></td>
                                <td style="height: 97px">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" style="height: 24px; text-align: center">
                                    &nbsp;<asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="保　存" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
  
</table></div>


    </form>
</body>
</html>
