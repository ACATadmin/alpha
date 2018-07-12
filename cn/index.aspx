<%@ page language="C#" autoeventwireup="true" inherits="en_index, afm_new" enableviewstate="false" enableviewstatemac="false" enableEventValidation="false" %>

<%@ Register TagPrefix="LS" TagName="top" Src="top.ascx"%>
<%@ Register TagPrefix="LS" TagName="foot" Src="foot.ascx"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no"/>
<title>Alphacat - Decentralized  Robo-Advisor Marketplace Based on AI & Big-Data | Cryptocurrency Predictive Investment Tools </title>
<meta name="keywords" content="blockchain, Alphacat, coin, neo, token, bitcoin , ethereum, quantitative, marketplace, decentralized,  cryptocurrency,  predictive, investment, A.I, big-data, machine learning">
<meta name="description" content="Gain a competitive edge in the digital market world by using AI and Big-data technologies">
<link rel="stylesheet" href="css/xinpinshijue.css">
<link rel="stylesheet" href="css/animate.min.css" />
<link rel="stylesheet" href="css/swiper.min.css" />
<link rel="stylesheet" href="css/public.css" />
<link rel="stylesheet" href="css/media.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/swiper.min.js"></script>
<script src="js/polyfill.object-fit.min.js"></script>

<style>
	html,body,.home_page{width: 100%;height: 100%;}
</style>
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

</head>

<body>
 <LS:top ID="top" runat="server" />
<div class="home_page">
        <!-- particles.js container -->
<div id="particles-js"></div>
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
      <div class="banner_txt">
      	<h1  class="" data-wow-duration="1s">金融科技的未來，現已到來 <p class="banner_gain"> 數字资产投資領先一步</p> <img src="images/banner_logo.png" width="130" alt="" /> <a href="store.aspx" class="banner_button" >獲取預測</a></h1>

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

      		<h1>預測</h1>
      		<p>利用久經考驗的專利交易演算法，結合先進的人工智能和大數據技術，在數位貨幣市場投資中快人一步。</p>
			</div>
      </div>
      		<div class="swiper-slide">
			<div class="data_container">

      		<h1>人工智能和大數據</h1>
      		<p>卓越的技術在數位市場中獲得競爭優勢。</p>
			</div>
      </div>
      	<div class="swiper-slide">
		<div class="data_container">
      		<h1>關於加密貨幣的生態系統</h1>
      		<p>基於數位資產的金融應用和服務的生態系統。</p>
	    </div>
      	</div>
      </div>

      	</div>
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
	<h1 class="menu_title">基於<b>人工智能和大數據</b>的機器人投顧市場 </h1>
	<div class="trade_main">
		<div class="trade_left">
			<p>
			Alphacat是一個專注於加密貨幣市場的機器人顧問市場，簡單易用但是功能強大。團隊由來自華爾街的金融專家以及Google人工智能的精英領銜。Alphacat基於NEO平臺開發和建造，其預測性投資工具利用久經考驗的專利交易演算法為其使用者提供了競爭優勢，將它們與先進的人工智能和大數據技術相結合。 Alphacat的目標是讓投資加密貨幣變得簡單易用，無論投資者的背景或經驗如何，並將金融技術的優勢帶入數位資產的世界！
			
			</p>

			<a href="/Alphacat-WhitePaper_CN.pdf" target="_blank">白皮書</a>
		</div><!-- trade_left -->
		<div class="trade_right">
			<img src="images/trade.jpg" alt="" />
		</div><!-- trade_right -->
	</div><!-- trade_main -->
	<ul>
		<li id="m_ecosystem"><a href="javascript:;"><img src="images/platform.png" alt="" class="rotate" /><p>Alphacat生態系統</p></a></li>
		<li id="a_team"><a href="javascript:;"><img src="images/team.png" alt="" class="rotate" /><p>Alphacat團隊</p></a></li>
		<li id="m_features"><a href="javascript:;"><img src="images/values.png" alt="" class="rotate" /><p>Alphacat功能</p></a></li>
	</ul>
     <form action="" id="add_form">
	<div class="trade_email">
		<input type="text" id="Email" name="Email" placeholder="EMAIL" /> <a href="javascript:;" id="Submit" class="submit">聯繫我們</a>
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
             $.ajax({
                 url: "../A_Util/Fun.ashx?act=addemail&cid=51",
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
         })
		 
</script>
</div><!-- trade -->

<div class="paper">
	<div class="paper_main container">
	<div class="dd">
                <div class="willesPlay">
                    <div class="playContent">
                       <video width="100%" height="100%" class="playVideo aa" poster="images/video_bg1.jpg">
                            <source src="/images/about.mp4" type="video/mp4">
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
	<h1 class="menu_title"><span>Alphacat生態系統</span> <p>投資者，專家和開發人員彙聚在此，共同創造<span>人工智能和大數據</span>技術的金融投資工具的未來。 </p></h1>
	<ul>
	<li>
	<div class="ecosystem_img"><a href="javascript:;"><img src="images/ecosystem1.jpg" alt="" /></a>
	<div class="fn-line"></div>	</div>

	<div class="ecosystem_txt">
		<a href="javascript:;"><h1>研究員</h1></a>
		
		<p>專業投資者通過演算法生成的資料分析來說明自己進行投資決策及研究，有助於為加密動力工具創建一個不斷完善的市場。</p>
		<img src="images/1_top.png" alt="" class="absolute_img" style="left:0" />
	</div>
	</li>

	<li>
	<div class="ecosystem_img"><a href="javascript:;"><img src="images/ecosystem2.jpg" alt="" /></a><div class="fn-line"></div></div>	
	<div class="ecosystem_txt">	
		<a href="javascript:;"><h1>建築師和工程師</h1></a>
		<p>金融專家和開發人員利用強大的ACAT引擎輕鬆設計，部署和訓練自己的機器人和其他金融產品。</p>
		<img src="images/2_top.png" alt="" class="absolute_img" />
	</div>
	</li>
	<li class="none">
	<div class="ecosystem_img"><a href="javascript:;"><img src="images/ecosystem3.jpg" alt="" /></a><div class="fn-line"></div></div>	
	<div class="ecosystem_txt">	
		<a href="javascript:;"><h1>普通投資者</h1></a>
		<p>投資者可以在數位市場領域獲得競爭優勢，無論其背景或經驗如何，都可以使用AI諮詢機器人作出投資決策。</p>
		<img src="images/3_top.png" alt="" class="absolute_img" />
	</div>
	</li>
	<li class="bottom_li">
	<div class="ecosystem_img" ><a href="javascript:;"><img src="images/ecosystem4.jpg" alt="" /></a><img src="images/1_bottom.png" alt="" class="absolute_img" style="left:0" /><a href="javascript:;"><h1>ACAT<br />數據庫</h1></a><div class="fn-line"></div></div>	
	<div class="ecosystem_txt">
		<h1>數據 </h1>
		<p>ACAT數據庫聚焦數位元資產行業的企業級金融終端。通過對於數位資產資料的收集、歸納、整理，ACAT資料庫形成了強大的大資料分析能力，可以有效理解複雜的數位資產市場。</p>
	</div>
	</li>

	<li class="bottom_li">
	<div class="ecosystem_img"><a href="javascript:;"><img src="images/ecosystem5.jpg" alt="" /></a><img src="images/2_bottom.png" alt="" class="absolute_img" /><a href="javascript:;"><h1>ACAT<br />引擎</h1></a><div class="fn-line"></div></div>	
	<div class="ecosystem_txt">	
		<h1>處理</h1>
		<p>ACAT引擎是Alphacat平臺的核心。數千個人工智能交易機器人驅動的引擎。經過數年的機器學習，植入了Alphacat的專利演算法，並且結合大資料以及一些未被商業化的最新技術，讓先進的金融技術得以被廣泛應用。</p>
		
	</div>
	</li>
	<li class="bottom_li none">
	<div class="ecosystem_img"><a href="javascript:;"><img src="images/ecosystem6.jpg" alt="" /></a><img src="images/3_bottom.png" alt="" class="absolute_img" /><a href="javascript:;"><h1>ACAT<br />商城</h1></a><div class="fn-line"></div></div>	
	<div class="ecosystem_txt">	
	<h1>市場</h1>
		<p>在ACAT商城中，普通投資者和專業投資者可以利用由AI開發的金融應用和服務，在加密貨幣市場獲得豐厚收益。</p>
		
	</div>
	</li>
	</ul>

	<h2>Alphacat將顛覆傳統<span>金融科技</span>，創造數字資產的新生態</h2>
	<h3>基於</h3>
	<a href="/Alphacat-WhitePaper_CN.pdf" target="_blank" class="button">下載白皮書</a>
</div>


<div class="benefits" id="features">
	<h1 class="menu_title">Alphacat功能 </h1>
	<div class="benefits_main">
		

		<div class=" swiper-container benefits_right">
			 <div class="swiper-wrapper"> 
      <asp:Repeater ID="Repeater1" runat="server"><ItemTemplate>
      <div class="swiper-slide">
	  <div class="benefits_left"><img src="../A_UpLoad/upload_pic/<%#Eval("upload_pic") %>" alt="" /></div>
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
	<p class="">獲得美國專利授予<a href="https://medium.com/@AlphacatGlobal/what-patents-does-alphacat-use-for-digital-asset-management-2e1e0999d44b" target="_blank"><span>4項</span></a>金融科技專利</p>
	<h1 class="menu_title">Alphacat路線圖</h1>
	<a href="javascript:;" class="button roadmap_button">打開全部路線圖</a>
	
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
	<h1 class="menu_title">團隊 <p>Alphacat由全明星團隊開發，主要由華爾街金融專家和Google人工智能的前團隊成員組成。我們的團隊擁有超過30位擁有AI，機器學習，金融技術和大資料的專家。結合我們廣泛的技能，進一步開發Alphacat的預測演算法和平臺。</p>	</h1>
	<ul class="team_ul">
    <asp:Repeater ID="Repeater2" runat="server"><ItemTemplate>
 
	<li class="">
		<div class="team_img">
			<h1>
				<div class="img"><img src="../A_UpLoad/upload_pic/<%#Eval("upload_pic") %>" alt="img"></div>
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
	<h1 class="menu_title"> <p>投資者</p>	</h1>
	<ul class="advisors_ul">
    <asp:Repeater ID="Repeater3" runat="server"><ItemTemplate>
	<li class="">
		<div class="team_img">
			<h1>
				<div class="img"><img src="../A_UpLoad/upload_pic/<%#Eval("upload_pic") %>" alt="img"></div>
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
	<h1 class="menu_title">合作夥伴</h1>
	<ul>
    <asp:Repeater ID="Repeater4" runat="server"><ItemTemplate>
		<li><img src="../A_UpLoad/upload_pic/<%#Eval("upload_pic") %>" alt="" /></li>
      </ItemTemplate></asp:Repeater>
	</ul>
</div>





 <LS:foot ID="foot" runat="server" />
 
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