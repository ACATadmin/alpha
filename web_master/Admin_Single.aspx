<%@ page language="C#" autoeventwireup="true" inherits="web_master_Admin_Single, afm_new" enableviewstate="false" enableviewstatemac="false" enableEventValidation="false" %>
<%@ Register TagPrefix="LS" TagName="Inc" Src="Inc.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="x-ua-compatible" content="ie=7" />
    <title>单页管理</title>
    <LS:Inc ID="Inc1" runat="server" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container" id="cpcontainer">
    <asp:Panel ID="main" runat="server" Visible="false">
    <%=LS.Common.Function.UEditor("content2",1)%>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tb tb2 fixpadding">
   <tr class="partition">
     <td height="28" colspan="2" class="titl"><asp:Literal ID="title" runat="server"></asp:Literal><asp:HiddenField ID="className" runat="server" /></td>
   </tr>
   <tr>
     <td width="10%" align="right">简介：</td>
     <td width="90%"><asp:TextBox id="content1" TextMode="MultiLine" runat="server" Width="500" Height="100"></asp:TextBox></td>
   </tr>
    <tr>
      <td height="28" align="right">详情：</td>
      <td><asp:TextBox id="content2" TextMode="MultiLine" style="width:100%;height:400px;" runat="server"></asp:TextBox></td>
    </tr>
   <tr>
     <td>&nbsp;</td>
      <td><asp:Button ID="Button1" Text=" 保 存 " CssClass="btn" runat="server" OnClick="OnClick_AddUp" />
        <input type="button" name="button" id="button" value=" 返 回 " class="btn" onClick="history.go(-1)" />
        <input name="BackURL" type="hidden" id="BackURL" value="<%=LS.Common.Function.GetDecodeURL()%>" />
     </td>
    </tr>
</table>
    </asp:Panel>
    
    
    </div>
    </form>
    <script type="text/javascript">
        laydate({
            format: 'YYYY/MM/DD hh:mm:ss',
            festival: false, //显示节日
            istime: true, //是否开启时间选择
            elem: '#addtime',
            event: 'focus' //响应事件。如果没有传入event，则按照默认的click
        });
        function deleteiImg() {
            $('#demo1').attr('src', "images/nophoto.gif");
            $('#img').attr('value', "");
        }
</script>
</body>
</html>
