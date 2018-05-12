$(document).ready ->
  $('.material-checkbox').click ->
    $(@).attr 'checked', !$(@).attr('checked')
    $(@).parent().toggleClass 'active'