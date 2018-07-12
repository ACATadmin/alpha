<%@ page language="C#" autoeventwireup="true" inherits="web_master_Index, afm_new" enableviewstate="false" enableviewstatemac="false" enableEventValidation="false" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link media="all" type="text/css" href="css/admin_css.css" rel="stylesheet" />
    <title>网站后台管理系统</title>
    <script src="../A_Util/jquery.min.js" type="text/javascript"></script>
</head>
<body style="margin: 0px" scroll="no">
    <form id="form1" runat="server">
<table cellpadding="0" cellspacing="0" width="100%" height="100%">
  <tr>
    <td colspan="2" height="90"><div class="mainhd">
        <div class="logo"></div>
        <div class="uinfo">
          <p style="line-height:18px; margin-top:8px;">您好, <em><%=LS.Common.Cookie.GetCookie("LS_AdminName")%></em> [<a href="Right.aspx?MenuID=Right&Action=logout" target="_top">退出</a>]</p>
          <p class="btnlink"><a href="../" target="_blank">网站首页</a></p>
        </div>
        <div class="navbg"></div>
        <div class="nav">
          <ul id="topmenu">
            <asp:repeater id="myRepeater" runat="server">
            <ItemTemplate> 
            <li<%#GetStr(Container.ItemIndex.ToString()) %> id="<%#Eval("id")%>" title="<%#Eval("popedom_name")%>" onClick="LoadMenu('<%#GetUrl(Eval("ishead").ToString())%>','<%#Eval("id")%>')"><em><a href="javascript:;" hidefocus="true"><%#Eval("popedom_name")%></a></em></li>
            </ItemTemplate>
            </asp:repeater>
          </ul>
          <div class="currentloca">
            <p id="admincpnav"></p>
          </div>
          <div class="navbd"></div>
          <div class="sitemapbtn">
            <div style="padding:4px 10px 0 0"><a href="javascript:window.top.frames['main'].document.location.reload()" target="main">刷新本页</a> | <a href="Right.aspx?Action=set_default_page" style="color:#FF0000" target="main">设置栏目默认页</a> | <a href="Right.aspx?Action=setcopyright" target="main">关于版权</a></div>
          </div>
        </div>
      </div></td>
  </tr>
  <tr>
    <td valign="top" width="160" class="menutd"><div id="leftmenu" class="menu"></div><div style="bottom:10px; padding-left:10px; position:absolute;line-height:22px;">技术支持：<a href="http://www.ls7080.com" target="_blank">朗晟网络</a><br>腾讯QQ:<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=2853820153&site=qq&menu=yes">2853820153</a><br>售后:021-31006558</div></td>
    <td valign="top" width="100%" class="mask" id="mainframes">
	<iframe src="Admin_ServerInfo.aspx?MenuID=Right" id="main" name="main" onload="" width="100%" height="100%" frameborder="0" scrolling="yes" style="overflow: visible;display:"></iframe>
	</td>
  </tr>
</table>
<script type="text/JavaScript">
$.ajaxSetup ({cache:false});
$("#leftmenu").load("Left.aspx?menuid=43");
main.location = "Admin_ServerInfo.aspx";
function LoadMenu(url,id) {
	$('#topmenu li').removeClass("navon");
    $('#'+id).addClass("navon");
	if (url=="")
	{
	  main.location = "Right.aspx?MenuID="+id+"&act=default_page";
	}
	else {
	    main.location = "load.aspx?url=" + escape(url);
    //parent.main.location = url;
	}
	$("#leftmenu").load("Left.aspx?menuid="+id+"");
};
</script>
    </form>
</body>
</html>
