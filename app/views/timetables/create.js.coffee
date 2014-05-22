$("#noti_attend").html("<%= escape_javascript(render('timetables/cancel')) %>")
.appendTo('#notiAttend')
.hide()
.fadeIn()