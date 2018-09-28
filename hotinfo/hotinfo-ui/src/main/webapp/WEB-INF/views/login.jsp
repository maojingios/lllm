<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/includes/user/taglib.jsp" %>
<html>
<head>
    <title>欢迎登录-新民网通行证</title>
    <jsp:include page="${ctxInclude}/head.jsp"/>
</head>

<body>
<%--顶部--%>
<div class="TopSideBg tsbg" style="border-bottom:1px solid #c2c2c2;">
    <div class="top_wrap">
        <a href="/index" target="_blank" class="top_wrap_link">
            <img src="/static/assets/imgs/logo.png" alt="" class="us_logo"/>
        </a>
        <h2 id="us_name">欢迎登录</h2>
        <div class="us_reg absimg">
            <span>没有账号？</span>
            <a href="/registPage">立即注册</a>
        </div>
    </div>
</div>
<%--顶部/--%>

<%--内容--%>
<div class="PageCoreBg">
    <div class="PageCore us_new_wrap">

        <%--登录块--%>
        <div class="us_all_wrap">
            <div class="us_input_wrap">

                <%--账号密码表单--%>
                <form action="login" id="u_login" name="u_login" method="post">
                    <div id="us_input">
                        <input type="text" id="phone" placeholder="手机号" maxlength="11" name="uname">
                        <input type="hidden" name="authcode" value="c46269d59335046b890016b16424dc9477da3628">
                        <input type="password" id="password" placeholder="密码" maxlength="18" name="passwd">
                    </div>
                    <input type="checkbox" id="u_remeber" onclick="fn();"><label for="u_remeber">记住密码</label>
                    <a href="/findPassword" class="us_forget">忘记密码</a>
                </form>
                <%--账号密码表单/--%>

                <%--登录按钮及其他--%>
                <div class="us_other_login">
                    <p id="us_login" class="us_btn">登录新民</p>
                    <a href="/appeal">账户异常请点这里</a>
                    <span class="us_three_box absimg">第三方帐号登录</span>
                    <img src="/static/assets/imgs/three.png" alt="" class="us_three">
                    <div class="us_o_link_box">
                        <div class="us_o_link us_qq"><a href="https://reg.xinmin.cn/index.php?app=uc&amp;controller=QQConnect"></a></div>
                    </div>
                </div>
                <%--登录按钮及其他/--%>

            </div>
        </div>
        <%--登录块/--%>

        <%--APP下载块--%>
        <jsp:include page="${ctxInclude}/appblock.jsp"/>
        <%--APP下载块/--%>
    </div>
</div>
<%--内容/--%>
<jsp:include page="${ctxInclude}/foot.jsp"/>
<script>
    (function(){
        function validate(){
            var phone = $("#phone").val(),
                password = $("#password").val();
            if(!phone){
                util.errnotice('#phone','请输入电话号码');
            }else if(!password){
                util.errnotice('#password','请输入密码');
            }else{
                $("form").submit();
            }
        }
        document.onkeydown=function(event){
            var e = event || window.event || arguments.callee.caller.arguments[0];
            if(e && e.keyCode==13)
            {
                validate();
            }
        }
        $("#us_login").click(function(){
            validate();
        });
        /*保存账号密码*/
        var phone = document.getElementById("phone"),
            pwd = document.getElementById("password"),
            check = document.getElementById("u_remeber"),
            loPhone = localStorage.getItem("phone") || "";
        loPwd = localStorage.getItem("pwd") || "";
        phone.value = loPhone;
        pwd.value = loPwd;
        if(loPhone !== "" && loPwd !== ""){
            check.setAttribute("checked","");
        }
        $('.us_qq').bind('click',function(){
            location.href="/index.php?app=uc&controller=QQConnect";
        })
        function fn(){
            if(check.checked){
                localStorage.setItem("phone",phone.value);
                localStorage.setItem("pwd",pwd.value);
            }else{
                localStorage.setItem("phone","");
                localStorage.setItem("pwd","");
            }
        }
    })();
</script>
</body>

</html>
