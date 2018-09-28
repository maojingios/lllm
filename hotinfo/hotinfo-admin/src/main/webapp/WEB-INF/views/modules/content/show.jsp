<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/includes/taglib.jsp" %>
<!DOCTYPE html>
<html>
<title>AdminLTE | 尾部内容信息管理</title>
<jsp:include page="${ctxInclude}/head.jsp"/>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <!-- iCheck for checkboxes and radio inputs -->
    <link rel="stylesheet" href="../../../../static/assets/plugins/iCheck/all.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="../../../../static/assets/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
    <jsp:include page="${ctxInclude}/header.jsp"/>
    <!-- Left side column. contains the logo and sidebar -->
    <jsp:include page="${ctxInclude}/aside.jsp"/>
    <!-- TbContent Wrapper. Contains page TbContent -->
    <div class="content-wrapper">
        <!-- TbContent Header (Page header) -->
        <section class="content-header">
            <h1>
                管理尾部内容
                <small>预览</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/main"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li class="active">展示内容页面</li>
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
                            <h3 class="box-title">尾部内容列表</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body ">
                            <div class="table-responsive">
                                <label class="col-sm-1 control-label text-right">所属类别</label>
                                <div class="col-sm-2">
                                    <input id="categoryTitle" type="text" class="form-control" placeholder="所属类别">
                                </div>
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
                                        <th>所属类别</th>
                                        <th>标题</th>
                                        <th>小分类</th>
                                        <th>最新更新时间</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                </table>
                                <button id="batchDelete" type="button" class="btn btn-danger">批量删除</button>
                                <a href="/content/form" type="button" class="btn btn-default">添加内容</a>
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
<script src="../../../../static/assets/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="../../../../static/assets/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="../../../../static/app/datetime.js"></script>
<script src="/static/app/hotInfo.js"></script>

<script>
    $(function () {

        $("#batchDelete").click(function(){
            HotInfo.batchDelete();
        });

        $("#confirm").bind("click",function(){
            window.location.href = "/content/delete?id="+$("#inputDel").val();
            $("#modal-default").modal("hide");
        })

        $("#confirmDel").bind("click",function(){
            HotInfo.confirmDel("/content/batchDelete");
        })

        var dataTable = HotInfo.initDataTables("/content/data",[
            {
                data: function (row, type, set, meta) {
                    return "<input id='" + row.id + "' type='checkbox' class='minimal' />";
                }
            },
            { data: 'category.name' },
            { data: 'title' },
            { data: 'tag' },
            {
                data: function (row, type, set, meta) {
                    return DateTime.format(new Date(row.updated),"yyyy-MM-dd hh:mm:ss");
                }
            },
            {
                data: function (row, type, set, meta) {
                    return "<a href='/content/view?id=" + row.id + "' class='btn btn-sm btn-default'><i class='fa fa-fw fa-search'></i>查看</a>&nbsp;&nbsp;&nbsp;&nbsp;" +
                        "<a href='/content/form?id=" + row.id + "' class='btn btn-sm btn-info'><i class='fa fa-fw fa-edit'></i>编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;" +
                        "<a  href='javascript:void(0);' id='" + row.id + "' class='btn btn-sm btn-danger' onclick='HotInfo.del(" + row.id + ")'><i class='fa fa-fw fa-trash-o'></i>删除</a>";
                }
            }
        ]);
        // 绑定搜索事件
        $("#btnDataTableSearch").on("click", function () {
            // 动态传参数
            dataTable.settings()[0].ajax.data = {
                "title": $("#title").val(),
                "category.name":$("#categoryTitle").val()
            };
            dataTable.ajax.reload();
        });
    })
</script>
</body>
</html>
