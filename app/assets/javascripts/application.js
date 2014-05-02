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
//= require googleajax.jquery.js
//= require turbolinks
//= require_tree .

// Include all twitter's javascripts
//= require twitter/bootstrap
//= require jquery.goup.min

//= require flat-ui/bootstrap-select
//= require flat-ui/bootstrap-switch
//= require flat-ui/flatui-fileinput
//= require flat-ui/jquery.tagsinput
//= require flat-ui/holder
//= require flat-ui/jquery-ui-1.10.3.custom.min









// To adjust the params of right side panel
$(document).ready(function () {
    $(".cbp-af-header").css("overflow", "hidden");

    $('#sidebar').affix({
        offset: {
            top: 230,
            bottom: 100
        }
    });

    $('#midCol').affix({
        offset: {
            top: 800,
            bottom: 100
        }
    });

});



