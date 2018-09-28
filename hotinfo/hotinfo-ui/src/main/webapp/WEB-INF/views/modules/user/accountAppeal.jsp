<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/includes/user/taglib.jsp"%>
<html>
<head>
    <title>账号异常申诉 - 新民网通行证</title>
    <jsp:include page="${ctxInclude}/head.jsp"/>
</head>
<body class="appeal us_new_box">
<%--顶部--%>
<jsp:include page="${ctxInclude}/top.jsp"/>
<%--顶部/--%>
<%--内容--%>
<div class="PageCoreBg us_wrap_bg">
    <div class="PageCore">
        <div class="bar_wrap">
            <%--菜单--%>
            <jsp:include page="${ctxInclude}/menu.jsp"/>
            <%--菜单/--%>
            <%--详情--%>
            <div class="us_rightbar">
                <div class="us_right_head">
                    <span>用户中心</span>&gt;<span>账号异常申诉</span>
                </div>
                <form action="/appeal" id="u_warn" name="u_warn" method="post">
                    <div id="us_warning_box">
                        <input type="text" id="phone" placeholder="手机号" maxlength="11" name="phone">
                        <div class="code_box">
                            <input type="text" id="code" placeholder="验证码" style="width:300px;" name="smsCode">
                            <a href="javascript:void(0);" style="width: 125px;"><img id="verification" src="/verification" style="cursor: pointer;" title="看不清？换一张"/></a>
                            <label for="" class="us_input_msg"></label>
                        </div>
                    </div>
                </form>
                <div class="us_warn_wrap">
                    <p id="us_warn_btn" class="us_btn">下一步</p>
                </div>
            </div>
            <%--详情/--%>
        </div>
    </div>
</div>
<%--内容/--%>
<jsp:include page="${ctxInclude}/foot.jsp"/>
<script type="text/javascript">
    (function(){
        $(window).load(function(){
            util.red();
            $.showTime();
        });

        // $(".us_leftbar li a").click(function(){
        //   $(this).addClass('lf_active').parent().siblings('li').find('a').removeClass('lf_active');
        // });

        timer = setInterval($.showTime,5000);

        $(function () {
            // 刷新验证码
            $("#verification").bind("click", function () {
                $(this).hide().attr('src', '/verification?random=' + Math.random()).fadeIn();
            });
        });

        var phones = /^1[\d]{10}$/

        function validate(){
            var phone = $("#phone").val(),
                code = $("#code").val();
            if(!phone){
                util.errnotice('#phone','请输入电话号码');
            }else if(isNaN(phone)){
                util.errnotice('#phone','电话号码必须为数字');
            }else if(!code){
                util.errnotice('#code','请输入验证码');
            }else{
                $("form").submit();
            }
        }
        $("#us_warn_btn").click(function(){
            validate();
        });
    })();
</script>

</body>
</html>
