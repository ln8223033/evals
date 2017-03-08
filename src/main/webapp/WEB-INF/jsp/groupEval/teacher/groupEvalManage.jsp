
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>群体评测管理</title>
    <link href="/css/Content/bootstrap.min.css" rel="stylesheet">
    <link href="/css/Content/backgroundStyle.css" rel="stylesheet">
    <link href="/css/timepicker/jquery-ui.css" rel="stylesheet">
    <link href="/css/timepicker/datetimepicker.css" rel="stylesheet">
    <script src="/js/Scripts/jquery.js"></script>
    <script src="/js/Scripts/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="/js/assets/dataTables.tableTools.min.js" type="text/javascript"></script>
    <script src="/js/Scripts/dataTables.bootstrap.min.js" type="text/javascript"></script>
    <script src="/js/Scripts/jquery-ui.min.js"></script>
    <script src="/js/Scripts/jquery-ui-timepicker-addon.js"></script>

</head>
<body>

<table>
    <tbody>
    <td class="main" valign="top">
        <div class="main-box">


            <div style="background-color:ghostwhite; height: 40px;">
                <center><h4 class="fixie"><b>群体式评审题目列表</b></h4></center>
                <hr style="height:5px;border:none;border-top:2px solid #555555;">
            </div>
            <tr>
                <td class="main" valign="top">
                    <div class="main-box">
                        <!--Index-->
                        <div style="width:80%;height:1000px;margin:auto">
                            <div style="border:1px #C7C7C7 dotted;width:850px;height:990px;margin:auto;margin-top:5px">
                                <!---教学班级层--->
                                <div style="height:60px;margin:auto">
                                    <form action="${pageContext.request.contextPath }/groupEval/teachingClass"
                                          method="post">
                                        <c:forEach items="${teachingClassList}" var="teachingClassList">
                                            <!--选择按钮-->
                                            <div class="dropdown" style="margin:15px 5px 0 35px;float:left;">
                                                <button class="btn dropdown-toggle btn-sm" type="button"
                                                        id="dropdownMenu1"
                                                        data-toggle="dropdown">
                                                    <span class="caret"></span>
                                                    选择班级
                                                </button>

                                                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1"
                                                    id="dropdownMenuItem">
                                                </ul>
                                            </div>
                                            <!--选择结果-->
                                            <div style="height:20px;margin-top:20px;text-align:center;float:left;">
                                                <label style="font-size:11px"><b>当前班级:</b></label>
                                                <label id="lbCourseName"
                                                       style="color:#4bd083;font-size:11px"><strong>${teachingClassList.name}</strong>
                                                </label>
                                            </div>
                                        </c:forEach>
                                    </form>
                                </div>

                                <!--搜索栏-->
                                <div style="margin:auto;margin-top:20px;">
                                    <div class="input-group" style="width:400px;margin:auto;">
                                        <input type="text" name="key" id="key" class="form-control"
                                               placeholder="请输入评测关键字"
                                               style="border-color:#4bd083">
                                        <span class="input-group-btn">
                    <button class="btn btnSelect" onclick="DoSearch()"><span class="glyphicon glyphicon-search"></span></button>
                </span>
                                    </div>
                                </div>

                                <!--按钮组-->
                                <div style="margin:auto;margin-top:20px;margin-left:35px;">
                                    <a class="btn btn-sm" href="${pageContext.request.contextPath }/groupEval/create">添加新评测</a>
                                    <a class="btn btn-sm" href="#" id="update" style="display: inline-block;">编辑</a>
                                    <a class="btn btn-sm" href="#" id="Delete" style="display: inline-block;">删除</a>
                                    <a class="btn btn-sm" href="#" id="btnDele" style="display: inline-block;">分组</a>
                                    <a class="btn btn-sm" href="#" id="btnDel" style="display: inline-block;">评分任务</a>
                                    <a class="btn btn-sm" href="#" id="btnDeleteTestPr" style="display: inline-block;">批量导出学生作业</a>
                                    <a class="btn btn-sm" href="#" id="btnDeleteTe" style="display: inline-block;">导出所有成绩</a>
                                </div>

                                <!--表格--->
                                <div style="margin:auto;margin-top:10px;height:600px;width:780px;border:1px #C7C7C7 solid">
                                    <div id="testpaperdt_wrapper"
                                         class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                                        <div class="dataTables_scroll">
                                            <div class="dataTables_scrollHead"
                                                 style="overflow: hidden; position: relative; border: 0px; width: 100%;">
                                                <div class="dataTables_scrollHeadInner"
                                                     style="box-sizing: content-box; width: 778px; padding-right: 0px;">
                                                    <table class="table table-bordered table-hover dataTable no-footer"
                                                           role="grid" style="margin-left: 0px; width: 778px;">
                                                        <thead>
                                                        <tr role="row">
                                                            <th class="text-center sorting_disabled" rowspan="1"
                                                                colspan="1"
                                                                style="width: 45px;" aria-label=" ">
                                                                <div class="checkbox" style="margin:auto">
                                                                    <label>
                                                                        <input name="checkAll" id="checkAll"
                                                                               type="checkbox"l
                                                                               class="btn-sm"><span class="text"></span>
                                                                    </label>
                                                                </div>
                                                                <div class="checkbox" style="margin:auto"></div>
                                                            </th>
                                                            <th class="text-center sorting_desc" rowspan="1" colspan="1"
                                                                style="width: 100px;" tabindex="0"
                                                                aria-controls="testpaperdt"
                                                                aria-sort="descending" aria-label="
                            评测项目
                        : activate to sort column ascending">
                                                                评测项目
                                                            </th>
                                                            <th class="text-center sorting" rowspan="1" colspan="1"
                                                                style="width: 100px;" tabindex="0"
                                                                aria-controls="testpaperdt"
                                                                aria-label="
                            开始时间
                        : activate to sort column ascending">
                                                                开始时间
                                                            </th>
                                                            <th class="text-center sorting" rowspan="1" colspan="1"
                                                                style="width: 100px;" tabindex="0"
                                                                aria-controls="testpaperdt"
                                                                aria-label="
                            结束时间
                        : activate to sort column ascending">
                                                                结束时间
                                                            </th>
                                                            <th class="text-center sorting" rowspan="1" colspan="1"
                                                                style="width: 100px;" tabindex="0"
                                                                aria-controls="testpaperdt"
                                                                aria-label="
                            分组截止时间
                        : activate to sort column ascending">
                                                                分组截止时间
                                                            </th>
                                                            <th class="text-center sorting" rowspan="1" colspan="1"
                                                                style="width: 100px;" tabindex="0"
                                                                aria-controls="testpaperdt"
                                                                aria-label="
                            作品截止时间
                        : activate to sort column ascending">
                                                                作品截止时间
                                                            </th>
                                                            <th class="text-center sorting" rowspan="1" colspan="1"
                                                                style="width: 100px;" tabindex="0"
                                                                aria-controls="testpaperdt"
                                                                aria-label="
                            出题人
                        : activate to sort column ascending">
                                                                出题人
                                                            </th>
                                                        </tr>
                                                        </thead>
                                                    </table>
                                                </div>
                                            </div>
                                            <%--<div class="dataTables_scrollBody"--%>
                                                 <%--style="position: relative; overflow: auto; height: 500px; width: 100%;">--%>
                                                <%--<table class="table table-bordered table-hover dataTable no-footer"--%>
                                                       <%--id="testpaperdt" role="grid" aria-describedby="testpaperdt_info"--%>
                                                       <%--style="width: 100%;">--%>
                                                    <%--<thead>--%>
                                                    <%--<tr role="row" style="height: 0px;">--%>
                                                        <%--<th class="text-center sorting_disabled" rowspan="1" colspan="1"--%>
                                                            <%--style="width: 45px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;"--%>
                                                            <%--aria-label="">--%>
                                                            <%--<div class="dataTables_sizing"--%>
                                                                 <%--style="height:0;overflow:hidden;">--%>
                                                                <%--<div class="checkbox" style="margin:auto">--%>
                                                                    <%--<label>--%>
                                                                        <%--<input name="checkAll" id="checkAll"--%>
                                                                               <%--type="checkbox"--%>
                                                                               <%--class="btn-sm"><span class="text"></span>--%>
                                                                    <%--</label>--%>
                                                                <%--</div>--%>
                                                            <%--</div>--%>
                                                        <%--</th>--%>
                                                        <%--<th class="text-center sorting_desc" rowspan="1" colspan="1"--%>
                                                            <%--style="width: 100px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;"--%>
                                                            <%--aria-controls="testpaperdt" aria-sort="descending"--%>
                                                            <%--aria-label="--%>
                            <%--评测项目--%>
                        <%--: activate to sort column ascending">--%>
                                                            <%--<div class="dataTables_sizing"--%>
                                                                 <%--style="height:0;overflow:hidden;">--%>
                                                                <%--评测项目--%>
                                                            <%--</div>--%>
                                                        <%--</th>--%>
                                                        <%--<th class="text-center sorting" rowspan="1" colspan="1"--%>
                                                            <%--style="width: 100px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;"--%>
                                                            <%--aria-controls="testpaperdt" aria-label="--%>
                            <%--开始时间--%>
                        <%--: activate to sort column ascending">--%>
                                                            <%--<div class="dataTables_sizing"--%>
                                                                 <%--style="height:0;overflow:hidden;">--%>
                                                                <%--开始时间--%>
                                                            <%--</div>--%>
                                                        <%--</th>--%>
                                                        <%--<th class="text-center sorting" rowspan="1" colspan="1"--%>
                                                            <%--style="width: 100px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;"--%>
                                                            <%--aria-controls="testpaperdt" aria-label="--%>
                            <%--结束时间--%>
                        <%--: activate to sort column ascending">--%>
                                                            <%--<div class="dataTables_sizing"--%>
                                                                 <%--style="height:0;overflow:hidden;">--%>
                                                                <%--结束时间--%>
                                                            <%--</div>--%>
                                                        <%--</th>--%>
                                                        <%--<th class="text-center sorting" rowspan="1" colspan="1"--%>
                                                            <%--style="width: 100px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;"--%>
                                                            <%--aria-controls="testpaperdt" aria-label="--%>
                            <%--分组截止时间--%>
                        <%--: activate to sort column ascending">--%>
                                                            <%--<div class="dataTables_sizing"--%>
                                                                 <%--style="height:0;overflow:hidden;">--%>
                                                                <%--分组截止时间--%>
                                                            <%--</div>--%>
                                                        <%--</th>--%>
                                                        <%--<th class="text-center sorting" rowspan="1" colspan="1"--%>
                                                            <%--style="width: 100px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;"--%>
                                                            <%--aria-controls="testpaperdt" aria-label="--%>
                            <%--作品截止时间--%>
                        <%--: activate to sort column ascending">--%>
                                                            <%--<div class="dataTables_sizing"--%>
                                                                 <%--style="height:0;overflow:hidden;">--%>
                                                                <%--作品截止时间--%>
                                                            <%--</div>--%>
                                                        <%--</th>--%>
                                                        <%--<th class="text-center sorting" rowspan="1" colspan="1"--%>
                                                            <%--style="width: 100px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;"--%>
                                                            <%--aria-controls="testpaperdt" aria-label="--%>
                            <%--出题人--%>
                        <%--: activate to sort column ascending">--%>
                                                            <%--<div class="dataTables_sizing"--%>
                                                                 <%--style="height:0;overflow:hidden;">--%>
                                                                <%--出题人--%>
                                                            <%--</div>--%>
                                                        <%--</th>--%>
                                                    <%--</tr>--%>
                                                    <%--</thead>--%>

                                                    <tbody>
                                                    <tr role="row" class="odd selectedRow">
                                                        <td class=" text-center">
                                                            <div class="checkbox" style="margin:auto">
                                                                <label><input name="checkItem" type="checkbox"
                                                                              value="11"
                                                                              class="btn-sm">
                                                                    <span class="text"></span>
                                                                </label>
                                                            </div>
                                                        </td>
                                                        <c:forEach items="${groupEval}" var="groupEval">
                                                            <%--<td class="text-center sorting_1">--%>
                                                            <%--<a href="groupEval/manage?teachingClassId=${groupEval.teachingClassId}"/>--%>
                                                            <%--</td>--%>
                                                            <td class=" text-center">${groupEval.evalTitle }</td>
                                                            <td class=" text-center">${groupEval.startTime }</td>
                                                            <td class=" text-center">${groupEval.endTime }</td>
                                                            <td class=" text-center">${groupEval.groupTime }</td>
                                                            <td class=" text-center">${groupEval.uploadTime }</td>
                                                            <td class=" text-center">${groupEval.ownerId }</td>
                                                        </c:forEach>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div id="testpaperdt_processing"
                                             class="dataTables_processing panel panel-default"
                                             style="display: none;">数据加载中.....
                                        </div>
                                        <div class="row DTTTFooter">
                                            <div class="col-sm-6">
                                                <div class="dataTables_length" id="testpaperdt_length">
                                                    <label>每页显示：<select
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
                                                <div class="dataTables_paginate paging_full_numbers"
                                                     id="testpaperdt_paginate">
                                                    <ul class="pagination">
                                                        <li class="paginate_button first disabled"
                                                            id="testpaperdt_first">
                                                            <a href="#" aria-controls="testpaperdt" data-dt-idx="0"
                                                               tabindex="0">首页</a></li>
                                                        <li class="paginate_button previous disabled"
                                                            id="testpaperdt_previous">
                                                            <a href="#" aria-controls="testpaperdt" data-dt-idx="1"
                                                               tabindex="0">前一页</a></li>
                                                        <li class="paginate_button active"><a href="#"
                                                                                              aria-controls="testpaperdt"
                                                                                              data-dt-idx="2"
                                                                                              tabindex="0">1</a>
                                                        </li>
                                                        <li class="paginate_button next disabled" id="testpaperdt_next">
                                                            <a href="#" aria-controls="testpaperdt" data-dt-idx="3"
                                                               tabindex="0">后一页</a>
                                                        </li>
                                                        <li class="paginate_button last disabled" id="testpaperdt_last">
                                                            <a href="#" aria-controls="testpaperdt" data-dt-idx="4"
                                                               tabindex="0">尾页</a></li>
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
    </tr>
    </tbody>
</table>
</body>
</html>
