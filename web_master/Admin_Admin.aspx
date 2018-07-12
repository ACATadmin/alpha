<%@ page language="C#" autoeventwireup="true" inherits="web_master_Admin_Admin, afm_new" enableviewstate="false" enableviewstatemac="false" enableEventValidation="false" %>
<%@ Register TagPrefix="LS" TagName="Inc" Src="Inc.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="x-ua-compatible" content="ie=7" />
    <title>管理员管理</title>
    <LS:Inc ID="Inc1" runat="server" />
</head>
<script language="javascript">
function unselectall()
{
    if(document.myform.chkAll.checked){
	document.myform.chkAll.checked = document.myform.chkAll.checked&0;
    }
}

function CheckAll(form)
{
  for (var i=0;i<form.elements.length;i++)
    {
    var e = form.elements[i];
    if (e.Name != "chkAll"&&e.disabled!=true)
       e.checked = form.chkAll.checked;
    }
}

function GetPopedom(name,fathername)
{
    if (name.checked == true) {
        fathername.checked = true;
    }
 }

function GetPopedom1(fathername,id)
{
    if (fathername.checked == false) {
        $(".b_checkbox" + id).attr("checked", false);
    } else {
        $(".b_checkbox" + id).attr("checked", true);
    }
}
</script>
<body>
    <form id="form1" runat="server" name="form1">
    <div class="container" id="cpcontainer">
    
<asp:Panel ID="AddUser" runat="server" Visible="false">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tb tb2 fixpadding">
  <tr class="partition">
    <td height="22" colspan="2" align="center"><asp:Label ID="Title" runat="server"></asp:Label></td>
  </tr>
  <tr class="hover">
    <td width="35%">管理员名称 ：</td>
    <td width="65%"><asp:TextBox ID="Admin_Name" TextMode="SingleLine" CssClass="txt" Width="200" runat="server" reg="^\w+$" strlen="4,50" tip="由数字、26个英文字母或者下划线组成的字符串" ></asp:TextBox>
    </td>
  </tr>
  <tr class="hover">
    <td width="35%">密码：</td>
    <td width="65%">
    <asp:TextBox ID="Admin_Pwd" TextMode="Password" runat="server" CssClass="txt" Width="200"></asp:TextBox>
    </td>
  </tr>
  <tr class="hover">
    <td width="35%">确认密码：</td>
    <td width="65%">
    <asp:TextBox ID="Admin_Pwd1" TextMode="Password" runat="server" CssClass="txt" Width="200"></asp:TextBox>
    </td>
  </tr>
  <tr>
    <td colspan="2"><div align="center">
    <asp:Button ID="Button1" Text=" 修 改 " CssClass="btn" runat="server" OnClick="OnClick_AddUp" />
&nbsp;
     <input type="button" class="btn" onClick="javascript:history.go(-1)" value=" 返 回 ">

</div></td>
  </tr>
</table>
</asp:Panel>    
    
    

<asp:Panel ID="Main" runat="server" Visible="false">
<table class="t_class">
  <tr>
    <td class="l">当前位置：管理员列表</td>
    <td class="r"><%=addurlstr %></td>
  </tr>
</table>

        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tb tb2 fixpadding">
          <tr class="partition">
           <td width="5%" height="22" align="center">ID</td>
           <td width="10%">用户名</td>
           <td width="25%">密 码</td>
           <td width="15%">添加时间</td>
           <td width="10%">最后登录IP</td>
           <td width="15%">最后登录时间</td>
           <td width="20%">操 作</td>
         </tr>
         
<asp:repeater id="myRepeater" runat="server">
<ItemTemplate> 
         <tr class="hover">
           <td align="center"><%#Eval("id")%></td>
           <td><%#Eval("userName")%><%#GetLock(Eval("isLock").ToString()) %></td>
           <td><%#Eval("userPwd")%></td>
           <td><%#Eval("addtime")%></td>
           <td><%#Eval("lastLoginIp")%></td>
           <td><%#Eval("lastLoginTime")%></td>
           <td><%#GetString(Eval("userName").ToString(), Convert.ToInt16(Eval("isLock")), Convert.ToInt16(Eval("id")))%></td>

         </tr>
</ItemTemplate>
<FooterTemplate>

    <tr class="hover" id="Tr1" runat="server" Visible="<%#bool.Parse((myRepeater.Items.Count==0).ToString())%>" >
    <td align="center" colspan="7" style="height:0px; padding:4px; margin:0;">无相关数据!</td>
    </tr>

</FooterTemplate>
</asp:repeater>

  </table>
</asp:Panel>
    
    
<asp:Panel ID="Popedom" runat="server" Visible="false">
<div class="itemtitle"><h3>设置<span class="red">管理员菜单</span>权限</h3></div>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
<asp:Repeater id="myRepeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
<ItemTemplate> 
<tr><td height="6"></td></tr>
        <tr class="hover">
          <td height="26"><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" class="tb tb2 fixpadding">
                <tr class="partition">
                  <td><label><input id="checkbox<%#Eval("id")%>" type="checkbox" class="a_checkbox<%#Eval("id")%>" name="checkbox_pop" value='<%#Eval("id")%>' onclick='GetPopedom1(this,<%#Eval("id")%>)' <%#GetChecked(Eval("id").ToString())%>/><%#Eval("popedom_name")%></label></td>
            </tr>
            </table></td>
        </tr>
        <tr>
          <td height="25" valign="top">
            <table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0" class="tb tb2 fixpadding" style="margin-top:0;">
            
              <tr class="hover">
                <td bgcolor="#F8FBFC" style="padding-left:20px; line-height:30px;">
<asp:Repeater id="myRepeater2" runat="server">
<ItemTemplate>

                    <label><input id="checkbox<%#Eval("popedom_father")%>" name="checkbox_pop" type="checkbox" class="b_checkbox<%#Eval("popedom_father")%>" value='<%#Eval("id")%>' onclick='GetPopedom(this,$("#checkbox"+<%#Eval("popedom_father")%>)[0])' <%#GetChecked(Eval("id").ToString())%>/><%#Eval("popedom_name")%></label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

</ItemTemplate>
</asp:Repeater>
                    </td>
              </tr>
          </table></td>
        </tr>
</ItemTemplate>
</asp:Repeater>
<tr>
   <td height="35" align="center" valign="bottom">
          <asp:Button ID="Button01" runat="server" Text="保存修改结果" CssClass="btn" OnClick="OnClick_Popedom" />
        &nbsp;
          <input type="button" class="btn" onClick="javascript:history.go(-1)" value=" 返 回 ">
   </td>
</tr>
  </table>
</asp:Panel>


<asp:Panel ID="WebPopedom" runat="server" Visible="false">

<div class="itemtitle"><h3>设置<span class="red">网站栏目</span>权限</h3></div>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
<asp:Repeater id="myRepeater3" runat="server" OnItemDataBound="Repeater3_ItemDataBound">
<ItemTemplate> 
<tr><td height="6"></td></tr>
        <tr class="hover">
          <td height="26"><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" class="tb tb2 fixpadding">
                <tr class="partition">
                  <td><label><input id="checkbox<%#Eval("id")%>" type="checkbox" class="a_checkbox<%#Eval("id")%>" name="checkbox_pop" value='<%#Eval("id")%>' onclick='GetPopedom1(this,<%#Eval("id")%>)' <%#GetWebChecked(Eval("id").ToString())%>/><%#Eval("classname")%></label></td>
            </tr>
            </table></td>
        </tr>
        <tr<%#GetDisplay(Eval("id").ToString()) %>>
          <td height="25" valign="top">
            <table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0" class="tb tb2 fixpadding" style="margin-top:0;">
            
              <tr class="hover">
                <td bgcolor="#F8FBFC" style="padding-left:20px; line-height:30px;">
<asp:Repeater id="myRepeater4" runat="server">
<ItemTemplate>

                    <label><input id="checkbox<%#Eval("parentid")%>" name="checkbox_pop" type="checkbox" class="b_checkbox<%#Eval("parentid")%>" value='<%#LS.Common.Function.GetChildrenId(Eval("id").ToString())%>' onclick='GetPopedom(this,$("#checkbox"+<%#Eval("parentid")%>)[0])' <%#GetWebChecked(Eval("id").ToString())%>/><%#Eval("classname")%></label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

</ItemTemplate>
</asp:Repeater>
                    </td>
              </tr>
          </table></td>
        </tr>
</ItemTemplate>
</asp:Repeater>
<tr>
   <td height="35" align="center" valign="bottom">
          <asp:Button ID="Button2" runat="server" Text="保存修改结果" CssClass="btn" OnClick="OnClick_WebPopedom" />
        &nbsp;
          <input type="button" class="btn" onClick="javascript:history.go(-1)" value=" 返 回 ">
   </td>
</tr>
  </table>

</asp:Panel>


    </div>
    </form>
</body>
</html>
