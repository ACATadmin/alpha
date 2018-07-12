<%@ page language="C#" autoeventwireup="true" inherits="store, afm_new" enableviewstate="false" enableviewstatemac="false" enableEventValidation="false" %>

<%@ Register TagPrefix="LS" TagName="top" Src="top.ascx"%>
<%@ Register TagPrefix="LS" TagName="foot" Src="foot.ascx"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no"/>
<title>ACAT Store-Alphacat</title>
<link rel="stylesheet" href="css/animate.min.css" />
<link rel="stylesheet" href="css/swiper.min.css" />
<link rel="stylesheet" href="css/public.css" />
<link rel="stylesheet" href="css/media.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/swiper.min.js"></script>
</head>

<body>
<div class="store_top">
 <LS:top ID="top" runat="server" />
 </div>
<div class="store_ban">
	<div class="store">
		<h1>Welcome to ACAT Store.</h1>
		<h2>The Future of FinTech is <span>Here</span>.</h2>
		
		<form id="from" class="store_form">
			<input type="text" id="Email" name="Email" placeholder="email" />
			<a href="javascript:;" id="submit" class="submit">KEEP UPDATED!</a>
            <input type="hidden" name="checkcode" id="code" value="<%=LS.Common.Function.RandomNum(4) %>" />
		</form>
             <script type="text/javascript">
                 $("#submit").click(function () {
                     var Email = $("#Email").val();
                     if (Email == "") {
                         alert("Email不能为空");
                         $("#Email").focus();
                         return false;
                     }
					  var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
             if (filter.test(Email)) {
                  $.ajax({
                         url: "A_Util/Fun.ashx?act=addemail&cid=42",
                         type: "post",
                         dataType: "json",
                         data: $('#from').serialize(),
                         success: function (data) {
                             $("#checkcode").val(data.code);
                             $("#code").val(data.code);
                             alert(data.result);
                             $("#Email").val("");
                         }
                     })
             }
             else {
                 alert("Please enter the correct email address");
                 $("#Email").focus();
                 return false;
             }
                    
                 })
               </script>
	</div>
</div>
	



 <LS:foot ID="foot" runat="server" />
</body>
</html>