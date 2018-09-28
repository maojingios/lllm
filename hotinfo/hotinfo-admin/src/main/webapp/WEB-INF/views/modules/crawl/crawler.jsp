<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/includes/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>HotInfo | 爬虫</title>
    <jsp:include page="${ctxInclude}/head.jsp" />
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <jsp:include page="${ctxInclude}/header.jsp" />
    <jsp:include page="${ctxInclude}/aside.jsp" />

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <%--content-header--%>
        <section class="content-header">
            <h1>
                分类
                <small>筛选条件</small>
            </h1>
        </section>

        <%--content--%>
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">筛选条件</h3>
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->
                        <form role="form" action="/crawler/run" method="post">
                            <div class="box-body">

                                <div class="form-group">
                                    <label>自定义</label>
                                    <input type="text" class="form-control" name="conditions" id="crawler-condition" placeholder="请输入筛选条件">
                                </div>

                                <div class="form-group" id="select-condition">
                                    <label>固定条件</label>
                                    <select>
                                        <option>-请选择-</option>
                                        <%--一键爬取--%>
                                        <option>一键爬取</option>
                                        <%--父类目--%>
                                        <option value="url:http://www.xinmin.cn/;pojo:CrawlerCategory;pn_id:MainNav;tn:a;av:href;ht:true;parent:true;part:pac">父级类目</option>
                                        <%--子类目--%>
                                        <option value="url:http://www.xinmin.cn/;pojo:CrawlerCategory;pn_id:MainNav;pn_cl:pull_box;tn:a;av:href;ht:true;parent:true;part:clc">子级类目</option>
                                        <%--头部新闻--%>
                                        <option value="url:http://www.xinmin.cn/;part:tpn">首页头部三种类型新闻</option>
                                        <%--body新闻--%>
                                        <option value="url:http://www.xinmin.cn/;part:mbn">首页body新闻以及下潜二级详情</option>
                                    </select>
                                </div>
                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer">
                                <button type="submit" class="btn btn-primary">开始爬吧</button>
                            </div>
                        </form>

                        <hr/>

                        <h3>Read me</h3>
                        <ul>
                            必填：
                            <li>url:目标网站  </li>
                            <li>pojo:类型;</li>
                            <li>pn_id:父节点id;</li>
                            <li>tn:标签名;</li>
                            <li>av:属性的值;</li>
                            <li>ht:文本内容,为boolean类型，TRUE则获取，反之不获取;</li>
                            <li>part:爬取类型，字符串；如part:pac(父级类目);clc(子类类目)</li>
                        </ul>

                        <ul>
                            选择：
                            <li>pn_cl:父节点class;</li>
                            <li>cn_id:子节点id;</li>
                            <li>cn_cl:子节点class;</li>
                            <li>条件格式如：pn_id:top_nav;tn:tagname   </li>
                            <li>parent:如果获取category数据，需使用parent参数指明当前数据是否为父类目  </li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <jsp:include page="${ctxInclude}/footer.jsp" />
</div>

<jsp:include page="${ctxInclude}/foot.jsp" />

<script>
    $(function () {
        $("#select-condition").on("change",function () {
            $("#crawler-condition").val($("#select-condition option:selected").val())
        })
    })
</script>

</body>
</html>