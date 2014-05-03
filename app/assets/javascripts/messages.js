$(document).ready(function() {

    $('msg_content').bind("ajax:beforeSend", function() {
        console.log("Sayonara AJAX Request!");
    }).bind("ajax:success", function(e, cool_beans) {
            console.log("success!");
            $("#comments").append(cool_beans);


        }).bind("ajax:error", function(e, data) {
            console.log("problem...");
        }).bind("ajax:complete", function(status) {
            console.log("Welcome back");
        });


});