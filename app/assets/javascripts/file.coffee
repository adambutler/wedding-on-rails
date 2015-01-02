$ ->
  $(".js-uploader").fileupload
    dataType: "json"
    dropZone: $("body")
    progressall: (e, data) ->
      progress = data.loaded / data.total
      NProgress.set(progress)

    done: (e, data) ->
      for file in data.result
        $(".js-justified").children().not("a").remove()
        $("<a href='#{file}' data-lightbox='event'>").html($("<img/>").attr("src", file)).prependTo(".js-justified")
        $(".js-justified").justifiedGallery
          rowHeight: 250
          margins: 10

  $(document).bind "dragover", (e) ->
    dropZone = $("body")
    timeout = window.dropZoneTimeout
    unless timeout
      dropZone.addClass "js-dropzone-in"
    else
      clearTimeout timeout
    found = false
    node = e.target
    loop
      if node is dropZone[0]
        found = true
        break
      node = node.parentNode
      break unless node?
    if found
      dropZone.addClass "js-dropzone-hover"
    else
      dropZone.removeClass "js-dropzone-hover"
    window.dropZoneTimeout = setTimeout(->
      window.dropZoneTimeout = null
      dropZone.removeClass "js-dropzone-in js-dropzone-hover"
    , 100)
