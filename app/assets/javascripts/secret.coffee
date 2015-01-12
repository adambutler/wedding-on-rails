$ ->

  scrollSpeed = 500

  easter_egg = new Konami()
  easter_egg.code = ->
    $("html, body").animate {
      scrollTop: $("#bridge").offset().top - 50
    }, scrollSpeed

    setTimeout ->
      $("#couple").addClass("animate")

      setTimeout ->
        $("#blood").show()
      , 1000

      setTimeout ->
        $("#couple").hide()
      , 1000

      setTimeout ->
        $("#couple").show().removeClass("animate")
        $("#blood").hide()
      , 4000

    , scrollSpeed + 500


  easter_egg.load()
