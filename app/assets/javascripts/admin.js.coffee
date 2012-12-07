$ ->
  $('.confirm').click (ev) ->
    $('#confirm-image-src').attr('src', $(@).attr('data-image-src'))
    $('#delete-url').attr('href', $(@).attr('data-delete-url'))
    $('#confirm').modal('show')

  $('.show').click (ev) ->
    $('#show-image-url').text(@.text)
    $('#show-image-src').attr('src', @.text)
    $('#show').modal('show')
