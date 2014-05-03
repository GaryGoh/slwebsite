$('<%= escape_javascript(render(:partial => @message))%>')
.appendTo('#messages')
.hide()
.fadeIn()

$('#new_message')[0].reset()
