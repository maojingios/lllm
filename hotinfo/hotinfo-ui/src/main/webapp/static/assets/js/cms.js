(function($) {
	/*4天气 start*/
		if($('#weather-date').length > 0){
		$('#weather-date').html('2018年09月25日 星期二');
	}
	/*天气 end*/

	/*今日热点 start*/
		
	var hots_a_tpl = '<dl><dt><a href="http://shanghai.xinmin.cn/xmsz/2018/09/25/31434634.html" target="_blank" class="pic zoom-in"><img class="zoom-img" src="http://img0.xinmin.cn/2018/09/25/20180925073350033568.jpg" width="282" height="159" title="人民日报头版重磅文章：总书记要我们对标焦裕禄" alt="人民日报头版重磅文章：总书记要我们对标焦裕禄"/></a><a href="http://shanghai.xinmin.cn/xmsz/2018/09/25/31434634.html" target="_blank" class="tit" title="人民日报头版重磅文章：总书记要我们对标焦裕禄">人民日报头版重磅文章：总书记要我们对标焦裕禄</a></dt><dd><span class="tag tag_color1">头条</span><span class="time">2018-09-25 07:37</span></dd></dl><dl><dt><a href="http://shanghai.xinmin.cn/xmsq/2018/09/25/31434638.html" target="_blank" class="pic zoom-in"><img class="zoom-img" src="http://img0.xinmin.cn/2018/09/25/20180925074323855216.jpg" width="282" height="159" title="人民日报头版聚焦浦东新区：改革开放，让城市更有温度" alt="人民日报头版聚焦浦东新区：改革开放，让城市更有温度"/></a><a href="http://shanghai.xinmin.cn/xmsq/2018/09/25/31434638.html" target="_blank" class="tit" title="人民日报头版聚焦浦东新区：改革开放，让城市更有温度">人民日报头版聚焦浦东新区：改革开放，让城市更有温度</a></dt><dd><span class="tag tag_color1">头条</span><span class="time">2018-09-25 07:43</span></dd></dl><dl><dt><a href="http://shanghai.xinmin.cn/xmsz/2018/09/24/31434579.html" target="_blank" class="pic zoom-in"><img class="zoom-img" src="http://img0.xinmin.cn/2018/01/03/20180103102159608713.jpg" width="282" height="159" title="中美贸易战进入全新阶段，中美都有三个没想到！" alt="中美贸易战进入全新阶段，中美都有三个没想到！"/></a><a href="http://shanghai.xinmin.cn/xmsz/2018/09/24/31434579.html" target="_blank" class="tit" title="中美贸易战进入全新阶段，中美都有三个没想到！">中美贸易战进入全新阶段，中美都有三个没想到！</a></dt><dd><span class="tag tag_color1">头条</span><span class="time">2018-09-24 18:58</span></dd></dl><dl><dt><a href="http://shanghai.xinmin.cn/xmsq/2018/09/25/31434609.html" target="_blank" class="pic zoom-in"><img class="zoom-img" src="http://img0.xinmin.cn/2018/09/25/20180925070315878355.jpg" width="282" height="159" title="中国已成为全球第一大黄金消费国,去年消费量为1089吨" alt="中国已成为全球第一大黄金消费国,去年消费量为1089吨"/></a><a href="http://shanghai.xinmin.cn/xmsq/2018/09/25/31434609.html" target="_blank" class="tit" title="中国已成为全球第一大黄金消费国,去年消费量为1089吨">中国已成为全球第一大黄金消费国,去年消费量为1089吨</a></dt><dd><span class="tag tag_color1">头条</span><span class="time">2018-09-25 07:03</span></dd></dl><dl><dt><a href="http://shanghai.xinmin.cn/xmsq/2018/09/25/31434616.html" target="_blank" class="pic zoom-in"><img class="zoom-img" src="http://img0.xinmin.cn/2018/09/25/20180925070856373912.jpg" width="282" height="159" title="上海今多云午后有分散性短时阵雨 最高温度26℃" alt="上海今多云午后有分散性短时阵雨 最高温度26℃"/></a><a href="http://shanghai.xinmin.cn/xmsq/2018/09/25/31434616.html" target="_blank" class="tit" title="上海今多云午后有分散性短时阵雨 最高温度26℃">上海今多云午后有分散性短时阵雨 最高温度26℃</a></dt><dd><span class="tag tag_color1">头条</span><span class="time">2018-09-25 07:10</span></dd></dl><dl><dt><a href="http://shanghai.xinmin.cn/xmsq/2018/09/25/31434606.html" target="_blank" class="pic zoom-in"><img class="zoom-img" src="http://img0.xinmin.cn/2018/09/25/20180925070150467427.jpg" width="282" height="159" title="瑞典电视台回应辱华节目称表达的整体意思出现了缺失 并未道歉" alt="瑞典电视台回应辱华节目称表达的整体意思出现了缺失 并未道歉"/></a><a href="http://shanghai.xinmin.cn/xmsq/2018/09/25/31434606.html" target="_blank" class="tit" title="瑞典电视台回应辱华节目称表达的整体意思出现了缺失 并未道歉">瑞典电视台回应辱华节目称"表达的整体意思出现了缺失" 并未道歉</a></dt><dd><span class="tag tag_color1">头条</span><span class="time">2018-09-25 07:01</span></dd></dl>';
	var hots_b_tpl = '<li><span>头条</span>&nbsp;|&nbsp;<a href="http://shanghai.xinmin.cn/xmsq/2018/09/25/31434620.html" target="_blank" title="今年中秋月25日上午最圆，十五的月亮为何十六圆？">今年中秋月25日上午最圆，十五的月亮为何十六圆？</a></li><li><span>金融城</span>&nbsp;|&nbsp;<a href="http://newsxmwb.xinmin.cn/caijing/2018/09/25/31434656.html" target="_blank" title="财经早班车 | 8月全国发行地方政府债券8830亿元">财经早班车 | 8月全国发行地方政府债券8830亿元</a></li><li><span>文体人物</span>&nbsp;|&nbsp;<a href="http://newsxmwb.xinmin.cn/wentihui/wtrw/2018/09/25/31434655.html" target="_blank" title="冲破梅罗十年垄断！莫德里奇当选新一届世界足球先生">冲破梅罗十年垄断！莫德里奇当选新一届世界足球先生</a></li><li><span>文体社会</span>&nbsp;|&nbsp;<a href="http://newsxmwb.xinmin.cn/wentihui/wtsh/2018/09/25/31434654.html" target="_blank" title="女排“最强阵容”今晨出征世锦赛！“郎家军”离大满贯就差这一个">女排“最强阵容”今晨出征世锦赛！“郎家军”离大满贯就差这一个</a></li><li><span>头条</span>&nbsp;|&nbsp;<a href="http://shanghai.xinmin.cn/xmsq/2018/09/25/31434649.html" target="_blank" title="党员注意！微信上这些信息不能发，严重者开除党籍！10月1日起实施！">党员注意！微信上这些信息不能发，严重者开除党籍！10月1日起实施！</a></li><li><span>头条</span>&nbsp;|&nbsp;<a href="http://shanghai.xinmin.cn/xmsq/2018/09/25/31434643.html" target="_blank" title="特朗普：可能很快与金正恩举行第二次会晤">特朗普：可能很快与金正恩举行第二次会晤</a></li>';
	var todayhots_a = hots_a_tpl;
	var todayhots_b = hots_b_tpl;
	if($('#today-hots-a').length > 0 && $('#today-hots-b').length > 0){
		$('#today-hots-a').html(todayhots_a);
		$('#today-hots-b').html(todayhots_b);
	}
	/*今日热点4  end*/

	/*聚合8  start*/
		
	if($('.juhe_link').length > 0){
		$('.juhe_link').attr('href','http://tag.xinmin.cn/21288/index.html');
		$('.juhe_src').attr('src','http://img0.xinmin.cn/2018/09/20/20180920160556412381.jpg').attr('title','我们的节日·中秋').attr('alt','我们的节日·中秋');
		$('.juhe_tit').text('我们的节日·中秋').attr('title','我们的节日·中秋');
			}

	if($('#nav_jh').length > 0){
		var jh_html = '<a href="http://tag.xinmin.cn/21288/index.html" target="_blank">2018中秋</a><a href="http://tag.xinmin.cn/21231/index.html" target="_blank">改革开放40年</a><a href="http://tag.xinmin.cn/21237/index.html" target="_blank">生逢1978</a><a href="http://tag.xinmin.cn/21260/index.html" target="_blank">进博会</a><a href="http://tag.xinmin.cn/21280/index.html" target="_blank">风从海上来</a>';
		$('#nav_jh').html(jh_html);
	}
	/*聚合 end*/

	/*右侧浮动 start*/
	$("#productBody .list").html('<li class="first"><a class="titItem" target="_blank" href="//newsxmwb.xinmin.cn/xinminyx/pc/index.htm">新民印象</a><div class="floatItem"><div class="wrap"><img src="//img0.xinmin.cn/2018/09/24/20180924112930616663.jpg" /><a href="http://newsxmwb.xinmin.cn/xinminyx/2018/09/24/31434407.html" target="_blank">外滩防汛墙新景观灯试灯</a></div></div></li>\
	<li class="first"><a class="titItem" target="_blank" href="//newsxmwb.xinmin.cn/yedu/pc/index.htm">夜读</a><div class="floatItem"><div class="wrap"><img src="//img.xinmin.cn/xmwb/2018/9/NEM1_20180924_C0323247176_A1308504.jpg" /><a href="http://newsxmwb.xinmin.cn/yedu/2018/09/24/31434487.html" target="_blank">月亮每个月都要圆上一回</a></div></div></li>\
	<li class="first"><a class="titItem" target="_blank" href="//newsxmwb.xinmin.cn/xinminyan/pc/index.htm">新民眼</a><div class="floatItem"><div class="wrap"><img src="//img.xinmin.cn/xmwb/2018/9/NEM1_20180924_C0323247373_A1308659.jpg" /><a href="http://newsxmwb.xinmin.cn/xinminyan/2018/09/24/31434457.html" target="_blank">独家述评 | 中秋恒久远 佳节永流传</a></div></div></li>\
	<li class="first"><a class="titItem" target="_blank" href="//shanghai.xinmin.cn/video/jr/">新视频</a><div class="floatItem"><div class="wrap"><img src="//img0.xinmin.cn/2018/09/24/20180924122637516886.jpg" /><a href="http://shanghai.xinmin.cn/xmsq/2018/09/25/31434455.html" target="_blank">生逢1978，我的故事 | 她们是“新上海人”，在这里“织”出了自己的斑斓人生</a></div></div></li>\
	<li class="first"><a class="titItem" target="_blank" href="//newsxmwb.xinmin.cn/chengsh/pc/index.htm">城生活</a><div class="floatItem"><div class="wrap"><img src="//img.xinmin.cn/xmwb/2018/9/NEM1_20180923_C0323244964_A1307174.jpg" /><a href="http://newsxmwb.xinmin.cn/chengsh/2018/09/23/31434186.html" target="_blank">上海始发首趟沪港高铁刚刚开出 不少旅客来“尝鲜”</a></div></div></li>\
	<li class="first"><a class="titItem" target="_blank" href="//newsxmwb.xinmin.cn/qiaoliang/pc/index.htm">侨梁</a><div class="floatItem"><div class="wrap"><img src="//img.xinmin.cn/xmwb/2018/9/NEM1_20180918_C0323227226_A1298929.jpg" /><a href="http://newsxmwb.xinmin.cn/qiaoliang/2018/09/21/31433641.html" target="_blank">买房“啃老”，新西兰“父母银行”不堪重负</a></div></div></li>\
	<li class="first"><a class="titItem" target="_blank" href="//newsxmwb.xinmin.cn/shizheng/szt/pc/index.htm">市政厅</a><div class="floatItem"><div class="wrap"><img src="//img.xinmin.cn/xmwb/2018/9/NEM1_20180924_C0323247535_A1308738.jpg" /><a href="http://newsxmwb.xinmin.cn/shizheng/szt/2018/09/24/31434521.html" target="_blank">花好月圆庆中秋 汉韵醉白情意浓</a></div></div></li>\
	<li class="first"><a class="titItem" target="_blank" href="//newsxmwb.xinmin.cn/wentihui/wtrw/pc/index.htm">文体人物</a><div class="floatItem"><div class="wrap"><img src="//img.xinmin.cn/xmwb/2018/9/NEM1_20180925_C0323248768_A1309083.jpg" /><a href="http://newsxmwb.xinmin.cn/wentihui/wtrw/2018/09/25/31434655.html" target="_blank">冲破梅罗十年垄断！莫德里奇当选新一届世界足球先生</a></div></div></li>');
	/*右侧浮动 end*/
})(jQuery);