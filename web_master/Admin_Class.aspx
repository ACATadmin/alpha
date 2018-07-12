<%@ page language="C#" autoeventwireup="true" inherits="web_master_Admin_Class, afm_new" enableviewstate="false" enableviewstatemac="false" enableEventValidation="false" %>
<%@ Register TagPrefix="LS" TagName="Inc" Src="Inc.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="x-ua-compatible" content="ie=7" />
    <title>分类管理</title>
    <LS:Inc ID="Inc1" runat="server" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container" id="cpcontainer">
    <asp:Panel ID="AddUp" runat="server" Visible="false">
    <%=LS.Common.Function.Lay_UpLoadImg("upload_pic")%>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tb tb2 fixpadding">
   <tr class="partition">
     <td height="28" colspan="2" class="titl">添加分类</td>
   </tr>
   <tr>
     <td width="10%" height="33" align="right">分类名称：</td>
     <td width="90%"><asp:TextBox ID="className" TextMode="SingleLine" runat="server" Width="250" CssClass="txt" reg="^.+$" tip="不能为空"></asp:TextBox></td>
    </tr>
   <tr>
   <td align="right">分类图片:</td>
    <td>
        <button type="button" class="layui-btn" id="upload_pic_btn" lay-data="{exts: 'jpg|png|gif|bmp|jpeg'}"><i class="layui-icon">&#xe64a;</i>上传图片</button>
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
    <tr> <td align="right">分类简介：</td>
     <td><asp:TextBox id="about" TextMode="MultiLine" runat="server" Width="400" Height="150"></asp:TextBox></td>
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
    <td class="l">所属分类：<%=LS.Common.Function.GetColumn(Request.QueryString["ParentId"],"classname")%></td>
    <td class="r"><%=GetTool(Request.QueryString["ParentId"])%></td>
  </tr>
</table>

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tb tb2 fixpadding">
  <tr class="partition">
    <td align="center" width="5%">选中</td>
    <td align="left">分类名称</td>
    <td align="center" width="15%">分类图片</td>
    <td align="center" width="15%">排序ID</td>
    <%if (LS.Common.Cookie.GetCookie("LS_AdminName").ToUpper() == "LSADMIN" || LS.Common.Cookie.GetCookie("LS_AdminName").ToUpper() == "SYSADMIN")
      { %>
    <td align="center" width="10%">是/否显示</td>
    <%} %>
    <td align="center" width="10%">操作</td>
  </tr>
  
   <asp:Repeater ID="Repeater1" runat="server">
   <ItemTemplate>
  <tr class="hover">
  <td align="center"><input name="id" class="checkbox" type="checkbox" id="id" value="<%#Eval("ID")%>"></td>
    <td align="left" style="font-weight:800; padding-left:12px;"><a href="Admin_Class.aspx?MenuId=<%=Request.QueryString["MenuId"]%>&ParentID=<%#Eval("id")%>"><%#Eval("ClassName")%><%#GetCount(Eval("ID").ToString())%></a></td>
    <td align="center"><img src="<%#LS.Common.Function.GetImgURL(Eval("upload_pic").ToString())%>" height="20" style="border:1px solid #cccccc" class="tooltip"></td>
      <td align="center">
                <div id="td22<%#Eval("id")%>"><span class="orderidVal"><%#Eval("OrderId")%></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="cursor:pointer;" onclick="$('#td22<%#Eval("id")%>').hide();$('#td11<%#Eval("id")%>').show();">编辑</span></div>
			    <div id="td11<%#Eval("id")%>" style="display:none;">
                <input type="text" id="td33<%#Eval("id")%>" value="<%#Eval("OrderId")%>" class="txt" reg="^\d+$" tip="必须填写数字" name="orderid<%#Eval("id")%>" onkeypress="return event.keyCode>=48&&event.keyCode<=57||event.keyCode==46" onpaste="return !clipboardData.getData('text').match(/\D/)" style="ime-mode:Disabled; width:60px;" ondragenter="return false">
                <input type="button" class="btn up" value="修改" onclick="$('td22<%#Eval("id")%>').hide();$('td11<%#Eval("id")%>').show();UpdateOrder(<%#Eval("id")%>,'orderid','tbl_class',$('#td33<%#Eval("id")%>').val());"/></div>
      </td>
   <%if (LS.Common.Cookie.GetCookie("LS_AdminName").ToUpper() == "LSADMIN" || LS.Common.Cookie.GetCookie("LS_AdminName").ToUpper() == "SYSADMIN")
     { %>
   <td align="center"><img src="<%#GetIsShow(Eval("isshow").ToString())%>" id="isshow<%#Eval("id")%>" width="14" height="14" border="0" style="cursor:pointer;" onclick="IsYes(<%#Eval("id")%>,'isshow','tbl_class')" /></td>
   <%} %>
    <td align="center">
      <a href="?ParentId=<%=LS.Common.Function.GetRequest("ParentId")%>&MenuID=<%=Request.QueryString["MenuID"]%>&ID=<%#Eval("ID")%>&Action=EditInfo&BackURL=<%#LS.Common.Function.GetEncodeURL()%>"><img src="images/icon_edit.gif" alt="编辑" width="16" height="16" border="0" align="absmiddle"></a> 
      <%#GetOperation(Eval("ParentId").ToString(), Eval("Id").ToString())%>
    </td>
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
    <asp:Button ID="submitid" runat="server"  OnClick="DelSelect_Click" Text="清除所选分类" CssClass="btn"/>
    <input name="BackURL" type="hidden" id="BackURL" value="<%=LS.Common.Function.GetDecodeURL()%>" />
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
