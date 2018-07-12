<%@ page language="C#" autoeventwireup="true" inherits="web_master_Admin_Partners, afm_new" enableviewstate="false" enableviewstatemac="false" enableEventValidation="false" %>

<%@ Register TagPrefix="Andy" TagName="Inc" Src="Inc.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="x-ua-compatible" content="ie=7" />
    <title>合作伙伴管理</title>
    <Andy:Inc ID="Inc1" runat="server" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container" id="cpcontainer">
    <asp:Panel ID="AddUp" runat="server" Visible="false">
     <%--   <%=LS.Common.Function.KindEditor("info_content")%>--%>
      <%=LS.Common.Function.Lay_UpLoadImg("upload_pic")%>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tb tb2 fixpadding">
	  <tr class="partition">
	    <td height="28" colspan="2"><asp:Literal ID="Txt_Title" runat="server"></asp:Literal></td>
    </tr>
	  <tr>
      <td width="9%" height="28" align="right"><strong>名称：</strong></td>
      <td width="91%">
        <asp:TextBox ID="Title" runat="server" Width="250" CssClass="txt" reg="^.+$" tip="不能为空"></asp:TextBox>
      </td>
    </tr>
      <tr>
      <td width="9%" height="28" align="right"><strong>链接地址：</strong></td>
      <td width="91%">
        <asp:TextBox ID="linkurl" runat="server" Width="250" CssClass="txt" ></asp:TextBox>
      </td>
    </tr>
      <tr>
   <td align="right">图片:</td>
    <td>
        <button type="button" class="layui-btn" id="upload_pic_btn" lay-data="{exts: 'jpg|png|gif|bmp|jpeg'}"><i class="layui-icon">&#xe67c;</i>上传图片</button>
    </td>
    </tr>
    <tr><td >&nbsp;</td>
    <td>
    <div class="layui-upload-list">
    <span class="cancel" onclick="delImg('upload_pic')"></span>
    <asp:Image ID="upload_pic_url" Target="_blank" runat="server" ImageUrl="images/nophoto.gif" CssClass="upimg_css"></asp:Image>
    <asp:HiddenField ID="upload_pic" runat="server"></asp:HiddenField>
    <asp:HiddenField ID="upload_pic_old" runat="server"></asp:HiddenField>
    </div>
    </td>
	</tr>
      <%--   <tr>
     <td align="right">详细内容：</td>
     <td><asp:TextBox id="info_content" TextMode="MultiLine" runat="server" style="width:100%;height:400px;"></asp:TextBox></td>
   </tr>--%>
 <tr>
      <td height="41" align="right"><strong>备注说明：</strong></td>
      <td><asp:TextBox id="About" TextMode="MultiLine" runat="server" Width="400" Height="120"></asp:TextBox></td>
    </tr>
 
   <tr>
     <td>&nbsp;</td>
      <td><asp:Button ID="Button1" Text=" 保 存 " CssClass="btn" runat="server" OnClick="OnClick_AddUp" />
        <input type="button" name="button" id="button" value=" 返 回 " class="btn" onClick="history.go(-1)"/>
                <input name="classid" type="hidden" id="classid" value="<%=LS.Common.Function.GetRequest("classid")%>" />
     </td>
    </tr>
</table>
    </asp:Panel>
    
    <asp:Panel ID="Main" runat="server">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tb tb2 fixpadding">
<tr class="title">
    <td>
       <div style="float:left">
      <asp:TextBox ID="KeyWords" runat="server" Width="250" style="margin:auto;" CssClass="txt"></asp:TextBox>
      <asp:DropDownList ID="Search_Option" runat="server" CssClass="txt" Height="22"></asp:DropDownList>
      <asp:Button ID="Button2" runat="server"  OnClick="OnClick_Search" Text=" 搜 索 " CssClass="btn"/>
         </div>
           <div style="float:right; padding-right:10px;"><%=addurlstr %></div>
	</td>
  </tr>
</table>
<br />
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tb tb2 fixpadding">
    <tr class="partition">
      <td width="3%" align="center">ID</td>
      <td width="32%" align="center"><strong>名称</strong></td>
      <td width="11%" align="center">图片</td>
      <td width="15%" align="center">排序ID</td>
      <td width="15%" align="center">添加日期</td>
      <td width="9%" align="center">操作</td>
    </tr>
   <asp:Repeater ID="Repeater1" runat="server">
   <ItemTemplate>  
    <tr class="hover">
      <td align="center"><input name="id" type="checkbox" class="checkbox" value="<%#Eval("id")%>"></td>
      <td align="left" style="padding-left:10px;"><%#Eval("title")%></td>
      <td align="center"><img src="<%#GetImg(Eval("upload_pic").ToString())%>" height="20" style="border:1px solid #cccccc" class="tooltip"></td>
        <td align="center">
            <div id="td22<%#Eval("id")%>"><span class="orderidVal"><%#Eval("OrderId")%></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="cursor:pointer;" onclick="$('#td22<%#Eval("id")%>').hide();$('#td11<%#Eval("id")%>').show();">编辑</span></div>
			<div id="td11<%#Eval("id")%>" style="display:none;">
            <input type="text" id="td33<%#Eval("id")%>" value="<%#Eval("OrderId")%>" class="txt" reg="^\d+$" tip="必须填写数字" name="orderid<%#Eval("id")%>" onkeypress="return event.keyCode>=48&&event.keyCode<=57||event.keyCode==46" onpaste="return !clipboardData.getData('text').match(/\D/)" style="ime-mode:Disabled; width:60px;" ondragenter="return false">
            <input type="button" class="btn" value="修改" onclick="$('td22<%#Eval("id")%>').hide();$('td11<%#Eval("id")%>').show();UpdateOrder(<%#Eval("id")%>,'orderid','Partners_List',$('#td33<%#Eval("id")%>').val());"/></div>
    </td>
      <td align="center"><%#Eval("addtime")%></td>
      <td align="center"><a href="?MenuId=<%=MenuId%>&classid=<%#Eval("classid")%>&Action=EditInfo&ID=<%#Eval("ID")%>&BackURL=<%#LS.Common.Function.GetEncodeURL()%>"><img src="images/icon_edit.gif" alt="编辑" width="16" height="16" border="0" align="absmiddle"></a>&nbsp;&nbsp;<a href="?Action=DelInfo&ID=<%#Eval("ID")%>&BackURL=<%#LS.Common.Function.GetEncodeURL()%>" onClick="return(confirm('确定删除吗？'))"><img src="images/icon_drop.gif" alt="删除" width="16" height="16" border="0" align="absmiddle"></a></td>
    </tr>
   </ItemTemplate>
<FooterTemplate>
    <tr class="hover" id="Tr1" runat="server" Visible="<%#bool.Parse((Repeater1.Items.Count==0).ToString())%>" >
    <td align="center" colspan="6" style="height:0px; padding:4px; margin:0;">无相关数据!</td>
    </tr>
</FooterTemplate>
</asp:Repeater>

</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:10px 0;">
  <tr>
    <td width="15%" align="left">
    <input name="chkall" type="checkbox" id="chkall" value="all" class="checkbox" onClick="CheckAll(this.form)" /> 全选
    <asp:Button ID="submitid" runat="server"  OnClick="DelSelect_Click" Text="清除所选信息" CssClass="btn"/>
    <input name="BackURL" type="hidden" id="Hidden1" value="<%=LS.Common.Function.GetDecodeURL()%>">
    </td>
    <td width="83%"><div class="msdn"><webdiyer:AspNetPager id="AspNetPager1" runat="server" CurrentPageButtonClass="current" FirstPageText="Home" PrevPageText="Prev" NextPageText="Next" LastPageText="End" 
                                                   ShowDisabledButtons="true" onpagechanged="AspNetPager1_PageChanged" UrlPaging="true" PageIndexBoxClass="input_page" PageIndexBoxType="TextBox" SubmitButtonClass="go" SubmitButtonText="GO" ShowPageIndexBox="Always"></webdiyer:aspnetpager></div></td>
  </tr>
</table>
    </asp:Panel>
    </div>
    </form>
</body>
</html>
