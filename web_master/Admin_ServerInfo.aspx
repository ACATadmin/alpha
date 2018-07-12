<%@Page ContentType="text/html" Language="C#" Inherits="SpbDev.DotNetInfo.Index"%>
<%@ Register TagPrefix="spbdev" Namespace="SpbDev.DotNetInfo" Assembly="SpbDev.DotNetInfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="x-ua-compatible" content="ie=7" />
    <title>起始页</title>
    <link media="all" type="text/css" href="css/admin_css.css" rel="stylesheet" />
</head>
<body>
<div class="container" id="cpcontainer">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tb tb2 fixpadding">
    <tr class="partition"> 
        <td colspan="2">服务器基本信息</td>
    </tr>
    <tr class="hover"> 
        <td width="38%" height="26">服务器计算机名</td>
        <td><spbdev:SpbLabel ID="ServerName" AllowHtml="false" runat="server"/></td>
    </tr>
    <tr class="hover"> 
        <td height="26">服务器IP地址</td>
        <td><spbdev:SpbLabel ID="ServerIP" AllowHtml="false" runat="server"/></td>
    </tr>
    <tr class="hover"> 
        <td height="26">服务器域名</td>
        <td><spbdev:SpbLabel ID="ServerDomain" AllowHtml="false" runat="server"/></td>
    </tr>
    <tr class="hover"> 
        <td height="26">服务器端口</td>
        <td><spbdev:SpbLabel ID="ServerPort" AllowHtml="false" runat="server"/></td>
    </tr>
    <tr class="hover"> 
        <td height="26">站点虚拟目录名称</td>
        <td><spbdev:SpbLabel ID="ServerAppPath" AllowHtml="false" runat="server"/></td>
    </tr>
    <tr class="hover">
        <td height="26">服务器操作系统</td>
        <td><spbdev:SpbLabel ID="ServerOS" AllowHtml="false" runat="server"/></td>
    </tr>
    <tr class="hover">
        <td height="26">服务器操作系统安装目录</td>
        <td><spbdev:SpbLabel ID="ServerRoot" AllowHtml="false" runat="server"/></td>
    </tr>
    <tr class="hover">
        <td height="26">服务器应用程序安装目录</td>
        <td><spbdev:SpbLabel ID="ServerProgramRoot" AllowHtml="false" runat="server"/></td>
    </tr>
    <tr class="hover">
        <td height="26">.NET Framework语言种类</td>
        <td><spbdev:SpbLabel ID="ServerDotNetLang" AllowHtml="false" runat="server"/></td>
    </tr>
    <tr class="hover">
        <td height="26">.NET Framework 版本</td>
        <td><spbdev:SpbLabel ID="ServerDotNetVer" AllowHtml="false" runat="server"/></td>
    </tr>
</table>
<br>

    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tb tb2 fixpadding">
    <asp:Repeater id="ServerCpuInfo" runat="server">
    <HeaderTemplate>
    <tr class="partition"> 
        <td colspan="2">服务器CPU详细信息</td>
    </tr>
    </HeaderTemplate>
    <ItemTemplate>
    <tr class="hover"> 
        <td width="38%" height="26">第 <%#DataBinder.Eval(Container.DataItem,"CpuNum","")%> 个 CPU 标识</td>
        <td><%#DataBinder.Eval(Container.DataItem,"ProcessorID","")%></td>
    </tr>
    <tr class="hover"> 
        <td height="26">第 <%#DataBinder.Eval(Container.DataItem,"CpuNum","")%> 个 CPU 描述</td>
        <td><%#DataBinder.Eval(Container.DataItem,"Description","")%></td>
    </tr>
    <tr class="hover"> 
        <td height="26">第 <%#DataBinder.Eval(Container.DataItem,"CpuNum","")%> 个 CPU 工作频率</td>
        <td><%#DataBinder.Eval(Container.DataItem,"CurrentClockSpeed","")%> MHz</td>
    </tr>
    <tr class="hover"> 
        <td height="26">第 <%#DataBinder.Eval(Container.DataItem,"CpuNum","")%> 个 CPU 最高频率</td>
        <td><%#DataBinder.Eval(Container.DataItem,"MaxClockSpeed","")%> MHz</td>
    </tr>
    <tr class="hover"> 
        <td height="26">第 <%#DataBinder.Eval(Container.DataItem,"CpuNum","")%> 个 CPU 二级缓存大小</td>
        <td><%#DataBinder.Eval(Container.DataItem,"L2CacheSize","")%></td>
    </tr>
    <tr class="hover"> 
        <td height="26">第 <%#DataBinder.Eval(Container.DataItem,"CpuNum","")%> 个 CPU 二级缓存速度</td>
        <td><%#DataBinder.Eval(Container.DataItem,"L2CacheSpeed","")%></td>
    </tr>
    </ItemTemplate>
    </asp:Repeater>
    
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tb tb2 fixpadding">
    <tr class="partition"> 
        <td colspan="2">服务器COM组件安装检测</td>
    </tr>
    <tr class="hover"> 
        <td width="38%" height="26">数据库访问组件(Adodb.Recordset)</td>
        <td><spbdev:SpbLabel ID="ServerComAdodb" AllowHtml="false" runat="server"/></td>
    </tr>
    <tr class="hover"> 
        <td height="26">JRO数据库压缩组件(JRO.JetEngine)</td>
        <td><spbdev:SpbLabel ID="ServerComJro" AllowHtml="false" runat="server"/></td>
    </tr>
    <tr class="hover"> 
        <td height="26">FSO文件操作组件(Scripting.FileSystemObject)</td>
        <td><spbdev:SpbLabel ID="ServerComFso" AllowHtml="false" runat="server"/></td>
    </tr>
    <tr class="hover"> 
        <td height="26">CDONTS邮件发送组件(CDONTS.NewMail)</td>
        <td><spbdev:SpbLabel ID="ServerComCdonts" AllowHtml="false" runat="server"/></td>
    </tr>
    <tr class="hover"> 
        <td height="26">JMail邮件组件(Jmail.Message)</td>
        <td><spbdev:SpbLabel ID="ServerComJMail" AllowHtml="false" runat="server"/></td>
    </tr>
    <tr class="hover"> 
        <td height="26">Persits文件上传组件(Persits.Upload.1)</td>
        <td><spbdev:SpbLabel ID="ServerComPersitsUp" AllowHtml="false" runat="server"/></td>
    </tr>
    <tr class="hover"> 
        <td height="26">SoftArtisans文件上传组件(SoftArtisans.FileUp)</td>
        <td><spbdev:SpbLabel ID="ServerComSAUp" AllowHtml="false" runat="server"/></td>
    </tr>
    <tr class="hover"> 
        <td height="26">Dundas文件上传组件(Dundas.Upload)</td>
        <td><spbdev:SpbLabel ID="ServerComDundasUp" AllowHtml="false" runat="server"/></td>
    </tr>
    <tr class="hover"> 
        <td height="26">其它COM组件检测</td>
        <td><form method="post" action="<%=Request.FilePath%>?MenuId=<%=Request.QueryString["MenuId"]%>"><input type="text" name="ComProgID" style="width:300px;" value="<%=ProgID%>" class="txt">&nbsp;&nbsp;<input type="submit" value="检测" class="btn">&nbsp;<font color="#FF3333"><spbdev:SpbLabel ID="ServerComCheckRslt" AllowHtml="false" Visible="false" runat="server"/></font></form></td>
    </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tb tb2 fixpadding">
    <tr class="partition"> 
        <td width="100%" colspan="2">服务器性能及网络速度检测</td>
    </tr>
    <tr class="hover"> 
        <td width="38%" height="26">2000万次整数运算性能</td>
        <td><form method="post" action="<%=Request.FilePath%>?MenuId=<%=Request.QueryString["MenuId"]%>"><input type="hidden" name="IntCalCheck" value="2000"><input type="submit" value="检测" class="btn">&nbsp;&nbsp;<font color="#FF3333"><spbdev:SpbLabel ID="ServerIntCalCheck" AllowHtml="false" Visible="false" runat="server"/></font></form></td>
    </tr>
    <tr class="hover"> 
        <td height="26">2000万次浮点运算性能</td>
        <td><form method="post" action="<%=Request.FilePath%>?MenuId=<%=Request.QueryString["MenuId"]%>"><input type="hidden" name="DblCalCheck" value="2000"><input type="submit" value="检测" class="btn">&nbsp;&nbsp;<font color="#FF3333"><spbdev:SpbLabel ID="ServerDblCalCheck" AllowHtml="false" Visible="false" runat="server"/></font></form></td>
    </tr>
    <tr class="hover"> 
        <td height="26">网络速度检测（填写一个正确网址，让服务器去获取数据来测网络速度，<font color="#FF3333"><B>务必耐心等待</B></font>）</td>
        <td><form method="post" action="<%=Request.FilePath%>?MenuId=<%=Request.QueryString["MenuId"]%>"><input type="text" name="ServerNetWorkCheck" style="width:300px;" value="<%=InputEnc(CheckUrl)%>" class="txt">&nbsp;<input type="submit" value="检测" class="btn">&nbsp;&nbsp;<font color="#FF3333"><spbdev:SpbLabel ID="ServerNetWorkCheck" AllowHtml="false" Visible="false" runat="server"/></font></form></td>
    </tr>
    <tr class="hover">
        <td height="26">执行时间</td>
        <td><%=ProcessTime%> 毫秒</td>
    </tr>
</table>
</div>
</body>
</html>
