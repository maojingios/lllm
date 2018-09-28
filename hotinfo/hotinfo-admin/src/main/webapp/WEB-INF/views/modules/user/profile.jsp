<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/WEB-INF/includes/taglib.jsp" %>
<!DOCTYPE html>
<html>
<title>hiUserLTE | 个人信息</title>
<jsp:include page="${ctxInclude}/head.jsp"/>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <jsp:include page="${ctxInclude}/header.jsp"/>
    <jsp:include page="${ctxInclude}/aside.jsp"/>
    <div class="content-wrapper">
        <section class="content-header text-center">
            <h1>
                用户信息
            </h1>
            <ol class="breadcrumb">
                <li><a href="/main"><i class="fa fa-dashboard"></i>主页</a></li>
                <li><a href="/user/show"><i class="fa fa-dashboard"></i>用户列表</a></li>
                <li class="active">用户信息页面</li>
            </ol>
        </section>
        <!-- Main TbContent -->
        <section class="content">
            <div class="control-label">
                <div class="col-md-12">
                    <!-- Profile Image -->
                    <div class="box box-primary">
                        <div class="box-body box-profile">
                            <img class="profile-user-img img-responsive img-circle"
                                 src=${hiUser.headUrl} alt="User profile picture">
                            <h3 class="profile-username text-center">${hiUser.userName}</h3>
                            <p class="text-muted text-center">普通用户</p>
                            <ul class="list-group list-group-unbordered">
                                <li class="list-group-item">
                                    <b>用户名</b> <a class="pull-right">${hiUser.userName}</a>
                                </li>
                                <li class="list-group-item">
                                    <b>密码</b><a class="pull-right">******</a>
                                </li>
                                <li class="list-group-item">
                                    <b>电话</b> <a class="pull-right">${hiUser.phone}</a>
                                </li>
                                <li class="list-group-item">
                                    <b>邮箱</b> <a class="pull-right">${hiUser.email}</a>
                                </li>
                                <li class="list-group-item">
                                    <b>最新更新日期</b> <a class="pull-right"><fmt:formatDate value="${hiUser.updated}"
                                                                                         pattern="yyyy-MM-dd HH:mm:ss"/></a>
                                </li>
                            </ul>
                            <a href="/user/form?id=${hiUser.id}" class="btn btn-primary pull-right"><b>修改</b></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <jsp:include page="${ctxInclude}/footer.jsp"/>
</div>
<jsp:include page="${ctxInclude}/foot.jsp"/>
</body>
</html>
