<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="/WEB-INF/includes/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>HotInfo | 商品管理</title>
    <jsp:include page="${ctxInclude}/head.jsp"/>

    <link href="https://cdn.bootcss.com/zTree.v3/3.5.33/css/metroStyle/metroStyle.min.css" rel="stylesheet">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <jsp:include page="${ctxInclude}/header.jsp"/>
    <jsp:include page="${ctxInclude}/menu.jsp"/>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                商品管理
                <small>商品分类</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/main"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li class="active">商品分类</li>
            </ol>
        </section>

        <section class="content">
            <c:if test="${message != null}">
                <div class="alert alert-danger alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        ${message}
                </div>
            </c:if>

            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">${tbItemCat.id == 0 ? "新增" : "编辑"}分类</h3>
                </div>

                <form:form id="inputForm" class="form-horizontal" action="/item/cat/save" method="post" modelAttribute="tbItemCat">
                    <form:hidden path="id" />

                    <div class="box-body">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">所属分类</label>
                            <div class="col-sm-9">
                                <form:hidden id="parentId" path="parentId" class="required" />
                                <input id="parentName" type="text" class="form-control required" placeholder="请选择" readonly="true" value="${tbItemCat.parentName}" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">分类名称</label>
                            <div class="col-sm-9">
                                <form:input path="name" class="form-control required" placeholder="分类名称" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">排序</label>
                            <div class="col-sm-9">
                                <form:input path="sortOrder" class="form-control digits" placeholder="排序" />
                            </div>
                        </div>
                    </div>

                    <div class="box-footer">
                        <button type="submit" class="btn btn-primary pull-right">提交</button>
                    </div>
                </form:form>
            </div>
        </section>
    </div>

    <jsp:include page="${ctxInclude}/footer.jsp"/>
</div>

<jsp:include page="${ctxInclude}/foot.jsp"/>
<script src="https://cdn.bootcss.com/zTree.v3/3.5.33/js/jquery.ztree.core.min.js"></script>
<script>
    $(function () {
        HotInfo.initTree("/item/cat/treeData");
    });
</script>
</body>
</html>