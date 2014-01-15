jQuery ->
  $('#new_image').fileupload
    paramName: "image[image_file]"
    dataType: "script"
    add: (e, data) ->
      file = data.files[0]
      #      data.context = $(tmpl("template-upload", file))
      #      $('#new_image').append(data.context)
      data.submit()
  $(".lb_image").rlightbox()
  $(document).on 'click', '.image-link', ->
    $('.lb_image').first().trigger('click')