<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="TopSideBg" style="border-bottom:1px solid #c2c2c2;">
    <div class="top_wrap">
        <a href="/index" target="_blank" class="top_wrap_link">
            <img src="/static/assets/imgs/logo.png" alt="" class="us_logo">
        </a>
        <span id="us_clock"></span>
        <div class="us_login absimg">
            <div>
                <img src="static/assets/imgs/header.png" alt="">
                <span id="us_uname">${user.username}</span>
                <a href="/index" target="_blank">首页</a>
                <a href="/loginOut">退出</a>
            </div>
        </div>
    </div>
</div>
