(function ($) {
	(function () {
		/*!
		 * jQuery Browser Plugin v0.0.6
		 * https://github.com/gabceb/jquery-browser-plugin
		 *
		 * Original jquery-browser code Copyright 2005, 2013 jQuery Foundation, Inc. and other contributors
		 * http://jquery.org/license
		 *
		 * Modifications Copyright 2013 Gabriel Cebrian
		 * https://github.com/gabceb
		 *
		 * Released under the MIT license
		 *
		 * Date: 2013-07-29T17:23:27-07:00
		 */



		var matched, browser;

		jQuery.uaMatch = function (ua) {
			ua = ua.toLowerCase();

			var match = /(opr)[\/]([\w.]+)/.exec(ua) ||
				/(chrome)[ \/]([\w.]+)/.exec(ua) ||
				/(version)[ \/]([\w.]+).*(safari)[ \/]([\w.]+)/.exec(ua) ||
				/(webkit)[ \/]([\w.]+)/.exec(ua) ||
				/(opera)(?:.*version|)[ \/]([\w.]+)/.exec(ua) ||
				/(msie) ([\w.]+)/.exec(ua) ||
				ua.indexOf("trident") >= 0 && /(rv)(?::| )([\w.]+)/.exec(ua) ||
				ua.indexOf("compatible") < 0 && /(mozilla)(?:.*? rv:([\w.]+)|)/.exec(ua) || [];

			var platform_match = /(ipad)/.exec(ua) ||
				/(iphone)/.exec(ua) ||
				/(android)/.exec(ua) ||
				/(windows phone)/.exec(ua) ||
				/(win)/.exec(ua) ||
				/(mac)/.exec(ua) ||
				/(linux)/.exec(ua) ||
				/(cros)/i.exec(ua) || [];

			return {
				browser: match[3] || match[1] || "",
				version: match[2] || "0",
				platform: platform_match[0] || ""
			};
		};

		matched = jQuery.uaMatch(window.navigator.userAgent);
		browser = {};

		if (matched.browser) {
			browser[matched.browser] = true;
			browser.version = matched.version;
			browser.versionNumber = parseInt(matched.version);
		}

		if (matched.platform) {
			browser[matched.platform] = true;
		}

		// These are all considered mobile platforms, meaning they run a mobile browser
		if (browser.android || browser.ipad || browser.iphone || browser["windows phone"]) {
			browser.mobile = true;
		}

		// These are all considered desktop platforms, meaning they run a desktop browser
		if (browser.cros || browser.mac || browser.linux || browser.win) {
			browser.desktop = true;
		}

		// Chrome, Opera 15+ and Safari are webkit based browsers
		if (browser.chrome || browser.opr || browser.safari) {
			browser.webkit = true;
		}

		// IE11 has a new token so we will assign it msie to avoid breaking changes
		if (browser.rv) {
			var ie = "msie";

			matched.browser = ie;
			browser[ie] = true;
		}

		// Opera 15+ are identified as opr
		if (browser.opr) {
			var opera = "opera";

			matched.browser = opera;
			browser[opera] = true;
		}

		// Stock Android browsers are marked as Safari on Android.
		if (browser.safari && browser.android) {
			var android = "android";

			matched.browser = android;
			browser[android] = true;
		}

		// Assign the name and platform variable
		browser.name = matched.browser;
		browser.platform = matched.platform;


		jQuery.browser = browser;

	})();

	$.extend({
		/*民调插件start
		<div style="width:300px">
			<div class="md_box" id="md-box-a"></div>
			<div class="md_box" id="md-box-b"></div>
		</div>
		<script>
		$.MinDiao(2,'a');
		$.MinDiao(3,'b');
		</script>
		*/
		MinDiao: function (id, type) {
			var id = id,
				type = type;
			var VoteLoad = function (flag) {
				var loadvote = {
					params: {
						'voteServerId': '1',
						'voteId': id
					},
					url: 'https://vote.xinmin.cn/index.php?app=common&controller=Vote.Service&action=phprpc',
					fun: 'getVote',
					checkbox: []
				};

				var tplouter = '<span class="md_box_tit" id="md-box-tit-{type}">{title}</span><div id="options-box-{type}"></div><div class="btn_box"><button type="button" class="btn btn-sm btn-primary l" id="box-btn-{type}">投票</button><span class="r"><b id="personnum-{type}">{total}</b>人已投票</span></div>';
				var tplinner = '<div class="options_box"><div class="before"><label><input type="{radiocheckbox}" name="{radiocheckbox}-{type}" class="i" value="{v}" data-count="{count}"><span class="t">{content}</span></label></div><div class="after"><div class="progress"><span class="progress_ing">{content} （{count}）</span><div class="each_progress progress-bar progress-bar-info progress-bar-striped active" role="progressbar" style="width:{percent}%" data-percent="{percent}"></div></div></div></div>';

				var rpc = new PHPRPC_Client(loadvote.url, [loadvote.fun]);
				rpc[loadvote.fun](loadvote.params, function (res) {
					/*console.log(res);*/
					var htmlinner = '',
						htmlouter = '',
						radiocheckbox = res.mode == 0 ? 'radio' : 'checkbox';
					htmlouter = tplouter.replace(/{type}/g, type).replace('{total}', res.total).replace('{title}', res.question);
					[].forEach.call(res.options, function (v, i) {
						htmlinner += tplinner.replace(/{content}/g, v.content).replace('{type}', type).replace(/{percent}/g, v.percent).replace(/{radiocheckbox}/g, radiocheckbox).replace(/{v}/g, i).replace(/{count}/g, v.count);
					});
					$('#md-box-' + type).html(htmlouter);
					$('#options-box-' + type).html(htmlinner);
					if (flag) {
						$('#options-box-' + type + ' .options_box .before').hide();
						$('#options-box-' + type + ' .progress .progress-bar').width('0px');
						$('#options-box-' + type + ' .options_box .after').show();
						$('#options-box-' + type + ' .each_progress').each(function () {
							$(this).animate({
								width: $(this).data('percent') + '%'
							}, 'linear');
						});
						$('#box-btn-' + type).unbind('click').attr('disabled', true);
						return;
					}
					$('#box-btn-' + type).click(function () {
						var f = $('#options-box-' + type).find('input').is(':checked');
						if (!f) {
							alert('请先选择一个');
							return;
						}
						switch (radiocheckbox) {
							case 'radio':
								$('#options-box-' + type).find('input').each(function () {
									if ($(this).prop('checked')) {
										VoteInsert($(this).val(), true);
									}
								});
								break;
							case 'checkbox':
								$('#options-box-' + type).find('input').each(function () {
									if ($(this).prop('checked')) {
										loadvote.checkbox.push($(this).val());
									}
								});
								VoteInsert(loadvote.checkbox, true);
								break;
						};
						$('#box-btn-' + type).unbind('click').attr('disabled', true);
					});

				});
			};

			var VoteInsert = function (postvalue, flag) {
				var insertvote = {
					params: {
						"voteServerId": "1",
						"voteId": id,
						"options": postvalue
					},
					url: 'https://vote.xinmin.cn/index.php?app=common&controller=Vote.Service&action=phprpc',
					fun: 'vote'
				};
				var rpc = new PHPRPC_Client(insertvote.url, [insertvote.fun]);
				rpc[insertvote.fun](insertvote.params, function (res) {
					/*console.log(res);*/
					VoteLoad(flag);
				});
			};

			VoteLoad();
		},
		/*民调插件end*/

		/*平台判断start
		alert($.Browser().versions.isweixin)
		*/
		Browser: function () {
			return {
				versions: function () {
					var u = navigator.userAgent,
						app = navigator.appVersion;
					return {
						trident: u.indexOf('Trident') > -1,
						/*IE内核*/
						presto: u.indexOf('Presto') > -1,
						/*opera内核*/
						webKit: u.indexOf('AppleWebKit') > -1,
						/*苹果、谷歌内核*/
						gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1,
						/*火狐内核*/
						mobile: !!u.match(/AppleWebKit.*Mobile.*/),
						/*是否为移动终端*/
						ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/),
						/*ios终端*/
						android: u.indexOf('Android') > -1 || u.indexOf('Adr') > -1,
						/*android终端*/
						iPhone: u.indexOf('iPhone') > -1,
						/*是否为iPhone或者QQHD浏览器*/
						iPad: u.indexOf('iPad') > -1,
						/*是否iPad*/
						webApp: u.indexOf('Safari') == -1,
						/*是否web应该程序，没有头部与底部*/
						weixin: u.indexOf('MicroMessenger') > -1,
						/*是否微信 （2015-01-22新增）*/
						qq: u.match(/\sQQ/i) == " qq",
						/*是否QQ*/
						ie6: app.split(";")[1].replace(/[ ]/g, "") == "MSIE6.0",
						/*是否是ie6*/
						istomxinmin: u.indexOf('Windows NT') < 0 && u.indexOf('Macintosh') < 0 && document.URL.indexOf('xmwb.xinmin.cn/') < 0,
						/*是否从pc页面跳转到m站*/
						isappios: u.indexOf('xinmin_app_ios') > -1,
						/*是否是app ios*/
						isappandroid: u.indexOf('xinmin_app_android') > -1,
						/*是否是app android*/
						isweixin: u.toLowerCase().match(/MicroMessenger/i) == "micromessenger", 
						/*是否是微信内置浏览器*/
						isxmapp: u.indexOf('xinmin_app') > -1
					};
				}(),
				language: (navigator.browserLanguage || navigator.language).toLowerCase()
			};
		},
		/*平台判断end*/

		/*dialog start
		<div id="toggle-msg" class="toggle_msg"></div>
		<script>
		$.MsgToggle('sdafsdfsafsdfsafdsf')
		</script>
		*/
		MsgToggle: function (txt) {
			clearInterval(window.t);
			var $window = $(window);
			var $el = $("#toggle-msg");
			$el.css('display', 'inline-block');
			var duration = 3000;
			var w = $window.width();
			var h = $window.height();
			var boxW = $el.css('width');
			var boxH = $el.css('height');
			$el.text(txt);
			$el.css({
				"position": "fixed",
				"z-index": "99999",
				"left": "50%",
				"top": "50%",
				"margin-left": "-" + boxW.substring(0, boxW.length - 2) / 2 + "px"
			});
			window.t = setInterval(function () {
				$el.fadeOut('fast');
			}, duration);
		},
		/*dialog end*/

		/*获取url&参数 start*/
		GetQueryString: function (name) {
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
			var r = window.location.search.substr(1).match(reg);
			if (r != null) return unescape(r[2]);
			return null;
		},
		/*获取url&参数 end*/

		/*获取滚动条滚动高度 start*/
		GetPageScroll: function () {
			var t, l, w, h;
			if (document.documentElement && document.documentElement.scrollTop) {
				t = document.documentElement.scrollTop;
				l = document.documentElement.scrollLeft;
				w = document.documentElement.scrollWidth;
				h = document.documentElement.scrollHeight;
			} else if (document.body) {
				t = document.body.scrollTop;
				l = document.body.scrollLeft;
				w = document.body.scrollWidth;
				h = document.body.scrollHeight;
			}
			var o = new Object();
			o.t = t;
			o.l = l;
			o.w = w;
			o.h = h;
			return o;
		}
		/*获取滚动条滚动高度 end*/

	});

	/***************************************************$.extend华丽的分割线*********************************************************/

	/*Cookie start*/
	/**
    *快捷的Cookie插件
    *
    *创建一个即时Cookie:
    *$.Cookie(name,"value");
    *
    *
    *创建多个Cookie:
    *$.Cookie({name1:"value1",name2:"value2"});
    *
    *创建一个持续3600秒的Cookie
    *$.Cookie("name","value",3600);
    *
    *创建多个持续3600秒的Cookie:
    *$.Cookie({name1:"value1",name2:"value2"},3600);
    *
    *Cookie选项:secure只有https协议才能种上
    *$.Cookie("name","value",0,{
    *    path:"/",
    *    domain:"www.xinmin.cn",
    *    secure:false
    *});
    *
    *$.Cookie({name1:"value1",name2:"value2"},0,{
    *    path:"/",
    *    domain:"www.xinmin.cn",
    *    secure:false
    *});
    *
    *读取某个Cookie
     $.Cookie("name");
    *
    *读取所有Cookie
    *$.Cookie();
    *
    *删除某个Cookie
    *$.UnCookie("name");
    *
    *删除所有cookie
    *$.UnCookie();
    **/
	$.Cookie = function (name, val, sec, options) {
		var setCookie = function (data, sec, options) {
			var opts = {
				domain: "",
				path: "",
				secure: false
			};
			$.extend(opts, options);
			var str = "",
				j = 0;
			if (sec > 0) {
				var exDate = new Date();
				exDate.setTime(exDate.getTime() + sec * 1000);
				str += "; expires=" + exDate.toGMTString();
			};
			if (opts.path) {
				str += "; path=" + opts.path;
			};
			if (opts.domain) {
				str += "; domain=" + opts.domain;
			};
			if (opts.secure) {
				str += "; secure";
			};
			var cookieStr = "";
			for (var i in data) {
				cookieStr = encodeURIComponent(i) + "=" + encodeURIComponent(data[i]) + str;
				document.cookie = cookieStr;
				cookieStr = "";
			}
		};

		var ReadCookie = function (name) {
			var arrCookies = document.cookie.split(";");
			var reg = /([^=^\s]+)=([^=^\s]+)/;
			var cookies = [];
			for (var i = 0; i < arrCookies.length; i++) {
				var ret = arrCookies[i].match(reg);
				if (ret) {
					cookies[ret[1]] = decodeURIComponent(ret[2]);
				}
			}
			if (name) {
				if (typeof cookies[name] !== "undefined") {
					return cookies[name];
				} else {
					return null;
				}
			} else {
				return cookies;
			}
		}
		if (name && $.isPlainObject(name)) {
			var data = name,
				seconds = val,
				options = sec;
			setCookie(data, seconds, options);
		} else if (name && val) {
			var data = Object;
			data[name] = val;
			setCookie(data, sec, options);
		} else if (name && !val && !sec && !options) {
			return ReadCookie(name);
		} else if (!name && !val && !sec && !options) {
			return ReadCookie();
		}
	}

	$.UnCookie = function (name) {
		var del = function (name) {
			var date = new Date();
			date.setTime(date.getTime() - 10000);
			document.cookie = name + "=null; expires=" + date.toGMTString();
		}
		if (name) {
			del(name);
		} else {
			var arrCookies = document.cookie.split(";");
			var reg = /([^=^\s]+)=[^=^\s]+/;
			var cookies = [];
			for (var i in arrCookies) {
				var ret = arrCookies[i].match(reg);
				var k = ret[1];
				del(k);
			}
		}
	}
	/*cookie end*/
	$(function () {


		/*app 设备信息 start*/
		$.XMWBApp_UdeviceId = window.XMWBApp_UdeviceId || null;
		if (window.xinminUserInterface) {
			var Xmwb_android_obj = eval("(" + window.xinminUserInterface.getUserInfo() + ")");
			$.XMWBApp_UdeviceId = Xmwb_android_obj.XMWBApp_UdeviceId;
		}
		/*app 设备信息 end*/

		/*底部 start*/
		$('#XmMember,#XmClient,#XmWeb,#Partner').click(function () {
			var _this = $(this);
			if ($('.' + _this.attr('id')).css('display') == 'none') {
				$('.' + _this.attr('id')).fadeIn('normal');
			} else {
				$('.' + _this.attr('id')).fadeOut('fast');
			}
		});
		/*底部 end*/

		/*导航子菜单 start*/
		if ($('#MainNav').length > 0 && $('#SubNav').length > 0) {

			$('#MainNav .n').bind('mouseover', function () {
				var _this = $(this);
				var _subid = _this.data('subid');
				var _x = _this.offset().left;
				var _y = _this.offset().top + 30;
				var _w = $('#' + _subid).width() / 3;
				$('#SubNav .pull_box').hide();
				if (_subid == 'nav_sub') {
					$('#' + _subid).css({
						'left': '50%',
						'top': _y - 6,
						'margin-left': '-598px'
					}).fadeIn('fast');
				} else if (_subid == 'nav_jh') {
					$('#' + _subid).find('a').css('width', '160px');
					$('#' + _subid).css({
						'left': _x - _w,
						'top': _y
					}).fadeIn('fast');
				} else {
					$('#' + _subid).css({
						'left': _x - _w,
						'top': _y
					}).fadeIn('fast');
				}

			});
			$('#SubNav .pull_box').bind('mouseleave', function () {
				$('#SubNav .pull_box').hide();
			});

			$('body,html').click(function () {
				$('.pull_box').hide();
			});
		}
		/*导航子菜单 end*/
		/*顶部右侧 start*/
		$('.ch_icon').hover(function () {
			$(this).addClass($(this).data('ch'))
		}, function () {
			$(this).removeClass($(this).data('ch'))
		});
		/*顶部右侧 end*/

		/*微信弹窗 start*/
		if ($('#wx-tan').length > 0) {
			$(function () {
				$('#wx-tan').popover({
					placement: 'bottom',
					html: true,
					content: '<img src="//image.xinmin.cn/template/www.xinmin.cn/201310/images/xmwb.jpg"/>',
					trigger: 'hover'
				});
			});
		}
		if ($('#wxjz').length > 0) {
			$(function () {
				$('#wxjz').popover({
					placement: 'top',
					html: true,
					content: '<img src="//img0.xinmin.cn/web/xinmin/2018/images/top10.png"/>',
					trigger: 'hover'
				});
			});
		}
		/*微信弹窗 end*/

		/*分享 start*/
		

		$.PcShare = function (type, params) {
			if (type == 'weixin') {
				var _url = encodeURIComponent(params.url);

				$('<img src="http://bshare.optimix.asia/barCode?site=weixin&type=0&publisherUuid=&url='+ _url + '"/>').load(function () {
					$(params.obj).popover({
						placement: 'top',
						html: true,
						content: '<img src="http://bshare.optimix.asia/barCode?site=weixin&type=0&publisherUuid=&url='+ _url + '"  width="150"/>',
						trigger: 'manual'
					});
					$(params.obj).popover('toggle');
				});

				return;
			} else if (type == 'tsina') {
				var _url = encodeURIComponent(params.url);
				var _title = encodeURI(params.title);
				var _pic = encodeURIComponent(params.pic);
				var _u = 'http://service.weibo.com/share/share.php?url=' + _url + '&title=' + _title ;
			} else if (type == 'qzone') {
				var _url = encodeURIComponent(params.url);
				var _title = encodeURI(params.title);
				var _pic = encodeURIComponent(params.pic);
				var _des = encodeURI(params.des);
				var _u = 'http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=' + _url + '&title=' + _title + '&pics=' + _pic + '&desc=' + _des;
			}
			window.open(_u, '', 'width=700, height=680, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, location=yes, resizable=no, status=no');
		}

		$(".weixin_share").click(function (e) {
			var $el = $(this);
			$.PcShare('weixin', {
				'url': $el.data('url'),
				'obj': this
			});
		});

		$(".share_sina").click(function (e) {
			var $el = $(this);
			$.PcShare('tsina', {
				'url': $el.data('url'),
				'title': $el.data('title'),
				'pic': $el.data('img')
			});
		});

		$(".share_zone").click(function (e) {
			var $el = $(this);
			$.PcShare('qzone', {
				'url': $el.data('url'),
				'title': $el.data('title'),
				'pic': $el.data('pic'),
				'des': $el.data('desc')
			});
		});

		/*分享 end*/


		/*右侧浮动*/
		if ($("#productBody").length > 0) {
			var _screenH = $(window).height();
			// 右侧导航栏
			var productBodyEv = {
				$_silder: $("#productBody .sliderLine"),
				$_list: $("#productBody .list"),
				$_listItem: $("#productBody .list li"),
				$_twoCode: $("#productBody .twoCode"),
				init: function () {
					$("#productBody img").each(function () {
						$(this).attr("src", $(this).attr("data-original"));
					});
					/*		if(_screenH-223 <= 590){//屏幕高度-本身TOP值 < 本身高度
								$("#productBody").css("top",(_screenH-590)/2+200);
								$("#productBody .tools").css("bottom",'-60px');
							}*/
					productBodyEv.bodyEv();
					productBodyEv.showTwoCode();
					productBodyEv.goTop();
					productBodyEv.closeBody();
					productBodyEv.listItem();
					var $_scrollAdLi = $(".scrollAd li");
					var scrollAdLiLen = $_scrollAdLi.length;
					var str = "";
					if (scrollAdLiLen == 1) {
						$("#productBody .scrollAd .btn").hide();
					}
					for (i = 0; i < scrollAdLiLen; i++) {
						str += '<li></li>';
					};
					$(".scrollAd .hd").append(str);
					$_scrollAdLi.show();


					if ($(".scrollZt").children().length > 1) {
						$("#productBody .ad2").slide({
							mainCell: ".scrollZt",
							effect: "fold",
							autoPlay: true,
							autoPage: true,
							interTime: 6000
						});
					};

					var isTouchDevice = 'ontouchstart' in window;
					if (isTouchDevice) {
						$("#productBody").hide();
					}

				},
				listItem: function () {
					productBodyEv.$_listItem.hover(
						function () {
							$(this).addClass("on").find(".floatItem").stop().animate({
								"width": 260
							}, 300);
						},
						function () {
							$(this).removeClass("on").find(".floatItem").stop().animate({
								"width": 88
							}, 300);
						}
					)
				},
				showTwoCode: function () {
					productBodyEv.$_twoCode.hover(
						function () {
							$(this).find("div").slideDown();
						},
						function () {
							$(this).find("div").slideUp();
						}
					);
				},
				goTop: function () {
					$("#productBody .goTop").click(function () {
						$('html,body').animate({
							scrollTop: '0px'
						}, 200);
					});
				},
				closeBody: function () {
					$("#productBody .close").click(function () {
						$("#productBody").slideUp();
					});
				},
				bodyEv: function () {

				}
			};

			productBodyEv.init();
		}

		/*右侧浮动 end*/

		/*数字报纸接口 start*/
		if ($('#szb-pic img').length > 0) {
			$.getJSON("//xmwb.xinmin.cn/ipadInterface/page.php?xinminInterface=xinmin&type=json", function (json) {
				if (json.code == 1) {
					// $('#szb-pic img').attr('src',json.data.xmwb.pagePicPrefix+json.data.xmwb.datePath+'/A01/Page_b.jpg');
					$('#szb-pic img').attr('src', json.data.xmwb.pagePicSmall);
				}
				/*console.log(json);*/
			});
		}
		/*数字报纸接口 end*/

		/*右侧百叶窗*/
		var $ls = $(".aside_slider li .l");
		var $slider_details = $(".aside_slider li .slider-detail");
		$(".aside_slider li").hover(function (e) {
			var $el = $(this);
			$slider_details.hide();
			$ls.show();
			$el.find(".l").hide();
			$el.find(".slider-detail").show();
		});
		$(".aside_slider li").eq(0).find(".l").hide();
		$(".aside_slider li").eq(0).find(".slider-detail").show();


		//鼠标移上去后高亮并显示分享
		var $lists = $(".list_list,.list_card");
		$lists.mouseenter(function (e) {
			$lists.removeClass("active");
			var $el = $(this);
			$el.addClass("active");
		}).mouseleave(function () {
			var $el = $(this);
			$el.find(".weixin_share").popover('hide');
		});
	})


	/*登录状态start*/
	$(function(){
		// console.log($.Cookie("XMPS_UC"));
		if($.Cookie("XMPS_UC")!="null" && $.Cookie("XMPS_UC") && $('.product').length > 0){
			$('.product .password').html('<a href="https://reg.xinmin.cn/" target="_blank">进入</a> | <a href="javascript:;" onclick="$.Cookie(\'XMPS_UC\',\'null\',0,{path:\'/\',domain:\'.xinmin.cn\',secure:false});window.location.reload();">退出</a>');
			$('.product .password').addClass('password_add');
			$('.product .password').unbind("mouseenter").unbind("mouseleave"); 
		}
		
	});
	/*登录状态end*/
})(jQuery);