<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="TopSide">
    <div class="date" id="weather-date"><fmt:formatDate value="${now}" pattern="yyyy年MM月dd日"></fmt:formatDate>&nbsp;&nbsp;</div>
    <a href="#" title="新民网" target="_blank" style="display:block;float:left;width:207px;height:70px;margin:15px 0 0 320px;background:none"></a>
    <div class="product">
        <a href="https://weibo.com/xinmincn" target="_blank" class="icon sina ch_icon" data-ch="sina_add">新浪</a>
        <!-- 判断是否登录 -->
        <!--  已登录 -->
        <c:if test="">

        </c:if>
        <!--  未登录 -->
        <c:if test="">
            <span class="icon password ch_icon" data-ch="password_add"><a href="/loginPage" target="_blank">登录</a> | <a href="/registPage" target="_blank">注册</a></span>
        </c:if>
        <!-- 判断是否登录/ -->
    </div>
</div>