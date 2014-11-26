# $ ->
#   $ ->
#     $("#fileupload").fileupload
#       dataType: "json"
#       done: (e, data) ->
#         $.each data.result.files, (index, file) ->
#           $("<p/>").text(file.name).appendTo document.body

#     $(document).bind "drop dragover", (e) ->
#       e.preventDefault()

#     $(document).bind "drop", (e) ->
#       alert 'drop'
#       url = $(e.originalEvent.dataTransfer.getData("text/html")).filter("img").attr("src")
#       if url
#         $.getImageData
#           url: url
#           success: (img) ->
#             canvas = document.createElement("canvas")
#             canvas.width = img.width
#             canvas.height = img.height
#             if canvas.getContext and canvas.toBlob
#               canvas.getContext("2d").drawImage img, 0, 0, img.width, img.height
#               canvas.toBlob ((blob) ->
#                 $("#fileupload").fileupload "add",
#                   files: [blob]
#               ), "image/jpeg"


