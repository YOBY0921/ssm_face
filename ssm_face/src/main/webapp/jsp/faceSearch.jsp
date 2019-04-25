<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>人脸识别</title>
		<link rel="stylesheet" type="text/css" href="${ctx}/static/css/faceControl.css" />
		<script src="${ctx}/static/js/jquery.min.js"></script>
	</head>

<body>
	<!-- 界面 -->
	<div style="margin-left: 25%">
		<div class="row" ><strong>请把你的脸放摄像头面前</strong></div>
		<div id="media" class="col-md-offset-3" style="margin-top: 20px;">
			<video id="video" width="500" height="300" autoplay></video>
			<canvas id="canvas" width="500" height="300" ></canvas>
		</div>
		<div style="margin-top: 20px">
			<input type="button" onclick="query()" value="点击识别" class="submit_btn" />
		</div>
	</div>

	<script type="text/javascript">
  		var video = document.getElementById("video");
  		var context = canvas.getContext("2d");
  		var con  ={
  			audio:false,
  			video:{
	  			width:1980,
	  			height:1024
  			}
  		};
  		
		//导航 获取用户媒体对象
		navigator.mediaDevices.getUserMedia(con).then(function(stream){
			// video.src = window.URL.createObjectURL(stream);
			video.srcObject = stream;
			video.onloadmetadate = function(e){
				video.play();
			}
		});
  		
		
		//获取人脸照片的base64，用于发送给后台进行识别
		function getBase64() {
			var imgSrc = document.getElementById("canvas").toDataURL("image/png");
			return imgSrc.split("base64,")[1];
		}
  	
		//发送人脸识别的请求
		function query(){
			context.drawImage(video,0,0,400,300);//把流媒体数据画到convas画布上
			var base = getBase64();
			$.ajax({
				url:"face.ajax",
				type:"post",
				dataType:"JSON", 
				data:{
				    base:base
				},
				success:function(resp){
					console.log(resp);
					if(resp=="success"){
						 alert("识别成功！");
						} else {
							alert("面容识别失败！");
						}
				},
				error:function (data) {
			        console.error(data);
			    }
			});
		}
			
	</script>
</body>
</html>
