<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/WEB-INF/includes/taglib.jsp" %>
<!DOCTYPE html>
<html>
<title>AdminLTE | 信息展示</title>
<jsp:include page="${ctxInclude}/head.jsp"/>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <jsp:include page="${ctxInclude}/header.jsp"/>
    <jsp:include page="${ctxInclude}/aside.jsp"/>
    <link href=../../../../static/assets/plugins/dropzone/dropzone.css rel="stylesheet">
    <link href="https://cdn.bootcss.com/dropzone/5.4.0/basic.css" rel="stylesheet">
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                管理员信息展示
                <small>预览</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/main"><i class="fa fa-dashboard"></i>主页</a></li>
                <li><a href="/admin/goBack"><i class="fa fa-dashboard"></i>个人展示</a></li>
                <li class="active">提交页面</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">编辑信息</h3>
                        </div>
                        <form:form id="inputAdminForm" class="form-horizontal" action="/admin/confirmUpdateInfo"
                                   mothod="post"
                                   modelAttribute="hiUser">
                            <form:hidden path="id"/>
                            <div class="box-body">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">用户名</label>
                                    <div class="col-sm-9">
                                        <form:input path="userName" class="form-control"
                                                    placeholder="用户名"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">个人头像</label>
                                    <div class="col-sm-9">
                                        <div id="drop" class="dropzone">
                                            <div class="dz-message needsclick">
                                                拖拽图片到这里上传<br>
                                                <span class="note needsclick">只能上传 .jsp  .png等图片格式的文件</span>
                                            </div>
                                        </div>
                                        <form:input path="headUrl" class="form-control required "
                                                    placeholder="个人头像"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">原密码</label>
                                    <div class="col-sm-9">
                                        <form:password path="passWord" class="form-control"
                                                       placeholder="原密码"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">新密码</label>
                                    <div class="col-sm-9">
                                        <form:password path="NewPWD" class="form-control"
                                                       placeholder="新密码"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">确认密码</label>
                                    <div class="col-sm-9">
                                        <form:password path="verificationPWD" class="form-control"
                                                       placeholder="确认密码"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">电话</label>
                                    <div class="col-sm-9">
                                        <form:input path="phone" class="form-control"
                                                    placeholder="电话"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">邮箱</label>
                                    <div class="col-sm-9">
                                        <form:input path="email" class="form-control "
                                                    placeholder="邮箱"/>
                                    </div>
                                </div>
                                    <%--错误提示--%>
                                <c:if test="${errorInfo!=null}">
                                    <div class="alert alert-danger alert-dismissible text-center">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×
                                        </button>
                                            ${errorInfo}
                                    </div>
                                </c:if>
                                <div class="box-footer">
                                    <button type="submit" class="btn btn-primary pull-right">确认修改</button>
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <jsp:include page="${ctxInclude}/footer.jsp"/>
</div>
<jsp:include page="${ctxInclude}/foot.jsp"/>
<script src="../../../../static/assets/plugins/dropzone/dropzone.js"></script>
<script src="/static/app/hotInfo.js"></script>
</body>
<script>
    $(function () {
        HotInfo.initMyDropzone("drop", "headUrl");
    })
</script>
</html>
