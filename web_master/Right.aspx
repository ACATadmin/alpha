<%@ page language="C#" autoeventwireup="true" inherits="web_master_Right, afm_new" enableviewstate="false" enableviewstatemac="false" enableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="x-ua-compatible" content="ie=7" />
    <title>设置栏目默认页</title>
     <link media="all" type="text/css" href="css/admin_css.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container" id="cpcontainer">
    <asp:Panel ID="Default_Page" runat="server" Visible="false">
<asp:Repeater id="myRepeater" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
<ItemTemplate> 
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tb tb2 fixpadding">
  <tr class="title">
    <td width="90%" align="left"><%#Eval("popedom_name")%><%#GetIsHead(Eval("ishead").ToString())%></td>
    <td width="10%" align="left">&nbsp;</td>
  </tr>
<asp:Repeater id="myRepeater2" runat="server">
<ItemTemplate>
  <tr class="hover">
    	<td align="left"><%#Eval("popedom_name")%></td>
		<td align="center"><%#GetIsSet(DataBinder.Eval((Container.NamingContainer.NamingContainer as RepeaterItem).DataItem, "ishead").ToString(), Eval("id").ToString())%></td>
  </tr>
</ItemTemplate>
</asp:Repeater>

</table>
</ItemTemplate>
</asp:Repeater>
    </asp:Panel>
    
<asp:Panel ID="CopyRight" runat="server" Visible="false">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tb tb2 fixpadding">
  <tr class="partition">
    <td colspan="2" valign="middle">关于版权</td>
  </tr>
  <tr class="hover">
    <td align="center"><strong>版本信息</strong></td>
    <td>&nbsp;&nbsp;朗晟网络 v3.0</td>
  </tr>
  <tr class="hover">
    <td width="8%" align="center"><strong>项目策划</strong></td>
    <td width="92%">&nbsp;&nbsp;LangSun</td>
  </tr>
  <tr class="hover">
    <td align="center"><strong>程序开发</strong></td>
    <td>&nbsp;&nbsp;LangSun</td>
  </tr>
  <tr class="hover">
    <td align="center"><strong>界面设计</strong></td>
    <td>&nbsp;&nbsp;LangSun</td>
  </tr>
  <tr class="hover">
    <td align="center"><strong>联系方式</strong></td>
    <td>&nbsp;&nbsp;LangSun　QQ：2853820153　电话：021-31006558</td>
  </tr>
  <tr class="hover">
    <td align="center"><strong>公司官网</strong></td>
    <td>&nbsp;&nbsp;<a href="http://www.ls7080.com" target="_blank">http://www.ls7080.com</a></td>
  </tr>
</table>
</asp:Panel> 
    
    </div>
    </form>
</body>
</html>
