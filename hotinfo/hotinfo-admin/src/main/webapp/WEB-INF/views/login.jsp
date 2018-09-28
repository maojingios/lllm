<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE | Log in</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="../../static/assets/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../static/assets/bower_components/font-awesome/css/font-awesome.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="../../static/assets/bower_components/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../../static/assets/dist/css/AdminLTE.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="../../static/assets/plugins/iCheck/square/blue.css">
   <%-- <link rel="stylesheet" href="https://fonts.lug.ustc.edu.cn/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">--%>
</head>
<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href=""><b>登陆页面</b></a>
    </div>
    <div class="login-box-body">
        <p class="login-box-msg">请输入账号和密码</p>
        <form action="/login" method="post">
            <div class="form-group has-feedback">
                <input type="text" class="form-control" placeholder="用户名" value="${admin.userName}" name="userName" id="userName">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" placeholder="密码" name="passWord" id="passWord">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <c:if test="${errorInfo!=null}">
                <div class="alert alert-danger alert-dismissible text-center">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    ${errorInfo}
                </div>
            </c:if>
            <div class="row">
                <div class="col-xs-8">
                    <div class="checkbox icheck" >
                        <label>
                            <input type="checkbox" name="isRemember" id="isRemember" ${admin==null?"":"checked"}>  记住账号
                        </label>
                    </div>
                    <div class="checkbox icheck" >
                        <label>
                            <input type="checkbox" name="autoLogin" id="autoLogin">  自动登陆
                        </label>
                    </div>
                </div>
                <div class="col-xs-4">
                    <button type="submit" class="btn btn-primary btn-block btn-flat">登陆</button>
                </div>
            </div>
        </form>
        <a href="#">忘记密码</a>&nbsp
    </div>
</div>
<!-- jQuery 3 -->
<script src="../../static/assets/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="../../static/assets/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="../../static/assets/plugins/iCheck/icheck.min.js"></script>
<script>
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%'
        });
        $('#autoLogin').on('ifChanged', function (event) {
            if (event.target.checked) {
                /*勾中自动登录同时勾中记住账号*/
                $('#isRemember').iCheck('check');
            }
        })
        $('#isRemember').on('ifUnchecked', function () {
            /*取消记住账号同时取消自动登陆*/
            $('#autoLogin').iCheck('uncheck')
        })
    });
</script>
</body>
</html>