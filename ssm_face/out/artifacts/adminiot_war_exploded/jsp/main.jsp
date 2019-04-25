<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: YOBY
  Date: 2018/12/26
  Time: 16:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html style="height: auto; min-height: 100%;">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit">

    <title>用户管理</title>

    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    <!-- Bootstrap 3.3.7 -->
    <link href="${ctx}/static/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${ctx}/static/css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- Ionicons -->
    <link href="${ctx}/static/css/ionicons.min.css" rel="stylesheet">
    <!-- Morris charts -->
    <link href="${ctx}/static/css/morris.css" rel="stylesheet">
    <!--&lt;!&ndash;jquery-ui&ndash;&gt;-->
    <link href="${ctx}/static/css/jquery-ui.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/static/css/AdminLTE.css">
    <link rel="stylesheet" href="${ctx}/static/css/common.css">

    <style>
        td {
            color: #0C0C0C;
            word-wrap: break-word;
        }

        th {
            text-align: center;
            vertical-align: middle
        }

        span {
            color: white;
        }

        input:-webkit-autofill {
            box-shadow: 0 0 0px 1000px white inset !important;
        }

        #section-content {
            padding-top: 5px;
        }

        .del {
            color: rgba(255, 255, 255, 0.67);
            background-color: rgba(221, 75, 57, 0.3);
            border-color: rgba(221, 75, 57, 0.1);
            pointer-events: none;
        }

        .edt {
            color: rgba(255, 255, 255, 0.9);
            background-color: rgba(0, 192, 239, 0.3);
            border-color: rgba(0, 192, 239, 0.1);
            pointer-events: none;
        }
    </style>
    <script src="${ctx}/static/js/jquery.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/js/jquery.timers-1.2.js" type="text/javascript"></script>
</head>

<body class="skin-blue sidebar-mini" style="height: auto; min-height: 100%;">

<div class="wrapper" style="height: auto; min-height: 100%;">
    <%--<div id="header"></div>--%>

    <jsp:include page="common/header.jsp"></jsp:include>

    <!-- Content Header (Page header) -->
    <div class="content-wrapper" style="min-height: 480px;margin-top: 50px">
        <section class="content-header" style="overflow: hidden">
            <h1 class="row" id="pageTitle" style="color: #0C0C0C; width: 50%;float: left; margin-bottom: 10px">用户管理</h1>
            <div class="row" id="alarmBox" style="width: 40%;float: right;">
                <div class="row" id="alarm" style="opacity:0; width: 30px; float: right;margin-right: 20px; top:-15px;">
                    <img id="pic" width="35px"/>
                </div>
                <div id="AlarmSound"></div>
            </div>
        </section>
        <section class="content" id="section-content">
            <div class="row">
                <div class="col-md-12">
                    <div class="box">
                        <div class="box-body">
                            <form action="${ctx}/admin/query/adminName" class="form-inline">
                                <div class="form-group">
                                    <input type="text" name="adminName" value="${adminName}" class="form-control"
                                           style="width: 300px" placeholder="帐号/姓名/角色/手机/状态">
                                </div>

                                <div class="form-group">
                                    <button class="btn btn-primary" type="submit"><i
                                            class="fa fa-search"></i>
                                        查询
                                    </button>
                                </div>

                                <div class="form-group">
                                    <button class="btn btn-danger" type="reset" name="reset"><i
                                            class="fa  fa-eraser"></i>
                                        清空查询
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="box">
                        <!--数据列表页头部-->
                        <div class="box-header with-border">
                            <h3 class="box-title">用户管理</h3>
                            <span>共</span><span style="font-size: 18px"><strong
                                id="number"></strong></span><span>条记录</span>
                            <span id="searched" style="display: none">查询到<span id="searchedNum"
                                                                               style="font-size: 18px"> </span>条记录</span>
                            <div class="box-tools">
                                <div class="input-group input-group-sm">
                                    <div class="input-group-btn">
                                        <a href="${ctx}/admin/addTo" class="btn btn-primary pull-right">
                                            <i class="fa fa-plus"></i>
                                            添加用户</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="box-body table-responsive" style="text-align: center">
                            <table id="datalist" class="table table-hover table-bordered datatable" width="100%"
                                   style="text-align: center">
                                <thead style="text-align: center">
                                <tr class="show-datatable-list-title" style="text-align: center">
                                    <th>登入帐号</th>
                                    <th>姓名</th>
                                    <th>所属角色</th>
                                    <th>手机</th>
                                    <th>邮箱</th>
                                    <th>状态</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${admin}" var="obj">
                                    <tr>
                                        <td>${obj.adminName}</td>
                                        <td>${obj.adminNickname}</td>
                                        <td>
                                            <c:if test="${obj.adminRole eq 1}">
                                                超级管理员
                                            </c:if>
                                            <c:if test="${obj.adminRole eq 0}">
                                                普通管理员
                                            </c:if>
                                        </td>
                                        <td>${obj.adminTelephone}</td>
                                        <td>${obj.adminEmail}</td>
                                        <td>
                                            <c:if test="${obj.adminStatus eq 1}">
                                                <span style="color: limegreen; font-size: 18px;font-weight: bold;">正常</span>
                                            </c:if>
                                            <c:if test="${obj.adminStatus eq 0}">
                                                <span style="color: red">禁用</span>
                                            </c:if>
                                            <c:if test="${obj.adminStatus eq 2}">
                                                <span style="color: orange;font-size: 15px;">异常</span>
                                            </c:if>
                                        </td>
                                        <td>
                                            <a href="${ctx}/admin/updateTo/${obj.adminId}" class="btn-primary btn-sm">
                                                <i class="fa fa-edit"></i> 编辑</a>
                                            <a href="${ctx}/admin/delete/${obj.adminId}" class="btn-sm btn-danger">
                                                <i class="fa fa-close"></i>删除</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <%--<tr>--%>
                                <%--<td colspan="6">--%>
                                <%--<c:if test="${deleteFlag eq true}">--%>
                                <%--<span style="color: cornflowerblue;">删除成功</span>--%>
                                <%--</c:if>--%>
                                <%--<c:if test="${deleteFlag eq false}">--%>
                                <%--<span style="color: red;">删除失败</span>--%>
                                <%--</c:if>--%>
                                <%--</td>--%>
                                <%--</tr>--%>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>V</b> 1.0
        </div>
        <strong>北博（厦门）智能科技有限公司 Copyright © 2018 <a></a>.</strong> All rights reserved.
    </footer>

</div>
<div class="modal fade" id="modal">
    <div class="modal-dialog" style="width: 25%; margin-top: 15%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span></button>
                <h4 class="modal-title">提示</h4>
            </div>
            <div class="modal-body">
                <p id="modal_message">您确认执行本次操作吗？</p>
                <input name="modal_do_url" id="modal_do_url" value="" placeholder="modal_do_url" type="hidden">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left " id="cancelBtn" data-dismiss="modal">取消</button>
                <button onclick="modal_do()" type="button" class="btn btn-primary">确认</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<script src="${ctx}/static/js/bootstrap.min.js"></script>
<script src="${ctx}/static/js/jquery-ui.min.js"></script>
<script src="${ctx}/static/js/parsley.min.js"></script>
<script src="${ctx}/static/js/raphael.min.js"></script>
<script src="${ctx}/static/js/morris.min.js"></script>
<script src="${ctx}/static/js/jquery.cookie.min.js"></script>
<script src="${ctx}/static/js/AdminLTE.js"></script>
<script src="${ctx}/static/js/common.js"></script>
<script src="${ctx}/static/js/layer/layer.js"></script>
<script src="${ctx}/static/js/laydate/laydate.js"></script>
<script src="${ctx}/static/js/layui/layui.js"></script>
<script src="${ctx}/static/js/admin_index.js"></script>
<script src="${ctx}/static/js/community.js"></script>




</body>

</html>
