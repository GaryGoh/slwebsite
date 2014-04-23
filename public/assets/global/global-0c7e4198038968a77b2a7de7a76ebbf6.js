/**
 * Created with JetBrains RubyMine.
 * User: GaryGoh
 * Date: 21/04/2014
 * Time: 20:52
 * To change this template use File | Settings | File Templates.
 */




    // Header fade out
$(document).ready(function () {

    $('#sidebar').affix({
        offset: {
            top: 230,
            bottom: 100
        }
    });
    $('#midCol').affix({
        offset: {
            top: 230,
            bottom: 100
        }
    });

});

// Fixed height of left & right
window.onload = window.onresize = function () {
    if (document.getElementById("maincontent").clientHeight < document.getElementById("sidecontent").clientHeight) {
        document.getElementById("sidecontent").style.maxHeight = document.getElementById("maincontent").offsetHeight + "px";
    }
    else {
        document.getElementById("sidecontent").style.maxHeight = document.getElementById("maincontent").offsetHeight + "px";
    }
}


// Go up
$(document).ready(function () {
    $('#goup').goup({
        appear: 200,
        scrolltime: 800,
        imgsrc: 'http://goo.gl/VDOdQc',
        width: 32,
        place: 'bottom-right',
        fadein: 500,
        fadeout: 500,
        opacity: 0.5,
        marginX: 0.7,
        marginY: 1
    });

});


$("#index").popover();
$("#news").popover();
$("#notis").popover();
$("#download").popover();
$("#faq").popover();
$("#slmember").popover();


var datepickerSelector = '#datepicker';
$(datepickerSelector).datepicker({
    showOtherMonths: true,
    selectOtherMonths: true,
    dateFormat: "d MM, yy",
    yearRange: '-1:+1'
}).prev('.btn').on('click', function (e) {
        e && e.preventDefault();
        $(datepickerSelector).focus();
    });

// Change to false if wanna enable select
$(datepickerSelector).datepicker("option", "disabled", true ).css({'margin-left': -$(datepickerSelector).prev('.btn').outerWidth()});
