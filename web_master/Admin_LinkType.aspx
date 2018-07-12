<%@ page language="C#" autoeventwireup="true" inherits="web_master_Admin_LinkType, afm_new" enableviewstate="false" enableviewstatemac="false" enableEventValidation="false" %>
<%@ Register TagPrefix="LS" TagName="Inc" Src="Inc.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="x-ua-compatible" content="ie=7" />
    <title>栏目管理</title>
    <LS:Inc ID="Inc1" runat="server" />
</head>

<body>
    <form id="form1" runat="server">
    <div class="container" id="cpcontainer">
<asp:Panel ID="Big" runat="server" Visible="false">
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tb tb2 fixpadding">
  <tr class="title">
    <td height="22"><strong>类别链接管理</strong></td>
  </tr>
  <tr>
    <td align="left">添加大类：<asp:TextBox ID="NameType" TextMode="SingleLine" runat="server" CssClass="txt" Width="150" reg="[^0]" tip="不能为空"></asp:TextBox>
                      <asp:Button ID="Button1" Text=" 确 定 " runat="server" CssClass="btn" OnClick="OnClick_BigClass" /> <input type="button" name="back" value=" 返 回 " class="btn" onclick="history.go(-1);" /></td>
  </tr>
</table>
</asp:Panel>




<asp:Panel ID="Small" runat="server" Visible="false">
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tb tb2 fixpadding">
  <tr class="title">
    <td height="22"><strong>类别链接管理</strong></td>
  </tr>
  <tr>
    <td align="left">添加类别：<asp:DropDownList ID="BigClassValue" runat="server" Height="22" CssClass="txt" reg="[^0]" tip="一定要选择哟"></asp:DropDownList>
            二类名称：<asp:TextBox ID="SmallTypeName" TextMode="SingleLine" runat="server" CssClass="txt" Width="150" reg="[^0]" tip="不能为空"></asp:TextBox>
            链接地址：<asp:TextBox ID="SmallClassUrl" TextMode="SingleLine" runat="server" Width="320" CssClass="txt" reg="[^0]" tip="不能为空"></asp:TextBox>
            <asp:Button ID="Button2" Text=" 确 定 " runat="server" CssClass="btn" OnClick="OnClick_SmallClass" /> <input type="button" name="back" value=" 返 回 " class="btn" onclick="history.go(-1);" /></td>
  </tr>
</table>
</asp:Panel>


    
<asp:Panel ID="Main" runat="server" Visible="false">
<asp:repeater id="myRepeater" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
<ItemTemplate> 
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tb tb2 fixpadding">
  <tr class="title">
    <td width="40%" align="left"><%#Eval("popedom_name")%></td>
    <td width="30%" align="left">&nbsp;</td>

    <td align="center" style="font-weight:bold;">
                <div id="td22<%#Eval("id")%>"><span class="orderidVal"><%#Eval("OrderId")%></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="cursor:pointer;" onclick="$('#td22<%#Eval("id")%>').hide();$('#td11<%#Eval("id")%>').show();">编辑</span></div>
			    <div id="td11<%#Eval("id")%>" style="display:none;">
                <input type="text" id="td33<%#Eval("id")%>" value="<%#Eval("OrderId")%>" class="txt" reg="^\d+$" tip="必须填写数字" name="orderid<%#Eval("id")%>" onkeypress="return event.keyCode>=48&&event.keyCode<=57||event.keyCode==46" onpaste="return !clipboardData.getData('text').match(/\D/)" style="ime-mode:Disabled; width:60px;" ondragenter="return false">
                <input type="button" class="btn up" value="修改" onclick="$('td22<%#Eval("id")%>').hide();$('td11<%#Eval("id")%>').show();UpdateOrder(<%#Eval("id")%>,'orderid','popedom',$('#td33<%#Eval("id")%>').val());"/></div>
    </td>

    <td width="10%" align="center"><a href="Admin_LinkType.aspx?Action=UpBig&ID=<%#Eval("id")%>&MenuId=<%=Request.QueryString["MenuId"]%>">修改</a> <a href="Admin_LinkType.aspx?Action=Del&ID=<%#Eval("id")%>&MenuId=<%=Request.QueryString["MenuId"]%>&BackURL=<%#LS.Common.Function.GetEncodeURL()%>" onClick="return(confirm('确定删除吗？'))">删除</a></td>
  </tr>
<asp:Repeater id="myRepeater2" runat="server">
<ItemTemplate>
  <tr class="hover">
    	<td align="left"><%#Eval("popedom_name")%></td>
			<td align="left">&nbsp;<%#Eval("popedom_url")%></td>

    <td align="center">
                <div id="td22<%#Eval("id")%>"><span class="orderidVal"><%#Eval("OrderId")%></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="cursor:pointer;" onclick="$('#td22<%#Eval("id")%>').hide();$('#td11<%#Eval("id")%>').show();">编辑</span></div>
			    <div id="td11<%#Eval("id")%>" style="display:none;">
                <input type="text" id="td33<%#Eval("id")%>" value="<%#Eval("OrderId")%>" class="txt" reg="^\d+$" tip="必须填写数字" name="orderid<%#Eval("id")%>" onkeypress="return event.keyCode>=48&&event.keyCode<=57||event.keyCode==46" onpaste="return !clipboardData.getData('text').match(/\D/)" style="ime-mode:Disabled; width:60px;" ondragenter="return false">
                <input type="button" class="btn up" value="修改" onclick="$('td22<%#Eval("id")%>').hide();$('td11<%#Eval("id")%>').show();UpdateOrder(<%#Eval("id")%>,'orderid','popedom',$('#td33<%#Eval("id")%>').val());"/></div>
    </td>



			<td align="center"><a href="Admin_LinkType.aspx?Action=UpSmall&ID=<%#Eval("ID")%>&ParentID=<%#Eval("popedom_father") %>&MenuId=<%=Request.QueryString["MenuId"]%>">修改</a>  <a href="Admin_LinkType.aspx?Action=Del&ID=<%#Eval("ID")%>&MenuId=<%=Request.QueryString["MenuId"]%>&BackURL=<%#LS.Common.Function.GetEncodeURL()%>" onClick="return(confirm('确定删除吗？'))">删除</a></td>
  </tr>
</ItemTemplate>
</asp:Repeater>

</table>
</ItemTemplate>
</asp:repeater>
</asp:Panel>
    </div>
    </form>
</body>
</html>
