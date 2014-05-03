$('#<%= dom_id(@message) %>')
.fadeOut ->
    $(this).remove()
