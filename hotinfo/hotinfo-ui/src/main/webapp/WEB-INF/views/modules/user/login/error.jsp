<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/includes/user/taglib.jsp"%>
<html>
<head>
    <title>信息提示 - 新民网通行证</title>
    <jsp:include page="${ctxInclude}/head.jsp"/>

    <%--样式--%>
    <style type="text/css">
        .content-wrap {
            width: 800px;
            max-width: 1024px;
            background: #fff;
            margin: 17px auto 0;
            /*box-shadow: 0px 1px 1px #ddd;*/
            font-family: "Microsoft YaHei", "微软雅黑", "Helvetica Neue", Georgia, "Times New Roman", Helvetica, serif;
        }
        .content-wrap h1 {
            font-size: 23px;
            color: #2c2c2c;
            text-align: center;
            padding-top: 19px;
            padding-bottom: 15px;
            border-bottom: 1px dashed #e5e5e5;
            width: 90%;
            margin: 0 auto;
        }
        .message-wrap {
            padding: 70px 50px;
            text-align: center;
        }
        .message-wrap h1 {
            border-bottom: 0 none;
        }
        .message-wrap a {
            color: #f00;
        }
    </style>
    <%--样式/--%>
</head>
<body>
<%--顶部--%>
<div class="TopSideBg" style="border-bottom:1px solid #c2c2c2;">
    <div class="top_wrap">
        <a href="/index" target="_blank" class="top_wrap_link">
            <img src="/static/assets/imgs/logo.png" alt="" class="us_logo">
        </a>
        <h2 id="us_name">信息提示</h2>
        <div class="us_reg absimg">
            <span>没有注册？</span>
            <a href="/registPage" target="_blank">立即注册</a>
        </div>
    </div>
</div>
<%--顶部/--%>

<%--内容--%>
<div class="PageCoreBg">
    <div class="PageCore us_new_wrap">
        <%--弹回倒计时--%>
        <div class="us_all_wrap">
            <div class="content-wrap message-wrap">
                <h1>用户名不正确</h1>
                <p><span id="seconds"></span> 秒后返回,<a href="/loginPage">点击立即返回</a></p>
            </div>
        </div>
        <%--弹回倒计时/--%>

        <%--app下载块--%>
        <jsp:include page="${ctxInclude}/appblock.jsp"/>
        <%--app下载块/--%>
    </div>
</div>
<%--内容/--%>

<jsp:include page="${ctxInclude}/foot.jsp"/>
<script>
    (function($) {
        $(function() {
            var seconds = 3;
            $("#seconds").text(seconds);

            var t = setInterval(function() {

                --seconds;
                $("#seconds").text(seconds);
                if (seconds == 0) {
                    clearInterval(t);
                    location.href="/loginPage";
                }
            }, 1000)
        })
    })(jQuery)
</script>

</body>
</html>
