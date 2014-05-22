$("#noti_attend").html("<%= escape_javascript(render('timetables/attend')) %>")
.appendTo('#notiAttend')
.hide()
.fadeIn()
