<%@ page language="C#" autoeventwireup="true" inherits="web_master_Admin_NewsList, afm_new" enableviewstate="false" enableviewstatemac="false" enableEventValidation="false" %>
<%@ Register TagPrefix="LS" TagName="Inc" Src="Inc.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="x-ua-compatible" content="ie=7" />
    <title>新闻管理</title>
    <LS:Inc ID="Inc1" runat="server" />
</head>

<body>
    <form id="form1" runat="server">
    <div class="container" id="cpcontainer">
    <asp:Panel ID="AddUp" runat="server" Visible="false">
    <%=LS.Common.Function.UEditor("info_content",1)%>
    <%=LS.Common.Function.Lay_UpLoadImg("upload_pic")%>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tb tb2 fixpadding">
   <tr class="partition">
     <td height="28" colspan="2" class="titl"><asp:Literal ID="Txt_Title" runat="server"></asp:Literal></td>
   </tr>
   <tr>
     <td width="10%" height="33" align="right">标题：</td>
     <td width="90%"><asp:TextBox ID="title" TextMode="SingleLine" runat="server" Width="450" CssClass="txt" reg="[^0]" tip="不能为空"></asp:TextBox></td>
    </tr>
    <tr style="display:none;">
      <td align="right">发布日期：</td>
      <td><asp:TextBox ID="addtime" TextMode="SingleLine" Width="156" CssClass="txt" runat="server" reg="[^0]" tip="不能为空" onClick="laydate()"></asp:TextBox> 来源：<asp:TextBox ID="source" TextMode="SingleLine" Width="120" CssClass="txt" runat="server" reg="[^0]" tip="不能为空"></asp:TextBox> 点击数：<asp:TextBox ID="num" TextMode="SingleLine" Width="70" CssClass="txt" runat="server" reg="[^0]" tip="不能为空"></asp:TextBox></td>
    </tr>
   <tr>
   <td align="right">分类图片:</td>
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
   <tr style="display:none;">
     <td align="right" >简介：</td>
     <td ><asp:TextBox id="about" TextMode="MultiLine" runat="server" Width="500" Height="120"></asp:TextBox></td>
   </tr>
      <tr>
     <td width="10%" height="33" align="right">转向外链：</td>
     <td width="90%"><asp:TextBox ID="href" TextMode="SingleLine" runat="server" Width="600" CssClass="txt" tip="可不填"></asp:TextBox>（注：可不填，如填写请确认该链接中包含http://）</td>
    </tr>
   <tr>
     <td align="right">详细内容：</td>
     <td><asp:TextBox id="info_content" TextMode="MultiLine" runat="server" style="width:100%;height:400px;"></asp:TextBox></td>
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
      <asp:TextBox ID="keywords" runat="server" Width="250" style="margin:auto;" CssClass="txt"></asp:TextBox>
      <asp:DropDownList ID="search_option" runat="server"></asp:DropDownList>
      <input name="MenuId" type="hidden" id="MenuId" value="<%=LS.Common.Function.GetRequest("MenuId")%>" />
      <asp:Button ID="Button2" runat="server"  OnClick="OnClick_Search" Text=" 搜 索 " CssClass="btn"/>
      </div>
      <div style="float:right; padding-right:10px;"><%=addurlstr %></div>
	</td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tb tb2 fixpadding">
  <tr class="partition">
    <td align="center" width="4%">ID</td>
    <td align="left" width="35%">标题</td>
    <td align="center" width="10%">分类</td>
    <td align="center" width="8%">图片</td>
    <td align="center" width="12%">排序ID</td>
    <td align="center" width="5%">显示</td>
    <td align="center" width="5%">置顶</td>
    <td align="center" width="15%">发布时间</td>
    <td align="center" width="6%">操作</td>
  </tr>
  
   <asp:Repeater ID="Repeater1" runat="server">
   <ItemTemplate>
  <tr class="hover">
  <td align="center"><input name="id" class="checkbox" type="checkbox" id="id" value="<%#Eval("ID")%>"></td>
    <td align="left"><%#Eval("title")%></td>
    <td align="center"><%#LS.Common.Function.GetColumn(Eval("classid").ToString(),"classname")%></td>
    <td align="center"  ><img src="<%#LS.Common.Function.GetImgURL(Eval("upload_pic").ToString())%>" height="20" style="border:1px solid #cccccc" class="tooltip"></td>
    <td align="center" >
            <div id="td22<%#Eval("id")%>"><span class="orderidVal"><%#Eval("OrderId")%></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="cursor:pointer;" onclick="$('#td22<%#Eval("id")%>').hide();$('#td11<%#Eval("id")%>').show();">编辑</span></div>
			<div id="td11<%#Eval("id")%>" style="display:none;">
            <input type="text" id="td33<%#Eval("id")%>" value="<%#Eval("OrderId")%>" class="txt" reg="^\d+$" tip="必须填写数字" name="orderid<%#Eval("id")%>" onkeypress="return event.keyCode>=48&&event.keyCode<=57||event.keyCode==46" onpaste="return !clipboardData.getData('text').match(/\D/)" style="ime-mode:Disabled; width:60px;" ondragenter="return false">
            <input type="button" class="btn" value="修改" onclick="$('td22<%#Eval("id")%>').hide();$('td11<%#Eval("id")%>').show();UpdateOrder(<%#Eval("id")%>,'orderid','News_List',$('#td33<%#Eval("id")%>').val());"/></div>
    </td>
    <td align="center"><img src="<%#GetIsShow(Eval("isshow").ToString())%>" id="isshow<%#Eval("id")%>" width="14" height="14" border="0" style="cursor:pointer;" onclick="IsYes(<%#Eval("id")%>,'isshow','News_List')" /></td>
    <td align="center"><img src="<%#GetIsShow(Eval("istop").ToString())%>" id="istop<%#Eval("id")%>" width="14" height="14" border="0" style="cursor:pointer;" onclick="IsYes(<%#Eval("id")%>,'istop','News_List')" /></td>
    <td align="center"><%#Eval("AddTime").ToString()%></td>
    <td align="center">
      <a href="?MenuId=<%=MenuId%>&classid=<%#Eval("classid")%>&Action=EditInfo&ID=<%#Eval("ID")%>&BackURL=<%#LS.Common.Function.GetEncodeURL()%>"><img src="images/icon_edit.gif" alt="编辑" width="16" height="16" border="0" align="absmiddle"></a> 
      <a href="?MenuId=<%=MenuId%>&Action=DelInfo&ID=<%#Eval("ID")%>&BackURL=<%#LS.Common.Function.GetEncodeURL()%>" onClick="return(confirm('确定删除吗？'))"><img src="images/icon_drop.gif" alt="删除" width="16" height="16" border="0" align="absmiddle"></a>
    </td>
  </tr>
    </ItemTemplate>
<FooterTemplate>
    <tr class="hover" id="Tr1" runat="server" Visible="<%#bool.Parse((Repeater1.Items.Count==0).ToString())%>" >
    <td align="center" colspan="7" style="height:0px; padding:4px; margin:0;">无相关数据!</td>
    </tr>
</FooterTemplate>
</asp:Repeater>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:10px 0;">
  <tr>
    <td width="15%" align="left">
    <input name="chkall" type="checkbox" id="chkall" value="all" class="checkbox" onClick="CheckAll(this.form)" /> 全选
    <asp:Button ID="submitid" runat="server"  OnClick="DelSelect_Click" Text="清除选中数据" CssClass="btn"/>
    <input name="BackURL" type="hidden" id="BackURL" value="<%=LS.Common.Function.GetDecodeURL()%>" />
    </td>
    <td width="83%"><div class="msdn"><webdiyer:AspNetPager id="AspNetPager1" runat="server" CurrentPageButtonClass="current" FirstPageText="Home" PrevPageText="Prev" NextPageText="Next" LastPageText="End" 
                                                   ShowDisabledButtons="true" onpagechanged="AspNetPager1_PageChanged" UrlPaging="true" PageIndexBoxClass="input_page" PageIndexBoxType="TextBox" SubmitButtonClass="go" SubmitButtonText="GO" ShowPageIndexBox="Always"></webdiyer:AspNetPager></div></td>
  </tr>
</table>
</asp:Panel>
    
    </div>
    </form>


<script type="text/javascript">
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        laydate.render({
            format: 'yyyy/MM/dd HH:mm:ss',
            festival: false, //显示节日
            istime: true, //是否开启时间选择
            elem: '#addtime',
            event: 'focus' //响应事件。如果没有传入event，则按照默认的click
        });
    });
</script>

</body>
</html>
