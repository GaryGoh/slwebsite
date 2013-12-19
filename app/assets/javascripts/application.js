// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

// Include all twitter's javascripts
//= require twitter/bootstrap

//= require wysihtml5
//= require parser_rules/advanced



//= require masonry.pkgd.js




//$("#span1").animate({
//    opacity: .4
//}, 1000, function() {
//    // 动画完成，所有浏览器下有效
//});

//$("#span1").css({ opacity: .4 });




$(document).ready(function() {

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