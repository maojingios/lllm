<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/includes/user/taglib.jsp"%>
<html>
<head>
    <title>账号设置 - 新民网通行证</title>
    <jsp:include page="${ctxInclude}/head.jsp"/>
</head>
<body class="set us_new_box">
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
                        <span>用户中心</span>&gt;<span>账号设置</span>
                    </div>
                    <div id="us_set_box">
                        <div class="form1">
                            <div class="us_old_wrap">
                                <span>昵称</span>
                                <span class="us_old_name">${user.username}</span>
                                <span class="us_set_update">修改</span>
                            </div>
                            <div class="form1_box form_box" style="display:none;">
                                <form action="updateUsername" id="form_name" name="u_set" method="post">
                                    <div class="us_set_name">
                                        <div class="us_update_wrap1">
                                            <span>新昵称</span>
                                            <input type="text" id="name" name="set_name" placeholder="输入新昵称" maxlength="18">
                                        </div>
                                    </div>
                                </form>
                                <div class="us_set_btn us_set_btn2">
                                    <p class="us_set_submit1">提交</p>
                                    <p class="us_set_cannel">取消</p>
                                </div>
                            </div>
                        </div>
                        <div class="form2">
                            <div class="us_old_wrap">
                                <span>密码</span>
                                <span style="padding-left:35px;">互联网账号存在被盗风险，建议您定期更改密码以保护账户安全。</span>
                                <span class="us_set_update">修改</span>
                            </div>
                            <div class="form2_box form_box" style="display:none;">
                                <form action="/updatePassword" id="form" name="form" method="post">
                                    <div class="us_set_update_box">
                                        <div class="us_update_wrap2">
                                            <input type="text" id="phone" name="phone" placeholder="手机号" maxlength="11" value="${user.phone}" readonly="readonly">
                                            <div class="code_box">
                                                <input type="text" id="code" name="code" style="width:240px;" placeholder="验证码">
                                                <a href="javascript:void(0);" style="width: 125px;"><img id="verification" src="/verification" style="cursor: pointer;" title="看不清？换一张"/></a>
                                                <label for="" class="us_input_msg"></label>
                                            </div>
                                            <input type="password" id="password" name="password" placeholder="输入密码（6-18位英文字母或数字）" maxlength="18">
                                            <input type="password" id="repassword" name="repassword" placeholder="确认密码" maxlength="18">
                                        </div>
                                    </div>
                                </form>
                                <div class="us_set_btn">
                                    <p class="us_set_submit2">提交</p>
                                    <p class="us_set_cannel">取消</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="us_set_bind">
                        <p class="us_bind">账号绑定</p>
                        <ul id="us_bind_list">
                            <!-- <li>
                              <div class="us_bind_img us_bind_qq"></div>
                              <p>QQ</p>
                              <span class="us_bind_num"></span>
                              <span class="us_bind_stat">已绑定</span>
                              <a href="#">解绑</a>
                            </li>
                            <li>
                              <div class="us_bind_img  us_bind_wx"></div>
                              <p>微信</p>
                              <span class="us_bind_num"></span>
                              <span class="us_bind_stat">已绑定</span>
                              <a href="#">解绑</a>
                            </li>
                            <li>
                              <div class="us_bind_img  us_bind_wb"></div>
                              <p>微博</p>
                              <span class="us_bind_num"></span>
                              <span class="us_bind_stat">未绑定</span>
                              <a href="#">绑定</a>
                            </li> -->
                            <li>
                                <div class="us_bind_img  us_bind_phone"></div>
                                <p>手机号</p>
                                <span id="us_bind_qqnum" class="us_bind_num">${user.phone}</span>
                                <span class="us_bind_stat">已绑定</span>
                                <a href="/ubind">更换绑定</a>
                            </li>
                        </ul>
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
        var click = true;
        function validate_name(){
            var names = /^[a-zA-Z0-9\u4e00-\u9fa5]+$/;
            var name = $("#name").val();
            if(!name){
                util.errnotice('#name','请输入新昵称');
            }else if(!names.test(name)){
                util.errnotice('#name','新昵称中文、字母或数字');
            }else{
                $("#form_name").submit();
            }
        }

        $(".us_set_submit1").click(function(){
            validate_name();
        });

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
                $("#form").submit();
            }
        }
        $(".us_set_submit2").click(function(){
            validate();
        });

        $(".us_set_update").click(function(){
            $(this).parent().next().slideDown();
        });

        $(".us_set_cannel").click(function(){
            $(this).parent().parent().slideUp();
        });
    })();
</script>
</body>
</html>
