<%@ page language="C#" autoeventwireup="true" inherits="web_master_Admin_Model, afm_new" enableviewstate="false" enableviewstatemac="false" enableEventValidation="false" %>
<%@ Register TagPrefix="LS" TagName="Inc" Src="Inc.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="x-ua-compatible" content="ie=7" />
    <title>模型管理</title>
    <LS:Inc ID="Inc1" runat="server" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container" id="cpcontainer">
    <asp:Panel ID="AddUp" runat="server" Visible="false">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tb tb2 fixpadding">
   <tr class="partition">
     <td height="28" colspan="2" class="titl"><asp:Literal ID="title" runat="server"></asp:Literal></td>
   </tr>
   <tr>
     <td width="10%" height="33" align="right">模型名称：</td>
     <td width="90%">
     <asp:TextBox ID="m_name" TextMode="SingleLine" runat="server" Width="200" CssClass="txt" reg="^.+$" tip="不能为空"></asp:TextBox>
     </td>
    </tr>
    <tr>
     <td width="10%" height="33" align="right">标签名：</td>
     <td width="90%">
     <asp:TextBox ID="m_tab" TextMode="SingleLine" runat="server" Width="250" CssClass="txt" reg="^.+$" tip="不能为空"></asp:TextBox>
     </td>
    </tr>
   <tr>
     <td align="right">模型处理地址：</td>
     <td><asp:TextBox id="m_url" TextMode="SingleLine" runat="server" Width="400" CssClass="txt" reg="^.+$" tip="不能为空"></asp:TextBox></td>
   </tr>
   <tr>
     <td align="right">备注：</td>
     <td><asp:TextBox id="about" TextMode="MultiLine" runat="server" Width="400" Height="100"></asp:TextBox></td>
   </tr>
   <tr>
     <td>&nbsp;</td>
      <td><asp:Button ID="Button1" Text=" 保 存 " CssClass="btn" runat="server" OnClick="OnClick_AddUp" />
        <input type="button" name="button" id="button" value=" 返 回 " class="btn" onClick="history.go(-1)">
     </td>
    </tr>
</table>
    </asp:Panel>
    <asp:Panel ID="Main" runat="server">
    
<table class="t_class">
  <tr>
    <td class="l">当前位置：网站模型</td>
    <td class="r"><a href="Admin_Model.aspx?MenuID=<%=Request.QueryString["MenuID"]%>&Action=AddInfo&BackURL=<%=LS.Common.Function.GetEncodeURL()%>">添加模型</a></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tb tb2 fixpadding">
  <tr class="partition">
    <td align="left" width="25%">模型名称</td>
    <td align="left" width="15%">标签名</td>
    <td align="left" width="30%">处理地址</td>
    <td align="center" width="20%">排序ID</td>
    <td align="center" width="10%">操作</td>
  </tr>
  
   <asp:Repeater ID="Repeater1" runat="server">
   <ItemTemplate>
   
  <tr class="hover">
    <td align="left" style="padding-left:12px;"><%#Eval("m_name")%></td>
    <td align="left"><%#Eval("m_tab")%></td>
    <td align="left"><%#Eval("m_url")%></td>
    <td align="center">
                <div id="td22<%#Eval("id")%>"><span class="orderidVal"><%#Eval("OrderId")%></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="cursor:pointer;" onclick="$('#td22<%#Eval("id")%>').hide();$('#td11<%#Eval("id")%>').show();">编辑</span></div>
			    <div id="td11<%#Eval("id")%>" style="display:none;">
                <input type="text" id="td33<%#Eval("id")%>" value="<%#Eval("OrderId")%>" class="txt" reg="^\d+$" tip="必须填写数字" name="orderid<%#Eval("id")%>" onkeypress="return event.keyCode>=48&&event.keyCode<=57||event.keyCode==46" onpaste="return !clipboardData.getData('text').match(/\D/)" style="ime-mode:Disabled; width:60px;" ondragenter="return false">
                <input type="button" class="btn up" value="修改" onclick="$('td22<%#Eval("id")%>').hide();$('td11<%#Eval("id")%>').show();UpdateOrder(<%#Eval("id")%>,'orderid','Model_List',$('#td33<%#Eval("id")%>').val());"/></div>
    </td>
            
    <td align="center">
      <a href="?MenuID=<%=Request.QueryString["MenuID"]%>&Action=EditInfo&Id=<%#Eval("ID")%>&BackURL=<%#LS.Common.Function.GetEncodeURL()%>"><img src="images/icon_edit.gif" alt="编辑" width="16" height="16" border="0" align="absmiddle"></a> 
      <a href="?Action=DelInfo&MenuID=<%=Request.QueryString["MenuID"]%>&Id=<%#Eval("ID")%>&BackURL=<%#LS.Common.Function.GetEncodeURL()%>" onClick="return(confirm('确定删除吗？'))"><img src="images/icon_drop.gif" alt="删除" width="16" height="16" border="0" align="absmiddle"></a>
    </td>
  </tr>
    </ItemTemplate>
<FooterTemplate>

    <tr id="Tr1" runat="server" Visible="<%#bool.Parse((Repeater1.Items.Count==0).ToString())%>" >
    <td align="center" colspan="3" style="height:0px; padding:4px; margin:0;">无相关数据!</td>
    </tr>

</FooterTemplate>
    
   </asp:Repeater>
</table>

</asp:Panel>  
    
    
    </div>
    </form>
</body>
</html>
