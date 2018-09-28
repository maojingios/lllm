<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/includes/user/taglib.jsp"%>
<html>
<head>
    <title>找回密码 - 新民网通行证</title>
    <jsp:include page="${ctxInclude}/head.jsp"/>
</head>
<body>
<%--顶部--%>
<div class="TopSideBg tsbg" style="border-bottom:1px solid #c2c2c2;">
    <div class="top_wrap">
        <a href="/index" target="_blank" class="top_wrap_link">
            <img src="/static/assets/imgs/logo.png" alt="" class="us_logo">
        </a>
        <h2 id="us_name">找回密码</h2>
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
        <%--表单输入块--%>
        <div class="us_all_wrap">
            <div class="us_input_wrap">
                <form action="/password" id="u_login" name="u_login" method="post">
                    <input type="hidden" name="authcode" value="2c497b5ff272be1414f8207778d8ca68c54874ae">
                    <div id="us_input">
                        <input type="text" id="phone" name="phone" placeholder="手机号" maxlength="11">
                        <div class="code_box">
                            <input type="text" id="code" placeholder="输入验证码" style="width: 300px;" maxlength="4" name="code">
                            <a href="javascript:void(0);" style="width: 125px;"><img id="verification" src="/verification" style="cursor: pointer;" title="看不清？换一张"/></a>
                            <label for="" class="us_input_msg">${message}</label>
                        </div>
                        <input type="password" id="password" name="password" placeholder="输入密码（6-18位英文字母或数字）" maxlength="18">
                        <input type="password" id="repassword" name="repassword" placeholder="确认密码（6-18位英文字母或数字）" maxlength="18">
                    </div>
                    <div class="us_other_login">
                        <p id="us_reset" class="us_btn">提交</p>
                    </div>
                </form>
            </div>
        </div>
        <%--表单输入块/--%>

        <%--app下载块--%>
        <jsp:include page="${ctxInclude}/appblock.jsp"/>
        <%--app下载块/--%>

    </div>
</div>
<%--内容/--%>

<jsp:include page="${ctxInclude}/foot.jsp"/>

<script>
    (function(){
        $(function () {
            // 刷新验证码
            $("#verification").bind("click", function () {
                $(this).hide().attr('src', '/verification?random=' + Math.random()).fadeIn();
            });
        });

        var phones = /^1[\d]{10}$/

        function validate(){
            var passwords = /^[a-zA-Z0-9]{6,18}$/;
            var phone = $("#phone").val(),
                password = $("#password").val(),
                repassword = $("#repassword").val(),
                code = $("#code").val();
            if(!phone){
                util.errnotice('#phone','请输入电话号码');
            }else if(isNaN(phone)){
                util.errnotice('#phone','电话号码必须为数字');
            }else if(!code){
                util.errnotice('#code','请输入验证码');
            }else if(!passwords.test(password)){
                util.errnotice('#password','需英文字母与数字组合');
            }else if(repassword != password){
                util.errnotice('#repassword','密码不相同');
            }else{
                $("form").submit();
            }
        }
        $("#us_reset").click(function(){
            validate();
        });
    })();
</script>

</body>
</html>
