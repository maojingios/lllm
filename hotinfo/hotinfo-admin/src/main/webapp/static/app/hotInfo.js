var HotInfo = function () {
    /*初始化ICheck*/
    var handlerInitICheck = function () {
        // 初始化 iCheck
        $('input[type="checkbox"].minimal').iCheck({
            checkboxClass: 'icheckbox_minimal-blue'
        });
    }
    /*批量删除*/
    var handlerBatchDelete = function () {
        if (handlerGetIdArray().length === 0){
            $("#modal-default").attr("class","modal fade")
            $("#inputDel").val("-1")
            $("#modal-default").modal("show");
        }else{
            $("#modal-danger").modal("show");
        }
    }
    /*弹出删除提示框*/
    var handlerDel = function (id) {
        $("#modal-default").attr("class","modal modal-danger fade");
        $("#confirm").attr("class","btn btn-outline");
        $("#close").attr("class","btn btn-outline pull-left");
        $("#modal-default .modal-body p").html("确定删除?删除后无法恢复");
        $("#inputDel").val(id)
        $("#modal-default").modal("show");
    }
    /*确认删除*/
    var handlerConfirmDel = function (uri) {
        $("#confirmDel").val(handlerGetIdArray());
        $("#confirmDelForm").attr("action",uri);
        $("#modal-danger").modal("hide");
    }
    /*得到多选的id数组*/
    var handlerGetIdArray = function () {
        var idArray = new Array();
        var checkbox = $('input[type="checkbox"]');
        checkbox.each(function(){
            var id = $(this).attr("id");
            if(id != null&&id!="undefine" && $(this).is(":checked")){
                idArray.push(id);
            }
        })
        return idArray;
    }
    /*初始化Dropzone*/
    var handlerMyDropzone = function (dropId,picId) {
        $("div#" + dropId).dropzone({
            url: "/upload/img",
            paramName: "dropFile",
            maxFilesize: 10,//1m
            maxFiles: 1,
            init: function () {
                this.on("success", function (file, data) {
                    $("#"+picId).val(data.imgUrl)
                });
            }
        });
    }
    /*初始化dataTable*/
    var handlerInitDataTables = function (uri,columns) {
        var dataTable = $('#dataTable').DataTable({
            //分页
            paging: true,
            //选择显示条数
            lengthChange: true,
            //本地搜索
            searching: false,
            //本地顺序
            ordering: false,
            autoWidth:false,
            //左下角信息
            info: true,
            //设置水平滚动条
            scrollX: true,
            scrollY: "500px",
            scrollCollapse: true,
            //缓存
            bStateSave: true,
            processing: true,
            //服务器模式
            serverSide:true,
            ajax: {
                url: uri,
                type: 'GET'
            },
            columns: columns,
            language: {
                "sProcessing": "数据处理中...",
                "sLengthMenu": "显示 _MENU_ 项结果",
                "sZeroRecords": "没有匹配结果",
                "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
                "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
                "sInfoPostFix": "",
                "sSearch": "搜索:",
                "sUrl": "",
                "sEmptyTable": "表中数据为空",
                "sLoadingRecords": "载入中...",
                "sInfoThousands": ",",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "上页",
                    "sNext": "下页",
                    "sLast": "末页"
                },
                "oAria": {
                    "sSortAscending": ": 以升序排列此列",
                    "sSortDescending": ": 以降序排列此列"
                }
            },
            drawCallback: function (settings) {
                //初始化ICheck
                HotInfo.initICheck();
                // 全选
                $(".chk_master").iCheck("uncheck");
                $(".chk_master").on("ifClicked", function (event) {
                    if (!$(this).is(':checked')) {
                        $("#dataTable input[type='checkbox']").iCheck('check');
                    }
                    else {
                        $("#dataTable input[type='checkbox']").iCheck('uncheck');
                    }
                });
            }
        })
        // 重置按钮
        bindEvent();
        return dataTable;
        function bindEvent() {
            $("#btnDataTableReset").on("click", function () {
                window.location.reload();
            });
        }
    }
    /*弹出温馨提示框*/
    var handlerShowAlert = function (col) {
        $("#modal-default").modal("show");
        $("#modal-default .modal-body p").html(col);
        $("#confirm").unbind("click");
        $("#confirm").bind("click", function () {
            $("#modal-default").modal("hide");
        });
    }
    /*弹出展示框*/
    var handlerShowInfo = function (col,col2) {
        $("#modal-default").modal("show");
        $("#modal-default .modal-body p").html(col);
        $("h4 [class='modal-title']").html(col2)
        $("#confirm").unbind("click");
        $("#confirm").bind("click", function () {
            /*可以点修改*/
            $("#modal-default").modal("hide");
        });

    }

    /*初始化zTree*/
    var handlerInitzTree = function (url) {
        var setting = {
            view: {
                selectedMulti: false
            },
            async: {
                enable: true,
                type: "get",
                url: url,
                autoParam: ["id"]
            },
            callback: {
                beforeClick: function (treeId,treeNode) {
                    $("#parentId").val(treeNode.id);
                    $("#parentTitle").val(treeNode.name);
                }
            }
        };
        $("#parentTitle").bind("click",function () {
            HotInfo.showAlert("<ul id='treeData' class='ztree'></ul>");
            $.fn.zTree.init($("#treeData"),setting);
        })
    }
    /*初始化富文本框*/
    var handlerInitUeditor = function (id,contentId) {
        var ue = UE.getEditor(id, {
            //高亮
            autoHeightEnabled: true,
            //浮动
            autoFloatEnabled: true,
            allowDivTransToP: false,
        });
        ue.ready(function () {
            var html = ue.getContent();
            ue.setContent($("#"+contentId).val());
            ue.addListener("contentChange", function () {
                $("#"+contentId).val(ue.getContent());
            });
        });
    }

    return {
        /*初始化富文本框*/
        initUeditor: function (id,contentId) {
            handlerInitUeditor(id,contentId);
        },
        /*初始化dataTable*/
        initDataTables: function (uri, columns) {
            return handlerInitDataTables(uri, columns);
        },
        /*初始化ICheck*/
        initICheck: function () {
            handlerInitICheck();
        },
        /*批量删除*/
        batchDelete: function () {
            handlerBatchDelete();
        },
        /*确定删除*/
        confirmDel: function (uri) {
            handlerConfirmDel(uri);
        },
        /*弹出删除提示框*/
        del: function (id) {
            handlerDel(id);
        },
        /*弹出温馨提示框*/
        showAlert: function (col) {
            handlerShowAlert(col);
        },
        /*初始化zTree*/
        initzTree: function (url) {
            handlerInitzTree(url)
        },
        /*初始化Dropzone(拖拽上传功能)*/
        initMyDropzone: function(dropId,picId){
            handlerMyDropzone(dropId,picId)
        },
        /*弹出展示框*/
        showInfo: function (col,col2) {
            handlerShowInfo(col,col2);
        }
        
    }
}();

// HotInfo 初始化器
jQuery(document).ready(function () {
    HotInfo.initICheck();
});