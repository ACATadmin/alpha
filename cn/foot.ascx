<%@ control language="C#" autoeventwireup="true" inherits="en_foot, afm_new" enableviewstate="false" %>
<div class="foot">
	<div class="foot_main">
		<ul>
			<h1><a href="javascript:;">導航</a></h1>
			<li><a href="index.aspx">首頁</a></li>
			<li><a href="/Alphacat-WhitePaper_CN.pdf" target="_blank">白皮書</a></li>
			<li id="f_team"><a href="index.aspx#team">團隊</a></li>
			<li id="m_partners"><a href="index.aspx#partners">合作夥伴</a></li>
		</ul>
		<ul>
			<h1><a href="javascript:;">幫助</a></h1>
			<li><a href="faq.aspx">常見問答</a></li>
			<li><a href="mailto:public@alphacat.io">聯繫我們</a></li>
		</ul>
		



		<div class="foot_email">
         <form class="search_form" action="" id="form">
			<input id="EmailMsg" name="Email" type="text" placeholder="EMAIL" /> <a href="javascript:;" id="submitMsg" class="submit">訂閱</a>
             <input type="hidden" name="checkcode" id="checkcode" value="<%=LS.Common.Function.RandomNum(4) %>" />
         </form>
     <script type="text/javascript">
         $("#submitMsg").click(function () {
             var Email = $("#EmailMsg").val();
             if (Email == "") {
                 alert("Email不能为空");
                 $("#EmailMsg").focus();
                 return false;
             }
             $.ajax({
                 url: "A_Util/Fun.ashx?act=addemail&cid=50",
                 type: "post",
                 dataType: "json",
                 data: $('#form').serialize(),
                 success: function (data) {
                     $("#checkcode").val(data.code);
                     $("#code").val(data.code);
                     alert(data.result);
                     $("#EmailMsg").val("");
                 }
             })
         })
</script>
			<div class="share">
					<a href="https://medium.com/@AlphacatGlobal" class="icon1" target="_blank"></a>
				<a href="https://www.facebook.com/Alphacat.io/" class="icon2" target="_blank"></a>
				<a href="https://twitter.com/Alphacat_io" class="icon3" target="_blank"></a>
				<a href="https://t.me/alphacatglobal" class="icon4" target="_blank"></a>
				<a href="javascript:;" class="icon5 theme-login" ></a>
				<a href="https://www.reddit.com/r/alphacat_io" class="icon6" target="_blank"></a>
				<a href="mailto:public@alphacat.io" class="icon7"></a>
			</div>
			<p>© Copyright 2018 by AlphaCat Inc - All Rights Reserved | public@alphacat.io </p>
		</div><!-- foot_email -->
		<div class="foot_logo">
			<img src="images/foot_logo.png" alt="" />
		</div>
	</div>
</div>

<div class="theme-popover">
     <div class="theme-poptit">
          <a href="javascript:;" title="关闭" class="close"></a>
     </div>
     <div class="theme-popbod"> <img src="images/ewm1.jpg" alt="" /> </div>
</div>
<div class="theme-popover-mask"></div>

<script type="text/javascript" src="js/wow.min.js"></script>
<script>
    if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))) {
        new WOW().init();
    };

</script>