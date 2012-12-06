$ ->
  $('.confirm-modal').click (ev) ->
    $('#confirm-image-src').attr('src', $(@).attr('data-image-src'))
    $('#delete-url').attr('href', $(@).attr('data-delete-url'))
    $('#confirm-modal').modal('show')

  $('.show-modal').click (ev) ->
    $('#show-image-url').text(@.text)
    $('#show-image-src').attr('src', @.text)
    $('#show-modal').modal('show')
