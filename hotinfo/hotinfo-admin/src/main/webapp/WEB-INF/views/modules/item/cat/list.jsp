<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/includes/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>HotInfo | 商品管理</title>
    <jsp:include page="${ctxInclude}/head.jsp"/>
    <link href="/static/assets/plugins/treeTable/themes/vsStyle/treeTable.min.css" rel="stylesheet">
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
                <div class="alert alert-success alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        ${message}
                </div>
            </c:if>

            <div class="row">
                <div class="col-xs-12">
                    <!-- Horizontal Form -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">高级搜索</h3>
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->
                        <form:form action="/item/cat/list" method="get" modelAttribute="tbItemCat">
                            <div class="form-horizontal">
                                <div class="box-body">
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label">分类名称</label>
                                        <div class="col-sm-3">
                                            <form:input path="name" cssClass="form-control" placeholder="分类名称" />
                                        </div>
                                    </div>
                                </div>
                                <!-- /.box-body -->
                                <div class="box-footer">
                                    <button id="btnDataTableSearch" type="submit" class="btn btn-primary pull-right">搜索</button>
                                </div>
                                <!-- /.box-footer -->
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-primary">
                        <div class="box-header">
                            <h3 class="box-title">商品分类</h3>

                            <ul class="nav nav-pills pull-right">
                                <li><a href="/item/cat/form"><i class="fa fa-fw fa-plus text-primary"></i> 新增</a></li>
                            </ul>
                        </div>
                        <div class="box-body">
                            <div class="table-responsive">
                                <table id="treeTable" class="table table-bordered table-striped table-hover nowrap">
                                    <thead>
                                    <tr>
                                        <th>分类名称</th>
                                        <th>排序</th>
                                        <th>更新时间</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${list}" var="tbItemCat">
                                        <tr id="${tbItemCat.id}" pId="${tbItemCat.parentId}">
                                            <td>${tbItemCat.name}</td>
                                            <td>${tbItemCat.sortOrder}</td>
                                            <td><fmt:formatDate value="${tbItemCat.updated}" pattern="yyyy-MM-dd HH:mm:ss" /> </td>
                                            <td>
                                                <a href='javascript:void(0);' class='btn btn-sm btn-default' onclick='HotInfo.showDetail("/item/cat/detail?id=${tbItemCat.id}")'><i class='fa fa-fw fa-search' title='查看'></i></a>&nbsp;&nbsp;&nbsp;&nbsp;
                                                <a href='/item/cat/form?id=${tbItemCat.id}' class='btn btn-sm btn-info'><i class='fa fa-fw fa-edit' title='编辑'></i></a>&nbsp;&nbsp;&nbsp;&nbsp;
                                                <a href='javascript:void(0);' class='btn btn-sm btn-danger' onclick='HotInfo.showDelete("/item/cat/delete?id=${tbItemCat.id}")'><i class='fa fa-fw fa-trash-o' title='删除'></i></a>&nbsp;&nbsp;&nbsp;&nbsp;
                                                <a href='/item/cat/form?parentId=${tbItemCat.id}&parentName=${tbItemCat.name}' class='btn btn-sm btn-primary'><i class='fa fa-fw fa-plus' title='添加下级目录'></i></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <jsp:include page="${ctxInclude}/footer.jsp"/>
</div>

<jsp:include page="${ctxInclude}/foot.jsp"/>
<script src="/static/assets/plugins/treeTable/jquery.treeTable.min.js"></script>
<script>
    $(function () {
        $("#treeTable").treeTable({
            expandLevel: 2,
            column: 0
        });
    });
</script>
</body>
</html>