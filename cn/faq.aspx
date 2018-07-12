<%@ page language="C#" autoeventwireup="true" inherits="en_faq, afm_new" enableviewstate="false" enableviewstatemac="false" enableEventValidation="false" %>

<%@ Register TagPrefix="LS" TagName="top" Src="top.ascx"%>
<%@ Register TagPrefix="LS" TagName="foot" Src="foot.ascx"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no"/>
<title>FAQ-Alphacat</title>
<link rel="stylesheet" href="css/animate.min.css" />
<link rel="stylesheet" href="css/swiper.min.css" />
<link rel="stylesheet" href="css/public.css" />
<link rel="stylesheet" href="css/media.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/swiper.min.js"></script>
<script>
    function navList(id) {
        var $obj = $(".operate ul");
        $obj.find("h4").click(function () {
            var $div = $(this).siblings(".list-item");
            if ($(this).parent().hasClass("selected")) {
                $div.slideUp(300);
                $(this).parent().removeClass("selected");
            }
            if ($div.is(":hidden")) {
                $(".operate ul li").find(".list-item").slideUp(300);
                $(".operate ul li").removeClass("selected");
                $(this).parent().addClass("selected");
                $div.slideDown(300);
            } else {
                $div.slideUp(300);
            }
        });
    }
</script>

</head>

<body>
 <LS:top ID="top" runat="server" />
<div class="faq_ban">
	<h1 class="wow slideInUp">FAQ</h1>
</div>
<div class="faq">
	<div class="faq_main">
		<div class="faq_nav">
		<li <%=GetStyle("57") %>><a href="faq.aspx?cid=57">Platform</a></li>
		
			
			<li <%=GetStyle("58") %>><a href="faq.aspx?cid=58">Tokens</a></li>
			<li <%=GetStyle("59") %>><a href="faq.aspx?cid=59">General FAQ</a></li>
		</div><!-- faq_nav -->

<div class="recruitment">
	<div class="operate">
		<ul>   
            <asp:Repeater ID="Repeater1" runat="server"><ItemTemplate>       
			<li>
				<h4><%#Eval("title") %>
					<i><span class="re_sub trans">&nbsp;</span></i>                            
				</h4>
				<div class="list-item"> 
					<p>	
					<%#LS.Common.Function.HtmlDiscode(Eval("details").ToString()) %>
					</p>
				</div>
			</li>
	       </ItemTemplate></asp:Repeater>
		</ul>
		
	</div><!-- operate -->
	<script type="text/javascript">
	    navList(12);
	</script>
</div><!-- recruitment -->


	</div><!-- faq_main -->
</div><!-- faq -->


 <LS:foot ID="foot" runat="server" />
</body>
</html>