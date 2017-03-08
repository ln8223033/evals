<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2017/1/5
  Time: 11:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>群体评测题目</title>
    <link href="/css/Content/bootstrap.min.css" rel="stylesheet">
    <link href="/css/Content/default.css" rel="stylesheet">
    <link href="/css/assets/dataTables.bootstrap.css" rel="stylesheet">
    <link href="/css/assets/font-awesome.min.css" rel="stylesheet">
    <%--<link href="/css/assets/beyond.min.css" rel="stylesheet">--%>
    <link href="/css/assets/animate.min.css" rel="stylesheet">
    <link href="/css/assets/darkblue.min.css" rel="stylesheet">
    <link href="/css/Content/site.css" rel="stylesheet">
    <link href="/css/Content/backgroundStyle.css" rel="stylesheet">
    <link href="/css/timepicker/jquery-ui.css" rel="stylesheet">
    <link href="/css/timepicker/datetimepicker.css" rel="stylesheet">
    <script src="/js/Scripts/jquery-1.10.2.min.js"></script>
    <script src="/js/Scripts/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="/js/assets/dataTables.tableTools.min.js" type="text/javascript"></script>
    <script src="/js/Scripts/dataTables.bootstrap.min.js" type="text/javascript"></script>
    <script src="/js/Scripts/jquery-ui.min.js"></script>
    <script src="/js/Scripts/jquery-ui-timepicker-addon.js"></script>
    <link href="/css/layer/layer.css" rel="stylesheet">
    <script src="/js/Scripts/layer.js"></script>
</head>

<body>
<table>
    <tbody>
    <td class="main" valign="top">
        <div class="main-box">

            <script type="text/javascript">
                $(function () {
                    $("#jqGrid").jqGrid({
                        url: '../question/list',
                        datatype: "json",
                        colModel: [
                            { label: 'id', name: 'id', width: 50, key: true },
                            { label: '是否匿名评论', name: 'anonymousComment', width: 80 },
                            { label: '发布', name: 'autoPublish', width: 80 },
                            { label: '评论开关', name: 'bsWitch', width: 80 },
                            { label: '作品结束上传时间', name: 'upload Time', width: 80 },
                            { label: '评测结束时间', name: 'endTime', width: 80 },
                            { label: '分组方式,0为还没设置,1为教师指定，2为学生自己分组(默认教师指定)', name: 'groupMethod', width: 80 },
                            { label: '每组人数(默认1人)', name: 'groupSize', width: 80 },
                            { label: '是否可以多次评论', name: 'multiComment', width: 80 },
                            { label: '评测题目', name: 'evalTitle', width: 80 },
                            { label: '是否公布结果', name: 'publishResult', width: 80 },
                            { label: '开始时间', name: 'startTime', width: 80 },
                            { label: '出题人', name: 'ownerId', width: 80 },
                            { label: '教学班级id', name: 'teachingClassId', width: 80 },
                            { label: '群体评测题目id', name: 'groupEvalQuestionId', width: 80 },
                            { label: '评测的详细内容', name: 'evalDetail', width: 80 },
                            { label: '分组结束时间', name: 'groupTime', width: 80 },
                            { label: '评论任务所需评论组数，默认为3组', name: 'checkTaskGroupCount', width: 80 },
                            { label: '是否已分组', name: 'assignState', width: 80 },
                            { label: '状态', name: 'status', width: 80 }
                        ],
                        viewrecords: true,
                        height: 385,
                        rowNum: 10,
                        rowList : [10,30,50],
                        rownumbers: true,
                        rownumWidth: 25,
                        autowidth:true,
                        multiselect: true,
                        pager: "#jqGridPager",

                        jsonReader : {
                            root: "page.list",
                            page: "page.currPage",
                            total: "page.totalPage",
                            records: "page.totalCount"
                        },
                        prmNames : {
                            page:"page",
                            rows:"limit",
                            order: "order"
                        },
                        gridComplete:function(){
                            //隐藏grid底部滚动条
                            $("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
                        }
                    });
                });

                var datatable;
                $(document).ready(function () {
                    $("#datepicker_begin").datetimepicker({
                        changeMonth: true,
                        changeYear: true,
                        dateFormat: "yy-mm-dd"
                    });
                    $("#datepicker_end").datetimepicker({
                        changeMonth: true,
                        changeYear: true,
                        dateFormat: "yy-mm-dd"

                    });

                    //初始化删除、编辑按钮
                    initBtn();

                    //初始化表格
                    initTestPaperDataTableOptions();

                    //表格选中事件
                    $('#testpaperdt tbody').on('click', 'tr', function () {
                        checkItemClick(this);
                    });


                    //全选事件
                    $("#checkAll").unbind("click");
                    $("#checkAll").click(function () {

                        if ($('#checkAll').is(':checked')) {
                            $(this).prop("checked", true);
                            $("#testpaperdt input[name='checkItem']").prop("checked", true);
                            $("#testpaperdt tr").addClass("selectedRow");
                        }
                        else {
                            $(this).prop("checked", false);
                            $("#testpaperdt input[name='checkItem']").prop("checked", false);
                            $("#testpaperdt tr").removeClass("selectedRow");
                        }

                    });

                    //编辑按钮事件
                    $("#btnUpdate").unbind("click");
                    $('#btnUpdate').click(function () {
                        var data = datatable.rows('.selectedRow').data();

                        if (data.length == 1) {
                            window.location.href = "/teacher/testPaper/edit/" + data[0].Id;
                        }
                        else {
                            //bootbox.setDefaults("locale", "zh_CN");
                            //bootbox.alert("请选择一条数据！");
                            layer.msg("请选择一条数据!");
                        }
                    });


                    //创建副本
                    $("#btnCreateCopy").unbind("click");
                    $("#btnCreateCopy").click(function () {
                        FunCopy();
                    });

                    //删除按钮
                    $("#btnDelete").unbind("click");
                    $("#btnDelete").click(function () {

                        FunDeleteTestPaper();
                    });
                    //开启共享
                    $("#btnOpenShare").unbind("click");
                    $("#btnOpenShare").click(function () {
                        FunOperateShare("Open");
                    });

                    //关闭共享
                    $("#btnCloseShare").unbind("click");
                    $("#btnCloseShare").click(function () {
                        FunOperateShare("Close");
                    });

                });

                //创建参数
                function initexamparp() {
                    var parp = {};
                    parp.Name = $("#txtName").val();
                    parp.BeginDate = $("#datepicker_begin").val();
                    parp.EndDate = $("#datepicker_end").val();
                    parp.Type = $("#stType option:selected").val();

                    var keyarray = new Array();
                    $('#divClass input[name="Teachingclassckbox"]:checked').each(function () {
                        keyarray.push($(this).val());
                    });
                    parp.ClassIds = keyarray.join(',');
                    parp.TestPaperId = $("#txtId").val();
                    return parp;
                }

                //查询事件
                function DoSearch() {
                    datatable.ajax.reload();
                }

                //搜索栏字段
                function initSearchParameter(d) {
                    var name = $("#key").val();
                    var cousegroup = $("#dropdownMenuItem .active").attr("value");
                    var shareFlag = $("#nav .active").attr("value");

                    d.Name = name;
                    d.CouseGroupId = cousegroup;
                    d.ShareFlag = shareFlag;
                }
                //初始化datatable
                function InitTestPaperDataTableOptions() {
                    datatable = $('#testpaperdt').DataTable({
                        serverSide: true,
                        processing: true,
                        sDom: "ftr<'row DTTTFooter'<'col-sm-6'il><'col-sm-6'p>><'clear'>",//改变元素在页面上的位置
                        sPaginationType: "full_numbers",//显示数字的翻页样式
                        ajax: {
                            type: "POST",
                            url: "/teacher/testpaper/QueryTestPapers",
                            data: InitSearchParameter
                        },
                        bStateSave: true,//状态保存，存cookie
                        columns: [
                            {
                                data: 'Id',
                                bSortable: false,
                                name: "Id",
                                class: "text-center",
                                "render": function (data, type, full) {
                                    if (data != null) {

                                        return "<div class=\"checkbox\" style=\"margin:auto\"><label><input name=\"checkItem\" type=\"checkbox\" value=\"" + data + "\"  class=\"btn-sm\" /><span class=\"text\"></span></label></div>";
                                    }
                                }
                            },
                            {
                                data: 'Name',
                                bSortable: true,
                                class: "text-center",
                                name: "Name",
                                "render": function (data, type, full) {

                                    return "<a href=\"/teacher/testpaper/look?testPaperId=" + full.Id + "&IsLook=1\" style=\"color:#01AAED\">" + data + "</a>";
                                }
                            },

                            {data: 'InUser', bSortable: true, class: "text-center", name: "InUser"},
                            {
                                data: 'InDate',
                                bSortable: true,
                                name: "InDate",
                                class: "text-center",
                                "render": function (data, type, full) {
                                    if (data != null) {
                                        var date = new Date(parseInt(data.substr(6)));
                                        return date.Format("yyyy-MM-dd hh:mm:ss");
                                    }
                                    return data;
                                }
                            },
                            {data: 'CourseGroupName', bSortable: true, class: "text-center", name: "CourseGroupName"},
                            {data: 'TestPaperScore', bSortable: true, class: "text-center", name: "TestPaperScore"},
                            {
                                data: 'ShareFlag',
                                bSortable: true,
                                class: "text-center",
                                name: "ShareFlag",
                                "render": function (data, type, ful) {
                                    return data.toString().replace("0", "个人").replace("1", "共享");
                                }
                            }
                        ],
                        drawCallback: function () {

                            // 取消全选
                            $("#checkAll").prop('checked', false);
                            $(":checkbox[name='checkItem']").prop('checked', false);
                        },
                        aaSorting: [[1, 'desc']],//排序
                        orderClasses: true,
                        language: {
                            search: "",
                            sInfoEmpty: "0条记录",
                            sInfo: "从 _START_ 到 _END_ /共 _TOTAL_ 条数据，总共_PAGES_ 页",
                            sLengthMenu: "每页显示：_MENU_",
                            oPaginate: {
                                "sFirst": "首页",
                                "sPrevious": "前一页",
                                "sNext": "后一页",
                                "sLast": "尾页"
                            },
                            sProcessing: "数据加载中....."
                        },//改变语言
                        bFilter: false,//过滤功能
                        bLengthChange: true,//改变每页数据量
                        bScrollCollapse: false,//水平控制
                        sScrollY: "500px",//垂直控制
                        "lengthMenu": [[5, 10, 25, 50, 100], [5, 10, 25, 50, 100]],
                        pageLength: 5
                    });
                }


                //子复选框事件
                function checkItemClick(input) {

                    $("#checkAll").prop("checked", false);
                    var checkItemObject = $(input).find("input[name='checkItem']");


                    if (!checkItemObject.is(':checked')) {
                        checkItemObject.prop("checked", true);
                        $(input).addClass("selectedRow");

                        var checkNum = $("#testpaperdt input[name='checkItem']").length;
                        var checkedNum = $("#testpaperdt input[name='checkItem']:checked").length;
                        if (checkNum == checkedNum) {
                            $("#checkAll").prop("checked", true);
                        }
                    }
                    else {
                        checkItemObject.prop("checked", false);
                        $(input).removeClass("selectedRow");
                    }


                }

                //下拉框点击事件
                function dropdownClick(dropdown) {
                    $("#dropdownMenuItem>li>a").removeClass('active');
                    $(dropdown).addClass('active');

                    var id = $(dropdown).attr("value");
                    var name = $(dropdown).text();

                    $('#lbCourseName').html("<strong>" + name + "</strong>");

                    DoSearch();
                }

                //导航的单击事件
                function navClick(navObject) {
                    $("#nav li").removeClass("active");
                    $(navObject).addClass("active");
                    initBtn();
                    DoSearch();
                }

                //删除/编辑按钮初始化
                function initBtn() {
                    if ($("#nav .active").attr("value") == 1) {
                        $("#btnDelete").hide();
                        $("#btnUpdate").hide();
                        $("#btnCreate").hide();
                        $("#btnOpenShare").hide();
                        $("#btnCloseShare").hide();
                    }
                    else {
                        $("#btnDelete").show();
                        $("#btnUpdate").show();
                        $("#btnCreate").show();
                        $("#btnOpenShare").show();
                        $("#btnCloseShare").show();
                    }
                }
                //                function initBtn() {
                //                    if ($("#nav .active").attr("value") == 1) {
                //                        $("#btnDelete").attr("style", "display:none");
                //                        $("#btnUpdate").attr("style", "display:none");
                //                        $("#btnCreate").attr("style", "display:none");
                //                    }
                //                    else {
                //                        $("#btnDelete").attr("style", "display:inline-block");
                //                        $("#btnUpdate").attr("style", "display:inline-block");
                //                        $("#btnCreate").attr("style", "display:inline-block");
                //                    }
                //                }})
                //操作共享状态
                function FunOperateShare(operatingOrder)
                {
                    var layerConfirmStr = "开启";
                    if (operatingOrder == "Close")
                    {
                        layerConfirmStr = "关闭";
                    }

                    var params = new Object();
                    params = InitOperateShareParams(operatingOrder);

                    if (params != null)
                    {
                        layer.confirm('你确定要将选中的评测试题' + params.EvalQuestionName + layerConfirmStr + '共享吗？', {
                            btn: ['确定', '取消'] //按钮
                        }, function () {
                            $.ajax({
                                url: "/question/testpaper/OperateShareFlag",
                                type: "POST",
                                async: false,
                                data: JSON.stringify(params),
                                dataType: "json",     //类型
                                contentType: "application/json",
                                success: function (data) {
                                    data = eval(data);
                                    if (data.Result == true) {
                                        layer.alert(layerConfirmStr + '共享成功!', { icon: 1, skin: 'layer-ext-moon', time: 3000 });

                                        DoSearch();
                                    }
                                    else {
                                        layer.alert(layerConfirmStr+'共享失败!', { icon: 2, skin: 'layer-ext-moon', time: 3000 });

                                    }
                                },
                                error: function (data) {
                                    layer.alert('连接服务器失败,请重试!', { icon: 1, skin: 'layer-ext-moon', time: 3000 });

                                }
                            });
                        }, function () { });

                    }

                }

                //组建参数
                function InitOperateShareParams(operatingOrder)
                {
                    var operateNo = 0;
                    var operateStr = "开启";
                    if (operatingOrder == "Close")
                    {
                        operateNo = 1;
                        operateStr = "关闭";
                    }

                    var chooseData = datatable.rows('.selectedRow').data();
                    if (chooseData == null || chooseData.length == 0)
                    {
                        layer.alert('请至少选择一条需要' + operateStr + '共享的评测试题信息!', { icon: 0, skin: 'layer-ext-moon', time: 3000 });
                        return null;
                    }

                    var evalQuestionName = "";
                    var evalQuestionIds = new Array();
                    for (var i = 0; i < chooseData.length; i++)
                    {
                        if (chooseData[i].ShareFlag == operateNo)
                        {
                            evalQuestionIds.push(chooseData[i].Id);
                            evalQuestionName += "[" + chooseData[i].Name + "]";
                        }
                    }

                    if (testPaperIds == null || testPaperIds.length == 0)
                    {
                        layer.alert('当前选中的试卷已' + operateStr + '共享状态!', { icon: 0, skin: 'layer-ext-moon', time: 3000 });

                        return null;
                    }

                    var requestdata = new Object();
                    requestdata.EvalQuestionIds = evalQuestionIds;
                    requestdata.OperatingOrder = operatingOrder;
                    requestdata.EvalQuestionName = evalQuestionName;

                    return requestdata;
                }

                //修改评测
                function FunUpdate()
                {
                    var data = datatable.rows('.selectedRow').data();

                    if (data.length == 1)
                    {

                        if (IsCanEdit(data[0].Id)===true)
                        {
                            window.location.href = "/question/testPaper/edit?Id=" + data[0].Id + "&lastShareFlag=" + $("#nav .active").attr("value");
                        }
                        else
                        {
                            layer.confirm('当前所选择的评测已被发布过，不能直接编辑。是否继续编辑？（提示:若继续编辑，编辑内容将作为副本保存!)？', {
                                btn: ['确定', '取消'] //按钮
                            }, function () {
                                $.ajax({
                                    url: "/question/testpaper/CreateOneCopy",
                                    type: "POST",
                                    async: false,
                                    data: {evalQuestionId: data[0].Id },
                                    success: function (result) {
                                        result = eval(result);
                                        if (result.Result === true) {
                                            window.location.href = "/question/testPaper/edit?Id=" + result.ReturnKey + "&lastShareFlag=" + $("#nav .active").attr("value");
                                        }
                                        else {
                                            layer.alert('创建副本失败,请重试!', { icon: 2, skin: 'layer-ext-moon', time: 3000 });
                                        }
                                    },
                                    error: function (data) {
                                        //FunTip("连接服务器失败，请重试！", "error");
                                        layer.alert('连接服务器失败,请重试!', { icon: 0, skin: 'layer-ext-moon', time: 3000 });

                                    }
                                });
                            }, function () { });
                        }
                    }
                    else {
                        layer.msg("请选择一条数据!");
                    }
                }

                //创建副本
                function FunCopy()
                {
                    var chooseData = datatable.rows('.selectedRow').data();

                    if (chooseData.length > 0)
                    {
                        var EvalQuestionIds = new Array();
                        var evalQuestionName = "";
                        for (var i = 0; i < chooseData.length; i++) {
                            EvalQuestionIds.push(chooseData[i].Id);
                            evalQuestionName += "[" + chooseData[i].Name + "]";
                        }

                        var requestdata = new Object();
                        requestdata.Ids = EvalQuestionIds;

                        layer.confirm('你确定要将选中的评测' + evalQuestionName + '创建副本吗？', {
                            btn: ['确定', '取消'] //按钮
                        }, function () {
                            $.ajax({
                                url: "/teacher/testpaper/CreateCopy",
                                type: "POST",
                                async: false,
                                data: JSON.stringify(requestdata),
                                dataType: "json",     //类型
                                contentType: "application/json",
                                success: function (data) {
                                    data = eval(data);
                                    if (data.Result == true) {
                                        layer.alert('创建副本成功!', { icon: 1, skin: 'layer-ext-moon', time: 3000 });
                                        DoSearch();
                                    }
                                    else {
                                        layer.alert('创建副本失败，请重新操作！', { icon: 1, skin: 'layer-ext-moon', time: 3000 });

                                    }
                                },
                                error: function (data) {
                                    layer.alert('连接服务器失败,请重试!', { icon: 0, skin: 'layer-ext-moon', time: 3000 });
                                }
                            });
                        }, function () { });

                    }
                    else {
                        layer.msg("请至少选择一条数据！");

                    }

                }



                //评测
                function FunDelete()
                {
                    var chooseData = datatable.rows('.selectedRow').data();
                    if (chooseData.length > 0) {
                        layer.confirm('你确定要删除选中的评测吗？', {
                            btn: ['确定', '取消'] //按钮
                        }, function () {
                            var EvalQuestionIds = new Array();
                            for (var i = 0; i < chooseData.length; i++) {
                                EvalQuestionIds.push(chooseData[i].Id);
                            }

                            var requestdata = new Object();
                            requestdata.Ids = EvalQuestionIds;

                            $.ajax({
                                url: "/teacher/testpaper/Delete",
                                type: "POST",
                                async: false,
                                data: JSON.stringify(requestdata),
                                dataType: "json",     //类型
                                contentType: "application/json",
                                success: function (data) {
                                    data = eval(data);
                                    if (data.Result == true) {

                                        layer.alert('删除成功!', { icon: 1, skin: 'layer-ext-moon', time: 3000 });

                                        DoSearch();
                                    }
                                    else {

                                        layer.alert('提示：' + data.Message, { icon: 2, skin: 'layer-ext-moon', time: 3000 });

                                    }
                                },
                                error: function (data) {
                                    //FunTip("连接服务器失败，请重试！", "error");
                                    layer.alert('连接服务器失败,请重试!', { icon: 0, skin: 'layer-ext-moon', time: 3000 });

                                }
                            });
                        }, function () { });
                    }
                    else {
                        //FunTip("请至少选择一条试卷信息","info");
                        layer.msg('请至少选择一条评测信息!');
                    }
                }

                //验证是否可以编辑
                function IsCanEdit(Id)
                {
                    var result = false;

                    $.ajax({
                        url: "/teacher/testpaper/IsCanEdit",
                        type: "POST",
                        async: false,
                        data: {evalQuestionId:Id},
                        //dataType: "json",     //类型
                        //contentType: "application/json",
                        success: function (data) {
                            data = eval(data);
                            result = data.Result;
                        },
                        error: function (data) {
                            //FunTip("连接服务器失败，请重试！", "error");
                            layer.alert('连接服务器失败,请重试!', { icon: 0, skin: 'layer-ext-moon', time: 3000 });
                        }
                    });

                    return result;

                }
            </script>

            <!--Index-->
            <div style="width:80%;height:1000px;margin:auto">
                <div style="border:1px #C7C7C7 dotted;width:850px;height:990px;margin:auto;margin-top:5px">

                    <!--导航-->
                    <div>
                        <ul class="nav nav-tabs" role="tablist" id="nav">
                            <li role="presentation" onclick="navClick(this)" value="1">
                                <a href="javascript:void(0);">共享评测题库</a>
                            </li>
                            <li role="presentation" onclick="navClick(this)" value="0">
                                <a href="javascript:void(0);">个人评测题库</a>
                            </li>
                        </ul>
                        <%--<ul class="nav nav-tabs" role="tablist" id="nav">--%>
                        <%--<li>--%>
                        <%--<a class="tabs-inner" type="public" href="javascript:void(0)"><span--%>
                        <%--class="tabs-title">共享评测题库</span>--%>
                        <%--</a>--%>
                        <%--</li>--%>
                        <%--<li class="tabs-selected">--%>
                        <%--<a class="tabs-inner" type="private"--%>
                        <%--href="javascript:void(0)"><span class="tabs-title">个人评测题库</span>--%>
                        <%--</a>--%>
                        <%--</li>--%>
                        <%--</ul>--%>
                    </div>

                    <!---课程组层--->
                    <div style="height:60px;margin:auto">
                        <form action="${pageContext.request.contextPath }/question/course" method="post">
                            <c:forEach items="${coursegroupList}" var="courses">
                                <!--选择按钮-->
                                <div class="dropdown" style="margin:15px 5px 0 35px;float:left;">
                                    <button class="btn dropdown-toggle btn-sm" type="button" id="dropdownMenu1"
                                            data-toggle="dropdown">
                                        <span class="caret"></span>
                                        选择课程
                                    </button>
                                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1"
                                        id="dropdownMenuItem">
                                        <li><a tabindex="-1" href="javascript:void(0);" value="5"
                                               onclick="dropdownClick(this)">${courses.name }</a></li>
                                    </ul>
                                </div>
                                <!--选择结果-->
                                <div style="height:20px;margin-top:20px;text-align:center;float:left;">
                                    <label style="font-size:11px"><b>&nbsp;&nbsp;当前课程:</b></label>
                                    <label id="lbCourseName"
                                           style="color:#4bd083;font-size:11px"><strong>${courses.name }</strong></label>
                                </div>
                            </c:forEach>
                        </form>
                    </div>

                    <!--搜索栏-->
                    <div style="margin:auto;margin-top:20px;">
                        <div class="input-group" style="width:400px;margin:auto;">
                            <input type="text" name="key" id="key" class="form-control" placeholder="请输入关键字"
                                   style="border-color:#4bd083">
                            <span class="input-group-btn">
                                  <button class="btn btnSelect" onclick="DoSearch()">
                                         <span class="glyphicon glyphicon-search"></span>
                                  </button>
                             </span>
                        </div>
                    </div>

                    <!--按钮组-->
                    <div style="margin:auto;margin-top:20px;margin-left:35px;">
                        <a class="btn btn-sm" href="/question/create" id="btnCreate">添加</a>
                        <a class="btn btn-sm" href="javascript:void(0);" id="btnLook"
                           style="display: inline-block;">查看</a>
                        <a class="btn btn-sm" href="javascript:void(0);" id="btnUpdate" style="display: inline-block;">编辑</a>
                        <a class="btn btn-sm" href="javascript:void(0);" id="btnDelete" style="display: inline-block;">删除</a>
                        <a class="btn btn-sm" href="javascript:void(0);" id="btnCreateCopy"
                           style="display: inline-block;">创建副本</a>
                        <a class="btn btn-sm" href="javascript:void(0);" id="btnOpenShare"
                           style="display: inline-block;">开启共享</a>
                        <a class="btn btn-sm" href="javascript:void(0);" id="btnCloseShare"
                           style="display: inline-block;">关闭共享</a>
                    </div>



                            <div class="row DTTTFooter">
                                <div class="col-sm-6">
                                    <div class="dataTables_length" id="testpaperdt_length"><label>每页显示：<select
                                            name="testpaperdt_length" aria-controls="testpaperdt"
                                            class="form-control input-sm">
                                        <option value="5">5</option>
                                        <option value="10">10</option>
                                        <option value="25">25</option>
                                        <option value="50">50</option>
                                        <option value="100">100</option>
                                    </select>
                                    </label>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="dataTables_paginate paging_full_numbers" id="testpaperdt_paginate">
                                        <ul class="pagination">
                                            <li class="paginate_button first disabled" id="testpaperdt_first"><a
                                                    href="#"
                                                    aria-controls="testpaperdt"
                                                    data-dt-idx="0"
                                                    tabindex="0">首页</a>
                                            </li>
                                            <li class="paginate_button previous disabled" id="testpaperdt_previous"><a
                                                    href="#" aria-controls="testpaperdt" data-dt-idx="1"
                                                    tabindex="0">前一页</a></li>
                                            <li class="paginate_button active"><a href="#" aria-controls="testpaperdt"
                                                                                  data-dt-idx="2" tabindex="0">1</a>
                                            </li>
                                            <li class="paginate_button next disabled" id="testpaperdt_next">
                                                <a href="#" data-dt-idx="3" tabindex="0">后一页</a>
                                            </li>
                                            <li class="paginate_button last disabled" id="testpaperdt_last">
                                                <a href="#" aria-controls="testpaperdt" data-dt-idx="4"
                                                   tabindex="0">尾页</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </div>

                </div>

            </div>
            </form>
        </div>
        </div>
        </div>
        </div>
    </td>
</table>
</body>
</html>
