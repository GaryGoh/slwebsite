$('<%= escape_javascript(render(:partial => @message))%>')
.appendTo('#messages')
.hide()
.fadeIn()

$('#new_message')[0].reset()

$('#messages_count').html '<%= messages_count %>'
