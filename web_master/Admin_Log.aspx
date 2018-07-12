<%@ page language="C#" autoeventwireup="true" inherits="web_master_Admin_Log, afm_new" enableviewstate="false" enableviewstatemac="false" enableEventValidation="false" %>
<%@ Register TagPrefix="LS" TagName="Inc" Src="Inc.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="x-ua-compatible" content="ie=7" />
    <title>日志管理</title>
    <LS:Inc ID="Inc1" runat="server" />
</head>
<body>
    <form id="form1" runat="server">
<div class="container" id="cpcontainer">
<table class="t_class">
  <tr>
    <td class="l">当前位置：日志管理</td>
    <td class="r"></td>
  </tr>
</table>

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tb tb2 fixpadding">
  <tr class="partition">
    <td width="5%">选择</td>
    <td width="15%">管理姓名</td>
    <td width="15%">操作日期</td>
    <td width="15%">IP地址</td>
    <td width="50%">操作记录</td>
  </tr>
<asp:repeater id="Repeater1" runat="server">
<ItemTemplate> 
  <tr class="hover">
    <td align="center"><input name="id" type="checkbox" class="checkbox" value="<%#Eval("id")%>"></td>
    <td><%#Eval("username")%></td>
    <td><%#Eval("addtime")%></td>
    <td><%#Eval("ip")%></td>
    <td><%#Eval("details")%></td>
  </tr>
</ItemTemplate>
<FooterTemplate>
    <tr class="hover" runat="server" Visible="<%#bool.Parse((Repeater1.Items.Count==0).ToString())%>" >
    <td align="center" colspan="5" style="padding:6px;">无相关数据!</td>
    </tr>
</FooterTemplate>
</asp:repeater>
</table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:10px 0;">
  <tr>
    <td width="15%" align="left">
    <input name="chkall" type="checkbox" id="chkall" value="all" class="checkbox" onClick="CheckAll(this.form)" /> 全选
    <asp:Button ID="submitid" runat="server"  OnClick="DelSelect_Click" Text="清除所选日志" CssClass="btn"/>
    <input name="BackURL" type="hidden" id="BackURL" value="<%=LS.Common.Function.GetDecodeURL()%>">
    </td>
    <td width="83%"><div class="msdn"><webdiyer:AspNetPager id="AspNetPager1" runat="server" CurrentPageButtonClass="current" FirstPageText="Home" PrevPageText="Prev" NextPageText="Next" LastPageText="End" 
                                                   ShowDisabledButtons="true" onpagechanged="AspNetPager1_PageChanged" UrlPaging="true" PageIndexBoxClass="input_page" PageIndexBoxType="TextBox" SubmitButtonClass="go" SubmitButtonText="GO" ShowPageIndexBox="Always"></webdiyer:aspnetpager></div></td>
  </tr>
</table>
</div>
    </form>
</body>
</html>
