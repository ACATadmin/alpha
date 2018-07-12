<%@ page language="C#" autoeventwireup="true" inherits="web_master_Login, afm_new" enableviewstate="false" enableviewstatemac="false" enableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="x-ua-compatible" content="ie=7" />
    <title>网站后台登录</title>
    <script language="javascript" type="text/javascript" src="../A_Util/jquery.min.js"></script>
    <script type="text/javascript" src="../A_Util/jquery.validator.pack.js"></script>
    <link  href="css/form_validate.css" rel="stylesheet" type="text/css" />

</head>
<style>
body{background-color:#F7F7F7; padding:0; margin:0; font:12px "Lucida Grande", Verdana, Lucida, Helvetica, Arial, sans-serif; color:#666666;}
form{margin:0; padding:0;}
INPUT{
	BACKGROUND: url(images/input.png) repeat-x 0px 0px; BORDER-BOTTOM: #cecece 1px solid; BORDER-LEFT: #707070 1px solid;BORDER-TOP: #707070 1px solid; BORDER-RIGHT: #cecece 1px solid;
}
.t_select{padding:2px; *padding:1px; BACKGROUND: url(images/input.png) repeat-x 0px 0px; BORDER-BOTTOM: #cecece 1px solid; BORDER-LEFT: #707070 1px solid;BORDER-TOP: #707070 1px solid; BORDER-RIGHT: #cecece 1px solid; height:16px; *height:18px; width:87px;}
.name_txt{
	LINE-HEIGHT: 30px; MARGIN-TOP: 5px; DISPLAY: inline-block; FLOAT: left; HEIGHT: 30px;TEXT-ALIGN: right; WIDTH: 90px; PADDING-RIGHT: 5px; COLOR: #333; FONT-SIZE: 14px; FONT-WEIGHT: bold
}

.input_txt {
	PADDING-BOTTOM: 2px; LINE-HEIGHT: 18px; PADDING-LEFT: 4px; PADDING-RIGHT: 4px; HEIGHT: 18px; VERTICAL-ALIGN: middle; PADDING-TOP: 2px; width:160px;
}
.login-btn {
	BORDER-BOTTOM-STYLE: none; TEXT-ALIGN: center; LINE-HEIGHT: 28px; BORDER-RIGHT-STYLE: none; MARGIN-TOP: 5px; WIDTH: 84px; BORDER-TOP-STYLE: none; BACKGROUND: url(images/login-btn.jpg) no-repeat; HEIGHT: 28px; COLOR: #fff; FONT-SIZE: 14px; BORDER-LEFT-STYLE: none; CURSOR: pointer; FONT-WEIGHT: bold
}
.login-power {
	TEXT-ALIGN: right; MARGIN-TOP: 5px; FONT: 11px/25px Tahoma,Helvetica,Arial,sans-serif; HEIGHT: 25px; COLOR: #999; padding-right:30px;
}
</style>
    <!--[if IE 6]>
    <script src="../A_Util/png.js" type="text/javascript"></script>
    <script>
      DD_belatedPNG.fix('#vtipArrow');
    </script>
    <![endif]-->
<body>
    <form id="form1" runat="server">
    <div>
    <table width="600" border="0" align="center" cellpadding="0" cellspacing="5" bgcolor="#EEEEEE" style="margin-top:150px;">
  <tr>
    <td height="271" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td align="right" height="48" style="background:url(images/login-top.jpg) no-repeat center center; padding-right:25px;">返回网站主页</td>
      </tr>
      <tr>
        <td height="51"><table width="94%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#F2DD8C">
          <tr>
            <td height="31" bgcolor="#FFFFCC" style="padding:0 10px;"><img src="images/safe-tips.gif" width="16" height="14" style="vertical-align:middle;" /> 友情提醒：我们建议您设置复杂的登录密码！</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="138">
        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="56%" height="67"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="26%" align="center"><span class="name_txt">用户名：</span></td>
                <td width="74%"><asp:TextBox ID="user_name" TextMode="SingleLine" runat="server" CssClass="input_txt" reg="^.+$" tip="请输入后台登录用户名"></asp:TextBox></td>
              </tr>
              <tr>
                <td align="center"><span class="name_txt">密　码：</span></td>
                <td><asp:TextBox ID="user_pwd" TextMode="Password" runat="server" CssClass="input_txt" reg="^.+$" tip="请输入用户名相对应的密码"></asp:TextBox></td>
              </tr>
              <tr>
                <td width="26%" align="center"><span class="name_txt">有效期：</span></td>
                <td width="74%">
                <div class="t_select">
                <span style="border:0; position:absolute; overflow:hidden">
                <select name="expires" id="expires" style="margin:-2px;">
                  <option value="0">浏览器进程</option>
                  <option value="1">一小时</option>
                  <option value="24">一天</option>
                  <option value="720">一个月</option>
                  <option value="8760">永远</option>
                </select></span>
                </div>
                </td>
              </tr>
              <tr>
                <td height="25" align="center">&nbsp;</td>
                <td><asp:Button ID="button" runat="server" Text="登录后台" CssClass="login-btn" onfocus="this.blur()" OnClick="AdminLogin_Click" /></td>
              </tr>
            </table></td>
            <td width="44%"><img src="images/login-bg.jpg" width="249" height="138" alt="" /></td>
          </tr>
        </table>
        </td>
      </tr>
      <tr>
        <td height="27" align="right" class="login-power">Powered by Z3.0 © 2018 CN7080.COM Inc.</td>
      </tr>
    </table></td>
  </tr>
</table>
    </div>
    </form>
</body>
</html>

