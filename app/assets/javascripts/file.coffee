$ ->
  $(".js-uploader").fileupload
    dataType: "json"
    dropZone: $("body")
    progressall: (e, data) ->
      progress = parseInt(data.loaded / data.total * 100, 10)
      showProgress = progress > 0 and progress < 100
      $(".js-progress").toggle(showProgress)
      $(".meter").css "width", progress + "%"
    done: (e, data) ->
      for file in data.result
        console.log file
        $("<a src='#{file}'>").html($("<img/>").attr("src", file)).prependTo(".js-justified")
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
