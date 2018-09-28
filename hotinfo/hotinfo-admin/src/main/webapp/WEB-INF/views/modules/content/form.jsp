<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/WEB-INF/includes/taglib.jsp" %>
<!DOCTYPE html>
<html>
<title>AdminLTE | 尾部内容展示</title>
<jsp:include page="${ctxInclude}/head.jsp"/>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <jsp:include page="${ctxInclude}/header.jsp"/>
    <jsp:include page="${ctxInclude}/aside.jsp"/>
    <link href="https://cdn.bootcss.com/zTree.v3/3.5.33/css/metroStyle/metroStyle.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/dropzone/5.4.0/basic.css" rel="stylesheet">
    <link href=../../../../static/assets/plugins/dropzone/dropzone.css rel="stylesheet">
    <div class="content-wrapper">
        <!-- TbContent Header (Page header) -->
        <section class="content-header">
            <h1>
                尾部内容信息
                <small>预览</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/main"><i class="fa fa-dashboard"></i>主页</a></li>
                    <li><a href="/content/show"><i class="fa fa-dashboard"></i>尾部内容展示</a></li>
                <li class="active">编辑页面</li>
            </ol>
        </section>
        <!-- Main TbContent -->
        <section class="content">
            <div class="row">
                <!-- left column -->
                <div class="col-md-12">
                    <!-- general form elements -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">${content.id==0 ? "添加":"编辑"}</h3>
                        </div>
                        <form:form id="inputForm" class="form-horizontal" action="/content/${content.id==0 ? 'insert':'update'}" mothod="post"
                                   modelAttribute="content">

                                <form:hidden path="id"/>

                            <!-- form start -->
                            <div class="box-body">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">所属类别</label>
                                    <div class="col-sm-9">
                                        <form:hidden id="parentId" path="categoryId" class="required"/>
                                        <input id="parentTitle" type="text" class="form-control required"
                                               placeholder="请选择" readonly="true"
                                               value="${content.category.title}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">标题</label>
                                    <div class="col-sm-9">
                                        <form:input path="title" class="form-control required "
                                                    placeholder="标题"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">跳转地址</label>
                                    <div class="col-sm-9">
                                        <form:input path="url" class="form-control required "
                                                    placeholder="跳转地址"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">附图</label>
                                    <div class="col-sm-9">
                                        <div id="drop" class="dropzone">
                                            <div class="dz-message needsclick">
                                                拖拽图片到这里上传<br>
                                                <span class="note needsclick">只能上传 .jsp  .png等图片格式的文件</span>
                                            </div>
                                        </div>
                                        <form:input path="pic" class="form-control required "
                                                    placeholder="附图地址"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">简约描述</label>
                                    <div class="col-sm-9">
                                        <form:input path="descr" class="form-control required "
                                                    placeholder="简约描述"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">小分类</label>
                                    <div class="col-sm-9">
                                        <form:input path="tag" class="form-control required "
                                                    placeholder="小分类"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">分等</label>
                                    <div class="col-sm-9">
                                        <form:input path="classify" class="form-control required "
                                                    placeholder="分等"/>
                                    </div>
                                </div>

                               <%-- <div class="form-group">
                                    <label class="col-sm-2 control-label">内容详情</label>
                                    <div class="col-sm-9">
                                        <!-- 加载编辑器的容器 -->
                                        <div id="myUeditor"></div>
                                        <form:input path="content" class="form-control required "
                                                    placeholder="内容详情"/>
                                    </div>
                                </div>--%>
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
                                            class="btn btn-primary pull-right">${content.id == 0  ? "添加":"修改"}</button>
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
<script src="../../../../static/assets/plugins/dropzone/dropzone.js"></script>
</body>
<script src="/static/app/hotInfo.js"></script>
<%--富文本框--%>
<!-- 配置文件 -->
<script type="text/javascript" src="../../../../static/assets/plugins/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="../../../../static/assets/plugins/ueditor/ueditor.all.js"></script>
<script src="../../../../static/assets/plugins/ueditor/ueditor.parse.js"></script>

<script>
    $(function () {
        HotInfo.initzTree("/content/category/treeData","parentId");
        HotInfo.initMyDropzone("drop","pic");
        /*HotInfo.initUeditor("myUeditor","content");*/
    })
</script>

</html>
