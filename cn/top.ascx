<%@ control language="C#" autoeventwireup="true" inherits="en_top, afm_new" enableviewstate="false" %>
<script>
    jQuery(document).ready(function ($) {
        $('.theme-login').click(function () {
            $('.theme-popover-mask').fadeIn(100);
            $('.theme-popover').slideDown(200);
        })
        $('.theme-poptit .close').click(function () {
            $('.theme-popover-mask').fadeOut(100);
            $('.theme-popover').slideUp(200);
        })
    })
</script>

<div class="top">
<div class="header">
	<div class="logo"><a href="index.aspx"></a></div>
	<ul class="nav">
		<li><a href="store.aspx">ACAT Store<span></span></a></li>
		<li id="m_team"><a href="index.aspx#team">團隊<span></span></a></li>
		<li><a href="faq.aspx">常見問答<span></span></a></li>
		<li><a href="/Alphacat-WhitePaper_CN.pdf" target="_blank">白皮書<span></span></a></li>
		<div class="share">
				<a href="https://medium.com/@AlphacatGlobal" class="icon1" target="_blank"></a>
				<a href="https://www.facebook.com/Alphacat.io/" class="icon2" target="_blank"></a>
				<a href="https://twitter.com/Alphacat_io" class="icon3" target="_blank"></a>
				<a href="https://t.me/alphacatglobal" class="icon4" target="_blank"></a>
				<a href="javascript:;" class="icon5 theme-login"></a>
				<a href="https://www.reddit.com/r/alphacat_io" class="icon6" target="_blank"></a>
				<a href="mailto:public@alphacat.io" class="icon7" ></a>
			</div>
			<div class="language">
			<a href="../" >English</a>
			<a href="javascript:;" class="active">中繁</a>
			</div>
	</ul>
</div>
</div>
<script>
    $(function () {
        $('.nav li a').hover(function () {

            $('span', this).stop().css('height', '2px');
            $('span', this).animate({
                left: '0',
                width: '100%',
                right: '0'
            }, 200);
        }, function () {
            $('span', this).stop().animate({
                left: '50%',
                width: '0'
            }, 200);
        });
        $(window).scroll(function () {
            //Header Main
            if ($(window).scrollTop() > 75) {

                $(".top").addClass("fixed");
            } else {
                $(".top").removeClass("fixed");

            }
        })


    });
</script>
<div class="mobile-inner-nav">
<div class="mobile_table">
<ul>
<li><a href="store.aspx" >ACAT Store</a></li>
<li><a href="faq.aspx">FAQ</a></li>
<li><a href="/Alphacat-WhitePaper_CN.pdf" >Whitepaper</a></li>
</ul>
</div>
</div>
<div class="ph_header">
<div class="mobile-inner-header">
<div class="top_logo"> <a href="index.aspx"><img src="images/logo.png" /></a> </div>
<div class="mobile-inner-header-icon mobile-inner-header-icon-out"><span></span><span></span></div>
</div>

</div>


	<script>
	    $(window).load(function () {
	        $(".mobile-inner-header-icon").click(function () {
	            $(this).toggleClass("mobile-inner-header-icon-click mobile-inner-header-icon-out");
	            $(".mobile-inner-nav").slideToggle(250);
	        });
	        $(".mobile-inner-nav a").each(function (index) {
	            $(this).css({ 'animation-delay': (index / 10) + 's' });
	        });
	    });
	</script>



