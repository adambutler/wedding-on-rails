console.log 'ok'

$ ->
  $(".js-scroll-to").click (e) ->
    e.preventDefault()
    console.log 'smooth'
    $("html,body").animate {
      scrollTop: $($(@).attr("href")).offset().top - 20
    }, 500
