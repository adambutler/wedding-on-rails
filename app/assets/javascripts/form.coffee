class Rsvp
  event: 1

  getForms: ->
    for guest in @guests
      $.ajax
        url: "/#{@event}/guests/#{guest.id}/rsvp"
        data:
          raw: true
        success: (data) ->
          $(data)
            .checkBo()
            .appendTo "#rsvp-form"

  getGuests: ->
    console.log "/#{@event}/groups/#{@group}"
    $.ajax
      url: "/#{@event}/groups/#{@group}"
      dataType: "json"
      success: (data) =>
        @guests = data
        @getForms()

  setGroup: (groupID) ->
    @group = groupID
    @getGuests()

$ ->
  rsvp = new Rsvp()

  $(".js-datetimepicker").datetimepicker
    timepicker: false
    format: 'd-m-Y'

  $("select")
    .select2
      width: "element"
      minimumInputLength: 3
    .on "change", (e) ->
      $("#rsvp-form").html("")
      rsvp.setGroup e.val
