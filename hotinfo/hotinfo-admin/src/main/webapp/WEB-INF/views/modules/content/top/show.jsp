<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/includes/taglib.jsp" %>
<!DOCTYPE html>
<html>
<title>AdminLTE | 头部内容信息管理</title>
<jsp:include page="${ctxInclude}/head.jsp"/>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <link rel="stylesheet" href="/static/assets/plugins/iCheck/all.css">
    <link rel="stylesheet" href="/static/assets/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
    <jsp:include page="${ctxInclude}/header.jsp"/>
    <jsp:include page="${ctxInclude}/aside.jsp"/>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                头部管理内容
                <small>预览</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/main"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li class="active">展示头部内容页面</li>
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
                            <h3 class="box-title">头部内容列表</h3>
                        </div>
                        <div class="box-body ">
                            <div class="table-responsive">
                                <label class="col-sm-1 control-label text-right">标题</label>
                                <div class="col-sm-2">
                                    <input id="title" type="text" class="form-control" placeholder="标题">
                                </div>
                                    <div class="box-tools col-sm-11">
                                        <button id="btnDataTableReset" type="button" class="btn btn-default pull-right">重置</button>
                                        <button id="btnDataTableSearch" type="button" class="btn btn-primary pull-right">搜索</button>
                                    </div>
                                <table id="dataTable" class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th><input type="checkbox" class="minimal chk_master "></th>
                                        <th>标题</th>
                                        <th>小分类</th>
                                        <th>最新更新时间</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                </table>
                                <button id="batchDelete" type="button" class="btn btn-danger">批量删除</button>
                                <a href="/content/top/form" type="button" class="btn btn-default">添加内容</a>
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
<script src="/static/assets/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="/static/assets/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="/static/app/datetime.js"></script>
<script src="/static/app/hotInfo.js"></script>

<script>
    $(function () {
        $("#batchDelete").click(function(){
            HotInfo.batchDelete();
        });

        $("#confirm").bind("click",function(){
            window.location.href = "/content/top/delete?id="+$("#inputDel").val();
            $("#modal-default").modal("hide");
        })

        $("#confirmDel").bind("click",function(){
            HotInfo.confirmDel("/content/top/batchDelete");
        })
        var dataTable = HotInfo.initDataTables("/content/top/data",[
            {
                data: function (row, type, set, meta) {
                    return "<input id='" + row.id + "' type='checkbox' class='minimal' />";
                }
            },
            { data: 'title' },
            { data: 'tag' },
            {
                data: function (row, type, set, meta) {
                    return DateTime.format(new Date(row.updated),"yyyy-MM-dd hh:mm:ss");
                }
            },
            {
                data: function (row, type, set, meta) {
                    return "<a href='/content/top/view?id=" + row.id + "' class='btn btn-sm btn-default'><i class='fa fa-fw fa-search'></i>查看</a>&nbsp;&nbsp;&nbsp;&nbsp;" +
                        "<a href='/content/top/form?id=" + row.id + "' class='btn btn-sm btn-info'><i class='fa fa-fw fa-edit'></i>编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;" +
                        "<a  href='javascript:void(0);' id='" + row.id + "' class='btn btn-sm btn-danger' onclick='HotInfo.del(" + row.id + ")'><i class='fa fa-fw fa-trash-o'></i>删除</a>";
                }
            }
        ]);
        // 绑定搜索事件
        $("#btnDataTableSearch").on("click", function () {
            // 动态传参数
            dataTable.settings()[0].ajax.data = {
                "title": $("#title").val()
            };
            dataTable.ajax.reload();
        });
    })
</script>
</body>
</html>
