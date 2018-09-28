<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <jsp:include page="/WEB-INF/includes/main/meta.jsp"/>

    <title>${content.title}</title>
    <link rel="shortcut Icon" href="http://image.xinmin.cn/favicon.ico">
    <jsp:include page="/WEB-INF/includes/main/link.jsp"/>
    <jsp:include page="/WEB-INF/includes/main/head_script.jsp"/>
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
<div class="PageCoreBg">

    <div class="PageCore">
        <!-- 左 -->
        <div class="Cleft">
           <%--${detail.topNav}--%>
            <div class="Mbx">您现在的位置：首页 &gt; 民生 &gt; 城生活 &gt; <span>正文</span> </div>
            <!-- 正文 -->
                <div class="ArticleBox">

                  <%-- ${detail.aTitle} --%>
                    <h1 class="a_title">第17届跨采大会今天开幕 “跨采在线平台”永不落幕${detail.title}</h1>

                   <%--  ${detail.info} --%>
                    <div class="info">
                        <span>来源：新民晚报${detail.source}</span>&nbsp;&nbsp;&nbsp;&nbsp;
                        <span>记者：张钰芸${detail.reporter}</span>&nbsp;&nbsp;&nbsp;&nbsp;
                        <span>作者：张钰芸${detail.author}</span>&nbsp;&nbsp;&nbsp;&nbsp;
                        <span>编辑：任天宝${detail.editor}</span>&nbsp;&nbsp;&nbsp;&nbsp;
                        <span>2018-09-26 10:04<fmt:formatDate value="${detail.releaseTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate> </span>
                        <img class="info_img" id="font-smaller" src="/static/assets/imgs/smaller.jpg">
                        <span class="info_img">|</span>
                        <img class="info_img" id="font-larger" src="/static/assets/imgs/larger.jpg">
                        <span class="info_img">|</span>
                        <img class="info_img pcshare-start" src="/static/assets/imgs/share_icon1.jpg">
                        <img class="info_img pcshare-end pcshare-qzone-end hidden" src="/static/assets/imgs/icon_qzone.png" width="22">
                        <img class="info_img pcshare-end pcshare-tsina-end hidden" src="/static/assets/imgs/icon_sina.png" width="22">
                        <img class="info_img pcshare-end pcshare-weixin-end hidden" src="/static/assets/imgs/icon_weixin.png" width="22">
                    </div>

                    <!-- 文章内容44 -->
                      <%--  ${detail.aContent} --%>
                    <div class="a_content">
                        <script>var contentimageurl = '/static/assets/imgs/newsPhoto/NEM1_20180924_C0323247176_A1308504.jpg';</script>
                    </div>
                    <p style="text-align: center;">
                        <img border="0" title="${content.title}" type="image" src="${content.pic}http://img.xinmin.cn/xmwb/2018/9/NEM1_20180926_C0323253470_A1311038.jpg" id="${content.pic}http://img.xinmin.cn/xmwb/2018/9/NEM1_20180926_C0323253470_A1311038.jpg">
                    </p>
                    <p style="text-align: center;">
                        <!--  图片介绍+拍摄人 -->
                        <em>图说：中国国际跨国采购在线平台启动仪式现场 新民晚报记者 张钰芸 摄</em>
                    </p>
                    <!-- 文章内容44/ -->

                      <!-- 关键字2 -->

                      <div class="key_words">
                          <div class="opera" id="opera-btn">
                              <span class="f">顶</span>
                              <span id="dz-btn">
							<i class="iconfont"><img src="/static/assets/imgs/heart.jpg" width="15"></i>
						</span>
                          </div>
                      </div>

                      <!-- 今日热点 -->
                      <%-- ${detail.todayHots}--%>
                      <div class="today_hots">
                          <h4 class="title">今日热点</h4>
                          <div class="content" id="today-hots-a">
                              <div class="row">
                                  <div class="col-sm-4">
                                      <dt>
                                          <a href="http://newsxmwb.xinmin.cn/2018/09/26/31435082.html" target="_blank" class="pic zoom-in">
                                              <img class="zoom-img" src="/static/assets/imgs/newsPhoto/NEM1_20180923_C0323244964_A1307174.jpg" width="282" height="159" title="丰收节后第二天，习近平考察了这个名字不一般的地方" alt="丰收节后第二天，习近平考察了这个名字不一般的地方">
                                          </a>
                                          <a href="http://newsxmwb.xinmin.cn/2018/09/26/31435082.html" target="_blank" class="tit" title="丰收节后第二天，习近平考察了这个名字不一般的地方">丰收节后第二天，习近平考察了这个名字不一般的地方</a>
                                      </dt>
                                      <dd><span class="tag tag_color1">头条</span>
                                          <span class="time">2018-09-26 08:54</span>
                                      </dd>
                                  </div>
                                  <div class="col-sm-4">
                                      <dt>
                                          <a href="http://newsxmwb.xinmin.cn/2018/09/26/31435082.html" target="_blank" class="pic zoom-in">
                                              <img class="zoom-img" src="/static/assets/imgs/newsPhoto/NEM1_20180923_C0323244964_A1307174.jpg" width="282" height="159" title="丰收节后第二天，习近平考察了这个名字不一般的地方" alt="丰收节后第二天，习近平考察了这个名字不一般的地方">
                                          </a>
                                          <a href="http://newsxmwb.xinmin.cn/2018/09/26/31435082.html" target="_blank" class="tit" title="丰收节后第二天，习近平考察了这个名字不一般的地方">丰收节后第二天，习近平考察了这个名字不一般的地方</a>
                                      </dt>
                                      <dd><span class="tag tag_color1">头条</span>
                                          <span class="time">2018-09-26 08:54</span>
                                      </dd>
                                  </div>
                                  <div class="col-sm-4">
                                      <dt>
                                          <a href="http://newsxmwb.xinmin.cn/2018/09/26/31435082.html" target="_blank" class="pic zoom-in">
                                              <img class="zoom-img" src="/static/assets/imgs/newsPhoto/NEM1_20180923_C0323244964_A1307174.jpg" width="282" height="159" title="丰收节后第二天，习近平考察了这个名字不一般的地方" alt="丰收节后第二天，习近平考察了这个名字不一般的地方">
                                          </a>
                                          <a href="http://newsxmwb.xinmin.cn/2018/09/26/31435082.html" target="_blank" class="tit" title="丰收节后第二天，习近平考察了这个名字不一般的地方">丰收节后第二天，习近平考察了这个名字不一般的地方</a>
                                      </dt>
                                      <dd><span class="tag tag_color1">头条</span>
                                          <span class="time">2018-09-26 08:54</span>
                                      </dd>
                                  </div>
                              </div>
                          </div>
                      </div>
                      <!-- 今日热点/ -->

                      <%-- ${detail.news24H}--%>
                      <div class="news_24H">
                          <div class="content">
                              <ul id="today-hots-b">
                                  <li>
                                      <span>法谭</span>&nbsp;|&nbsp;
                                      <a href="http://newsxmwb.xinmin.cn/fatan/2018/09/26/31435145.html" target="_blank" title="是“投资失败”还是“落入圈套”：上海警方破获多起金融投资电信诈骗团伙">是“投资失败”还是“落入圈套”：上海警方破获多起金融投资电信诈骗团伙</a>
                                  </li>
                                  <li>
                                      <span>法谭</span>&nbsp;|&nbsp;
                                      <a href="http://newsxmwb.xinmin.cn/fatan/2018/09/26/31435145.html" target="_blank" title="是“投资失败”还是“落入圈套”：上海警方破获多起金融投资电信诈骗团伙">是“投资失败”还是“落入圈套”：上海警方破获多起金融投资电信诈骗团伙</a>
                                  </li>
                                  <li>
                                      <span>法谭</span>&nbsp;|&nbsp;
                                      <a href="http://newsxmwb.xinmin.cn/fatan/2018/09/26/31435145.html" target="_blank" title="是“投资失败”还是“落入圈套”：上海警方破获多起金融投资电信诈骗团伙">是“投资失败”还是“落入圈套”：上海警方破获多起金融投资电信诈骗团伙</a>
                                  </li>
                                  <li>
                                      <span>法谭</span>&nbsp;|&nbsp;
                                      <a href="http://newsxmwb.xinmin.cn/fatan/2018/09/26/31435145.html" target="_blank" title="是“投资失败”还是“落入圈套”：上海警方破获多起金融投资电信诈骗团伙">是“投资失败”还是“落入圈套”：上海警方破获多起金融投资电信诈骗团伙</a>
                                  </li>
                                  <li>
                                      <span>法谭</span>&nbsp;|&nbsp;
                                      <a href="http://newsxmwb.xinmin.cn/fatan/2018/09/26/31435145.html" target="_blank" title="是“投资失败”还是“落入圈套”：上海警方破获多起金融投资电信诈骗团伙">是“投资失败”还是“落入圈套”：上海警方破获多起金融投资电信诈骗团伙</a>
                                  </li>
                                  <li>
                                      <span>法谭</span>&nbsp;|&nbsp;
                                      <a href="http://newsxmwb.xinmin.cn/fatan/2018/09/26/31435145.html" target="_blank" title="是“投资失败”还是“落入圈套”：上海警方破获多起金融投资电信诈骗团伙">是“投资失败”还是“落入圈套”：上海警方破获多起金融投资电信诈骗团伙</a>
                                  </li>
                              </ul>
                          </div>
                      </div>

                      <!-- 评论 -->
                      <div class="comments">
                          <div class="cols">
                              <span class="tit">网友评论</span>
                              <span class="tips">小提示：您要为您发表的言论后果负责，请各位遵守法纪注意语言文明</span>
                              <!-- <span class="num"><b>0</b> 条评论</span> -->
                          </div>
                          <div class="comments_pub">
                              <form action="/submit/comment" method="post">
                                  <div class="line2"><textarea id="PlTextarea" name="txt"></textarea></div>
                                  <div class="line1">
                                      <button class="plbtn" id="comment-btn">发表评论</button>
                                  </div>
                              </form>
                          </div>
                          <div class="cols">
                              <span class="tit">最新评论</span>
                              <a href="javascript:;" class="toggle" id="comment-toggle">[展开]</a>
                          </div>

                          <div class="comments_list" id="comment-list">
                              <div class="comment_">
                                <%--  <c:forEach items="${commoents}" var="comment">
                                      ${comment.content}
                                  </c:forEach>--%>
                              </div>
                          </div>
                      </div>
                      <!-- 评论/ -->
                </div>
            <!-- 正文/ -->
        </div>
        <!-- 左/ -->
        <!-- 右 -->
        <div class="Cright">
            <div class="right_box">
                <div class="c_title">
                    <a href="http://xmwb.xinmin.cn/" target="_blank" class="tit">新民晚报数字报</a>
                    <a href="http://xmwb.xinmin.cn/" target="_blank" class="more"></a>
                </div>
                <div class="c_content">
                    <a href="http://xmwb.xinmin.cn/" target="_blank" class="szb_pic zoom-in " id="szb-pic"><img class="zoom-img" src="/static/assets/imgs/Page_b.jpg" width="225" height="305" title="新民晚报数字报" alt="新民晚报数字报"></a>
                    <a href="http://xmwb.xinmin.cn/" target="_blank" class="szb_more">阅读更多</a>
                </div>
            </div>
        </div>
        <!-- 右/ -->
    </div>
    </div>
</div>
<!-- 内容/ -->

<!-- 底部 -->
<jsp:include page="/WEB-INF/includes/main/button.jsp"></jsp:include>
<!-- 底部 -->

<script>
$(function () {
    $("#comment-toggle").click(function () {
        commentDetails=$.ajax({
            url:"/get/comment",
            type:"get",
            dataType:"json",
            async:true,
            success:function (data) {
                console.log(data);
                if($(".comments_list").css("display")=="none"){
                    $(".comments_list").css("display","block");
                    var html_resultinfo='';

                    var comments = eval(data);
                    $(comments).each(function(name, value){
                        var comment = $(this);
                        console.log(comment);
                        html_resultinfo +=
                            "<div class='post clearfix'>" +
                            "  <div class='user-block'>" +
                            "        <span class='username'>" +
                            "          <a>"+value.userName+"</a>" +
                            "        </span>" +
                            "    <span class='description'>"+value.createTime+"</span>" +
                            "  </div>" +
                            "  <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
                            + value.content + "</p>" +
                            "</div>";

                        $(".toggle").html("[收起]");
                        $(".comment_").html(html_resultinfo);
                    });
                }

                else{
                    $(".toggle").html("[展开]");
                    $(".comments_list").css("display","none");
                }

            }
        });


        $(".comment_").html(commentDetails);
    });
})
</script>

</body>
</html>
