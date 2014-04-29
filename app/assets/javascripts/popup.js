/**
 * Created with JetBrains RubyMine.
 * User: GaryGoh
 * Date: 29/04/2014
 * Time: 11:30
 * To change this template use File | Settings | File Templates.
 */



/*
 * lx.ui 界面函数库
 * lxrmido@lxrmido.com
 */
var LxA = {

    scrW : 0,
    scrH : 0,

    clickX : 0,              // Mouse Click X
    clickY : 0,              // Mouse Click Y
    registerMenuDOM : null,  // jQuery Object

    wins : [],
    gids : [],

    gid : 1,

    startZ : 60000,

    dmpool : [],

    dmplay : false,

    /* Lx initial */
    init : function(){
        document.onmousedown = LxK.mouseDown;
        document.onmousemove = LxK.mouseMove;
        document.onmouseup = LxK.mouseUp;
        LxK.timer();
    },
    inDOMScope : function($dom, x, y){
        var x0 = parseInt($dom.css('left'));
        var y0 = parseInt($dom.css('top'));
        var x1 = x0 + parseInt($dom.css('width'));
        var y1 = y0 + parseInt($dom.css('height'));
        return x > x0 && x < x1 && y > y0 && y < y1;
    },
    dyMenuDOM : function(scope){
        scope = scope || true;
        if(LxA.registerMenuDOM == null){
            return;
        }
        if(scope && LxA.inDOMScope(LxA.registerMenuDOM, LxA.clickX, LxA.clickY)){
            return;
        }
        if(LxA.registerMenuDOM.lxtype == null){
            return;
        }
        if(LxA.registerMenuDOM.lxtype == 'menu'){
            LxA.registerMenuDOM.fold();
        }
    },
    initInput : function(text){
        var $is = $('.lxinput');
        for(var i = 0; i < $is.length; i++){
            if($($is[i]).val().length > 0){
                continue;
            }
            text = text || '在此输入';
            $($is[i]).val(text).bind('click', LxK.clearOnClick);
        }
    },
    initSearch : function(){
        var $is = $('.lxsearch');
        for(var i = 0; i < $is.length; i++){
            if($($is[i]).val().length > 0){
                continue;
            }
            $($is[i]).val('Search Here.').bind('click', LxK.clearOnClick);
        }
        $('.lxsearchclr').click(function(){
            $(this).parent().find('.lxsearch').val('');
        });
    },
    initDmPlayer : function(max){
        max = max || 256;
        LxA.dmpool = [];
        for(var i = 0; i < max; i++){
            LxA.dmpool[i] = {
                id   : i,
                live : false,
                x    : 0,
                y    : 0,
                w    : 0,
                h    : 0,
                vx   : -8,
                vy   : 0,
                fc   : 'rgba(255, 255, 255, 1)',
                fs   : '28px',
                sc   : 'rgba(0, 0, 0, 0.9)',
                die  : 'x',
                text : ''
            };
        }
    },
    initDm : function(dm){
        $('#lxdm_' + dm.id).detach();
        var $dm = $(
            '<div class="lxdm" id="lxdm_' + dm.id + '">'+dm.text+'</div>'
        );
        $dm.css(
            {
                'font-size'   : dm.fs,
                'color'       : dm.fc,
                'text-shadow' : '0 0 4px ' + dm.sc,
                'left'        : dm.x,
                'top'         : dm.y
            }
        );
        $('body').append($dm);
        dm.w = $dm.width();
        dm.h = $dm.height();
        dm.live = true;
        return $dm;
    },
    getEmptyDm : function(){
        for(var i = 0; i < LxA.dmpool.length; i ++){
            if(LxA.dmpool[i].live){
                continue;
            }
            LxA.dmpool[i] = {
                id   : i,
                live : false,
                x    : 0,
                y    : 0,
                w    : 0,
                h    : 0,
                vx   : -8,
                vy   : 0,
                fc   : '#000000',
                fs   : '24px',
                sc   : 'rgba(0, 192, 248, 0.6)',
                die  : 'x',
                text : ''
            };
            return LxA.dmpool[i];
        }
        return null;
    },
    calcDm : function(dm){
        if(!dm.live){
            return;
        }
        switch(dm.die){
            case 'x':
                if(dm.x + dm.w < 0){
                    dm.live = false;
                    $('#lxdm_' + dm.id).detach();
                    return;
                }
                break;
            case 'y':
                if(dm.y + dm.h < 0){
                    dm.live = false;
                    $('#lxdm_' + dm.id).detach();
                    return;
                }
                break;
        }
        dm.x += dm.vx;
        dm.y += dm.vy;

        $('#lxdm_' + dm.id).css({
            'left' : dm.x,
            'top'  : dm.y
        });
    }
};
var LxK = {
    dragging : null,
    draggingParent : null,
    dragX : 0,
    dragY : 0,
    mouseDown : function(e){
        e = window.event || e;
        LxA.clickX = e.x || e.clientX;
        LxA.clickY = e.y || e.clientY;
        LxA.dyMenuDOM();
    },
    mouseMove : function(e){
        e = window.event || e;
        if(LxK.dragging != null){
            var cx = e.clientX - LxK.dragX;
            var cy = e.clientY - LxK.dragY;
            LxK.draggingParent.css({top:cy, left:cx});
            return false;
        }
    },
    mouseUp : function(e){
        if(LxK.dragging != null){
            LxK.dragging = null;
            LxK.draggingParent.removeClass('dragging');
            LxK.draggingParent = null;
        }
        LxA.dyMenuDOM();
    },
    startDrag : function(e, d, p){
        LxK.dragging = d;
        LxK.draggingParent = p;
        LxK.dragX = e.clientX - parseInt(p.css('left'));
        LxK.dragY = e.clientY - parseInt(p.css('top'));
    },
    dragenable : function(dragItem, parent){
        parent = parent || dragItem;
        dragItem.mousedown(function(e){
            parent.addClass('dragging');
            LxK.startDrag(e, dragItem, parent);
            return false;
        });
    },
    timer : function(time){
        time = time || 40;
        LxA.scrW = $(window).width();
        LxA.scrH = $(window).height();
        if(LxA.dmplay){
            for(var i = 0; i < LxA.dmpool.length; i ++){
                LxA.calcDm(LxA.dmpool[i]);
            }
        }
        setTimeout(function(){LxK.timer(time)}, time);
    },
    clearOnClick : function(e){
        $(this).val('');
        $(this).unbind('click', LxK.clearOnClick);
    },
    qByGid : function(gid){
        for(var i = 0; i < LxA.gids.length; i++){
            if(LxA.gids[i].data('gid') == gid){
                return LxA.gids[i];
            }
        }
        return null;
    },
    addwin : function($w){
        LxA.gids[LxA.gids.length] = $w;
        LxA.wins[LxA.wins.length] = $w;
        LxK.resortZ();
    },
    rmwin : function($w){
        var ary = [];
        for(var i = 0; i < LxA.wins.length; i ++){
            if(LxA.wins[i].data('gid') == $w.data('gid')){
                continue;
            }
            ary[ary.length] = LxA.wins[i];
        }
        LxA.wins = ary;
        LxK.resortZ();
        $w.addClass('lxlinear');
        $w.addClass('closing');
        setTimeout(function(){
            $w.detach();
        }, 250)
    },
    wintofront : function($w){
        var ary = [];
        for(var i = 0; i < LxA.wins.length; i++){
            if(LxA.wins[i].data('gid') == $w.data('gid')){
                continue;
            }
            ary[ary.length] = LxA.wins[i];
        }
        ary[ary.length] = $w;
        LxA.wins = ary;
        LxK.resortZ();
    },
    resortZ : function(){
        var z = LxA.startZ;
        for(var i = 0; i < LxA.wins.length; i++){
            LxA.wins[i].css({'z-index': z++});
        }
    },
    hideswitch : function(ctrl, dest){
        ctrl.click(function(){
            dest.toggleClass('hide');
        });
    },
    foldswitch : function(ctrl, dest){
        ctrl.click(function(){
            dest.toggleClass('fold');
        });
    }
};
var LxS = {
    win : function(title, width, height, closefunc){
        title  = title || 'TITLE';
        width  = width || 512;
        height = height || 512;
        var x  = ($(window).width() - width) / 2;
        var y  = ($(window).height() - height) / 2;
        var $t = $('<div class="lxwintit">'+title+'</div>').mousedown(function(){
            LxK.wintofront($(this).parent());
        });
        var $m = $('<div class="lxwinmv"></div>').mousedown(function(){
            LxK.wintofront($(this).parent());
        });
        closefunc = closefunc || function(){};
        var $c = $('<div class="lxwincbut"></div>').click(function(){
            var cf = $(this).data('closefunc');
            if(cf){
                cf();
            }
            LxK.rmwin($(this).parent());
        }).css(
            {
                'background-image':
                    'url(\'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6RkZERkYzRDRDQkVBMTFFMkI5RkFEOUM5RjNGREZFMjciIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6RkZERkYzRDVDQkVBMTFFMkI5RkFEOUM5RjNGREZFMjciPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpGRkRGRjNEMkNCRUExMUUyQjlGQUQ5QzlGM0ZERkUyNyIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpGRkRGRjNEM0NCRUExMUUyQjlGQUQ5QzlGM0ZERkUyNyIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PsxObT4AAAENSURBVHja7JfhDcIgEIVpN2ACkjqCK+gIOkJdwRVcgRHqCDiCXcGECRwBD3M/CKHERFCavEteSilJ35eDu7Zzzok1Ry9WHgAAAAAAAAAAAAAAAAAAAADwdVhrR9KdJDNrJMmQtqXe25X4pSRDB7pMfDuT9kqpZ2yeLobkzftnm3jNPzNwY+OCDZowE5F5H+cS5otlYMHkOxM8DudPZF43tYUyEJrHVcwXB1iAELXMVymjvLeP0fSDdF1FH+AMTNH0EB/sJgFS1SZXnVprZDJRbS5ciapB9BXN6+BMVIMolYFdrlQmIAZWU41sZLP6gwPuO/HcZB/A5zQAAAAAAAAAAAAAAAAAAIBfxUuAAQCFXoSnRUesCAAAAABJRU5ErkJggg==\')'
            }
        ).data('closefunc', closefunc);
        var $w = $('<div class="lxwin"></div>').append(
            $t, $m, $c
        ).data('gid', LxA.gid++).data('cbs', 48);
        $('body').append($w);
        LxK.dragenable($m, $w);
        LxK.dragenable($t, $w);
        LxK.addwin($w);
        $w.cbut = function(text, func, back){
            if(!text){
                return;
            }
            var $cb = $('<div class="lxwincbut">'+text+'</div>');
            $(this).append($cb);
            $cb.css({top:$(this).data('cbs')});
            $(this).data('cbs', $(this).data('cbs') + 48);
            if(func){
                $cb.click(func);
            }
            if(back){
                $cb.css({'background-image':'url(\''+back+'\')'});
            }
            return $cb;
        }
        $w.css({width:width, height:height, left:x, top:y});
        return $w;
    },
    alert : function(text, func, titl){
        text = text || '无内容';
        titl = titl || '通知';
        func = func || function(){};
        var $w = LxS.win(titl, 384, 128).css({'min-height':'128px', 'height':'auto'});
        $w.find('.lxwincbut').click(func).css(
            {
                'background-image':
                    'url(\'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NEEyM0RCOTRENjk3MTFFMjk0RjZDQTdCMDY3QUZFREEiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NEEyM0RCOTVENjk3MTFFMjk0RjZDQTdCMDY3QUZFREEiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0QTIzREI5MkQ2OTcxMUUyOTRGNkNBN0IwNjdBRkVEQSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0QTIzREI5M0Q2OTcxMUUyOTRGNkNBN0IwNjdBRkVEQSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PmR6/tYAAADzSURBVHja7NjRCcIwEAbgVHzJo47QFbpCHaGO4ApdoR1BV+gKruAIzpDHPMY7SCAUX6S51IP/4BBCKXzen1jbhBCM5joY5QUAAAAAAAAAAAAAAAD71XHrDbz3v1w+UY/UZ2ut0ziBG/VC7TRGqKM+UT+17oEhfi6aAUXjUxPA8WlLx6cUgE+VkHVfKz5czdbXKtkxyhv0Tf2ivqwuS+vXtEDH6N9FiLM9xwn0NeIjsQceETLWiI8E4NsUhvjtOw2A9RRE4yMFyKdwz1CqnkbTFDrJ+EgC0hSMZHyK/A7gDw0AAAAAAAAAAAAAAAAAsFd9BBgAexY2u0WNO0UAAAAASUVORK5CYII=\')'
            }
        );
        $w.append('<div class="lxalfield">'+text+'</div>');
        return $w;
    },
    quest : function(text, func1, preval, func2, titl){
        text   = text   || '请输入：';
        titl   = titl   || '询问';
        func1  = func1  || function(d){};
        func2  = func2  || function(){};
        preval = preval || '';
        var $w = LxS.win(titl, 384, 128).css({'min-height':'128px', 'height':'auto'});
        $w.find('.lxwincbut').click(func2);
        $w.append($('<div class="lxalfield">'+text+'</div>'));
        $w.append($('<textarea class="lxquest"></textarea>').val(preval));
        var $c = $('<div class="lxwincbut"></div>').click(function(){
            var val = $(this).parent().find('textarea').val();
            func1(val);
            LxK.rmwin($(this).parent());
        }).css(
            {
                'top':48,
                'background-image':
                    'url(\'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NEEyM0RCOTRENjk3MTFFMjk0RjZDQTdCMDY3QUZFREEiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NEEyM0RCOTVENjk3MTFFMjk0RjZDQTdCMDY3QUZFREEiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0QTIzREI5MkQ2OTcxMUUyOTRGNkNBN0IwNjdBRkVEQSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0QTIzREI5M0Q2OTcxMUUyOTRGNkNBN0IwNjdBRkVEQSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PmR6/tYAAADzSURBVHja7NjRCcIwEAbgVHzJo47QFbpCHaGO4ApdoR1BV+gKruAIzpDHPMY7SCAUX6S51IP/4BBCKXzen1jbhBCM5joY5QUAAAAAAAAAAAAAAAD71XHrDbz3v1w+UY/UZ2ut0ziBG/VC7TRGqKM+UT+17oEhfi6aAUXjUxPA8WlLx6cUgE+VkHVfKz5czdbXKtkxyhv0Tf2ivqwuS+vXtEDH6N9FiLM9xwn0NeIjsQceETLWiI8E4NsUhvjtOw2A9RRE4yMFyKdwz1CqnkbTFDrJ+EgC0hSMZHyK/A7gDw0AAAAAAAAAAAAAAAAAsFd9BBgAexY2u0WNO0UAAAAASUVORK5CYII=\')'
            }
        );
        $w.append($c);
        return $w;
    },
    confirm : function(text, func1, func2, titl){
        text = text || '确定吗？';
        titl = titl || '询问';
        func1 = func1 || function(){};
        func2 = func2 || function(){};
        var $w = LxS.win(titl, 384, 128).css({'min-height':'128px', 'height':'auto'});
        $w.find('.lxwincbut').click(func2);
        $w.append('<div class="lxalfield">'+text+'</div>');
        var $c = $('<div class="lxwincbut"></div>').click(function(){
            func1();
            LxK.rmwin($(this).parent());
        }).css(
            {
                'top':48,
                'background-image':
                    'url(\'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NEEyM0RCOTRENjk3MTFFMjk0RjZDQTdCMDY3QUZFREEiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NEEyM0RCOTVENjk3MTFFMjk0RjZDQTdCMDY3QUZFREEiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0QTIzREI5MkQ2OTcxMUUyOTRGNkNBN0IwNjdBRkVEQSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0QTIzREI5M0Q2OTcxMUUyOTRGNkNBN0IwNjdBRkVEQSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PmR6/tYAAADzSURBVHja7NjRCcIwEAbgVHzJo47QFbpCHaGO4ApdoR1BV+gKruAIzpDHPMY7SCAUX6S51IP/4BBCKXzen1jbhBCM5joY5QUAAAAAAAAAAAAAAAD71XHrDbz3v1w+UY/UZ2ut0ziBG/VC7TRGqKM+UT+17oEhfi6aAUXjUxPA8WlLx6cUgE+VkHVfKz5czdbXKtkxyhv0Tf2ivqwuS+vXtEDH6N9FiLM9xwn0NeIjsQceETLWiI8E4NsUhvjtOw2A9RRE4yMFyKdwz1CqnkbTFDrJ+EgC0hSMZHyK/A7gDw0AAAAAAAAAAAAAAAAAsFd9BBgAexY2u0WNO0UAAAAASUVORK5CYII=\')'
            }
        );
        $w.append($c);
        return $w;
    },
    textarea : function(text, preval, func, titl){
        text   = text   || '请输入：';
        titl   = titl   || '询问';
        func   = func  || function(){};
        preval = preval || '';
        var $w = LxS.win(titl, 384, 128).css({'min-height':'128px', 'height':'auto'});
        $w.find('.lxwincbut').click(func);
        $w.append($('<div class="lxalfield">'+text+'</div>'));
        $w.append($('<textarea class="lxtextview"></textarea>').val(preval));
        return $w;
    },
    popup : function(its, x, y){
        if(its == null || its.length == 0){
            its = [{text:'DEMO', click:function(e){alert('Popup Demo!');}}];
        }
        x = x || LxA.clickX;
        y = y || LxA.clickY;
        var $pp = $('<div class="lxppmenu"></div>');
        for(var i = 0; i < its.length; i++){
            var $i = $('<div class="it">STUVWX</div>');
            $i.html(its[i].text || 'UNDEFINED');
            if(its[i].click != null){
                $i.click(its[i].click).click(function(e){$pp.fold()});
            }
            if(its[i].data != null){
                $i.data('ppdata', its[i].data);
            }
            $pp.append($i);
        }
        $pp.lxtype = 'menu';
        $pp.pop = function(time){
            time = time || 200;
            $pp.slideDown(time);
            var wx = $(window).width() - $pp.width() - 8;
            var wy = $(window).height() - (16 + (36 * its.length));
            if(x > wx){
                x = wx;
            }
            if(y > wy){
                y = wy;
            }
            $pp.css({left:x, top:y});
            LxA.dyMenuDOM(false);
            LxA.registerMenuDOM = $pp;
        };
        $pp.fold = function(time){
            time = time || 200;
            $pp.fadeOut(time);
            LxA.registerMenuDOM = null;
        }
        $('body').append($pp);
        return $pp;
    },
    button : function(text, func, size){
        text = text || 'BUTTON';
        size = size || '';
        var $b = $('<div></div>').html(text).addClass('lxbut' + size);
        if(func != null){
            $b.click(func);
        }
        return $b;
    },
    input : function(text, clickEmpty, func){
        text = text || '在此输入';
        clickEmpty = clickEmpty || true;
        var $i = $('<input />').addClass('lxinput').val(text);
        if(clickEmpty){
            $i.bind('click', LxK.clearOnClick);
        }
        if(func){
            $i.keydown(function(e){
                if(e.keyCode == 13){
                    func(e);
                }
            });
        }
        return $i;
    },
    search : function(text, clickEmpty, func){
        text = text || '在此处搜索';
        clickEmpty = clickEmpty || true;
        var $i = $('<input class="lxsearch" />').val(text);
        if(clickEmpty){
            $i.bind('click', LxK.clearOnClick);
        }
        if(true){
            if(func){
                $i.keydown(function(e){
                    if(e.keyCode == 13){
                        func(e);
                    }
                });
            }
        }
        return $i;
    },
    list : function(){
        var $l = $('<div class="lxlist"></div>');
        $l.add = function(ary){
            ary = ary || [];
            if(!Array.isArray(ary)){
                ary = [ary];
            }
            var $li = $('<div class="lxlitem"></div>');
            for(var i = 0; i < ary.length; i ++){
                $li.append(
                    $('<p>'+ary[i]+'</p>')
                );
            }
            $(this).append($li);
            return $(this);
        }
        return $l;
    },
    dm : function(text, x, y){
        var dm = LxA.getEmptyDm();
        if(dm == null){
            return;
        }
        x = x || LxA.scrW;
        y = y || Math.round(Math.random() * LxA.scrH);
        dm.x = x;
        dm.y = y;
        dm.text = text;
        LxA.initDm(dm);
    }
};