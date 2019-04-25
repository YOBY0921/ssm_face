<%--
  Created by IntelliJ IDEA.
  User: YOBY
  Date: 2019/3/16
  Time: 22:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>登录</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    <link href="${ctx}/static/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/static/css/login.min.css">

    <!--[if lt IE 9]>
    <script src="${ctx}/static/js/html5shiv.min.js"></script>
    <script src="${ctx}/static/js/respond.min.js"></script>
    <![endif]-->
</head>

<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href="javascript:(0);">人脸识别考勤系统</a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">登入账号进入后台</p>
        <div id="error_message" class="" style="margin-bottom: 5px;color: red;text-align: center;font-size: 18px">
        </div>
        <form action="${ctx}/checkLogin" method="post" data-parsley-validate onsubmit="return check()">
            <div class="row">
                <div class="col-xs-12">
                    <div class="form-group has-feedback">
                        帐号：
                        <input id="user_name" name="username" type="text" class="form-control parsley-success" style="display: inline-block" placeholder="帐号">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <div class="form-group has-feedback">
                        密码：
                        <input id="password" name="password" type="password" class="form-control parsley-success" placeholder="密码">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <button type="submit" class="btn btn-primary btn-block btn-flat" style="font-size: 16px; ">登录</button>
                </div>
            </div>
        </form>

        <div class="row">
            <div class="col-lg-12">
                <button type="submit" id="change" class="btn btn-primary btn-block btn-flat" style="background-color: rgba(60,141,188,0.8); border-color: rgba(60,141,188,0.5)"
                        onclick="window.location.href='/regist'">注册
                </button>
            </div>
        </div>

    </div>
</div>
<!-- /.login-box -->
<script src="${ctx}/static/js/jquery.min.js"></script>
<!--<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
<script src="${ctx}/static/js/parsley.min.js"></script>
<script src="https://cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>
<script src="${ctx}/static/js/layer/layer.js"></script>

<script>

    var error = '${errorMsg}';
    if (error != null && error != undefined && error != '') {
        alert(error);
    }

    function check() {
        var user = $('#user_name').val();
        var pwd = $('#password').val();

        if (user.length != 10){
            alert("账号必须为10位");
            return false;
        }
        if (pwd.length < 6) {
            alert("密码不能小于6位");
            return false;
        }
        return true;
    }
</script>

<%--<script type="text/javascript">--%>
    <%--$.ajax({--%>
        <%--url:"/checkLogin",--%>
        <%--type:"post",--%>
        <%--dataType:"JSON",--%>
        <%--data:{base:base},--%>
        <%--success:function(resp){--%>
            <%--console.log(resp);--%>
            <%--if(resp=="success"){--%>
                <%--alert("识别成功！");--%>
            <%--} else {--%>
                <%--alert("面容识别失败！");--%>
            <%--}--%>
        <%--},--%>
        <%--error:function (data) {--%>
            <%--console.error(data);--%>
        <%--}--%>
    <%--});--%>
<%--</script>--%>


</body>

</html>