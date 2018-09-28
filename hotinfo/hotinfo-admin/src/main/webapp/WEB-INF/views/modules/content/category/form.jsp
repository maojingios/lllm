<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/WEB-INF/includes/taglib.jsp" %>
<!DOCTYPE html>
<html>
<title>AdminLTE | 分类展示</title>
<jsp:include page="${ctxInclude}/head.jsp"/>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <jsp:include page="${ctxInclude}/header.jsp"/>
    <jsp:include page="${ctxInclude}/aside.jsp"/>
    <link href="https://cdn.bootcss.com/zTree.v3/3.5.33/css/metroStyle/metroStyle.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/dropzone/5.4.0/basic.css" rel="stylesheet">
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                分类信息
                <small>预览</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/main"><i class="fa fa-dashboard"></i>主页</a></li>
                    <li><a href="/content/category/show"><i class="fa fa-dashboard"></i>分类展示</a></li>
                <li class="active">编辑页面</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">${category.id==0 ? "添加":"编辑"}</h3>
                        </div>
                        <form:form id="inputForm" class="form-horizontal" action="/content/category/${category.id==0 ? 'insert':'update'}" mothod="post"
                                   modelAttribute="category">
                                <form:hidden path="id"/>
                            <div class="box-body">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">所属分类</label>
                                    <div class="col-sm-9">
                                        <form:hidden id="parentId" path="parentId" class="required"/>
                                        <input id="parentTitle" type="text" class="form-control"
                                               placeholder="请选择" readonly="true"
                                               value="${category.parentTitle}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">标题</label>
                                    <div class="col-sm-9">
                                        <form:input path="title" class="form-control required" placeholder="标题"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">跳转地址</label>
                                    <div class="col-sm-9">
                                        <form:input path="url" class="form-control required" placeholder="跳转地址"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">排序</label>
                                    <div class="col-sm-9">
                                        <form:input path="sortOrder" class="form-control digits" placeholder="排序"/>
                                    </div>
                                </div>
                            <%--错误提示--%>
                                <c:if test="${message!=null}">
                                    <div class="alert alert-danger alert-dismissible text-center">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×
                                        </button>
                                            ${message}
                                    </div>
                                </c:if>
                                <div class="box-footer">
                                    <button type="submit"
                                            class="btn btn-primary pull-right">${category.id == 0  ? "添加":"修改"}</button>
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
<script src="https://cdn.bootcss.com/zTree.v3/3.5.32/js/jquery.ztree.core.min.js"></script>
<script src="/static/app/hotInfo.js"></script>
</body>
<script>
    $(function () {
        HotInfo.initzTree("/content/category/treeData","parentId");
    })
</script>
</html>
