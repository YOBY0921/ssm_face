var Rect = {
    //当前正在画的矩形对象
    obj: null,
    //画布
    container: null,
    //初始化函数
    init: function(containerId) {
        Rect.container = document.getElementById(containerId);
        if (Rect.container) {
            //鼠标按下时开始画
            Rect.container.onmousedown = Rect.start;
        } else {
            alert('You should specify a valid container!');
        }
    },
    start: function(e) {
        if(e.button==0) {
            var o = Rect.obj = document.createElement('div');
            o.id = 'rectangle';
            o.style.position = "absolute";
            // mouseBeginX，mouseBeginY是辅助变量，记录下鼠标按下时的位置
            o.mouseBeginX = Rect.getEvent(e).x - $("#main").offset().left;
            o.mouseBeginY = Rect.getEvent(e).y - $("#main").offset().top;
            o.style.left = o.mouseBeginX + "px";
            o.style.top = o.mouseBeginY + "px";
            o.style.height = 0;
            o.style.width = 0;
            o.style.border = "dotted red 1px";
            o.style.background = "rgba(255,0,0,0.5)";
            //把当前画出的对象加入到画布中
            Rect.container.appendChild(o);
            //处理onmousemove事件
            Rect.container.onmousemove = Rect.move;
            //处理onmouseup事件
            Rect.container.onmouseup = Rect.end;
            x1 = o.mouseBeginX;
            y1 = o.mouseBeginY;
            //console.log(x1,y1);
        }
    },
    move: function(e) {
        var o = Rect.obj;
        //dx，dy是鼠标移动的距离
        dx = Rect.getEvent(e).x - $("#main").offset().left - o.mouseBeginX;
        //console.log(dx);
        dy = Rect.getEvent(e).y - $("#main").offset().top - o.mouseBeginY;
        x2 = x1 + dx;
        y2 = y1;
        x3 = x1 + dx;
        y3 = y1 + dy;
        x4 = x1;
        y4 = y1 + dy;
        //console.log(x2,y2,x3,y3,x4,y4);
        //如果dx，dy <0,说明鼠标朝左上角移动，需要做特别的处理
        if (dx < 0) {
            o.style.left = Rect.getEvent(e).x - $("#main").offset().left + "px";
        }
        if (dy < 0) {
            o.style.top = Rect.getEvent(e).y - $("#main").offset().top + "px";
        }
        o.style.height = Math.abs(dy) + "px";
        //console.log(o.style.height);
        //console.log(Math.abs(dy));
        o.style.width = Math.abs(dx) + "px";
        Rect.container.onmouseup = Rect.end;
    },
    end: function(e) {
        //onmouseup时释放onmousemove，onmouseup事件句柄
        Rect.container.onmousedown = null;
        Rect.container.onmousemove = null;
        Rect.container.onmouseup = null;
        // Rect.obj = null;
    },
    //辅助方法，处理IE和FF不同的事件模型
    getEvent: function(e) {
        if (typeof e == 'undefined') {
            e = window.event;
        }
        //alert(e.x?e.x : e.layerX);
        if (typeof e.x == 'undefined') {
            e.x = e.layerX;
        }
        if (typeof e.y == 'undefined') {
            e.y = e.layerY;
        }
        return e;
    },
};
