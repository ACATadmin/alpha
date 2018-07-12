<%@ page language="C#" autoeventwireup="true" inherits="web_master_Admin_FileList, afm_new" enableviewstate="false" enableviewstatemac="false" enableEventValidation="false" %>
<%@ Register TagPrefix="LS" TagName="Inc" Src="Inc.ascx" %>
<%@ Register TagPrefix="LS" TagName="uploadFile" Src="uploadFile.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="x-ua-compatible" content="ie=7" />
    <title>文件管理</title>
    <LS:Inc ID="Inc1" runat="server" />
    <LS:uploadFile ID="uploadFile" runat="server" />
</head>

<body>
    <form id="form1" runat="server">
    <div class="container" id="cpcontainer">
    <asp:Panel ID="AddUp" runat="server" Visible="false">

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tb tb2 fixpadding">
   <tr class="partition">
     <td height="28" colspan="2" class="titl"><asp:Literal ID="Txt_Title" runat="server"></asp:Literal></td>
   </tr>
   <tr>
     <td width="10%" height="33" align="right">名称：</td>
     <td width="90%"><asp:TextBox ID="title" TextMode="SingleLine" runat="server" Width="450" CssClass="txt" reg="[^0]" tip="不能为空"></asp:TextBox></td>
    </tr>

    <tr>
      <td align="right">附件上传：</td>
      <td>
<div id="uploader" class="wu-example">
    <!--用来存放文件信息-->
    <div id="thelist" class="uploader-list"></div>
    <div class="btns">
        <div id="picker">选择文件</div>
    </div>
    <div id="fileList"></div>
    <asp:HiddenField ID="up_fileName_Old" runat="server"></asp:HiddenField>
</div>
      </td>
    </tr>

   <tr>
     <td align="right" >简介：</td>
     <td ><asp:TextBox id="about" TextMode="MultiLine" runat="server" Width="500" Height="120"></asp:TextBox></td>
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
      <input name="MenuId" type="hidden" id="MenuId" value="<%=MenuId%>" />
      <asp:Button ID="Button2" runat="server"  OnClick="OnClick_Search" Text=" 搜 索 " CssClass="btn"/>
      </div>
      <div style="float:right; padding-right:10px;"><%=addurlstr %></div>
	</td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tb tb2 fixpadding">
  <tr class="partition">
    <td align="center" width="5%">ID</td>
    <td align="left" width="35%">名称</td>
    <td align="center" width="10%">分类</td>
    <td align="center" width="12%">排序ID</td>
    <td align="center" width="15%">添加时间</td>
    <td align="center" width="6%">操作</td>
  </tr>
  
   <asp:Repeater ID="Repeater1" runat="server">
   <ItemTemplate>
  <tr class="hover">
  <td align="center"><input name="id" class="checkbox" type="checkbox" id="id" value="<%#Eval("ID")%>"></td>
    <td align="left"><%#Eval("title")%></td>
    <td align="center"><%#LS.Common.Function.GetColumn(Eval("classid").ToString(),"classname")%></td>
  
    <td align="center" >
            <div id="td22<%#Eval("id")%>"><span class="orderidVal"><%#Eval("OrderId")%></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="cursor:pointer;" onclick="$('#td22<%#Eval("id")%>').hide();$('#td11<%#Eval("id")%>').show();">编辑</span></div>
			<div id="td11<%#Eval("id")%>" style="display:none;">
            <input type="text" id="td33<%#Eval("id")%>" value="<%#Eval("OrderId")%>" class="txt" reg="^\d+$" tip="必须填写数字" name="orderid<%#Eval("id")%>" onkeypress="return event.keyCode>=48&&event.keyCode<=57||event.keyCode==46" onpaste="return !clipboardData.getData('text').match(/\D/)" style="ime-mode:Disabled; width:60px;" ondragenter="return false">
            <input type="button" class="btn" value="修改" onclick="$('td22<%#Eval("id")%>').hide();$('td11<%#Eval("id")%>').show();UpdateOrder(<%#Eval("id")%>,'orderid','File_List',$('#td33<%#Eval("id")%>').val());"/></div>
    </td>
    <td align="center"><%#Eval("addTime").ToString()%></td>
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


</body>
</html>
