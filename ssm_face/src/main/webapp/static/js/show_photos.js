function showBigPic(filepath) {
//将文件路径传给img大图
    document.getElementById('pre_view').src = filepath;
//获取大图div是否存在
    var div = document.getElementById("bigPic");
    if (!div) {
        return;
    }
//如果存在则展示
    document.getElementById("bigPic").style.display="block";

    //浏览器可见部分宽高
    var biggestW = window.innerWidth;
    var biggestH = window.innerHeight;

    //设置位置
    var intW = document.getElementById("pre_view").width;//图片宽
    var left = (biggestW -intW)/2;
    var intH = document.getElementById("pre_view").height;//图片高
    var top = (biggestH - intH)/2;

    // div框固定显示
    div.style.left = left +"px";
    div.style.top = top +"px";
}
//隐藏
function closeimg(){
    //恢复大小
    var ratio  =$("#pre_view").height()/$("#pre_view").width();
    var biggestW = window.innerWidth;
    var biggestH = window.innerHeight;
    var width = biggestW*4/10;    // 图片实际宽度
    var height = width*ratio;  // 图片实际高度
    $("#pre_view").css("width", width);
    $("#pre_view").css("height", height);
    var width = $("#pre_view").width();    // 图片实际宽度
    var height = $("#pre_view").height();  // 图片实际高度
    var top = (biggestH - height) / 2;
    var left = (biggestW - width) / 2;
    $("#bigPic").css("top", top);
    $("#bigPic").css("left", left);

    document.getElementById("bigPic").style.display="none";      //隐藏
}

//捕捉滚轮动作
function kk() {
    var scrollFunc = function (e) {
        // e是FF的事件。window.event是chrome/ie/opera的事件
        var ee = e || window.event;
        window.event.returnValue = false;//去掉浏览器默认滚动事件
        if (ee.wheelDelta) { //IE/Opera/Chrome
//                t1.value = ee.wheelDelta;
            if (ee.wheelDelta > 0) {
                resizeImg(true);
            } else if (ee.wheelDelta < 0) {
                resizeImg(false);
            }
        } else if (ee.detail) { //Firefox
//                t2.value = ee.detail;
            console.log(ee.detail)
        }
    };

    /*注册事件*/
    if (document.addEventListener) {
        //W3C FF
        document.addEventListener('DOMMouseScroll', scrollFunc, false);
    }

    //IE/Opera/Chrome/Safari
    window.onmousewheel = document.onmousewheel = scrollFunc;
}

//鼠标挪出div后，恢复浏览器滚动，并恢复图片大小
function mouseout(){
    var hhh = function () {
        window.event.returnValue = true;
    };
    window.onmousewheel = document.onmousewheel = hhh;//哈哈哈哈哈哈哈哈
}

//放大或缩小
function resizeImg(isSmall) {
    var biggestW = window.innerWidth;
    var biggestH = window.innerHeight;
    var ratio  =$("#pre_view").height()/$("#pre_view").width();

    if (!isSmall) {
        console.log("变小");
        var width = $("#pre_view").width();    // 图片实际宽度
        var height = $("#pre_view").height();  // 图片实际高度
        var top = (biggestH - height) / 2;
        var left = (biggestW - width) / 2;
        $("#bigPic").css("top", top);
        $("#bigPic").css("left", left);
        if (width <= biggestW * 4 / 10) {
            $("#pre_view").css("width", width);
            $("#pre_view").css("height", height);
        } else {
            height = height - 15;                   //缩小后
            width = width - 15 / ratio;
            top = (biggestH - height) / 2;
            left = (biggestW - width) / 2;
            $("#bigPic").css("top", top);
            $("#bigPic").css("left", left);
            $("#pre_view").css("width", width);
            $("#pre_view").css("height", height);
        }
    } else {
        console.log("变大");
        var width = $("#pre_view").width();    // 图片实际宽度
        var height = $("#pre_view").height();  // 图片实际高度
        if (width >= biggestW || height > biggestH) {
            $("#pre_view").css("width", width);
            $("#pre_view").css("height", height);
        } else {
            height = height + 15;                   //放大后
            width = width + 15 / ratio;
            top = (biggestH - height) / 2;
            left = (biggestW - width) / 2;
            $("#bigPic").css("top", top);
            $("#bigPic").css("left", left);
            $("#pre_view").css("width", width);
            $("#pre_view").css("height", height);
        }
    }
}