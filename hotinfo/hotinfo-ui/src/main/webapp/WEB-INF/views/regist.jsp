<%--
  Created by IntelliJ IDEA.
  User: carrot
  Date: 2018/9/25
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/includes/user/taglib.jsp" %>
<html>
<head>
    <title>注册账号 - 新民网通行证</title>
    <jsp:include page="${ctxInclude}/head.jsp"/>
</head>
<body>
<%--顶部--%>
<div class="TopSideBg tsbg" style="border-bottom:1px solid #c2c2c2;">
    <div class="top_wrap">
        <a href="/index" target="_blank" class="top_wrap_link">
            <img src="/static/assets/imgs/logo.png" alt="" class="us_logo">
        </a>
        <h2 id="us_name">账号注册</h2>
        <div class="us_reg absimg">
            <span>已有账号？</span>
            <a href="/loginPage">立即登录</a>
        </div>
    </div>
</div>
<%--顶部/--%>

<%--内容--%>
<div class="PageCoreBg">
    <div class="PageCore us_new_wrap">
        <%--注册块--%>
        <div class="us_all_wrap">
            <div class="us_input_wrap">
                <form action="regist" id="u_login" name="u_login" method="post">

                    <%--注册表单输入部分--%>
                    <div id="us_input">
                        <input type="text" id="phone" placeholder="手机号" maxlength="11" name="phone">
                        <label for="" class="us_input_msg">${msg}</label>
                        <div class="code_box">
                            <input type="text" id="code" placeholder="输入验证码" style="width: 300px;" maxlength="4" name="code">
                            <a href="javascript:void(0);" style="width: 125px;"><img id="verification" src="/verification" style="cursor: pointer;" title="看不清？换一张"/></a>
                            <label for="" class="us_input_msg">${message}</label>
                        </div>
                        <input type="password" id="password" name="password" placeholder="输入新密码（6-18位英文字母或数字）" maxlength="18">
                        <input type="password" id="repassword" name="repassword" placeholder="再次输入密码（6-18位英文字母或数字）" maxlength="18">
                    </div>
                    <%--注册表单输入部分/--%>

                    <%--提交按钮及其他--%>
                    <div class="us_other_login">
                        <input type="checkbox" id="u_read"><label for="u_read">我已阅读并同意</label>
                        <a href="/static/assets/html/instructions.html" target="_blank" class="us_xieyi">《新民网服务使用协议》</a>
                        <p id="us_regsiter" class="us_btn">完成</p>
                    </div>
                    <%--提交按钮及其他/--%>

                </form>
            </div>
        </div>
        <%--注册块/--%>

        <%--app下载块--%>
        <jsp:include page="${ctxInclude}/appblock.jsp"/>
        <%--app下载块/--%>

        <%--提示框--%>
            <div class="tk-box msg-box" style="display: none;">
                <div class="tk-wrapper-box">
                    <div class="tk-wrapper">
                        <h1><a href="/static/assets/html/instructions.html" target="_blank">请阅读新民网使用协议</a></h1>
                        <div class="btn-box">
                            <span class="us_tk_oks">确认</span>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        <%--提示框/--%>
    </div>
</div>
<%--内容/--%>

<jsp:include page="${ctxInclude}/foot.jsp"/>
<script src="/static/assets/js/json2.min.js"></script>

<script>
    (function () {
        var phones = /^1[\d]{10}$/

        $(function () {
            // 刷新验证码
            $("#verification").bind("click", function () {
                $(this).hide().attr('src', '/verification?random=' + Math.random()).fadeIn();
            });
        });
        function validate() {
            var passwords = /^[a-zA-Z0-9]{6,18}$/;
            var phone = $("#phone").val(),
                password = $("#password").val(),
                repassword = $("#repassword").val(),
                code = $("#code").val();
            if (!phones.test(phone)) {
                util.errnotice('#phone', '请输入正确的手机号码');
            } else if (!code) {
                util.errnotice('#code', '请输入验证码');
            } else if (!passwords.test(password)) {
                util.errnotice('#password', '至少6位英文字母与数字组合');
            } else if (repassword != password) {
                util.errnotice('#repassword', '密码不相同');
            } else {
                if ($('#u_read').is(':checked')) {
                    $("form").submit();
                } else {
                    $(".tk-box").show();
                }
            }
        }

        $("#us_regsiter").click(function () {
            console.log("hi");
            validate();
        });
        $(".us_tk_oks").click(function () {
            $(".tk-box").hide();
        });
    })();
</script>

</body>
</html>
