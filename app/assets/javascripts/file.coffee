$ ->
  $(".js-uploader").fileupload
    dataType: "json"
    progressall: (e, data) ->
      progress = parseInt(data.loaded / data.total * 100, 10)
      $(".meter").css "width", progress + "%"
      console.log progress
    done: (e, data) ->
      for file in data.result
        console.log file
        $("<a src='#{file}'>").html($("<img/>").attr("src", file)).prependTo(".js-justified")
        $(".js-justified").justifiedGallery
          rowHeight: 250
          margins: 10
