jQuery ->
  $('#new_picture').fileupload
    dataType: 'script'
    add: (e, data) ->
      data.context = $(tmpl('template-upload', data.files[0]))
      $('#pictures').prepend(data.context)
      data.submit()
    progress: (e, data) ->
      if data.context
        progress = parseInt(data.loaded / data.total * 100, 10)
        data.context.find('.progress-bar').
          attr('aria-valuenow', progress).
          css('width', progress + '%')
