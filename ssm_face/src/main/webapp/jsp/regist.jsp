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
    <title>注册</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link href="${ctx}/static/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/static/css/login.min.css">
    <script src="${ctx}/static/js/html5shiv.min.js"></script>
    <script src="${ctx}/static/js/respond.min.js"></script>
</head>

<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href="javascript:(0);">人脸识别考勤系统</a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">注册账号</p>
        <div id="error_message" class="" style="margin-bottom: 5px;color: red;text-align: center;font-size: 18px">
        </div>
        <form action="${ctx}/doRegist" method="post" onsubmit="return check()">

        <div class="row">
                <div class="col-xs-12">
                    <div class="form-group has-feedback">
                        <span>用户名：</span>
                        <input id="user_name" name="username" type="text" class="form-control parsley-success" placeholder="帐号">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-12">
                    <div class="form-group has-feedback">
                        <span>密码：</span>
                        <input id="password" name="password" type="password" class="form-control parsley-success"  placeholder="密码长度大于6">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-12">
                    <div class="form-group has-feedback">
                        <span>确认密码：</span>
                        <input id="comPwd" name="comPwd" type="password" class="form-control parsley-success"  placeholder="密码长度大于6">
                    </div>
                </div>
            </div>

            <div class="row">
                    <div class="col-xs-12 form-group has-feedback">
                        <button type="submit" id="regist" class="btn btn-primary btn-block btn-flat">注册</button>
                    </div>
                <div class="col-xs-12 ">
                    <a href="javascript:history.back(-1);" class="btn btn-default col-xs-12">
                        <i class="fa fa-arrow-left"></i>
                        返回
                    </a>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- /.login-box -->
<script src="${ctx}/static/js/jquery.min.js"></script>
<!--<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
<script src="${ctx}/static/js/parsley.min.js"></script>
<script src="https://cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>
<script src="${ctx}/static/js/layer/layer.js"></script>

<script type="text/javascript">

    var error = '${errorMsg}';
    if (error != null && error != undefined && error != '') {
        alert(error);
    }

    function check() {
        var user = $('#user_name').val();
        var pwd = $('#password').val();
        var comPwd = $('#comPwd').val();

        if (user.length != 10){
            alert("账号必须为10位");
            return false;
        }
        if (pwd.length < 6) {
            alert("密码不能小于6位");
            return false;
        }

        if (pwd != comPwd){
            alert("两次密码输入不一致");
            return false;
        }
        alert("账号注册成功");
        return true;
    }



    // $(document).ready(function () {
    //     var data = {
    //         username :$('#user_name').val(),
    //         password:$('#password').val()
    //     };
    //     $.ajax({
    //         type: reMethod,
    //         url: "/doRegist",
    //         data: data,
    //         dataType: "json",
    //         success: function (result) {
    //             if (result.success) {
    //                 /*$('#user').focus().css({
    //                     border: "1px solid green",
    //                     boxShadow: "0 0 2px green"
    //                 });*/
    //                 $("#loading").hide();//loading
    //                 $("#userCue").html("<font color='green'><b>" + result.text + "</b></font>");
    //                 alert(result.text);
    //                 return false;
    //             } else {
    //                 /*$('#user').css({
    //                     border: "1px solid #D7D7D7",
    //                     boxShadow: "none"
    //                 });*/
    //                 $("#loading").hide();
    //                 $("#userCue").html("<font color='red'><b>" + result.text + "</b></font>");
    //                 alert(result.text);
    //             }}
    //     });
    // });

</script>

</body>

</html>