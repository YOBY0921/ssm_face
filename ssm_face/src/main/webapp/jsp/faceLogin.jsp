<%--
  Created by IntelliJ IDEA.
  User: ruanyun
  Date: 2019-04-16
  Time: 18:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>管理员登录</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <style>
        body {
            height: 100%;
            background: #213838;
            overflow: hidden;
        }

        canvas {
            z-index: -1;
            position: absolute;
        }
    </style>
    <script src="${ctx}/static/js/jquery.min.js"></script>
    <script src="${ctx}/static/js/demo/Particleground.js"></script>
    <script src="${ctx}/static/js/demo/verificationNumbers.js"></script>

    <script>
        $(document).ready(function () {
            //粒子背景特效
            $('body').particleground({
                dotColor: '#5cbdaa',
                lineColor: '#5cbdaa'
            });
            //验证码
            createCode();
            //测试提交，对接程序删除即可
            $(".submit_btn").click(function () {
                window.location.href = "${ctx}/login";
            });
        });
    </script>

    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
        }

        body {
            height: 100vh;
            background-position: center;
            overflow: hidden;
        }

        h1 {
            color: #fff;
            text-align: center;
            font-weight: 100;
            margin-top: 40px;
        }

        #media {
            width: 280px;
            height: 250px;
            margin: 10px auto 0;
            border-radius: 30px;
            overflow: hidden;
        }

        #video {

        }

        #canvas {
            display: none;
        }

        #btn {
            width: 160px;
            height: 50px;
            background: #03a9f4;
            margin: 70px auto 0;
            text-align: center;
            line-height: 50px;
            color: #fff;
            border-radius: 40px;
        }
    </style>
</head>

<body>

<form action="${ctx}/facelogin.action"
      method="get">
    <dl class="admin_login">
        <dt>
            <strong>后台管理系统</strong><em>Management System</em> <strong>请把你的脸放摄像头面前</strong>
        </dt>
        <div id="media">
            <video id="video" width="530" height="300" autoplay></video>
            <canvas id="canvas" width="400" height="300"></canvas>
        </div>
        <dd>
            <input type="button" onclick="query()" value="立即登录" class="submit_btn"/>
        </dd>
    </dl>
<%--    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>--%>
    <script type="text/javascript">
        //var 是定义变量

        var video = document.getElementById("video"); //获取video标签
        var canvas = document.getElementById("canvas"); //获取video标签
        var context = canvas.getContext("2d");
        var con = {
            audio: false,
            video: {
                width: 1980,
                height: 1024
            }
        };

        //导航 获取用户媒体对象
        navigator.mediaDevices.getUserMedia(con).then(function (stream) {
                // video.src = window.URL.createObjectURL(stream);
            video.srcObject = stream;
                video.onloadmetadate = function (e) {
                    video.play();
                }
            });


        function query() {

            //把流媒体数据画到convas画布上去
            context.drawImage(video, 0, 0, 400, 300);
            var base = getBase64();


            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/facelogin.action",
                data: {"base": base},
                success: function (data) {

                    /* alert(data) */
                    var result = eval(data);

                    if (result) {


                        // location.replace("/www.baidu.com");
                        //location.href='text.jsp';//此处跳转页面

                        alert("登录成功")
                        //location.href="/localhost:8180/ssh-five/putong.jsp";

                    } else {
                        alert("面容识别失败,请继续验证");
                    }
                }
            });

        }

        function getBase64() {
            var imgSrc = document.getElementById("canvas").toDataURL(
                "image/png");
            alert(imgSrc);
            return imgSrc.split("base64,")[1];

        }
    </script>
</form>
</body>
</html>
