$('#messages_count').html '<%= messages_count %>'

$('#<%= dom_id(@message) %>')
.fadeOut ->
    $(this).remove()
