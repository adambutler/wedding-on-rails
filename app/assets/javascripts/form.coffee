$ ->
  $(".js-datetimepicker").datetimepicker
    timepicker: false
    format: 'd-m-Y'

  $("select")
    .select2
      width: "element"
      minimumInputLength: 3
    .on "change", (e) ->
      console.log e
