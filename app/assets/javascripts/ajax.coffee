$("form").on "ajax:send", ->
  NProgress.start()

$("form").on "ajax:complete", ->
  NProgress.done()
