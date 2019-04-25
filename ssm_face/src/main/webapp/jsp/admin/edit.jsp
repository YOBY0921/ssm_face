<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: YOBY
  Date: 2018/12/27
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html style="height: auto; min-height: 100%;">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit">

    <title>修改资料</title>

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
        #section-content {
            padding-top: 5px;
        }

        td {
            color: white;
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
    </style>
    <script src="${ctx}/static/js/jquery.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/js/jquery.timers-1.2.js" type="text/javascript"></script>
</head>

<body class="skin-blue sidebar-mini" style="height: auto; min-height: 100%;">
<div class="wrapper" style="height: auto; min-height: 100%;">

    <jsp:include page="../common/header.jsp"></jsp:include>

    <div class="content-wrapper" style="min-height: 480px;margin-top: 50px">
        <section class="content-header" style="overflow: hidden">
            <h1 class="row" id="pageTitle" style="color:#0C0C0C; width: 50%;float: left; margin-bottom: 10px">修改资料</h1>
        </section>
        <section class="content" id="section-content">
            <div class="row">
                <div class="col-md-12">
                    <div class="box">
                        <form action="${ctx}/admin/update" method="post">
                            <div class="box-body">
                                <div style="width: 45%;float: left">
                                    <%--<input type="hidden" name="admin_id" value="${adminId}">--%>
                                    <input type="hidden" name="adminId" value="${iotAdmin.adminId}">

                                    <div class="form-group">
                                        <label for="adminName" class="icon-required">登入账号：</label>
                                        <input type="text" class="form-control" id="adminName"
                                               name="adminName" value="${iotAdmin.adminName}" placeholder="请输入登入账号">
                                    </div>
                                    <div class="form-group">
                                        <label for="adminPassword" class="icon-required">密码：</label>
                                        <input type="password" class="form-control" id="adminPassword"
                                               name="adminPassword" value="${iotAdmin.adminPassword}" placeholder="请输入管理员密码">
                                    </div>
                                    <%--<div class="form-group">--%>
                                        <%--<label for="conPassword" class="icon-required">确认密码：</label>--%>
                                        <%--<input type="password" class="form-control" id="conPassword" name="con_password"--%>
                                               <%--required pattern="^.{1,16}$" data-parsley-pattern-message="设备名称最多设置16个字符"--%>
                                               <%--data-parsley-trigger="keyup" placeholder="请输入管理员密码" data-parsley-id="4">--%>
                                    <%--</div>--%>
                                    <div class="form-group">
                                        <label for="adminNickname" class="icon-required">姓名：</label>
                                        <input type="text" class="form-control" id="adminNickname"
                                               name="adminNickname" value="${iotAdmin.adminNickname}" placeholder="请输入管理员姓名">
                                        <!--<label class="show-other-font"></label>-->
                                    </div>
                                </div>

                                <div style="width: 45%;float: left;margin-left: 8%">
                                    <div class="form-group">
                                        <label for="adminTelephone" class="icon-required">手机：</label>
                                        <input type="text" class="form-control" id="adminTelephone"
                                               name="adminTelephone" value="${iotAdmin.adminTelephone}" placeholder="请输入管理员手机">
                                    </div>
                                    <div class="form-group">
                                        <label for="adminEmail" class="icon-required">邮箱：</label>
                                        <input type="text" class="form-control" id="adminEmail"
                                               name="adminEmail" value="${iotAdmin.adminEmail}"
                                               placeholder="请输入管理员邮箱">
                                    </div>
                                    <!--角色-->
                                    <div class="form-group">
                                        <label for="adminRole" class="icon-required">所属角色：</label>
                                        <div class="icon-required">
                                            <select id="adminRole" name="adminRole" class="form-control">
                                                <c:if test="${iotAdmin.adminRole eq 0 }"> <option value="0">普通管理员</option></c:if>
                                                <c:if test="${iotAdmin.adminRole eq 1 }"> <option value="1">超级管理员</option></c:if>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="adminStatus" class="icon-required">状态：</label>
                                        <div class="icon-required">
                                            <select id="adminStatus" name="adminStatus" class="form-control">
                                                <c:if test="${iotAdmin.adminStatus eq 0 }"><option value="0">禁用</option></c:if>
                                                <c:if test="${iotAdmin.adminStatus eq 1 }"><option value="1">正常</option></c:if>
                                                <c:if test="${iotAdmin.adminStatus eq 2 }"><option value="2">异常</option></c:if>
                                            </select>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="box-footer">
                                <!--<input type="hidden" name="__token__" value="abfd0fb3a62f29ec57db109c9654fbfa">-->
                                <a href="javascript:history.back(-1);" class="btn btn-primary">
                                    <i class="fa fa-arrow-left"></i>
                                    返回
                                </a>
                                <button type="submit" id="save" name="save" class="btn btn-primary pull-right">
                                    <i class="fa fa-save"></i>
                                    保存
                                </button>
                            </div>
                        </form>
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
<%--<script src="${ctx}/static/js/admin_add.js"></script>--%>
<%--<script src="${ctx}/static/js/community.js"></script>--%>

<script>
</script>

</body>

</html>