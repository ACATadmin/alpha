<%@ page language="C#" autoeventwireup="true" inherits="index, afm_new" enableviewstate="false" enableviewstatemac="false" enableEventValidation="false" %>

<%@ Register TagPrefix="LS" TagName="top" Src="top.ascx"%>
<%@ Register TagPrefix="LS" TagName="foot" Src="foot.ascx"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no"/>
<title>Alphacat - Decentralized  Robo-Advisor Marketplace Based on AI & Big-Data | Cryptocurrency Predictive Investment Tools </title>
<meta name="keywords" content="blockchain, Alphacat, coin, neo, token, bitcoin , ethereum, quantitative, marketplace, decentralized,  cryptocurrency,  predictive, investment, A.I, big-data, machine learning">
<meta name="description" content="Gain a Competitive Edge in the Digital Market World by Using AI and Big-Data Technologies">
<link href="images/favicon.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="css/xinpinshijue.css">
<link rel="stylesheet" href="css/animate.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.3.2/css/swiper.min.css" />
<link rel="stylesheet" href="css/public.css" />
<link rel="stylesheet" href="css/media.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="js/polyfill.object-fit.min.js"></script>
<style>
	html,body,.home_page{width: 100%;height: 100%;}
</style>
</head>

<body>
 <LS:top ID="top" runat="server" />
<div class="home_page">
<div id="particles-js"></div>

      <div class="banner_txt">
      	<h1  class="" data-wow-duration="1s"><p style="display:none">ARRIFICIAL INTELLIENCE MACHINE LEARNING</p> The Future of Fintech is Here <p class="banner_gain"> GAIN A COMPETITIVE EDGE IN THE DIGITAL MARKET</p> <img src="images/banner_logo.png" width="130" alt="" /> <a href="store.aspx" class="banner_button" >GET A FORECAST</a><p style="display:none">DIGITAL MARKET PREDICTION TOOLS</p></h1>

      </div><!-- banner_txt -->
<div class="swiper-container slide_banner">
    <div class="swiper-wrapper"> 
      <div class="swiper-slide" style="background:url(images/banner.jpg) no-repeat;background-size: cover;">
	   </div><!-- swiper-slide -->
	   <div class="swiper-slide" style="background:url(images/banner.jpg) no-repeat;background-size: cover;">
	   </div><!-- swiper-slide -->
	   <div class="swiper-slide" style="background:url(images/banner.jpg) no-repeat;background-size: cover;">
	   </div><!-- swiper-slide -->    
    </div>

  </div><!-- slide_banner -->
 
	<div class="swiper-container data " >
      <div class="swiper-wrapper"> 
      	<div class="swiper-slide">
		<div class="data_container">

      		<h1>FORECAST</h1>
      		<p>Gain a competitive edge by leveraging proven and patented trading algorithms,<br /> combined with advanced artificial intelligence and big data technologies. </p>
			</div>
      </div>
      		<div class="swiper-slide">
			<div class="data_container">

      		<h1>AI & BIG-DATA</h1>
      		<p>Prediction analytics using cutting edge AI technology allow you to make smarter and more profitable investment decisions.</p>
			</div>
      </div>
      	<div class="swiper-slide">
		<div class="data_container">
      		<h1>ECOSYSTEM FOR CRYPTO-POWER-TOOLS</h1>
      		<p>Complete ecosystem of digital-assets based financial applications and services, made for beginners and experts.</p>
	    </div>
      	</div>
      </div>

      	</div>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.3.2/js/swiper.min.js"></script>
 <script>
    var galleryTop = new Swiper('.slide_banner', {
	    autoplay: {
    delay: 7000,//1秒切换一次
  },    
  speed:1000,
    });
    var galleryThumbs = new Swiper('.data', {
	 autoplay: {
    delay: 7000,//1秒切换一次
  },
  speed:1000,
  centeredSlides : true,
  virtualTranslate : true,  
      slidesPerView: 3,
      slideToClickedSlide: true,
    });
    galleryTop.controller.control = galleryThumbs;
    galleryThumbs.controller.control = galleryTop;

  </script>
</div>
<div class="trade">
	<h1 class="menu_title">ROBO-ADVISOR MARKETPLACE <b> BASED ON AI & BIG-DATA</b></h1>
	<div class="trade_main">
		<div class="trade_left">
			<p>Alphacat is a marketplace for simple-to-use yet powerful robo-advisors focused on cryptocurrency 
			investment. Built using the<span> NEO</span>  platform and developed by an all-star team mainly composed of Wall Street financial experts and former team members of Google’s Artificial Intelligence program.<br />
            Alphacat’s predictive investment tools give its users a competitive edge by leveraging proven and patented trading algorithms, and combining them with advanced Artificial Intelligence and Big-data technologies.<br />
            The goal of Alphacat is to make investing in cryptocurrencies easy and accessible for everyone regardless of their background or experience and to bring the advantages of financial technology into the world of digital assets!
			
			</p>

			<a href="Alphacat-WhitePaper_EN.pdf">WHITE PAPER</a>
		</div><!-- trade_left -->
		<div class="trade_right">
			<img src="images/trade.jpg" alt="" />
		</div><!-- trade_right -->
	</div><!-- trade_main -->
	<ul>
		<li id="m_ecosystem"><a href="javascript:;"><img src="images/platform.png" alt="" class="rotate" /><p>ALPHACAT ECOSYSTEM</p></a></li>
		<li id="a_team"><a href="javascript:;"><img src="images/team.png" alt="" class="rotate" /><p>ALPHACAT TEAM</p></a></li>
		<li id="m_features"><a href="javascript:;"><img src="images/values.png" alt="" class="rotate" /><p>ALPHACAT FEATURES</p></a></li>
	</ul>
     <form action="" id="add_form">
	<div class="trade_email">
		<input type="text" id="Email" name="Email" placeholder="EMAIL" /> <a href="javascript:;" id="Submit" class="submit">KEEP IN TOUCH</a>
         <input type="hidden" name="checkcode" id="code" value="<%=LS.Common.Function.RandomNum(4) %>" />
	</div><!-- trade_email -->
     </form>
	

     <script type="text/javascript">
         $("#Submit").click(function () {
             var Email = $("#Email").val();
             if (Email == "") {
                 alert("Email不能为空");
                 $("#Email").focus();
                 return false;
             }
			  var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
             if (filter.test(Email)) {
                $.ajax({
                 url: "A_Util/Fun.ashx?act=addemail&cid=45",
                 type: "post",
                 dataType: "json",
                 data: $('#add_form').serialize(),
                 success: function (data) {
                     $("#code").val(data.code);
                     $("#checkcode").val(data.code);
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
</div><!-- trade -->
<div class="paper"  style="display:none">
	<div class="paper_main">
	<img src="images/video_soon.png" />
	
	</div>
</div>

<div class="paper">
	<div class="paper_main container">
	<div class="dd">
                <div class="willesPlay">
                    <div class="playContent">
                       <video width="100%" height="100%" class="playVideo aa" poster="images/video_bg1.jpg">
                            <source src="images/about.mp4" type="video/mp4">
                            当前浏览器不支持 video直接播放，请升级浏览器
                        </video>
                        <div class="playTip glyphicon glyphicon-play">
                            <img src="images/stop1.png" alt="">
                        </div>
                        <div class="playControll clearfix">
                            <div class="playPause playIcon fl"></div>
                            <div class="timebar fl clearfix">
                                <span class="currentTime fl">0:00:00</span>
                                <div class="progress fl">
                                    <div class="progress-bar progress-bar-danger progress-bar-striped" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: 0%"></div>
                                </div>
                                <span class="duration fl"></span>
                            </div>
                            <div class="otherControl fr">
                                <span class="volume  glyphicon-volume-down"></span>
                                <span class="fullScreen  glyphicon-fullscreen"></span>
                                <div class="volumeBar">
                                    <div class="volumewrap">
                                        <div class="progress">
                                            <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
	
	</div>
	  
</div>


<div class="ecosystem" id="ecosystem">
	<h1 class="menu_title"><span>ALPHACAT ECOSYSTEM</span> <p>Where Investors, Experts and Developers Meet to Create the Future of Financial Investment Tools Using <span>AI & Big-Data Technologies. </span> </p></h1>
	<ul>
	<li>
	<div class="ecosystem_img"><a href="javascript:;"><img src="images/ecosystem1.jpg" alt="" /></a>
	<div class="fn-line"></div>	</div>

	<div class="ecosystem_txt">
		<a href="javascript:;"><h1>SURVEYOR</h1></a>
		
		<p>Professional investors creating and publishing immutable<br /> research papers about the robo strategies and <br /> performance, helping to create an ever-improving <br /> marketplace of crypto-power-tools.</p>
		<img src="images/1_top.png" alt="" class="absolute_img" style="left:0" />
	</div>
	</li>

	<li>
	<div class="ecosystem_img"><a href="javascript:;"><img src="images/ecosystem2.jpg" alt="" /></a><div class="fn-line"></div></div>	
	<div class="ecosystem_txt">	
		<a href="javascript:;"><h1>ARCHITECTS AND ENGINEERS</h1></a>
		<p>Financial experts and developers utilizing the powerful<br /> ACAT-Engine to easily design, deploy and monetize from<br /> their own robo-advisors and other financial inventions.</p>
		<img src="images/2_top.png" alt="" class="absolute_img" />
	</div>
	</li>
	<li class="none">
	<div class="ecosystem_img"><a href="javascript:;"><img src="images/ecosystem3.jpg" alt="" /></a><div class="fn-line"></div></div>	
	<div class="ecosystem_txt">	
		<a href="javascript:;"><h1>INVESTORS</h1></a>
		<p>Beginners and expert Investors making smarter decisions using<br /> AI-powered advisory-robo, ultimately reaching higher returns<br /> and reducing risk on their cryptocurrencies investments.</p>
		<img src="images/3_top.png" alt="" class="absolute_img" />
	</div>
	</li>
	<li class="bottom_li">
	<div class="ecosystem_img" ><a href="javascript:;"><img src="images/ecosystem4.jpg" alt="" /></a><img src="images/1_bottom.png" alt="" class="absolute_img" style="left:0" /><a href="javascript:;"><h1>ACAT<br />TERMINAL</h1></a><div class="fn-line"></div></div>	
	<div class="ecosystem_txt">
		<h1>DATA </h1>
		<p>A robust database delivering complete coverage of the digital assets world. Capturing, classifying and encapsulating thousands of datasets, it provides powerful insights necessary to understand and navigate the complex digital market world.</p>
	</div>
	</li>

	<li class="bottom_li">
	<div class="ecosystem_img"><a href="javascript:;"><img src="images/ecosystem5.jpg" alt="" /></a><img src="images/2_bottom.png" alt="" class="absolute_img" /><a href="javascript:;"><h1>ACAT<br />ENGINE</h1></a><div class="fn-line"></div></div>	
	<div class="ecosystem_txt">	
		<h1>PROCESSING </h1>
		<p>A powerful financial engine that combines years of experience, patented trading algorithms and other technologies not yet commercially available, with the power of AI and big data technologies. 
</p>
		
	</div>
	</li>
	<li class="bottom_li none">
	<div class="ecosystem_img"><a href="javascript:;"><img src="images/ecosystem6.jpg" alt="" /></a><img src="images/3_bottom.png" alt="" class="absolute_img" /><a href="javascript:;"><h1>ACAT<br />STORE</h1></a><div class="fn-line"></div></div>	
	<div class="ecosystem_txt">	
	<h1>MARKETPLACE </h1>
		<p>A scalable marketplace where beginners, as well as expert investors, can use the advantages offered by AI-powered advisory tools to gain a competitive edge in the digital market world.</p>
		
	</div>
	</li>
	</ul>

	<h2>Alphacat plan to disrupt & revolutionize the <span>FinTech</span>  (Financial Technology) industry by<br />offering a complete eco-system for digital-assets financial applications and services.</h2>
	<h3>Powered by</h3>
	<a target="_blank" href="/Alphacat-WhitePaper_EN.pdf" class="button">Download the Whitepaper</a>
</div>


<div class="benefits" id="features">
	<h1 class="menu_title">ALPHACAT FEATURES</h1>
	<div class="benefits_main">
		

		<div class=" swiper-container benefits_right">
			 <div class="swiper-wrapper"> 
      <asp:Repeater ID="Repeater1" runat="server"><ItemTemplate>
      <div class="swiper-slide">
	  <div class="benefits_left"><img src="A_UpLoad/upload_pic/<%#Eval("upload_pic") %>" alt="" /></div>
      <div class="benefits_txt">
      		<h1><%#LS.Common.Function.HtmlDiscode(Eval("title").ToString()) %></h1>
      	<p><%#LS.Common.Function.HtmlUEditorDiscode(Eval("details").ToString()) %></p>
      </div>
      
      </div><!-- swiper-slide -->
     </ItemTemplate></asp:Repeater>
 
    </div>
    <div class="swiper-pagination"></div>
		</div>
  <script>
    var swiper = new Swiper('.benefits_right', {

      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
	   autoplay: {
    delay: 7000,//1秒切换一次
  },
  speed:1000,
    });
  </script>
	</div>
</div>

<script>
    jQuery(document).ready(function ($) {
        $('.roadmap_button').click(function () {
            $('.roadmap-popover-mask').fadeIn(100);
            $('.roadmap-popover').slideDown(200);
        })
        $('.theme-poptit .close').click(function () {
            $('.roadmap-popover-mask').fadeOut(100);
            $('.roadmap-popover').slideUp(200);
        })
    })
</script>


<div class="roadmap">
	<p class="">AWARDED <a href="https://medium.com/@AlphacatGlobal/what-patents-does-alphacat-use-for-digital-asset-management-2e1e0999d44b" target="_blank"> <span> 4 PATENTS </span></a>IN FINTECH BY THE USPTO</p>
	<h1 class="menu_title">OUR ROADMAP</h1>
	<a href="javascript:;" class="button roadmap_button">OPEN FULL ROADMAP</a>
	
</div>

<div class="roadmap-popover">
     <div class="theme-poptit">
          <a href="javascript:;" title="关闭" class="close"></a>
     </div>
     <div class="roadmap-popbod"> <img src="images/full_roadmap.jpg" alt="" /> </div>
</div>
<div class="roadmap-popover-mask"></div>




<div class="team_content" id="team">
<div class="team">
	<h1 class="menu_title">TEAM <p>Alphacat is developed by an all-star team, mainly composed of Wall Street financial experts and former team members of Google Artificial Intelligence. Our team counts more than 30 experts holding advanced degrees in AI, machine learning, financial technology and big data. Together, we combine our vast skills-set to further develop Alphacat’s prediction algorithms and platform.</p>	</h1>
	<ul class="team_ul">
    <asp:Repeater ID="Repeater2" runat="server"><ItemTemplate>
 
	<li class="">
		<div class="team_img">
			<h1>
				<div class="img"><img src="A_UpLoad/upload_pic/<%#Eval("upload_pic") %>" alt="img"></div>
				<div class="info">
					<div class="info_txt">
						<h2>
							<p><%#Eval("about") %></p><a href="<%#Eval("linkurl").ToString()==""?"javascript:;":Eval("linkurl") %>" target="_blank"><img src="images/in.png" alt="" width="25" /></a>
						</h2>
					</div>
				</div>
			</h1>
		</div>
		<div class="team_txt">
			<p><%#Eval("Title") %></p>
		</div>
	</li>
    </ItemTemplate></asp:Repeater>
</ul>
	<h1 class="menu_title"> <p>INVESTORS</p>	</h1>
	<ul class="advisors_ul">
    <asp:Repeater ID="Repeater3" runat="server"><ItemTemplate>
	<li class="">
		<div class="team_img">
			<h1>
				<div class="img"><img src="A_UpLoad/upload_pic/<%#Eval("upload_pic") %>" alt="img"></div>
				<div class="info">
					<div class="info_txt">
						<h2>
							<p><%#Eval("about") %></p><a href="<%#Eval("linkurl").ToString()==""?"javascript:;":Eval("linkurl") %>"></a>
						</h2>
					</div>
				</div>
			</h1>
		</div>
		<div class="team_txt">
			<p><%#Eval("Title") %></p>
		</div>
	</li>
    </ItemTemplate></asp:Repeater>
	</ul>
</div>
</div>

<div class="partners" id="partners">
	<h1 class="menu_title">PARTNERS</h1>
	<ul>
    <asp:Repeater ID="Repeater4" runat="server"><ItemTemplate>
		<li><img src="A_UpLoad/upload_pic/<%#Eval("upload_pic") %>" alt="" /></li>
      </ItemTemplate></asp:Repeater>
	</ul>
</div>





 <LS:foot ID="foot" runat="server" />

<script type="text/javascript">
    $(function () {
        $("#m_team").click(function () {
            $("html,body").animate({ scrollTop: $("#team").offset().top - 80 }, 300);

        });
        $("#a_team").click(function () {
            $("html,body").animate({ scrollTop: $("#team").offset().top - 80 }, 300);

        });
        $("#f_team").click(function () {
            $("html,body").animate({ scrollTop: $("#team").offset().top - 80 }, 300);

        });
        $("#a_team").click(function () {
            $("html,body").animate({ scrollTop: $("#team").offset().top - 80 }, 300);

        });
        $("#m_ecosystem").click(function () {
            $("html,body").animate({ scrollTop: $("#ecosystem").offset().top - 80 }, 300);

        });
        $("#m_features").click(function () {
            $("html,body").animate({ scrollTop: $("#features").offset().top - 80 }, 300);

        });
        $("#m_partners").click(function () {
            $("html,body").animate({ scrollTop: $("#partners").offset().top - 80 }, 300);

        });
    });		

</script>
<script src="particles.min.js"></script>
<script src="js/app.js"></script>

<!-- stats.js -->
<script src="js/lib/stats.js"></script>
<script>
  var count_particles, stats, update;
  stats = new Stats;
  stats.setMode(0);
  stats.domElement.style.position = 'absolute';
  stats.domElement.style.left = '0px';
  stats.domElement.style.top = '0px';
   stats.domElement.style.z-index ='2';
  document.body.appendChild(stats.domElement);
  count_particles = document.querySelector('.js-count-particles');
  update = function() {
    stats.begin();
    stats.end();
    if (window.pJSDom[0].pJS.particles && window.pJSDom[0].pJS.particles.array) {
      count_particles.innerText = window.pJSDom[0].pJS.particles.array.length;
    }
    requestAnimationFrame(update);
  };
  requestAnimationFrame(update);
</script>
  <script>
        $(function () {
            // 兼容ie ：object-fit：cover
            objectFit.polyfill({
                selector: 'video',
                fittype: 'cover'
            });
            // 鼠标点击右上角导航栏开启
            $('.nav').click(function () {
                $('.nav-open').fadeIn('1000');
            });

            // 鼠标点击关闭
            $('.nav_opens').click(function () {
                $('.nav-open').fadeOut('1000');
            });

        });

        $(function () {
            var playVideo = $('video');
            var playPause = $('.playPause'); //播放和暂停
            var currentTime = $('.timebar .currentTime'); //当前时间
            var duration = $('.timebar .duration'); //总时间
            var progress = $('.timebar .progress-bar'); //视频进度条
            var volumebar = $('.volumeBar .volumewrap').find('.progress-bar');//音量进度条

            playPause.on('click', function () {
                playControl($(this).parents('.container'));
            });

            $('.glyphicon img').on('click', function () {
                playControl($(this).parents('.container'));
                // return false;
            });

            $('video').on('click', function () {
                playControl($(this).parents('.container'));
                var container = $(this).parents('.container');
            });

            //初始化音量
            for (var i = 0; i < playVideo.length; i++) {
                (function (i) {
                    playVideo[i].volume = 0.4; //初始化音量
                    var container = $(this).parents('.container');

                    $(this).on('loadedmetadata', function () {
                        duration.text(formatSeconds(playVideo[0].duration));
                    });

                })(i);
            }

// 视频播放进度
            playVideo.each(function (i) {

                var container = $(this).parents('.container');
                $(this).on('loadedmetadata', function () {
                    container.find('.duration').text(formatSeconds(this.duration));
                });


                $(this).on('timeupdate', function () {
                    container.find('.currentTime').text(formatSeconds(this.currentTime));
                    container.find('.timebar .progress-bar').css('width', 100 * this.currentTime / this.duration + '%');
                });

                $(this).on('ended', function () {
                    container.find('.playTip').removeClass('glyphicon-pause').addClass('glyphicon-play').fadeIn();
                    container.find('.playPause').toggleClass('playIcon');
                    container.find('.playContent .glyphicon.glyphicon-play img').css('display', 'block');
                    container.find('.willesPlay .playControll .playPause').css({
                        'background': 'url("images/stop2.png") 0 0 no-repeat'
                    })
                });

            });

            $(window).keyup(function (event) {

                event = event || window.event;
                if (event.keyCode == 32) playControl();
                if (event.keyCode == 27) {
                    // $(this).removeClass('cancleScreen');
                    $('.fullScreen').removeClass('cancleScreen');
                    $('#willesPlay .playControll').css({
                        'bottom': 0,
                    }).removeClass('fullControll');
                }

                event.preventDefault();
            });


            //全屏
            $('.fullScreen').on('click', function () {
                var container = $(this).parents('.container');
                var playVideo = container.find('video')[0];
                if ($(this).hasClass('cancleScreen')) {
                    if (document.exitFullscreen) {
                        document.exitFullscreen();
                    } else if (document.mozExitFullScreen) {
                        document.mozExitFullScreen();
                    } else if (document.webkitExitFullscreen) {
                        document.webkitExitFullscreen();
                    }
                    $(this).removeClass('cancleScreen');
                    container.find('.willesPlay .playControll').css({
                        'bottom': 0,
                    }).removeClass('fullControll');
                } else {
                    if (playVideo.requestFullscreen) {
                        playVideo.requestFullscreen();
                    } else if (playVideo.mozRequestFullScreen) {
                        playVideo.mozRequestFullScreen();
                    } else if (playVideo.webkitRequestFullscreen) {
                        playVideo.webkitRequestFullscreen();
                    } else if (playVideo.msRequestFullscreen) {
                        playVideo.msRequestFullscreen();
                    }
                    $(this).addClass('cancleScreen');
                    container.find('.willesPlay .playControll').css({
                        'left': 0,
                        'bottom': 0,
                    }).addClass('fullControll');
                }
                return false;
            });

            //点击音量显示与隐藏
            $('.volume').on('click', function (e) {
                var container = $(this).parents('.container');
                e = e || window.event;
                e.stopPropagation();
                if (container.find('.willesPlay .otherControl .progress').is(':hidden')) {
                    container.find('.willesPlay .otherControl .progress').css('display', 'block');
                } else {
                    container.find('.willesPlay .otherControl .progress').css('display', 'none');
                }
            });

            // 音量控制
            $('.volumeBar').on('click mousewheel DOMMouseScroll', function (e) {
                var container = $(this).parents('.container');

                e = e || window.event;
                volumeControl(e, container);
                e.stopPropagation();
                return false;
            });


            // 点击视频控制条到对应位置
            $('.timebar .progress').mousedown(function (e) {
                e = e || window.event;
                updatebar(e.pageX, $(this).parents('.container'));
            });

            // 点击视频控制条到对应位置封装
            var updatebar = function (x, container) {
                var video = container.find('video')[0];
                var progress = container.find('.timebar .progress-bar');
                var maxduration = video.duration; //Video
                var positions = x - progress.offset().left; //Click pos
                var percentage = 100 * positions / container.find('.timebar .progress').width();
                //Check within range
                if (percentage > 100) {
                    percentage = 100;
                }
                if (percentage < 0) {
                    percentage = 0;
                }

                //Update progress bar and video currenttime
                progress.css('width', percentage + '%');
                video.currentTime = maxduration * percentage / 100;
            };


            //音量控制的封装
            function volumeControl(e, container) {
                e = e || window.event;
                var eventype = e.type;
                var delta = (e.originalEvent.wheelDelta && (e.originalEvent.wheelDelta > 0 ? 1 : -1)) || (e.originalEvent.detail && (e.originalEvent.detail > 0 ? -1 : 1));
                var positions = 0;
                var percentage = 0;
                if (eventype == "click") {

                    volumebar = container.find('.volumeBar .volumewrap').find('.progress-bar');

                    positions = volumebar.offset().top - e.pageY;
                    percentage = 100 * (positions + volumebar.height()) / container.find('.volumeBar .volumewrap').height();
                } else if (eventype == "mousewheel" || eventype == "DOMMouseScroll") {
                    percentage = 100 * (volumebar.height() + delta) / container.find('.volumeBar .volumewrap').height();
                }
                if (percentage < 0) {
                    percentage = 0;
                    container.find('.otherControl .volume').attr('class', 'volume glyphicon glyphicon-volume-off');
                }
                if (percentage > 50) {
                    container.find('.otherControl .volume').attr('class', 'volume glyphicon glyphicon-volume-up');
                }
                if (percentage > 0 && percentage <= 50) {
                    container.find('.otherControl .volume').attr('class', 'volume glyphicon glyphicon-volume-down');
                }
                if (percentage >= 100) {
                    percentage = 100;
                }
                container.find('.volumewrap .progress-bar').css('height', percentage + '%');
                var playVideo = container.find('video')[0];
                playVideo.volume = percentage / 100;
                e.stopPropagation();
                e.preventDefault();
            }

            // 视频开关的封装
            function playControl(container) {

                var video = container.find('video')[0];

                // if (video.paused) {
                if (container.find('.glyphicon img').is(':visible')) {
                    container.find('.willesPlay .playControll .playPause').css({
                        'background': 'url("images/kaishi.png") 0 0 no-repeat'
                    });
                    container.find('video').trigger('play');
                    container.find('.glyphicon img').css('display', 'none');
                } else {
                    container.find('.willesPlay .playControll .playPause').css({
                        'background': 'url("images/stop2.png") 0 0 no-repeat'
                    });
                    container.find('video').trigger('pause');
                    container.find('.glyphicon img').css('display', 'block');
                }
            }

        });

        //秒转时间
        function formatSeconds(value) {
            value = parseInt(value);
            var time;
            if (value > -1) {
                hour = Math.floor(value / 3600);
                min = Math.floor(value / 60) % 60;
                sec = value % 60;
                day = parseInt(hour / 24);
                if (day > 0) {
                    hour = hour - 24 * day;
                    time = day + "day " + hour + ":";
                } else time = hour + ":";
                if (min < 10) {
                    time += "0";
                }
                time += min + ":";
                if (sec < 10) {
                    time += "0";
                }
                time += sec;
            }
            return time;
        }
    </script>
</body>
</html>