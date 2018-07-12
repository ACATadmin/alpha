<%@ page language="C#" autoeventwireup="true" inherits="web_master_Left, afm_new" enableviewstate="false" enableviewstatemac="false" enableEventValidation="false" %>
<ul>
<asp:repeater id="myRepeater" runat="server">
<ItemTemplate> 
    <li><a href="<%#GetUrl(Eval("popedom_url").ToString(),Eval("id").ToString())%>" hidefocus="true" target="main"><%#Eval("popedom_name")%></a></li>
</ItemTemplate>
</asp:repeater>    
</ul>
<script type="text/JavaScript"> 
$('.menu li').click( function () { 
   $('.menu li').css("background","");
   $('.menu li a').css("color","");
   $(this).children("a").css("color","#2366A8");
   $(this).css("background","#DEEFFA");  
});
</script>