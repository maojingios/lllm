<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/includes/taglib.jsp" %>
<!DOCTYPE html>
<html>
<title>AdminLTE | 分类信息管理</title>
<jsp:include page="${ctxInclude}/head.jsp"/>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <link rel="stylesheet" href="../../../../../static/assets/plugins/iCheck/all.css">
    <jsp:include page="${ctxInclude}/header.jsp"/>
    <jsp:include page="${ctxInclude}/aside.jsp"/>
    <link href="/static/assets/plugins/treeTable/themes/vsStyle/treeTable.min.css" rel="stylesheet">
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                管理分类
                <small>预览</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/main"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li class="active">展示分类页面</li>
            </ol>
        </section>
        <!-- Main TbContent -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-primary">
                        <div class="box-header">
                            <c:if test="${message!=null}">
                                <div class="alert alert-success alert-dismissible text-center">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×
                                    </button>
                                        ${message}
                                </div>
                            </c:if>
                            <h3 class="box-title">分类列表</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body ">
                            <div class="table-responsive">
                                <label class="col-sm-1 control-label text-right">标题</label>
                                <div class="col-sm-2">
                                    <input id="title" type="text" class="form-control" placeholder="分类名称">
                                </div>
                                    <div class="box-tools col-sm-11">
                                        <button id="btnDataTableReset" type="button" class="btn btn-default pull-right">重置</button>
                                        <button id="btnDataTableSearch" type="button" class="btn btn-primary pull-right">搜索</button>
                                    </div>
                                <table id="treeTable" class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>标题</th>
                                        <th>排序</th>
                                        <th>更新时间</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${list}" var="category">
                                        <tr id="${category.id}" pId="${category.parentId}">
                                            <td>${category.title}</td>
                                            <td>${category.sortOrder}</td>
                                            <td><fmt:formatDate value="${category.updated}"
                                                                pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                            <td>
                                                <a href='/content/category/form?id=${category.id}'
                                                   class='btn btn-sm btn-info'><i class='fa fa-fw fa-edit'></i>编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                                <a href='javascript:void(0);' class='btn btn-sm btn-danger'
                                                   onclick='HotInfo.del(${category.id})'><i
                                                        class='fa fa-fw fa-trash-o'></i>删除</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                                <a href='/content/category/form?parentId=${category.id}&parentTitle=${category.title}'
                                                   class='btn btn-sm btn-primary'><i class='fa fa-fw fa-plus'
                                                                                     title='添加下级目录'></i>添加下级目录</a>
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
    <!-- /.TbContent-wrapper -->
    <jsp:include page="${ctxInclude}/footer.jsp"/>
</div>
<jsp:include page="${ctxInclude}/foot.jsp"/>
<script src="/static/assets/plugins/treeTable/jquery.treeTable.min.js"></script>
<script src="/static/app/hotInfo.js"></script>

<script>
    $(function () {
        $("#treeTable").treeTable({
            expandLevel: 2,
            column: 0
        });

        $("#confirm").bind("click",function(){
            window.location.href = "/content/category/delete?id="+$("#inputDel").val();
            $("#modal-default").modal("hide");
        })
    });
</script>
</body>
</html>
