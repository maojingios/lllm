<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/WEB-INF/includes/taglib.jsp" %>
<!DOCTYPE html>
<html>
<title>AdminLTE | 尾部内容信息</title>
<jsp:include page="${ctxInclude}/head.jsp"/>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <jsp:include page="${ctxInclude}/header.jsp"/>
    <jsp:include page="${ctxInclude}/aside.jsp"/>

    <div class="content-wrapper" style="height: 80%">
        <!-- TbContent Header (Page header) -->
        <section class="content-header text-center">
            <h1>
                尾部内容信息
            </h1>
            <ol class="breadcrumb">
                <li><a href="/main"><i class="fa fa-dashboard"></i>主页</a></li>
                <li><a href="/content/show/"><i class="fa fa-dashboard"></i>尾部内容列表</a></li>
                <li class="active">尾部内容信息页面</li>
            </ol>
        </section>
        <!-- Main TbContent -->
        <section class="content" >
            <div class="control-label">
                <div class="col-md-12">
                    <!-- Profile Image -->
                    <div class="box box-primary">
                        <div class="box-body box-profile">
                            <%--<h3 class="profile-username text-center">${tbContent.username}</h3>--%>
                            <h4 class="text-muted text-center">详情信息</h4>
                            <ul class="list-group list-group-unbordered">
                                <li class="list-group-item">
                                    <b>所属类别</b> <a class="pull-right">${content.category.title}</a>
                                </li>
                                <li class="list-group-item">
                                    <b>标题</b> <a class="pull-right">${content.title}</a>
                                </li>
                                <li class="list-group-item">
                                    <b>跳转地址</b> <a class="pull-right">${content.url}</a>
                                </li>
                                <li class="list-group-item">
                                    <b>附图</b> <a class="pull-right">${content.pic}</a>
                                </li>
                                <li class="list-group-item">
                                    <b>简约描述</b> <a class="pull-right">${content.descr}</a>
                                </li>
                                <li class="list-group-item">
                                    <b>小标题</b> <a class="pull-right">${content.tag}</a>
                                </li>
                                <li class="list-group-item">
                                    <b>分等</b> <a class="pull-right">${content.classify}</a>
                                </li>

                          <%--      <li class="list-group-item">
                                <b>内容详情</b><br/><br/> &lt;%&ndash;<a class="text-input-context-menu">${tbContent.content}</a>&ndash;%&gt;
                                <p>${content.content}</p>
                            </li>--%>
                                <li class="list-group-item">
                                    <b>最新更新时间</b> <a class="pull-right"><fmt:formatDate value="${content.updated}"
                                                                                        pattern="yyyy-MM-dd HH:mm:ss"/></a>
                                </li>
                            </ul>
                            <a href="/content/form?id=${content.id}" class="btn btn-primary pull-right"><b>修改</b></a>
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
