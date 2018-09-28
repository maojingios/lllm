<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <jsp:include page="/WEB-INF/includes/content/meta.jsp"/>
    <title>热点资讯-抢先看</title>
    <%--logo--%>
    <link rel="shortcut Icon" href="http://image.xinmin.cn/favicon.ico">
    <link rel="shortcut Icon" href="http://image.xinmin.cn/favicon.ico">
    <jsp:include page="/WEB-INF/includes/main/link.jsp"/>
    <jsp:include page="/WEB-INF/includes/main/head_script.jsp"/>
    <script type="text/javascript" src="/static/assets/js/h.js" charset="utf-8" id="r_script"></script></head>
</head>
<body>
<!-- 顶部 -->
<div class="TopSideBg">
    <jsp:include page="/WEB-INF/includes/main/top.jsp"></jsp:include>
</div>
<!-- 顶部/ -->

<!-- 导航 -->
<jsp:include page="/WEB-INF/includes/main/nav.jsp"></jsp:include>
<!-- 导航/ -->

<!-- 子菜单 -->
<div class="SubNav" id="SubNav">

     <c:forEach items="${navigations}" var="navigation">
         <div class="pull_box" id="${navigation.dataSubId}" style="display: none;">
             <c:forEach items="${subNavs}" var="subNav">
                 <c:if test="${navigation.id == subNav.parentId}">
                     <a href="${subNav.url}" target="_blank">${subNav.name}</a>
                 </c:if>
             </c:forEach>
         </div>
     </c:forEach>

</div>
<!-- 子菜单/ -->

<!-- 内容 -->
<div class="PageCoreBg body">
    <div class="PageCore grids100">
        <!-- 左侧 -->
        <div class="w-79 main">
            <div class="grids100">
                <div class="w-72">
                    <!-- 头条3图 -->

                    <div class="toutu">
                        <div class="mod_c1">
                            <div id="SiderBarBcroll2_slidexinminpic" class="SiderBarBcroll2_slidexinminpic" onmouseover="/*jQuery(&#39;#SiderBarBcroll2_leftarrxinminpic,#SiderBarBcroll2_rightarrxinminpic&#39;).css(&#39;visibility&#39;,&#39;visible&#39;)*/" onmouseout="/*jQuery(&#39;#SiderBarBcroll2_leftarrxinminpic,#SiderBarBcroll2_rightarrxinminpic&#39;).css(&#39;visibility&#39;,&#39;hidden&#39;)*/">
                                <div class="mod_01">

<%--
                                    <a class="aimg zoom-in" href="${headLine.url}" target="_blank" style="text-align:center">
                                        <img class="zoom-img" src="${headLine.pic}" title="${headLine.title}" alt="${headLine.title}">
                                    </a>
                                    <p class="background"></p>
                                     <p class="title">
                                        <a href="${headLine.url}" target="_blank" title="${headLine.title}">${headLine.title}</a>
                                    </p>
                                    <p class="descri">${headLine.desc}</p>
--%>

                                    <a class="aimg zoom-in" href="/turn/to/detail" target="_blank" style="text-align:center">
                                        <img class="zoom-img" src="/static/assets/imgs/newsPhoto/20180925073350033568.jpg" title="人民日报头版重磅文章：总书记要我们对标焦裕禄" alt="人民日报头版重磅文章：总书记要我们对标焦裕禄">
                                    </a>
                                    <p class="background"></p>
                                    <p class="title">
                                        <a href="/turn/to/detail" target="_blank" title="人民日报头版重磅文章：总书记要我们对标焦裕禄">人民日报头版重磅文章：总书记要我们对标焦裕禄</a>
                                    </p>
                                    <p class="descri">人民日报开设重要专栏“新思想从实践中产生”，今天刊发河南兰考篇《总书记要我们对标焦裕禄》。</p>
                                </div>
                            </div>

<%--
                            <div id="SiderBarBcroll2_leftarrxinminpic" onmouseover="jQuery(&#39;#SiderBarBcroll2_leftarrxinminpic,#SiderBarBcroll2_rightarrxinminpic&#39;).css(&#39;visibility&#39;,&#39;visible&#39;)"></div>
                            <div id="SiderBarBcroll2_slide_01_dot"></div>
                            <div id="SiderBarBcroll2_rightarrxinminpic" onmouseover="jQuery(&#39;#SiderBarBcroll2_leftarrxinminpic,#SiderBarBcroll2_rightarrxinminpic&#39;).css(&#39;visibility&#39;,&#39;visible&#39;)"></div>
--%>                        </div>
                        <script type="text/javascript">
                            /*var SiderBarBcroll2_slidexinminpic = new ScrollPic();SiderBarBcroll2_slidexinminpic.scrollContId = "SiderBarBcroll2_slidexinminpic";SiderBarBcroll2_slidexinminpic.dotListId = "SiderBarBcroll2_slide_01_dot";SiderBarBcroll2_slidexinminpic.frameWidth = 732;SiderBarBcroll2_slidexinminpic.pageWidth = 732;SiderBarBcroll2_slidexinminpic.upright = false;SiderBarBcroll2_slidexinminpic.speed = 10;SiderBarBcroll2_slidexinminpic.space = 20;SiderBarBcroll2_slidexinminpic.autoPlay = true;SiderBarBcroll2_slidexinminpic.arrLeftId = "SiderBarBcroll2_leftarrxinminpic";SiderBarBcroll2_slidexinminpic.arrRightId = "SiderBarBcroll2_rightarrxinminpic";SiderBarBcroll2_slidexinminpic.initialize();*/
                        </script>
                    </div>
                    <!--  头条3图/ -->
                </div>

                <div class="w-28">
                    <!-- 头条右侧列表 -->
                    <div class="mod_c2">
<%--
                        <c:forEach items="${contents}" var="content">
                            <div class="item">
                                <h1>
                                    <a href="${content.url}" class="tit" target="_blank">${content.title}</a>
                                </h1>

                                <p class="des">
                                    <c:if test="${fn:length(content)>45}">
                                        ${fn:substring(content, 0, 45)}
                                    </c:if>
                                    <c:if test="${fn:length(content)<=45}">
                                        ${content}
                                    </c:if>
                                </p>

                                <div class="info">
                                    <span class="onlinetime"><fmt:formatDate value="${content.releaseTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></span>

                                </div>

                            </div>
                        </c:forEach>
--%>

                        <div class="item">
                            <h1>
                                <a href="http://shanghai.xinmin.cn/xmsq/2018/09/25/31434638.html" class="tit" target="_blank">人民日报头版聚焦浦东新区：改革开放，让城市更有温度</a>
                            </h1>

                            <p class="des">习近平总书记参加全国人大会议上海团审议时表示，加强和创新社会治理，关键在体制创新，核心是人，只...

                            </p>
                            <div class="info">
                                <span class="onlinetime">2018-09-25 07:43</span>

                            </div>
                        </div>

                    </div>
                    <!-- 头条右侧列表/ -->
                </div>
            </div>

            <!-- 热点 -->
            <div class="HotBox">
                <div class="HotContent">
<%--
                    <a href="${hotOne.utl}" target="_blank" title="${hotOne.title}">
                        <font color="red">${hotOne.title}</font>
                    </a>
                    <c:forEach items="${hotNews}" var="news">
                        <a href="${news.url}" target="_blank" title="${news.title}">
                           ${news.title}
                        </a>
                    </c:forEach>
--%>
                    <a href="http://shanghai.xinmin.cn/xmsz/2018/09/25/31434653.html" target="_blank" title="中秋夜，听听习近平的“家常话”">
                        <font color="red">中秋夜，听听习近平的“家常话”</font>
                    </a>
                    <a href="http://shanghai.xinmin.cn/xmsz/2018/09/25/31434652.html" target="_blank" title="总书记要我们对标焦裕禄（新思想从实践中产生系列报道之七·河南兰考篇）">
                        总书记要我们对标焦裕禄（新思想从实践中产生系列报道之七·河南兰考篇）
                    </a>
                </div>
                <a class="more" href="#" target="_blank">更多</a>
            </div>
            <!-- 热点/ -->

            <!-- tab列表 -->
            <div class="tabs-news">
                <div class="nav-wrapper clearfix">
                    <ul class="nav clearfix pull-left" id="change-type">
<%--
                       <c:forEach items="${navigations}" var="navigation">
                            <c:if test="${navigation.isParent}">
                                <li class="">${navigation.name}</li>
                            </c:if>
                        </c:forEach>
--%>
                        <li class="active">头条</li>
                        <li class="">时政</li>
                        <li class="">民生</li>
                        <li class="">文体汇</li>
                        <li class="">夜光杯</li>
                        <li class="">帮侬忙</li>
                        <li class="">视频</li>
                    </ul>

                </div>

                <div class="type_content">
                    <!-- 选项卡内容 -->
                    <div class="arrangement type_content-group">

                        <!--  新闻提要 -->
<%--

                        <c:forEach items="${navigations}" var="navigation">
                            <!-- 判断到 nvaId == 视频就结束 -->
                            <c:if test="${navigation}">
                            <div class="type-item" style="display: block;">
                                <div class="type_content_card">
                                    <!-- 根据 navigation.id 查找出左右新闻摘要列表 -->
                                    <c:forEach items="${newsList}" var="news">
                                        <div class="list_card shared-item">
                                            <a href="${news.url}" target="_blank" class="pic zoom-in">
                                                <img data-src="${news.pic}" width="328" height="184" class="img smart-load zoom-img" title="${news.title}" alt="${news.title}" src="${news.pic}">
                                            </a>
                                            <a href="${news.url}" target="_blank" class="tit share-url share-title" title="${news.title}">${news.title}</a>
                                            <p class="des share-brief">${news.desc}
                                            </p>
                                            <div class="info">
                                                <span class="tag color1">${news.tag}</span>
                                                <span class="onlinetime"><fmt:formatDate value="${news.releaseTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate> </span>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            </c:if>
                        </c:forEach>

--%>
                        <!--  新闻提要 -->
                        <!-- 头条 -->
                        <div class="type-item" style="display: block;">

                        <div class="type_content_card">

                            <div class="list_card shared-item">
                                <a href="http://newsxmwb.xinmin.cn/caijing/2018/09/25/31434656.html" target="_blank" class="pic zoom-in">
                                    <img data-src="#" width="328" height="184" class="img smart-load zoom-img" title="财经早班车 | 8月全国发行地方政府债券8830亿元" alt="财经早班车 | 8月全国发行地方政府债券8830亿元" src="/static/assets/imgs/newsPhoto/20180925073350033568.jpg">
                                </a>
                                <a href="http://newsxmwb.xinmin.cn/caijing/2018/09/25/31434656.html" target="_blank" class="tit share-url share-title" title="财经早班车 | 8月全国发行地方政府债券8830亿元">财经早班车 | 8月全国发行地方政府债券8830亿元</a>
                                <p class="des share-brief">2018年8月，全国发行地方政府债券8830亿元。其中，一般债券3564亿元，专项债券5266...
                                </p>
                                <div class="info">
									<span class="tag color1">
										金融城
									</span>
                                    <span class="onlinetime">2018-09-25 08:53</span>
                                </div>
                            </div>
                            <div class="list_card shared-item">
                                <a href="http://newsxmwb.xinmin.cn/wentihui/wtrw/2018/09/25/31434655.html" target="_blank" class="pic zoom-in">
                                    <img data-src="#" width="328" height="184" class="img smart-load zoom-img" title="冲破梅罗十年垄断！莫德里奇当选新一届世界足球先生" alt="冲破梅罗十年垄断！莫德里奇当选新一届世界足球先生" src="/static/assets/imgs/newsPhoto/20180925073350033568.jpg">
                                </a>
                                <a href="http://newsxmwb.xinmin.cn/wentihui/wtrw/2018/09/25/31434655.html" target="_blank" class="tit share-url share-title" title="冲破梅罗十年垄断！莫德里奇当选新一届世界足球先生">冲破梅罗十年垄断！莫德里奇当选新一届世界足球先生</a>
                                <p class="des share-brief">国际足联年度颁奖典礼今晨在伦敦举行，莫德里奇击败皇马队友C罗和上赛季英超金靴萨拉赫，当选新一届...
                                </p>
                                <div class="info">


																		<span class="tag color1">
										人物
									</span>
                                    <span class="onlinetime">2018-09-25 08:51</span>
                                    <div class="tip-4-share"></div>
                                    <div class="news_share">
                                        <a class="weixin_share" data-url="http://newsxmwb.xinmin.cn/wentihui/wtrw/2018/09/25/31434655.html" ref="nofollow"></a>
                                        <a data-title="冲破梅罗十年垄断！莫德里奇当选新一届世界足球先生" data-url="http://newsxmwb.xinmin.cn/wentihui/wtrw/2018/09/25/31434655.html" data-img="#" class="share_sina" ref="nofollow"></a>
                                        <a data-title="冲破梅罗十年垄断！莫德里奇当选新一届世界足球先生" data-url="http://newsxmwb.xinmin.cn/wentihui/wtrw/2018/09/25/31434655.html" data-img="#" data-desc="国际足联年度颁奖典礼今晨在伦敦举行，莫德里奇击败皇马队友C罗和上赛季英超金靴萨拉赫，当选新一届..." class="share_zone" ref="nofollow"></a>
                                    </div>
                                </div>
                            </div>
                            <div class="list_card shared-item">
                                <a href="http://newsxmwb.xinmin.cn/wentihui/wtrw/2018/09/25/31434655.html" target="_blank" class="pic zoom-in">
                                    <img data-src="#" width="328" height="184" class="img smart-load zoom-img" title="冲破梅罗十年垄断！莫德里奇当选新一届世界足球先生" alt="冲破梅罗十年垄断！莫德里奇当选新一届世界足球先生" src="/static/assets/imgs/newsPhoto/20180925073350033568.jpg">
                                </a>
                                <a href="http://newsxmwb.xinmin.cn/wentihui/wtrw/2018/09/25/31434655.html" target="_blank" class="tit share-url share-title" title="冲破梅罗十年垄断！莫德里奇当选新一届世界足球先生">冲破梅罗十年垄断！莫德里奇当选新一届世界足球先生</a>
                                <p class="des share-brief">国际足联年度颁奖典礼今晨在伦敦举行，莫德里奇击败皇马队友C罗和上赛季英超金靴萨拉赫，当选新一届...
                                </p>
                                <div class="info">


																		<span class="tag color1">
										人物
									</span>
                                    <span class="onlinetime">2018-09-25 08:51</span>
                                    <div class="tip-4-share"></div>
                                    <div class="news_share">
                                        <a class="weixin_share" data-url="http://newsxmwb.xinmin.cn/wentihui/wtrw/2018/09/25/31434655.html" ref="nofollow"></a>
                                        <a data-title="冲破梅罗十年垄断！莫德里奇当选新一届世界足球先生" data-url="http://newsxmwb.xinmin.cn/wentihui/wtrw/2018/09/25/31434655.html" data-img="#" class="share_sina" ref="nofollow"></a>
                                        <a data-title="冲破梅罗十年垄断！莫德里奇当选新一届世界足球先生" data-url="http://newsxmwb.xinmin.cn/wentihui/wtrw/2018/09/25/31434655.html" data-img="#" data-desc="国际足联年度颁奖典礼今晨在伦敦举行，莫德里奇击败皇马队友C罗和上赛季英超金靴萨拉赫，当选新一届..." class="share_zone" ref="nofollow"></a>
                                    </div>
                                </div>
                            </div>


                            <%--<div class="placeholder">

                            </div>
                            <div class="placeholder">

                            </div>
                            <div class="placeholder">

                            </div>--%>
                        </div>
                        <a href="http://shanghai.xinmin.cn/t/gdbd/" target="_blank" class="show-more">显示更多</a>
                    </div>
                        <!-- 头条/ -->
                    </div>
                    <!-- 选项卡内容/ -->
                </div>
            </div>
            <!-- tab列表/ -->
        </div>
        <!--  左侧/ -->

        <!-- 右侧 -->
        <div class="w-21 aside">
            <div class="digtal-paper right-box">
                <div class="c_title">
                    <a href="http://xmwb.xinmin.cn/" target="_blank" class="tit highlight">新民晚报数字报</a>
                    <a href="http://xmwb.xinmin.cn/" target="_blank" class="more"></a>
                </div>
                <div class="paper zoom-in">
                    <a href="http://xmwb.xinmin.cn/" target="_blank"></a>
                    <a href="http://xmwb.xinmin.cn/" target="_blank" class="zoom-in paper-img" id="szb-pic">
                        <img class="zoom-img" src="#" width="225" height="305" title="新民晚报数字报" alt="新民晚报数字报">
                    </a>
                </div>

                <a class="read-more-paper" href="http://xmwb.xinmin.cn/" target="_blank">
                    阅读更多数字报
                </a>


            </div>
        </div>
        <!-- 右侧/ -->
    </div>
</div>
<!-- 内容/ -->

<jsp:include page="/WEB-INF/includes/main/button.jsp"></jsp:include>


<script>
    $(function() {
        $("ul > li").each(function(index){
            $(this).click(function(){
                $("ul > li").removeClass("active");
                $(this).addClass("active");
            })
        });

    })
</script>
</body>
</html>
