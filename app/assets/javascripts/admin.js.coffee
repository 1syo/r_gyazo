$ ->
  $('.destroy-modal').click (ev) ->
    $('#image-url').html($(@).attr('data-image-url'))
    $('#delete-url').attr('href', $(@).attr('data-delete-url'))
    $('#destroy-modal').modal('show')
