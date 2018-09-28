<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="MainNavBg">
    <div class="MainNav" id="MainNav">
        <a class="n" href="/" target="_blank">首页</a>
        <a class="n" href="/" target="_blank">人文</a>
        <a class="n" href="/" target="_blank">社会</a>
        <a class="n" href="/" target="_blank">热点</a>
        <a class="n" href="/" target="_blank">民生</a>
        <a class="n" href="/" target="_blank">时政</a>
        <a class="n" href="/" target="_blank">人文</a>
        <a class="n" href="/" target="_blank">社会</a>
        <a class="n" href="/" target="_blank">热点</a>
        <a class="n" href="/" target="_blank">民生</a>
        <a class="n" href="/" target="_blank">时政</a>
        <a class="n" href="/" target="_blank">人文</a>
        <a class="n" href="/" target="_blank">社会</a>
        <a class="n" href="/" target="_blank">热点</a>
        <a class="n" href="/" target="_blank">民生</a>
        <a class="n" href="/" target="_blank">时政</a>
        <a class="n" href="/" target="_blank">人文</a>
        <c:forEach items="${navigations}" var="navigation" >
            <a class="n" href="${navigation.url}" target="_blank" data-subid="${navigation.dataSubId}">${navigation.name}</a>
        </c:forEach>

		<img class="n icon" src="/static/assets/imgs/nav_icon.jpg" data-subid="nav_sub">

    </div>
</div>