$('<%= escape_javascript(render(:partial => @comment))%>')
.prependTo('#comments')
.after()
.hide()
.fadeIn()


$('#new_comment')[0].reset()
